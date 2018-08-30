--[[----------------------------------------------------------------------------
	AzeritePowerWeights

	Helps you pick the best Azerite powers on your gear for your class and spec.

	(c) 2018 -
	Sanex @ EU-Arathor / ahak @ Curseforge
----------------------------------------------------------------------------]]--
local ADDON_NAME, n = ...

local _G = _G
local L = n.L

-- Libs
local ACD = LibStub("AceConfigDialog-3.0")
local ACR = LibStub("AceConfigRegistry-3.0")
local AceGUI = LibStub("AceGUI-3.0")

-- Default DB settings
local dbVersion = 1
local dbDefaults = {
	customScales = {},
	char = {},
	dbVersion = dbVersion
}
local charDefaults = {
	debug = false,
	onlyOwnClassDefaults = true,
	importingCanUpdate = true,
	defensivePowers = true,
	rolePowers = true,
	rolePowersNoOffRolePowers = true,
	zonePowers = true,
	professionPowers = false,
	pvpPowers = false,
	specScales = {}
}

-- Slots for Azerite Gear
local azeriteSlots = {
	[1] = true, -- Head
	[3] = true, -- Shoulder
	[5] = true -- Chest
}

-- Weight Editor
local importVersion = 1

-- Score Strings
local reallyBigNumber = 2^31 - 1 -- 2147483647, go over this and errors are thrown
local activeStrings = {} -- Pointers of score strings in use are save in this table
local scoreData = {} -- Current active scales are saved to this table

-- Pointers and Eventframe
local customScales, cfg
local db, lastOpenScale
local playerClassID, playerSpecID
local f = CreateFrame("Frame")
f:SetScript("OnEvent", function(self, event, ...)
	return self[event] and self[event](self, event, ...)
end)
f:RegisterEvent("ADDON_LOADED")

-- Help functions
local function Debug(text, ...)
	if not cfg or not cfg.debug then return end

	if text then
		if text:match("%%[dfqsx%d%.]") then
			(DEBUG_CHAT_FRAME or ChatFrame3):AddMessage("|cffff9999"..ADDON_NAME..":|r " .. format(text, ...))
		else
			(DEBUG_CHAT_FRAME or ChatFrame3):AddMessage("|cffff9999"..ADDON_NAME..":|r " .. strjoin(" ", text, tostringall(...)))
		end
	end
end

local function Print(text, ...)
	if text then
		if text:match("%%[dfqs%d%.]") then
			DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00".. ADDON_NAME ..":|r " .. format(text, ...))
		else
			DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00".. ADDON_NAME ..":|r " .. strjoin(" ", text, tostringall(...)))
		end
	end
end

local function initDB(db, defaults) -- This function copies values from one table into another:
	if type(db) ~= "table" then db = {} end
	if type(defaults) ~= "table" then return db end
	for k, v in pairs(defaults) do
		if type(v) == "table" then
			db[k] = initDB(db[k], v)
		elseif type(v) ~= type(db[k]) then
			db[k] = v
		end
	end
	return db
end

local AcquireString, ReleaseString
do
	local string_cache = {}

	function AcquireString(parent, text)
		local string

		if #string_cache > 0 then
			string = tremove(string_cache)
		else
			string = f:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
		end

		string:Show()
		string:SetPoint("CENTER", parent)
		string:SetText(text)

		return string
	end

	function ReleaseString(string)
		string:SetText("")
		string:Hide()
		string:ClearAllPoints()

		string_cache[#string_cache + 1] = string
	end
end -- StringPool

-- Delay function
local lock
local function delayedUpdate()
	if not lock then
		lock = true
		C_Timer.After(0, f.UpdateValues) -- Wait until next frame
	end
end

-- Scale weight editor related functions
local function _customSort(a, b)
	if a.value and b.value then -- Sorting Tree
		if a.text ~= b.text then
			return a.text < b.text
		else
			return a.value < b.value
		end
	else -- Sorting Custom Scales save-table
		if a[1] ~= b[1] then
			return a[1] < b[1]
		elseif a[2] ~= b[2] then
			return a[2] < b[2]
		else
			return a[3] < a[3]
		end
	end
end

local pvpPairs = { -- Used for Exporting/Importing. These powers have same effects, but are different powers
	-- Horde
	[486] = 6,
	[487] = 6,
	[488] = 6,
	[489] = 6,
	[490] = 6,
	[491] = 6,

	-- Alliance
	[492] = -6,
	[493] = -6,
	[494] = -6,
	[495] = -6,
	[496] = -6,
	[497] = -6
}
local function insertCustomScalesData(scaleName, classIndex, specID, powerData) -- Inser into table
	local t = {}
	if powerData and powerData ~= "" then -- String to table
		for _, weight in pairs({ strsplit(",", powerData) }) do
			local azeritePowerID, value = strsplit("=", strtrim(weight))
			azeritePowerID = tonumber(azeritePowerID) or nil
			value = tonumber(value) or nil

			if azeritePowerID and value and value > 0 then
				value = value > reallyBigNumber and reallyBigNumber or value
				t[azeritePowerID] = value
				if pvpPairs[azeritePowerID] then -- Mirror PvP Powers for both factions
					t[azeritePowerID + pvpPairs[azeritePowerID]] = value
				end
			end
		end
	end

	local updated = false
	-- Check if we have scale with same name already and update it
	for key, dataSet in ipairs(customScales) do
		if (dataSet) and dataSet[1] == scaleName and dataSet[2] == classIndex and dataSet[3] == specID then
			dataSet[4] = t
			updated = true
			break
		end
	end

	-- Create new scale if we didn't find existing set
	if not updated then
		customScales[#customScales + 1] = {
			scaleName,
			classIndex,
			specID,
			t
		}
	end

	sort(customScales, _customSort)

	return updated -- Return info if we created new or updated old
end

local function _buildTree(t)
	local t = {}

	t[1] = {
		value = 1,
		text = L.ScalesList_CustomGroupName,
		disabled = true,
		children = {}
	}
	t[2] = {
		value = 2,
		text = L.ScalesList_DefaultGroupName,
		disabled = true,
		children = {}
	}

	playerClassID = playerClassID or select(3, UnitClass("player"))

	for _, dataSet in ipairs(customScales) do
		local classDisplayName, classTag, classID = GetClassInfo(dataSet[2])
		local specID, name, description, iconID, role, class = GetSpecializationInfoByID(dataSet[3])
		local c = _G.RAID_CLASS_COLORS[classTag]

		if (dataSet) then
			t[1].children[#t[1].children + 1] = {
				value = "C/"..dataSet[2].."/"..dataSet[3].."/"..dataSet[1],
				text = ("|c%s%s|r"):format(c.colorStr, dataSet[1]),
				icon = iconID
			}
		end
	end

	sort(t[1].children, _customSort)
	tinsert(t[1].children,	1, { -- Make sure Create New/Import is the first item on the list
		value = ADDON_NAME.."Import",
		text = L.ScalesList_CreateImportText,
		icon = 134400
	})

	for _, dataSet in ipairs(n.defaultScalesData) do
		local classDisplayName, classTag, classID = GetClassInfo(dataSet[2])
		local specID, name, description, iconID, role, isRecommended, isAllowed = GetSpecializationInfoForClassID(classID, dataSet[3])
		local c = _G.RAID_CLASS_COLORS[classTag]

		local scaleName = n.defaultNameTable[ dataSet[1] ] and classDisplayName .. " - " .. name .. " (" .. dataSet[1] .. ")" or classDisplayName .. " - " .. name
		if (dataSet) and ((cfg.onlyOwnClassDefaults and classID == playerClassID) or (not cfg.onlyOwnClassDefaults)) then
			t[2].children[#t[2].children + 1] = {
				value = "D/"..dataSet[2].."/"..dataSet[3].."/"..dataSet[1],
				text = ("|c%s%s|r"):format(c.colorStr, scaleName),
				icon = iconID
			}
		end
	end

	return t
end

local function _SelectGroup(widget, callback, group)
	local dataGroup, scaleKey = strsplit("\001", group)

	if dataGroup and not scaleKey then
		scaleKey = dataGroup
	end

	local groupSet, classID, specNum, scaleName = strsplit("/", scaleKey)
	Debug(">>", dataGroup, ">", scaleKey, ">", groupSet, ">", classID, ">", specNum, ">", scaleName)

	if scaleKey == ADDON_NAME.."Import" then -- Create New / Import
		--Debug("!!! Import")
		n:CreateImportGroup(n.scalesScroll)
	else -- Scaleset
		classID = tonumber(classID)
		specNum = tonumber(specNum)
	
		if groupSet == "C" then -- Custom Scales
			--Debug("!!! Custom")

			for _, dataSet in ipairs(customScales) do
				if (dataSet) and dataSet[1] == scaleName and dataSet[2] == classID and dataSet[3] == specNum then
					n:CreateWeightEditorGroup(true, n.scalesScroll, dataSet[1], dataSet[4], scaleKey, cfg.specScales[playerSpecID].scaleID == scaleKey, classID, specNum) -- specNum is actually specID here

					break
				end
			end

		elseif groupSet == "D" then -- Default Scales
			--Debug("!!! Default")

			for _, dataSet in ipairs(n.defaultScalesData) do
				if (dataSet) and dataSet[1] == scaleName and dataSet[2] == classID and dataSet[3] == specNum then
					local classDisplayName, classTag, classID = GetClassInfo(dataSet[2])
					local specID, name, description, iconID, role, isRecommended, isAllowed = GetSpecializationInfoForClassID(classID, dataSet[3])

					n:CreateWeightEditorGroup(false, n.scalesScroll, ("%s - %s (%s)"):format(classDisplayName, name, dataSet[1]), dataSet[4], scaleKey, cfg.specScales[playerSpecID].scaleID == scaleKey, classID, specID)

					break
				end
			end

		else -- ???
			Debug("!!! Else")
		end
	end

	delayedUpdate()
end

local function _enableScale(powerWeights, scaleKey)
	--Debug("Enable Scale:", scaleKey)
	wipe(scoreData)
	for k, v in pairs(powerWeights) do
		scoreData[k] = v
	end

	local _, _, _, scaleName = strsplit("/", scaleKey)

	cfg.specScales[playerSpecID].scaleID = scaleKey
	cfg.specScales[playerSpecID].scaleName = scaleName
	n.treeGroup:SelectByValue(cfg.specScales[playerSpecID].scaleID)
end

local function _checkForNameCollisions(nameString, previousName, classID, specID)
	local collision = true
	local testName = nameString
	local c = 1
	while collision == true do
		collision = false
		for key, dataSet in ipairs(customScales) do
			if (dataSet) and dataSet[1] == testName and dataSet[2] == classID and dataSet[3] == specID then
				Debug("!!! Name collisions:", nameString, testName)
				collision = true
				testName = ("%s (%d)"):format(nameString, c)
				c = c + 1

				if previousName and testName == previousName then -- Earlier name had (x) in it and we hit the same number, don't increase it
					collision = false
				end

				break
			end
		end
	end

	return testName
end

local function _exportScale(powerWeights, scaleName, classID, specID) -- Create export string and show export popup
	local template = "( %s:%d:\"%s\":%d:%d:%s )"
	local t = {}
	local isHorde = UnitFactionGroup("player") == "Horde"
	for k, v in pairs(powerWeights) do
		if type(tonumber(v)) == "number" and tonumber(v) > 0 then
			if pvpPairs[tonumber(k)] then
				if isHorde and pvpPairs[tonumber(k)] > 0 then -- Horde player and Horde power
					t[#t + 1] = k.."="..v
				elseif not isHorde and pvpPairs[tonumber(k)] < 0 then -- Alliance player and Alliance power
					t[#t + 1] = k.."="..v
				end
			else
				t[#t + 1] = k.."="..v
			end
		end
	end
	sort(t)

	local exportString = format(template, ADDON_NAME, importVersion, scaleName, classID, specID, #t > 0 and " "..strjoin(", ", unpack(t)) or "")
	--Debug("%d - %s", #t, s)

	--CreatePopUp(mode, titleText, descriptionText, editboxText, callbackFunction)
	n.CreatePopUp("Export", L.ExportPopup_Title, format(L.ExportPopup_Desc, NORMAL_FONT_COLOR_CODE .. scaleName .. FONT_COLOR_CODE_CLOSE, NORMAL_FONT_COLOR_CODE, FONT_COLOR_CODE_CLOSE, NORMAL_FONT_COLOR_CODE, FONT_COLOR_CODE_CLOSE), exportString)
end

local function _importScale() -- Show import popup and parse input
	local template = "^%s*%(%s*" .. ADDON_NAME .. "%s*:%s*(%d+)%s*:%s*\"([^\"]+)\"%s*:%s*(%d+)%s*:%s*(%d+)%s*:%s*(.+)%s*%)%s*$"
	local callbackFunction = function(widget, callback, ...)
		local importString = widget:GetUserData("importString") or ""
		--Debug(tostringall(strfind(importString, template)))

		local startPos, endPos, stringVersion, scaleName, classID, specID, powerWeights = strfind(importString, template)
		stringVersion = tonumber(stringVersion) or 0
		scaleName = scaleName or L.ScaleName_Unnamed
		powerWeights = powerWeights or ""
		classID = tonumber(classID) or nil
		specID = tonumber(specID) or nil

		if not cfg.importingCanUpdate then -- No updating for you, get collision free name
			scaleName = _checkForNameCollisions(scaleName, false, classID, specID)
		end

		if stringVersion < importVersion then -- String version is old
			Print(L.ImportPopup_Error_OldStringVersion)
		elseif type(classID) ~= "number" or classID < 1 or type(specID) ~= "number" or specID < 1 then -- No class or no spec, this really shouldn't happen ever
			Print(L.ImportPopup_Error_MalformedString)
		else -- Everything seems to be OK
			local result = insertCustomScalesData(scaleName, classID, specID, powerWeights)

			-- Rebuild Tree
			n.treeGroup.tree = _buildTree(n.treeGroup.tree)
			n.treeGroup:SelectByValue("C/"..classID.."/"..specID.."/"..scaleName)
			n.treeGroup:RefreshTree(true)

			if result then -- Updated old scale
				Print(L.ImportPopup_UpdatedScale, scaleName)
			else -- Created new
				Print(L.ImportPopup_CreatedNewScale, scaleName)
			end
		end

		--Debug(">", stringVersion, classID, specID, scaleName, powerWeights)

		widget.frame:GetParent().obj:Hide()
	end

	--CreatePopUp(mode, titleText, descriptionText, editboxText, callbackFunction)
	n.CreatePopUp("Import", L.ImportPopup_Title, format(L.ImportPopup_Desc, NORMAL_FONT_COLOR_CODE, FONT_COLOR_CODE_CLOSE, NORMAL_FONT_COLOR_CODE .. _G.ACCEPT .. FONT_COLOR_CODE_CLOSE), "", callbackFunction)
end

local function _createScale() -- Show create popup and parse input
	local callbackFunction = function(widget, callback, ...)
		local classID = widget:GetUserData("classID")
		local specID = widget:GetUserData("specID")
		local nameString = widget:GetUserData("nameString")

		Debug(">", nameString, classID, specID)
		if not nameString or nameString == "" then
			nameString = L.ScaleName_Unnamed
		end
		if not classID then
			classID = 1 -- Warrior
			specID = 71 -- Arms
		end

		local scaleName = _checkForNameCollisions(nameString, false, classID, specID)
		Debug(">>", scaleName)
		if scaleName then
			local result = insertCustomScalesData(scaleName, classID, specID)

			-- Rebuild Tree
			n.treeGroup.tree = _buildTree(n.treeGroup.tree)
			n.treeGroup:SelectByValue("C/"..classID.."/"..specID.."/"..scaleName)
			n.treeGroup:RefreshTree(true)


			if result then -- Updated old instead of creating new, which should never happen
				Print(L.CreatePopup_Error_UnknownError, scaleName)
			else -- Expected result
				Print(L.CreatePopup_Error_CreatedNewScale, scaleName)
			end
		end


		widget.frame:GetParent().obj:Hide()
	end

	--CreatePopUp(mode, titleText, descriptionText, editboxText, callbackFunction)
	n.CreatePopUp("Create", L.CreatePopup_Title, format(L.CreatePopup_Desc, NORMAL_FONT_COLOR_CODE .. _G.ACCEPT .. FONT_COLOR_CODE_CLOSE), "", callbackFunction)
end

local function _renameScale(scaleName, classID, specID, isCurrentScales) -- Show rename popup and check for name collisions
	local callbackFunction = function(widget, callback, ...)
		local renameString = widget:GetUserData("renameString")

		if not renameString or renameString == "" then
			renameString = L.ScaleName_Unnamed
		end

		if renameString ~= scaleName then -- Check if name actually changed
			local finalName = _checkForNameCollisions(renameString, scaleName, classID, specID)

			local scaleWeights
			for key, dataSet in ipairs(customScales) do
				if (dataSet) and dataSet[1] == scaleName and dataSet[2] == classID and dataSet[3] == specID then
					Debug("> Renamed:", scaleName, "to", finalName)
					dataSet[1] = finalName
					scaleWeights = dataSet[4]

					break
				end
			end

			Print(L.RenamePopup_RenamedScale, scaleName, finalName)

			n.treeGroup.tree = _buildTree(n.treeGroup.tree)
			n.treeGroup:SelectByValue("C/"..classID.."/"..specID.."/"..finalName)
			n.treeGroup:RefreshTree(true)

			if isCurrentScales and scaleWeights then
				Debug("> New Key: C/%d/%d/%s", classID, specID, finalName)
				_enableScale(scaleWeights, "C/"..classID.."/"..specID.."/"..finalName)
			end

			-- Check if we have to rename scaleKeys for other characters using same scale
			for realmName, realmData in pairs(db.char) do
				for charName, charData in pairs(realmData) do
					for spec, specData in pairs(charData.specScales) do
						if spec == specID and specData.scaleName == scaleName and specData.scaleID == "C/"..classID.."/"..specID.."/"..scaleName then -- Found character with same scale, update scaleKey
							Debug("> Changing scaleKey for", charName, realmName)
							specData.scaleID = "C/"..classID.."/"..specID.."/"..finalName
							specData.scaleName = finalName
						end
					end
				end
			end
		end

		widget.frame:GetParent().obj:Hide()
	end

	--CreatePopUp(mode, titleText, descriptionText, editboxText, callbackFunction)
	n.CreatePopUp("Rename", L.RenamePopup_Title, format(L.RenamePopup_Desc, NORMAL_FONT_COLOR_CODE .. scaleName .. FONT_COLOR_CODE_CLOSE, NORMAL_FONT_COLOR_CODE .. _G.ACCEPT .. FONT_COLOR_CODE_CLOSE), scaleName, callbackFunction)
end

local function _deleteScale(scaleName, classID, specID, isCurrentScales) -- Show delete popup and remove scale
	local callbackFunction = function(widget, callback, ...)
		local index
		-- Find where in the table scaleKey to be removed is
		for key, dataSet in ipairs(customScales) do
			if (dataSet) and dataSet[1] == scaleName and dataSet[2] == classID and dataSet[3] == specID then
				Debug("> Delete:", key, scaleName)
				index = key

				break
			end
		end

		-- Remove without breaking the indexing
		tremove(customScales, index)
		Print(L.DeletePopup_DeletedScale, scaleName)

		n.treeGroup.tree = _buildTree(n.treeGroup.tree)
		n.treeGroup:SelectByValue(ADDON_NAME.."Import")
		n.treeGroup:RefreshTree(true)

		-- If removed scaleKey was in use, revert back to default option
		if isCurrentScales then
			local specNum = GetSpecialization()
			playerClassID = playerClassID or select(3, UnitClass("player"))
			local scaleKey = n.GetDefaultScaleSet(playerClassID, specNum)
			local _, _, _, defaultScaleName = strsplit("/", scaleKey)
			
			for _, dataSet in ipairs(n.defaultScalesData) do
				if (dataSet) and dataSet[1] == defaultScaleName and dataSet[2] == playerClassID and dataSet[3] == specNum then
					Debug("Reverting to", scaleKey)
					_enableScale(dataSet[4], scaleKey)

					break
				end
			end

			Print(L.DeletePopup_DeletedDefaultScale)
		end

		-- Check if someone used this scale and remove it so they can revert back to default on their next login
		for realmName, realmData in pairs(db.char) do
			for charName, charData in pairs(realmData) do
				for spec, specData in pairs(charData.specScales) do
					if spec == specID and specData.scaleName == scaleName and specData.scaleID == "C/"..classID.."/"..specID.."/"..scaleName then -- Found character with same scale, remove scaleKey
						Debug("> Deleting scaleKey", specID, charName, realmName)
						charData.specScales[spec] = nil
					end
				end
			end
		end

		widget.frame:GetParent().obj:Hide()
	end

	--CreatePopUp(mode, titleText, descriptionText, editboxText, callbackFunction)
	n.CreatePopUp("Delete", L.DeletePopup_Title, format(L.DeletePopup_Desc, NORMAL_FONT_COLOR_CODE .. scaleName .. FONT_COLOR_CODE_CLOSE, NORMAL_FONT_COLOR_CODE .. _G.ACCEPT .. FONT_COLOR_CODE_CLOSE), L.DeletePopup_Warning, callbackFunction)
end

function n:CreateImportGroup(container)
	container:ReleaseChildren()

	local version = AceGUI:Create("Label")
	version:SetText(format(L.WeightEditor_VersionText, GetAddOnMetadata(ADDON_NAME, "Version")))
	version:SetJustifyH("RIGHT")
	version:SetFullWidth(true)
	container:AddChild(version)

	local title = AceGUI:Create("Heading")
	title:SetText(L.ScalesList_CreateImportText)
	title:SetFullWidth(true)
	container:AddChild(title)

	local newButton = AceGUI:Create("Button")
	newButton:SetText(L.WeightEditor_CreateNewText)
	newButton:SetFullWidth(true)
	newButton:SetCallback("OnClick", function()
		-- Call _createScale
		_createScale()
	end)
	container:AddChild(newButton)

	local importButton = AceGUI:Create("Button")
	importButton:SetText(L.WeightEditor_ImportText)
	importButton:SetFullWidth(true)
	importButton:SetCallback("OnClick", function()
		-- Call _importScale
		_importScale()
	end)
	container:AddChild(importButton)

	local line = AceGUI:Create("Heading")
	line:SetFullWidth(true)
	container:AddChild(line)

	lastOpenScale = ADDON_NAME.."Import"
end

function n:CreateWeightEditorGroup(isCustomScale, container, titleText, powerWeights, scaleKey, isCurrentScales, classID, specID)
	container:ReleaseChildren()

	local title = AceGUI:Create("Heading")
	title:SetText(titleText)
	title:SetFullWidth(true)
	container:AddChild(title)

	local useButton = AceGUI:Create("Button")
	if isCurrentScales then
		useButton:SetText(GRAY_FONT_COLOR_CODE .. L.WeightEditor_EnableScaleText .. FONT_COLOR_CODE_CLOSE)
	else
		useButton:SetText(L.WeightEditor_EnableScaleText)
	end
	useButton:SetRelativeWidth(.5)
	useButton:SetDisabled(isCurrentScales)
	useButton:SetCallback("OnClick", function()
		-- Call _enableScale
		_enableScale(powerWeights, scaleKey)
	end)
	container:AddChild(useButton)

	local exportButton = AceGUI:Create("Button")
	exportButton:SetText(L.WeightEditor_ExportText)
	exportButton:SetRelativeWidth(.5)
	exportButton:SetCallback("OnClick", function()
		-- Call _exportScale
		_exportScale(powerWeights, titleText, classID, specID)
	end)
	container:AddChild(exportButton)

	if isCustomScale then
		local renameButton = AceGUI:Create("Button")
		renameButton:SetText(L.WeightEditor_RenameText)
		renameButton:SetRelativeWidth(.5)
		renameButton:SetCallback("OnClick", function()
			-- Call _renameScale
			_renameScale(titleText, classID, specID, isCurrentScales)
		end)
		container:AddChild(renameButton)

		local deleteButton = AceGUI:Create("Button")
		deleteButton:SetText(L.WeightEditor_DeleteText)
		deleteButton:SetRelativeWidth(.5)
		deleteButton:SetCallback("OnClick", function()
			-- Call _deleteScale
			_deleteScale(titleText, classID, specID, isCurrentScales)
		end)
		container:AddChild(deleteButton)
	end

	local spacer = AceGUI:Create("Label")
	spacer:SetText(" \n ")
	spacer:SetFullWidth(true)
	container:AddChild(spacer)

	local classTitle = AceGUI:Create("Heading")
	classTitle:SetText(L.PowersTitles_Class)
	classTitle:SetFullWidth(true)
	container:AddChild(classTitle)

	local roleBits = 0x0
	local BIT_DAMAGER = 0x1
	local BIT_TANK = 0x2
	local BIT_HEALER = 0x4
	for i = 1, GetNumSpecializationsForClassID(classID) do
		local spec, _, _, _, role = GetSpecializationInfoForClassID(classID, i)
		if spec and ((cfg.rolePowersNoOffRolePowers and spec == specID) or (not cfg.rolePowersNoOffRolePowers)) then -- Check if only powers suitable for the spec
			if role == "DAMAGER" then
				roleBits = bit.bor(roleBits, BIT_DAMAGER)
			elseif role == "TANK" then
				roleBits = bit.bor(roleBits, BIT_TANK)
			elseif role == "HEALER" then
				roleBits = bit.bor(roleBits, BIT_HEALER)
			end
		end
	end

	local e = {}
	local c = 1

	local function _saveValue(widget, callback, text)
		local value = tonumber(text) or 0
		value = value > reallyBigNumber and reallyBigNumber or value
		local pointer = widget:GetUserData("dataPointer")
		local pairPointer = widget:GetUserData("pairPointer")
		-- Save to DB
		powerWeights[pointer] = value
		widget:SetText(text == "" and "" or (value and value or ""))
		AceGUI:ClearFocus()
		if pairPointer then
			powerWeights[pairPointer] = value
		end
		if isCurrentScales then
			-- Update visible numbers
			scoreData[pointer] = value
			delayedUpdate()
		end
	end

	-- Center Power
	local cname = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(n.sourceData.center.azeritePowerID).spellID)
	e[c] = AceGUI:Create("EditBox")
	e[c]:SetLabel(format("  |T%d:18|t %s", n.sourceData.center.icon, cname or n.sourceData.center.name))
	e[c]:SetText(powerWeights[n.sourceData.center.azeritePowerID] or "")
	e[c]:SetRelativeWidth(.5)
	if isCustomScale then
		e[c]:SetUserData("dataPointer", n.sourceData.center.azeritePowerID)
		e[c]:SetCallback("OnEnterPressed", _saveValue)
	else
		e[c]:SetDisabled(true)
	end
	container:AddChild(e[c])
	c = c + 1

	-- Class Powers
	for i, powerData in ipairs(n.sourceData.class[classID][specID]) do
		local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
		e[c] = AceGUI:Create("EditBox")
		e[c]:SetLabel(format("  |T%d:18|t %s", powerData.icon, name or powerData.name))
		e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
		e[c]:SetRelativeWidth(.5)
		if isCustomScale then
			e[c]:SetUserData("dataPointer", n.sourceData.class[classID][specID][i].azeritePowerID)
			e[c]:SetCallback("OnEnterPressed", _saveValue)
		else
			e[c]:SetDisabled(true)
		end
		container:AddChild(e[c])
		c = c + 1
	end

	if cfg.defensivePowers then
		local defTitle = AceGUI:Create("Heading")
		defTitle:SetText(L.PowersTitles_Defensive)
		defTitle:SetFullWidth(true)
		container:AddChild(defTitle)

		-- Defensive Powers
		for i, powerData in ipairs(n.sourceData.defensive[classID]) do
			local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
			e[c] = AceGUI:Create("EditBox")
			e[c]:SetLabel(format("  |T%d:18|t %s", powerData.icon, name or powerData.name))
			e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
			e[c]:SetRelativeWidth(.5)
			if isCustomScale then
				e[c]:SetUserData("dataPointer", n.sourceData.defensive[classID][i].azeritePowerID)
				e[c]:SetCallback("OnEnterPressed", _saveValue)
			else
				e[c]:SetDisabled(true)
			end
			container:AddChild(e[c])
			c = c + 1
		end
		for i, powerData in ipairs(n.sourceData.defensive.common) do
			local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
			e[c] = AceGUI:Create("EditBox")
			e[c]:SetLabel(format("  |T%d:18|t %s", powerData.icon, name or powerData.name))
			e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
			e[c]:SetRelativeWidth(.5)
			if isCustomScale then
				e[c]:SetUserData("dataPointer", n.sourceData.defensive.common[i].azeritePowerID)
				e[c]:SetCallback("OnEnterPressed", _saveValue)
			else
				e[c]:SetDisabled(true)
			end
			container:AddChild(e[c])
			c = c + 1
		end
	end

	if cfg.rolePowers then
		local roleTitle = AceGUI:Create("Heading")
		roleTitle:SetText(L.PowersTitles_Role)
		roleTitle:SetFullWidth(true)
		container:AddChild(roleTitle)

		-- Role Powers
		for i, powerData in ipairs(n.sourceData.role.common) do
			local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
			e[c] = AceGUI:Create("EditBox")
			e[c]:SetLabel(format("  |T%d:18|t %s", powerData.icon, name or powerData.name))
			e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
			e[c]:SetRelativeWidth(.5)
			if isCustomScale then
				e[c]:SetUserData("dataPointer", n.sourceData.role.common[i].azeritePowerID)
				e[c]:SetCallback("OnEnterPressed", _saveValue)
			else
				e[c]:SetDisabled(true)
			end
			container:AddChild(e[c])
			c = c + 1
		end
		-- Non-Healer Powers
		if bit.band(roleBits, bit.bor(BIT_DAMAGER, BIT_TANK)) ~= 0 then
			for i, powerData in ipairs(n.sourceData.role.nonhealer) do
				local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
				e[c] = AceGUI:Create("EditBox")
				e[c]:SetLabel(format("  |T%d:18|t %s", powerData.icon, name or powerData.name))
				e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
				e[c]:SetRelativeWidth(.5)
				if isCustomScale then
					e[c]:SetUserData("dataPointer", n.sourceData.role.nonhealer[i].azeritePowerID)
					e[c]:SetCallback("OnEnterPressed", _saveValue)
				else
					e[c]:SetDisabled(true)
				end
				container:AddChild(e[c])
				c = c + 1
			end
		end
		-- Tank Powers
		if bit.band(roleBits, BIT_TANK) ~= 0 then
			for i, powerData in ipairs(n.sourceData.role.tank) do
				local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
				e[c] = AceGUI:Create("EditBox")
				e[c]:SetLabel(format("  |T%d:18|t %s", powerData.icon, name or powerData.name))
				e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
				e[c]:SetRelativeWidth(.5)
				if isCustomScale then
					e[c]:SetUserData("dataPointer", n.sourceData.role.tank[i].azeritePowerID)
					e[c]:SetCallback("OnEnterPressed", _saveValue)
				else
					e[c]:SetDisabled(true)
				end
				container:AddChild(e[c])
				c = c + 1
			end
		end
		-- Healer Powers
		if bit.band(roleBits, BIT_HEALER) ~= 0 then
			for i, powerData in ipairs(n.sourceData.role.healer) do
				local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
				e[c] = AceGUI:Create("EditBox")
				e[c]:SetLabel(format("  |T%d:18|t %s", powerData.icon, name or powerData.name))
				e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
				e[c]:SetRelativeWidth(.5)
				if isCustomScale then
					e[c]:SetUserData("dataPointer", n.sourceData.role.healer[i].azeritePowerID)
					e[c]:SetCallback("OnEnterPressed", _saveValue)
				else
					e[c]:SetDisabled(true)
				end
				container:AddChild(e[c])
				c = c + 1
			end
		end
	end

	if cfg.zonePowers then
		local zoneTitle = AceGUI:Create("Heading")
		zoneTitle:SetText(L.PowersTitles_Zone)
		zoneTitle:SetFullWidth(true)
		container:AddChild(zoneTitle)

		-- Raid Powers
		for i, powerData in ipairs(n.sourceData.raid) do
			local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
			e[c] = AceGUI:Create("EditBox")
			e[c]:SetLabel(format("  |T%d:18|t*%s*", powerData.icon, name or powerData.name))
			e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
			e[c]:SetRelativeWidth(.5)
			if isCustomScale then
				e[c]:SetUserData("dataPointer", n.sourceData.raid[i].azeritePowerID)
				e[c]:SetCallback("OnEnterPressed", _saveValue)
			else
				e[c]:SetDisabled(true)
			end
			container:AddChild(e[c])
			c = c + 1
		end
		-- Zone Powers
		for i, powerData in ipairs(n.sourceData.zone) do
			local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
			e[c] = AceGUI:Create("EditBox")
			e[c]:SetLabel(format("  |T%d:18|t %s", powerData.icon, name or powerData.name))
			e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
			e[c]:SetRelativeWidth(.5)
			if isCustomScale then
				e[c]:SetUserData("dataPointer", n.sourceData.zone[i].azeritePowerID)
				e[c]:SetCallback("OnEnterPressed", _saveValue)
			else
				e[c]:SetDisabled(true)
			end
			container:AddChild(e[c])
			c = c + 1
		end
	end

	if cfg.professionPowers then
		local professionTitle = AceGUI:Create("Heading")
		professionTitle:SetText(L.PowersTitles_Profession)
		professionTitle:SetFullWidth(true)
		container:AddChild(professionTitle)

		-- Profession Powers
		for i, powerData in ipairs(n.sourceData.profession) do
			local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
			e[c] = AceGUI:Create("EditBox")
			e[c]:SetLabel(format("  |T%d:18|t %s", powerData.icon, name or powerData.name))
			e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
			e[c]:SetRelativeWidth(.5)
			if isCustomScale then
				e[c]:SetUserData("dataPointer", n.sourceData.profession[i].azeritePowerID)
				e[c]:SetCallback("OnEnterPressed", _saveValue)
			else
				e[c]:SetDisabled(true)
			end
			container:AddChild(e[c])
			c = c + 1
		end
	end

	if cfg.pvpPowers then
		local pvpTitle = AceGUI:Create("Heading")
		pvpTitle:SetText(L.PowersTitles_PvP)
		pvpTitle:SetFullWidth(true)
		container:AddChild(pvpTitle)

		-- PvP Powers
		local isHorde = UnitFactionGroup("player") == "Horde"
		local startPoint = isHorde and 1 or 7
		local endPoint = isHorde and 6 or 12
		for i = startPoint, endPoint do
			local powerData = n.sourceData.pvp[i]
			local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
			e[c] = AceGUI:Create("EditBox")
			e[c]:SetLabel(format("  |T%d:18|t %s", powerData.icon, name or powerData.name))
			e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
			e[c]:SetRelativeWidth(.5)
			if isCustomScale then
				e[c]:SetUserData("dataPointer", n.sourceData.pvp[i].azeritePowerID)
				e[c]:SetUserData("pairPointer", n.sourceData.pvp[i].pair)
				e[c]:SetCallback("OnEnterPressed", _saveValue)
			else
				e[c]:SetDisabled(true)
			end
			container:AddChild(e[c])
			c = c + 1
		end
	end

	Debug("C-Elements:", #e)

	local line = AceGUI:Create("Heading")
	line:SetFullWidth(true)
	container:AddChild(line)

	lastOpenScale = scaleKey
end

local function _toggleEditorUI()
	if not n.guiContainer then return end

	if _G.AzeriteEmpoweredItemUI:IsShown() then
		n.guiContainer.frame:SetParent(_G.AzeriteEmpoweredItemUI)
	else
		n.guiContainer.frame:SetParent(_G.UIParent)
	end

	if n.guiContainer:IsShown() then
		n.guiContainer:Hide()
	else
		n.guiContainer:Show()
	end
end


-- Hook and Init functions
local function _activeSpec() -- Get current active spec for scoreData population etc.
	local currentSpec = GetSpecialization()
	if currentSpec then
		local specID = GetSpecializationInfo(currentSpec)
		if specID then
			playerSpecID = specID
		end
	end
end

local function _populateWeights() -- Populate scoreData with active spec's scale
	local scaleKey = cfg.specScales[playerSpecID].scaleID
	local groupSet, classID, specNum, scaleName = strsplit("/", scaleKey)
	if groupSet and classID and specNum and scaleName then
		classID = tonumber(classID)
		specNum = tonumber(specNum)
		for _, dataSet in ipairs(groupSet == "C" and customScales or n.defaultScalesData) do
			if (dataSet) and dataSet[1] == scaleName and dataSet[2] == classID and dataSet[3] == specNum then
				wipe(scoreData)
				for k, v in pairs(dataSet[4]) do
					scoreData[k] = v
				end

				Debug("Populated scoreData", groupSet, classID, specNum, scaleName)
				return
			end
		end
		Debug("Couldn't populate scoreData", 2, groupSet, classID, specNum, scaleName)
	else
		Debug("Couldn't populate scoreData", 1, groupSet, classID, specNum, scaleName)
	end
end

function f:HookAzeriteUI() -- Set Parents and Anchors
	Debug("HOOK UI")
	self:InitUI()

	n.frame:SetParent(_G.AzeriteEmpoweredItemUI)
	n.frame:Show()
	--[[
	-- Tooltip
	n.frame:SetAllPoints(n.string)
	]]

	if _G.AzeriteEmpoweredItemUIPortrait:IsShown() then -- Default UI etc. who show Portrait
		n.string:SetPoint("TOPLEFT", _G.AzeriteEmpoweredItemUI.ClipFrame.BackgroundFrame, 10, -50)
	else -- ElvUI etc. who hides Portrait
		n.string:SetPoint("TOPLEFT", _G.AzeriteEmpoweredItemUI.ClipFrame.BackgroundFrame, 10, -10)
	end

	n.enableButton.frame:SetParent(_G.AzeriteEmpoweredItemUI)
	n.enableButton.frame:Show()

	_G.AzeriteEmpoweredItemUI:HookScript("OnHide", function() -- Hide strings on frame hide
		Debug("== HIDING ==", #activeStrings)
		while #activeStrings > 0 do
			local s = tremove(activeStrings)
			ReleaseString(s)
		end

		if n.guiContainer then
			n.guiContainer:Hide()
		end
		Debug("== HIDDEN ==", #activeStrings)
	end)
end

--[[
-- Tooltip
local baseScore = ""
]]
local initDone
function f:InitUI() -- Build UI and set up some initial data
	if initDone then return end
	initDone = true

	Debug("INIT UI")

	local frame = CreateFrame("Frame")
	--[[
	-- Tooltip
	frame:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
		GameTooltip:SetText(format("%s\n%s", HIGHLIGHT_FONT_COLOR_CODE .. (cfg.specScales[playerSpecID].scaleName or L.ScaleName_Unknown) .. FONT_COLOR_CODE_CLOSE, baseScore))
	end)
	frame:SetScript("OnLeave", GameTooltip_Hide)
	]]
	frame:Hide()

	local string = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	string:SetJustifyH("LEFT")
	string:SetJustifyV("TOP")
	string:SetText("")

	n.frame = frame
	n.string = string

	-- Enable Button
	local enableButton = AceGUI:Create("Button")
	enableButton:SetPoint("BOTTOMLEFT", _G.AzeriteEmpoweredItemUI, "BOTTOMLEFT", 10, 10)
	enableButton:SetText(ADDON_NAME)
	enableButton:SetAutoWidth(true)
	enableButton:SetCallback("OnClick", _toggleEditorUI)
	n.enableButton = enableButton

	-- Editor GUI
	n.guiContainer = n.CreateUI()
	n.guiContainer:SetPoint("TOPLEFT", _G.AzeriteEmpoweredItemUI, "TOPRIGHT", 10, 0)
	n.guiContainer:SetPoint("BOTTOMLEFT", _G.AzeriteEmpoweredItemUI, "BOTTOMRIGHT", 10, 0)

	-- TreeGroup Hacks for QoL
	n.treeGroup:SetCallback("OnGroupSelected", _SelectGroup)
	n.treeGroup.tree = _buildTree(n.treeGroup.tree)
	local statusTable = {}
	for i = 1, #n.treeGroup.tree do
		statusTable[#statusTable + 1] = true
	end
	n.treeGroup:SetStatusTable({
		groups = statusTable,
		treesizable = false,
		selected = ("%d\001%s"):format(1, ADDON_NAME.."Import")
	}) -- Expand groups

	-- Content Area
	n:CreateImportGroup(n.scalesScroll)

	-- Check if we have spec
	if not (playerSpecID and cfg.specScales[playerSpecID] and cfg.specScales[playerSpecID].scaleID) then
		Debug("No playerSpecID detected", playerSpecID, cfg.specScales[playerSpecID] and cfg.specScales[playerSpecID].scaleID or "!No specScales", GetRealmName(), UnitName("player"), GetSpecializationInfo(GetSpecialization()))
		_activeSpec()
	end
	-- Populate scoreData
	_populateWeights()
end

function f:UpdateValues() -- Update scores
	lock = nil
	if not _G.AzeriteEmpoweredItemUI or not _G.AzeriteEmpoweredItemUI:IsShown() then return end
	Debug("UPDATE VALUES")

	local currentScore, currentPotential, maxScore, currentLevel, maxLevel = 0, 0, 0, 0, 0
	local azeriteItemLocation = C_AzeriteItem.FindActiveAzeriteItem()
	if azeriteItemLocation then
		currentLevel = C_AzeriteItem.GetPowerLevel(azeriteItemLocation)
	end

	-- Update score strings and calculate current score
	while #activeStrings > 0 do
		local s = tremove(activeStrings)
		ReleaseString(s)
	end

	local container = _G.AzeriteEmpoweredItemUI.ClipFrame.PowerContainerFrame
	local children = { container:GetChildren() }
	for _, frame in ipairs(children) do
		if frame and frame:IsShown() then
			--Debug(">" frame.azeritePowerID, frame.spellID, frame.unlockLevel)
			--Debug(">>", frame.isSelected)

			local score = 0
			local powerInfo = C_AzeriteEmpoweredItem.GetPowerInfo(frame.azeritePowerID)
			if powerInfo then
				score = scoreData[powerInfo.azeritePowerID] or scoreData[powerInfo.spellID] or 0
			end

			if frame.isSelected == true then
				currentScore = currentScore + score
			end

			local s = AcquireString(frame, score)
			activeStrings[#activeStrings + 1] = s
		end
	end

	-- Calculate maxScore for the item
	local allTierInfo = _G.AzeriteEmpoweredItemUI.azeriteItemDataSource:GetAllTierInfo()
	if not allTierInfo then
		local itemID = _G.AzeriteEmpoweredItemUI.azeriteItemDataSource:GetItem():GetItemID()
		if not itemID then return end
		allTierInfo = C_AzeriteEmpoweredItem.GetAllTierInfoByItemID(itemID)
	end

	--[[
		Dump: value=C_AzeriteEmpoweredItem.GetAllTierInfoByItemID(158041)
		[1]={
			[1]={
				azeritePowerIDs={
					[1]=195,
					[2]=186,
					[3]=385,
					[4]=184
				},
				unlockLevel=10
			},
			[2]={
				azeritePowerIDs={
					[1]=218,
					[2]=83
				},
				unlockLevel=15
			},
			[3]={
				azeritePowerIDs={
					[1]=13
				},
				unlockLevel=20
			}
		}
	]]

	for tierIndex, tierInfo in ipairs(allTierInfo) do
		local maximum, tierMaximum = 0, 0
		for _, azeritePowerID in ipairs(tierInfo.azeritePowerIDs) do
			local score = 0
			local powerInfo = C_AzeriteEmpoweredItem.GetPowerInfo(azeritePowerID)
			if powerInfo then
				score = scoreData[powerInfo.azeritePowerID] or scoreData[powerInfo.spellID] or 0
			end
			
			if maximum < score then
				maximum = score
			end
			if tierInfo.unlockLevel <= currentLevel and tierMaximum < score then
				tierMaximum = score
			end
		end

		--Debug(tierIndex, maximum)
		maxScore = maxScore + maximum
		currentPotential = currentPotential + tierMaximum
		if maxLevel < tierInfo.unlockLevel then
			maxLevel = tierInfo.unlockLevel
		end
	end

	local baseScore = format(L.PowersScoreString, currentScore, currentPotential, maxScore, currentLevel, maxLevel)

	n.string:SetText(format("%s\n%s", NORMAL_FONT_COLOR_CODE .. (cfg.specScales[playerSpecID].scaleName or L.ScaleName_Unknown) .. FONT_COLOR_CODE_CLOSE, baseScore))

	--Debug("Score:", currentScore, maxScore, currentLevel, #activeStrings, itemID)
end

-- Event functions
function f:ADDON_LOADED(event, addon)
	if addon == ADDON_NAME then
		AzeritePowerWeightsDB = initDB(AzeritePowerWeightsDB, dbDefaults)
		db = AzeritePowerWeightsDB

		local playerName = UnitName("player")
		local playerRealm = GetRealmName()

		db.char[playerRealm] = db.char[playerRealm] or {}
		db.char[playerRealm][playerName] = initDB(db.char[playerRealm][playerName], charDefaults)

		customScales = db.customScales
		cfg = db.char[playerRealm][playerName]

		self:RegisterEvent("PLAYER_LOGIN")
		self:RegisterEvent("AZERITE_ITEM_POWER_LEVEL_CHANGED")
		self:RegisterEvent("AZERITE_EMPOWERED_ITEM_SELECTION_UPDATED")
		self:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
		self:RegisterUnitEvent("PLAYER_SPECIALIZATION_CHANGED", "player")

		playerClassID = select(3, UnitClass("player"))
		for i = 1, GetNumSpecializationsForClassID(playerClassID) do
			local specID = GetSpecializationInfoForClassID(playerClassID, i)
			if not cfg.specScales[specID] then
				local scaleKey = n.GetDefaultScaleSet(playerClassID, i)
				local _, _, _, defaultScaleName = strsplit("/", scaleKey)

				cfg.specScales[specID] = {
					scaleID = scaleKey,
					scaleName = defaultScaleName
				}
			end
		end

		if _G.AzeriteEmpoweredItemUI then
			self:HookAzeriteUI()
		end

		self:CreateOptions()

	elseif addon == "Blizzard_AzeriteUI" then
		-- Hook 'em & Cook 'em
		hooksecurefunc(_G.AzeriteEmpoweredItemUI, "UpdateTiers", delayedUpdate)
		--hooksecurefunc(_G.AzeriteEmpoweredItemUI, "Refresh", delayedUpdate)
		hooksecurefunc(_G.AzeriteEmpoweredItemUI, "OnItemSet", delayedUpdate)
		C_Timer.After(0, function() -- Fire on next frame instead of current frame
			delayedUpdate()
			_G.AzeriteEmpoweredItemUI:HookScript("OnShow", delayedUpdate)
		end)
		self:HookAzeriteUI()

	end
end

function f:PLAYER_LOGIN(event)
	_activeSpec()
end

function f:AZERITE_ITEM_POWER_LEVEL_CHANGED(event)
	Debug(event)

	delayedUpdate()
end

function f:AZERITE_EMPOWERED_ITEM_SELECTION_UPDATED(event)
	Debug(event)

	delayedUpdate()
end

function f:PLAYER_EQUIPMENT_CHANGED(event, equipmentSlot, hasCurrent)
	if not azeriteSlots[equipmentSlot] then return end
	Debug(event, equipmentSlot, hasCurrent)

	delayedUpdate()
end

function f:PLAYER_SPECIALIZATION_CHANGED(event, ...)
	--Debug(event, tostringall(...)) -- ... = unit == player always

	_activeSpec()
	_populateWeights()

	delayedUpdate()
end

-- Config
function f:RefreshConfig()
	delayedUpdate()
	if n.treeGroup and n.treeGroup.tree then
		n.treeGroup.tree = _buildTree(n.treeGroup.tree)
		n.treeGroup:RefreshTree(true)

		local lastExists;
		for _, v in ipairs(n.treeGroup.tree) do
			if v.value == lastOpenScale then
				lastExists = true
			end
		end

		n.treeGroup:SelectByValue(lastExists and lastOpenScale or ADDON_NAME.."Import")
	end
end

function f:CreateOptions()
	if self.optionsFrame then return end

	-- Config showing in the Blizzard Options
	local blizzOptions = {
		type = "group",
		name = ADDON_NAME,
		order = 103,
		get = function(info) return cfg[ info[#info] ] end,
		set = function(info, value) cfg[ info[#info] ] = value; self:RefreshConfig(); end,
		args = {
			reminder = {
				type = "description",
				name = L.Config_SettingsSavedPerChar,
				fontSize = "large",
				image = "Interface\\DialogFrame\\UI-Dialog-Icon-AlertNew", --"Interface\\DialogFrame\\DialogAlertIcon",
				width = "full",
				order = 0,
			},
			scalesHeader = {
				type = "header",
				name = L.Config_Scales_Title,
				order = 5,
			},
			scalesText = {
				type = "description",
				name = L.Config_Scales_Desc,
				fontSize = "medium",
				image = "Interface\\DialogFrame\\UI-Dialog-Icon-AlertNew", --"Interface\\DialogFrame\\DialogAlertIcon",
				width = "full",
				order = 10,
			},
			onlyOwnClassDefaults = {
				type = "toggle",
				name = NORMAL_FONT_COLOR_CODE .. L.Config_Scales_OwnClassDefaultsOnly .. FONT_COLOR_CODE_CLOSE,
				desc = L.Config_Scales_OwnClassDefaultsOnly_Desc,
				descStyle = "inline",
				width = "full",
				order = 15,
			},
			editorHeader = {
				type = "header",
				name = L.Config_WeightEditor_Title,
				order = 20,
			},
			editorText = {
				type = "description",
				name = L.Config_WeightEditor_Desc,
				fontSize = "medium",
				image = "Interface\\DialogFrame\\UI-Dialog-Icon-AlertNew", --"Interface\\DialogFrame\\DialogAlertIcon",
				width = "full",
				order = 25,
			},
			importingCanUpdate = {
				type = "toggle",
				name = NORMAL_FONT_COLOR_CODE .. L.Config_WeightEditor_ImportingCanUpdate .. FONT_COLOR_CODE_CLOSE,
				desc = L.Config_WeightEditor_ImportingCanUpdate_Desc,
				descStyle = "inline",
				width = "full",
				order = 30,
			},
			importingUpgrade_Desc = {
				type = "description",
				name = GRAY_FONT_COLOR_CODE .. L.Config_WeightEditor_ImportingCanUpdate_Desc_Clarification .. FONT_COLOR_CODE_CLOSE,
				fontSize = "medium",
				image = "Interface\\DialogFrame\\UI-Dialog-Icon-AlertOther",
				width = "full",
				order = 35,
			},
			defensivePowers = {
				type = "toggle",
				name = NORMAL_FONT_COLOR_CODE .. L.Config_WeightEditor_ShowDefensive .. FONT_COLOR_CODE_CLOSE,
				desc = L.Config_WeightEditor_ShowDefensive_Desc,
				descStyle = "inline",
				width = "full",
				order = 40,
			},
			rolePowers = {
				type = "toggle",
				name = NORMAL_FONT_COLOR_CODE .. L.Config_WeightEditor_ShowRole .. FONT_COLOR_CODE_CLOSE,
				desc = L.Config_WeightEditor_ShowRole_Desc,
				descStyle = "inline",
				width = "full",
				order = 45,
			},
			rolePowersNoOffRolePowers = {
				type = "toggle",
				name = NORMAL_FONT_COLOR_CODE .. L.Config_WeightEditor_ShowRolesOnlyForOwnSpec .. FONT_COLOR_CODE_CLOSE,
				desc = L.Config_WeightEditor_ShowRolesOnlyForOwnSpec_Desc,
				descStyle = "inline",
				width = "full",
				order = 50,
			},
			zonePowers = {
				type = "toggle",
				name = NORMAL_FONT_COLOR_CODE .. L.Config_WeightEditor_ShowZone .. FONT_COLOR_CODE_CLOSE,
				desc = L.Config_WeightEditor_ShowZone_Desc,
				descStyle = "inline",
				width = "full",
				order = 55,
			},
			zonePowers_Desc = {
				type = "description",
				name = GRAY_FONT_COLOR_CODE .. L.Config_WeightEditor_ShowZone_Desc_Proc .. FONT_COLOR_CODE_CLOSE,
				fontSize = "medium",
				image = "Interface\\DialogFrame\\UI-Dialog-Icon-AlertOther",
				width = "full",
				order = 60,
			},
			professionPowers = {
				type = "toggle",
				name = NORMAL_FONT_COLOR_CODE .. L.Config_WeightEditor_ShowProfession .. FONT_COLOR_CODE_CLOSE,
				desc = L.Config_WeightEditor_ShowProfession_Desc,
				descStyle = "inline",
				width = "full",
				order = 65,
			},
			pvpPowers = {
				type = "toggle",
				name = NORMAL_FONT_COLOR_CODE .. L.Config_WeightEditor_ShowPvP .. FONT_COLOR_CODE_CLOSE,
				desc = L.Config_WeightEditor_ShowPvP_Desc,
				descStyle = "inline",
				width = "full",
				order = 70,
			},
			pvpPowers_Desc = {
				type = "description",
				name = GRAY_FONT_COLOR_CODE .. L.Config_WeightEditor_ShowPvP_Desc_Import .. FONT_COLOR_CODE_CLOSE,
				fontSize = "medium",
				image = "Interface\\DialogFrame\\UI-Dialog-Icon-AlertOther",
				width = "full",
				order = 75,
			},
		},
	}

	ACR:RegisterOptionsTable(ADDON_NAME.."BlizzInfo", blizzOptions, false)
	self.optionsFrame = ACD:AddToBlizOptions(ADDON_NAME.."BlizzInfo", ADDON_NAME)
end

-- Slash
SLASH_AZERITEPOWERWEIGHTS1 = "/azerite"
if L.Slash_Command and L.Slash_Command ~= "/azerite" then
	SLASH_AZERITEPOWERWEIGHTS2 = L.Slash_Command
end

local SlashHandlers = {
	["debug"] = function() -- Debug stuff
		cfg.debug = not cfg.debug
		Print("Debug:", cfg.debug)
	end,
	["reset"] = function()
		wipe(AzeritePowerWeightsDB)

		f:ADDON_LOADED("ADDON_LOADED", ADDON_NAME)
		if n.treeGroup and n.treeGroup.tree then
			n.treeGroup.tree = _buildTree(n.treeGroup.tree)
			n.treeGroup:SelectByValue(ADDON_NAME.."Import")
			n.treeGroup:RefreshTree(true)
		end
		--ReloadUI()
	end,
	["scale"] = function()
		Print(">", cfg.specScales[playerSpecID].scaleName or L.ScaleName_Unknown)
	end,
	["bang"] = function(...)
		local number = tonumber(...)
		Print("Bang:", number)
	end,
}

local shouldKnowAboutConfig
local _scanPowers -- Debug
SlashCmdList["AZERITEPOWERWEIGHTS"] = function(text)
	local command, params = strsplit(" ", text, 2)

	if SlashHandlers[command] then
		SlashHandlers[command](params)
	else
		if _scanPowers then
			_scanPowers()
		else
			if not shouldKnowAboutConfig then
				Print(L.Slash_RemindConfig, ADDON_NAME)
				shouldKnowAboutConfig = true
			end
			if not n.guiContainer then
				if not _G.AzeriteEmpoweredItemUI then
					local loaded, reason = LoadAddOn("Blizzard_AzeriteUI")
					if loaded then
						_toggleEditorUI()
					else
						Print(L.Slash_Error_Unkown)
						Debug(reason)
					end
				end
			else
				_toggleEditorUI()
			end
		end
	end
end

--#EOF