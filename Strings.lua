--[[----------------------------------------------------------------------------
	AzeritePowerWeights

	Helps you pick the best Azerite powers on your gear for your class and spec.

	(c) 2018 - 2024
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
	L.ImportPopup_Error_OldStringRetry = "ERROR: Old or malformed \"Import string\" -version is used, trying to import it anyway as a new scale!"
	L.ImportPopup_Error_OldStringVersion = "ERROR: \"Import string\" -version is too old or malformed import string!"
	L.ImportPopup_Error_MalformedString = "ERROR: Malformed import string!"
	L.ImportPopup_UpdatedScale = "Updated existing scale \"%s\"" -- %s = scaleName
	L.ImportPopup_CreatedNewScale = "Imported new scale \"%s\"" -- %s = scaleName

	L.MassImportPopup_Title = "Mass Import Scales"
	L.MassImportPopup_Desc = "Importing multiple scales at once from string\nPress %1$sCtrl+V%2$s to paste string to the editbox and press %3$s" -- %1$s and %2$s are color codes and %3$s = _G.ACCEPT

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
	L.WeightEditor_MassImportText = "Mass Import"
	L.WeightEditor_EnableScaleText = "Use this Scale"
	L.WeightEditor_ExportText = "Export"
	L.WeightEditor_RenameText = "Rename"
	L.WeightEditor_DeleteText = "Delete"
	L.WeightEditor_TooltipText = "Show in Tooltips"
	L.WeightEditor_ModeToEssences = "Change to Essences"
	L.WeightEditor_ModeToTraits = "Change to Traits"
	L.WeightEditor_TimestampText_Created = "Created %s" -- %s DD.MM.YYYY
	L.WeightEditor_TimestampText_Imported = "Imported %s" -- %s DD.MM.YYYY
	L.WeightEditor_TimestampText_Updated = "Updated %s" -- %s DD.MM.YYYY
	L.WeightEditor_CurrentScale = "Current scale: %s" -- %s current scaleName
	L.WeightEditor_Major = "Major"
	L.WeightEditor_Minor = "Minor"

	L.PowersTitles_Class = "Class Powers"
	L.PowersTitles_Defensive = "Defensive Powers"
	L.PowersTitles_Role = "Role Powers"
	L.PowersTitles_Zone = "Raid and Zone Powers"
	L.PowersTitles_Profession = "Profession Powers"
	L.PowersTitles_PvP = "PvP Powers"

	L.PowersScoreString = "Current score: %1$s/%2$s\nMaximum score: %3$s\nAzerite level: %4$d/%5$d" -- %1$s = currentScore, %2$s = currentPotential, %3$s = maximumScore, %4$d = currentLevel, %5$d = maxLevel
	L.ItemToolTip_AzeriteLevel = "Azerite level: %1$d / %2$d" -- %1$d = currentLevel, %2$d = maxLevel
	L.ItemToolTip_Legend = "Current score / Current potential / Maximum score"

	L.Config_SettingsAddonExplanation = "This addon calculates \"Current score\", \"Current potential\" and \"Maximum score\" for Azerite gear based on your selected scale's weights."
	L.Config_SettingsScoreExplanation = "\"Current score\" is the sum of the currently selected Azerite powers in the item.\n\"Current potential\" is the sum of the highest weighted Azerite powers from each tier you have access to in the item.\n\"Maximum score\" is the sum of the highest weighted Azerite powers from each tier, including the locked ones, in the item."
	L.Config_SettingsSavedPerChar = "All these settings here are saved per character.\nCustom scales are shared between all characters."

	L.Config_Enable_Traits = "Azerite Traits"
	L.Config_Enable_Traits_Desc = "Enable %s for Azerite Empowered items." -- %s = ADDON_NAME
	L.Config_Enable_Essences = "Azerite Essences"
	L.Config_Enable_Essences_Desc = "Enable %s for Azerite Essences." -- %s = ADDON_NAME

	L.Config_Scales_Title = "Scales list"
	--L.Config_Scales_Desc = "Following settings only affects the list of Default scales. All Custom scales will be always listed to every class."
	L.Config_Scales_OwnClassDefaultsOnly = "List own class Default-scales only"
	L.Config_Scales_OwnClassDefaultsOnly_Desc = "List Default-scales for your own class only, instead of listing all of them."
	L.Config_Scales_OwnClassCustomsOnly = "List own class Custom-scales only"
	L.Config_Scales_OwnClassCustomsOnly_Desc = "List Custom-scales for your own class only, instead of listing all of them."

	L.Config_Importing_Title = "Importing"
	L.Config_Importing_ImportingCanUpdate = "Importing can update existing scales"
	L.Config_Importing_ImportingCanUpdate_Desc = "When importing scale with same name, class and specialization as pre-existing scale, existing scale will be updated with the new weights instead of creating new scale."
	L.Config_Importing_ImportingCanUpdate_Desc_Clarification = "There can be multiple scales with same name as long as they are for different specializations or classes."

	L.Config_WeightEditor_Title = "Scales weight editor"
	L.Config_WeightEditor_Desc = "Following settings only affects the powers shown in the scale weight editor. Even if you disable them, all and any Azerite powers will be still scored if they have weight set to them in the active scale."
	L.Config_WeightEditor_ShowDefensive = "Show Defensive powers"
	L.Config_WeightEditor_ShowDefensive_Desc = "Show common and class specific Defensive powers in the scale weight editor."
	L.Config_WeightEditor_ShowRole = "Show Role specific powers"
	L.Config_WeightEditor_ShowRole_Desc = "Show Role specific powers in the scale weight editor."
	L.Config_WeightEditor_ShowRolesOnlyForOwnSpec = "Show Role specific powers only for my own specializations role"
	L.Config_WeightEditor_ShowRolesOnlyForOwnSpec_Desc = "Show common and current specialization related specific Role specific powers in the scale weight editor. Enabling this setting e.g. hides healer only specific powers from damagers and tanks etc."
	L.Config_WeightEditor_ShowZone = "Show Zone specific powers"
	L.Config_WeightEditor_ShowZone_Desc = "Show Zone specific powers in the scale weight editor. These powers can only appear in items acquired in particular zones related to the power."
	L.Config_WeightEditor_ShowZone_Desc_Proc = "Zone specific powers can activate/proc everywhere, but raid powers have secondary effect which will activate only while inside their related raid instance (e.g. Uldir powers secondary effect will only proc while inside Uldir raid instance).\nRaid powers are marked with an asterisk (*) next to their name in the scale weight editor."
	L.Config_WeightEditor_ShowProfession = "Show Profession specific powers"
	L.Config_WeightEditor_ShowProfession_Desc = "Show Profession specific powers in the scale weight editor. These powers can only appear in items created with professions. Currently, these can only appear in Engineering headgear."
	L.Config_WeightEditor_ShowPvP = "Show PvP specific powers"
	L.Config_WeightEditor_ShowPvP_Desc = "Show PvP specific powers in the scale weight editor. You'll only see your own factions powers, but changes made to them will be mirrored to both factions."
	L.Config_WeightEditor_ShowPvP_Desc_Import = "When Exporting, the resulting export-string will only include your own factions pvp powers, but they are interchangeable with opposing factions pvp-powerIDs.\nWhen Importing import-string with pvp powers only from one faction, powers will get their weights mirrored to both factions on Import."

	L.Config_Score_Title = "Score"
	L.Config_Score_AddItemLevelToScore = "Add itemlevel to all scores"
	L.Config_Score_AddItemLevelToScore_Desc = "Add Azerite items itemlevel to all current score, current potential and maximum score calculations."
	L.Config_Score_ScaleByAzeriteEmpowered = "Scale itemlevel score by the weight of %s in the scale" -- %s Name of Azerite Empowered, returned by _G.GetSpellInfo(263978)
	L.Config_Score_ScaleByAzeriteEmpowered_Desc = "When adding itemlevel to the scores, use the weight of %s of the scale to calculate value of +1 itemlevel instead of using +1 itemlevel = +1 score." -- %s Name of Azerite Empowered, returned by _G.GetSpellInfo(263978)
	L.Config_Score_AddPrimaryStatToScore = "Add primary stat to all scores"
	L.Config_Score_AddPrimaryStatToScore_Desc = "Add Azerite items amount of primary stat (%s/%s/%s) to all current score, current potential and maximum score calculations." -- %s, %s, %s = _G.ITEM_MOD_AGILITY_SHORT, _G.ITEM_MOD_INTELLECT_SHORT, _G.ITEM_MOD_STRENGTH_SHORT
	L.Config_Score_RelativeScore = "Show relative values in tooltips instead of absolute values"
	L.Config_Score_RelativeScore_Desc = "Instead of showing absolute values of scales in tooltips, calculate the relative value compared to currently equipped items and show them in percentages."
	L.Config_Score_ShowOnlyUpgrades = "Show tooltips only for upgrades"
	L.Config_Score_ShowOnlyUpgrades_Desc = "Show scales values in tooltips only if it is an upgrade compared to currently equipped item. This works only with relative values enabled."
	L.Config_Score_ShowTooltipLegend = "Show legend in tooltips"
	L.Config_Score_ShowTooltipLegend_Desc = "Show reminder for \"Current score / Current potential / Maximum score\" in tooltips."
	L.Config_Score_OutlineScores = "Outline Scores"
	L.Config_Score_OutlineScores_Desc = "Draw small outline around the score-numbers on Azerite traits/essences to make it easier to read the numbers on light trait/essence icons."
	L.Config_Score_PreferBiSMajor = "Prefer best major essence"
	L.Config_Score_PreferBiSMajor_Desc = "Always pick the highest scored major essence even when sometimes you could get better overall score by not selecting the best major essence. When this setting is disabled, the addon will calculate few different score combinations and will pick the best overall score."

	L.Slash_Command = "/azerite" -- If you need localized slash-command, this doesn't replace the existing /azerite
	L.Slash_RemindConfig = "Check ESC -> Interface -> AddOns -> %s for settings." -- %s = ADDON_NAME
	L.Slash_Error_Unkown = "ERROR: Something went wrong!"

	L.Debug_CopyToBugReport = "COPY & PASTE the text above to your bug report if you think it is relevant."
end
-- 111 Phrases

if LOCALE == "deDE" then -- Sinusquell (39), Tiggi2702 (5), Vivan (2), pas06 (2), Cytoph (1), imna1975 (17), Aurielqt (6)
	-- 2 + 31 + 42 + 30 = 105
	-- 94.59% translated
--@localization(locale="deDE", format="lua_additive_table", handle-subnamespaces="concat")@

elseif LOCALE == "esES" then -- isaracho (4)
	-- 110 + 1 = 111
	-- 100% translated
--@localization(locale="esES", format="lua_additive_table", handle-subnamespaces="concat")@

elseif LOCALE == "esMX" then -- assesino55 (16)
	-- 16 = 16
	-- 14.4% translated
	-- 16 under review
--@localization(locale="esMX", format="lua_additive_table", handle-subnamespaces="concat")@

elseif LOCALE == "frFR" then -- tthegarde (19), Marechoux (9), follower4jas (1)
	-- 3 + 11 + 10 + 66 + 8 + 13 = 111
	-- 100% translated
	-- 101 under review
--@localization(locale="frFR", format="lua_additive_table", handle-subnamespaces="concat")@

elseif LOCALE == "itIT" then -- faniel80 (111)
	-- 111 = 111
	-- 100% translated
--@localization(locale="itIT", format="lua_additive_table", handle-subnamespaces="concat")@

elseif LOCALE == "koKR" then -- Killberos (52)
	-- 1 + 52 = 53
	-- 30.63% translated
	-- 19 under review
--@localization(locale="koKR", format="lua_additive_table", handle-subnamespaces="concat")@

elseif LOCALE == "ptBR" then -- mariogusman (73)
	-- 73 = 73
	-- 49.55% translated
	-- 18 under review
--@localization(locale="ptBR", format="lua_additive_table", handle-subnamespaces="concat")@

elseif LOCALE == "ruRU" then -- dartraiden (78), Hubbotu (18), rtim0905 (0), Wolfeg (1), lorientalas (1)
	-- 83 + 1 + 3 + 24 = 111
	-- 100% translated
--@localization(locale="ruRU", format="lua_additive_table", handle-subnamespaces="concat")@

elseif LOCALE == "zhCN" then -- plok245 (27), riggzh (29), xlfd2008 (33)
	-- 29 + 55 + 27 = 111
	-- 100% translated
	-- 111 under review
--@localization(locale="zhCN", format="lua_additive_table", handle-subnamespaces="concat")@

elseif LOCALE == "zhTW" then -- BNSSNB (96), Sinusquell (1)
	-- 111 = 111
	-- 100% translated
--@localization(locale="zhTW", format="lua_additive_table", handle-subnamespaces="concat")@

end

--#EOF