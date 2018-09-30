### 8.0.23

- Updating Russian translations

### 8.0.22

- Fix visibility of Weight Editor when using addon "Aurora"
- Updating Russian translations

### 8.0.21

- Updated Default-scales because Blizzard has done some balancing on Azerite powers.
- Updating Traditional Chinese translations

### 8.0.20

- Added legend for "Current score / Current potential / Maximum score" for the tooltips. This can be disabled in the config.
- Added also short explanation of different scores to the config.
- Updating Simplified Chinese translations

### 8.0.19

- Updating Russian translations

### 8.0.18

- Fixes to "add itemlevel" calculations when relative values are enabled.
- Adding tooltips for normal quest rewards ([ticket #12](https://wow.curseforge.com/projects/azeritepowerweights/issues/12))

### 8.0.17

- Trying to fix the `attempt to index local 'dataPointer' (a nil value)` error
- Updating Traditional Chinese -translations

### 8.0.16

- Fixing the calculation error in Relative values... Fractions are fun.

### 8.0.15

- **The setting to hide role specific traits for other than your current specs role in the Weight Editor wasn't clear to some people so I changed the default value of that setting for ALL characters (existing and new).**
   - Addon now shows all role specific traits in the Weight Editor by default.
   - If you don't want to see them, you can enable hiding them in the settings.
   - The reason why it was on by default in previous versions was because some hybrid classes has access to quite a lot of traits and I wanted to keep the Weight Editor as clutter free as possible, but this caused some people to not find the trait they were looking for and clearly didn't know about the setting.
- Role specific traits have now icons in front of the trait name to illustrate what roles the traits are aimed for.
   - **If you can see them in the editor, the traits can still appear and you can pick them even if they are marked for different role. It is not a bug for hybrid class to see role traits for other roles than the current specs role.**
- Add itemlevel to score calculations can now be scaled using the weight of Azerite Empowered trait (the center trait) if you don't like the default +1 itemlevel == +1 score.
   - All scores can now be shown as relative to currently equipped items scores in tooltips.
   - Relatives scores can be shown/hidden in the tooltips based on if it has any upgrade potential.
- Few new lines to translate and at least one changed line for translators.
   - Also made a small help page to this addons project page at Curseforge to give translators some context where some of the strings are used at.

### 8.0.14

- Update Russian translations, few first lines translated in Spanish by isaracho.

### 8.0.13

- Translations update

### 8.0.12

- Add scores to comparison tooltips and vendor tooltips

### 8.0.11

- Translation updates for German, Simplified Chinese and Traditional Chinese

### 8.0.10

- New option to add itemlevel to the score calculations.
   - +1 itemlevel is +1 point in score.
   - This is off by default and you can enable it in the config.
- 3 new phrases for translators.
- Translation updates including new Brazilian Portuguese translation by mariogusman

### 8.0.9

- Fix the traits data after I broke it on last update.
- Few more Korean translations by Killberos

### 8.0.8

- Fixed the missing traits for some specializations, if you are still missing specialization specific traits, let me know
- Updated the Default-scales, now they should be little bit more accurate, but still can't promise 100%
- More translations:
   - French by tthegarde
   - Korean by Killberos
   - More Simplified Chinese by plok245
   - **Translators ahoy, L.PowersScoreString has changed. Go check your translations if you need to fix it**
- Small bug fixes

### 8.0.7

- Tying to fix the "'guiContainer' (a nil value)" -errors
- Updating translations (including new Simplified Chinese translations by riggzh)

### 8.0.6

- Additional check for tooltips to prevent errors
- More translations by BNSSNB (Traditional Chinese), dartraiden (Russian) and Sinusquell (German)

### 8.0.5

- Finally fix the [ticket #1](https://wow.curseforge.com/projects/azeritepowerweights/issues/1)
  - And fix it for real this time (I downloaded bdCore to make sure it stays fixed)
- Traditional Chinese (zhTW) translations by BNSSNB

### 8.0.4

- Added scales to tooltips, fixed bugs and updated translations
   - You can now enable scales to be shown on your tooltips
   - You can enable multiple scales to be shown on tooltips at any given time to make it easier for example compare item between single target vs. multi-target without the need to change active scale in the addon.
   - Should work most of the time, but there might be some bugs etc. still around.
- All scales now can show decimals in their scores, the accuracy is up to highest decimal count found on the current items power weights.
   - Thanks to Spookyturbo for pointing this out.
- Tooltips-feature added 2 new strings to the localizations.
- 13 new translations in Germany (deDE), thanks to Sinusquell
- More fixes to [ticket #1](https://wow.curseforge.com/projects/azeritepowerweights/issues/1)

### 8.0.3

- Added Profession created item specific powers and PvP powers.
   - Both of these categories are off by default from the Weight Editor, but powers will be scored with them if they exists in the scales like with every other category.
   - You can turn these categories on by checking config in `ESC -> Interface -> AddOns -> AzeritePowerWeights`.
- Currently only profession created item with Azerite powers are the Engineeering goggles, but I named it as `Professions` to keep it future-proof.
- When PvP-category is enabled, you'll only see your own factions powers, but changes made to them will be mirrored so you can use same Custom-scales for characters on different factions.
   - When you Export scale to a string, you'll get export-string with only your own factions powerIDs to keep the string shorter, but these are interchangeable with opposing factions IDs.
   - When you Import scale from string with only one factions PvP powers, the weights will be mirrored to both factions powers.
- Edit the Settings coloring to make it look less restless
- More settings fine tuning.
- Added name of the current active scale to the Weight Editors statusbar at the bottom.

### 8.0.2

- Typo in Strings.lua

### 8.0.1

- Trying to fix [ticket #1](https://wow.curseforge.com/projects/azeritepowerweights/issues/1)

### 8.0.0

- Initial release