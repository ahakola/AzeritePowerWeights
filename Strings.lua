--[[----------------------------------------------------------------------------
	AzeritePowerWeights

	Helps you pick the best Azerite powers on your gear for your class and spec.

	(c) 2018 -
	Sanex @ EU-Arathor / ahak @ Curseforge
----------------------------------------------------------------------------]]--
local ADDON_NAME, n = ...

local _G = _G
local L = {}
n.L = L

local LOCALE = GetLocale()
do -- enUS / enGB
	-- Data.lua
	L.DefaultScaleName_Default = "Default"
	L.DefaultScaleName_Defensive = "Defensive"
	L.DefaultScaleName_Offensive = "Offensive"

	-- UI.lua
	L.ScaleWeightEditor_Title = "%s Scale Weight Editor" -- %s = ADDON_NAME

	-- Core.lua
	L.ScalesList_CustomGroupName = "Custom Scales"
	L.ScalesList_DefaultGroupName = "Default Scales"
	L.ScalesList_CreateImportText = "Create New / Import"

	L.ScaleName_Unnamed = "Unnamed"
	L.ScaleName_Unknown = "Unknown"

	L.ExportPopup_Title = "Export Scale"
	L.ExportPopup_Desc = "Exporting scale %1$s\nPress %2$sCtrl+C%3$s to copy the string and %4$sCtrl+V%5$s to paste it somewhere" -- %1$s = scaleName, rest are color codes

	L.ImportPopup_Title = "Import Scale"
	L.ImportPopup_Desc = "Importing scale from string\nPress %1$sCtrl+V%2$s to paste string to the editbox and press %3$s" -- %1$s and %2$s are color codes and %3$s = _G.ACCEPT
	L.ImportPopup_Error_OldStringVersion = "ERROR: \"Import string\" -version is too old or malformed import string!"
	L.ImportPopup_Error_MalformedString = "ERROR: Malformed import string!"
	L.ImportPopup_UpdatedScale = "Updated existing scale \"%s\"" -- %s = scaleName
	L.ImportPopup_CreatedNewScale = "Imported new scale \"%s\"" -- %s = scaleName

	L.CreatePopup_Title = "Create Scale"
	L.CreatePopup_Desc = "Creating new scale. Select class and specialization from dropdown and then enter name for the new scale and press %1$s" -- %s = _G.ACCEPT
	L.CreatePopup_Error_UnknownError = "ERROR: Something went wrong creating new scale \"%s\"!" -- %s = scaleName
	L.CreatePopup_Error_CreatedNewScale = "Created new scale \"%s\"" -- %s = scaleName

	L.RenamePopup_Title = "Rename Scale"
	L.RenamePopup_Desc = "Renaming scale %1$s\nEnter new name to the editbox and press %2$s" -- %1$s = old (current) scaleName, %2$s = _G.ACCEPT
	L.RenamePopup_RenamedScale = "Renamed scale \"%1$s\" to \"%2$s\"" -- %1$s = old scaleName, %2$s = new scaleName

	L.DeletePopup_Title = "Delete Scale"
	L.DeletePopup_Desc = "Deleting scale %1$s\nPress %2$s to confirm.\nAll characters using this scale for their specialization will be reverted back to Default scale." -- %1$s = scaleName, %2$s = _G.ACCEPT
	L.DeletePopup_Warning = " ! This action is permanent and cannot be reversed ! "
	L.DeletePopup_DeletedScale = "Deleted scale \"%s\"" -- %s = scaleName
	L.DeletePopup_DeletedDefaultScale = "Deleted scale was in use, reverting back to Default-option for your class and specialization!"

	L.WeightEditor_VersionText = "Version %s" -- %s = version
	L.WeightEditor_CreateNewText = "Create New"
	L.WeightEditor_ImportText = "Import"
	L.WeightEditor_EnableScaleText = "Use this Scale"
	L.WeightEditor_ExportText = "Export"
	L.WeightEditor_RenameText = "Rename"
	L.WeightEditor_DeleteText = "Delete"

	L.PowersTitles_Class = "Class Powers"
	L.PowersTitles_Defensive = "Defensive Powers"
	L.PowersTitles_Role = "Role Powers"
	L.PowersTitles_Zone = "Raid and Zone Powers"

	L.PowersScoreString = "Current score: %1$d/%2$d\nMaximum score: %3$d\nAzerite level: %4$d/%5$d" -- %1$d = currentScore, %2$d = currentPotential, %3$d = maximumScore, %4$d = currentLevel, %5$d = maxLevel

	L.Config_SettingsSavedPerChar = "All these settings here are saved per character.\nCustom scales are shared between all characters."
	L.Config_Scales_Title = "Scales list"
	L.Config_Scales_Desc = "Following settings only affects the list of Default scales. All Custom scales will be always listed to every class."
	L.Config_Scales_OwnClassDefaultsOnly = "List own class Default-scales only"
	L.Config_Scales_OwnClassDefaultsOnly_Desc = "List Default-scales for your own class only, instead of listing all of them."

	L.Config_WeightEditor_Title = "Scales weight editor"
	L.Config_WeightEditor_Desc = "Following settings only affects the powers shown in the scale weight editor. Even if you disable them, all and any Azerite powers will be still scored if they have weight set to them in the active scale."
	L.Config_WeightEditor_ImportingCanUpdate = "Importing can update existing scales"
	L.Config_WeightEditor_ImportingCanUpdate_Desc = "When importing scale with same name, class and specialization as pre-existing scale, it updates the existing scale with the new weights instead of creating new scale. Different scales with same name can exist for different specializations or classes."
	L.Config_WeightEditor_ShowDefensive = "Show Defensive powers"
	L.Config_WeightEditor_ShowDefensive_Desc = "Show common and class specific Defensive powers in the scale weight editor."
	L.Config_WeightEditor_ShowRole = "Show Role specific powers"
	L.Config_WeightEditor_ShowRole_Desc = "Show Role specific powers in the scale weight editor."
	L.Config_WeightEditor_ShowRolesOnlyForOwnSpec = "Show Role specific powers only for my own specializations role"
	L.Config_WeightEditor_ShowRolesOnlyForOwnSpec_Desc = "Show common and current specialization related specific Role specific powers in the scale weight editor. Enabling this setting e.g. hides healer only specific powers from damagers and tanks etc."
	L.Config_WeightEditor_ShowZone = "Show Zone specific powers"
	L.Config_WeightEditor_ShowZone_Desc = "Show Zone specific powers in the scale weight editor. These powers can only appear in items acquired in particular zones related to the power."
	L.Config_WeightEditor_ShowZone_Desc_Proc = "Normal zone specific powers can activate/proc everywhere, but raid powers will do so only while inside their related raid instance (e.g. Uldir powers will only proc while inside Uldir raid instance).\nRaid powers are marked with an asterisk (*) next to their name in the scale weight editor."

	L.Slash_Command = "/azerite" -- If you need localized slash-command, this doesn't replace the existing /azerite
	L.Slash_RemindConfig = "Check ESC -> Interface -> AddOns -> %s for settings." -- %s = ADDON_NAME
	L.Slash_Error_Unkown = "ERROR: Something went wrong!"
end

if LOCALE == "deDE" then
--@localization(locale="deDE", format="lua_additive_table", handle-subnamespaces="concat")@

elseif LOCALE == "esES" then
--@localization(locale="esES", format="lua_additive_table", handle-subnamespaces="concat")@

elseif LOCALE == "esMX" then
--@localization(locale="esMX", format="lua_additive_table", handle-subnamespaces="concat")@

elseif LOCALE == "frFR" then
--@localization(locale="frFR", format="lua_additive_table", handle-subnamespaces="concat")@

elseif LOCALE == "itIT" then
--@localization(locale="itIT", format="lua_additive_table", handle-subnamespaces="concat")@

elseif LOCALE == "ptBR" then
--@localization(locale="ptBR", format="lua_additive_table", handle-subnamespaces="concat")@

elseif LOCALE == "ruRU" then
--@localization(locale="ruRU", format="lua_additive_table", handle-subnamespaces="concat")@

elseif LOCALE == "koKR" then
--@localization(locale="koKR", format="lua_additive_table", handle-subnamespaces="concat")@

elseif LOCALE == "zhCN" then
--@localization(locale="znCN", format="lua_additive_table", handle-subnamespaces="concat")@

elseif LOCALE == "zhTW" then
--@localization(locale="zhTW", format="lua_additive_table", handle-subnamespaces="concat")@

end

--#EOF