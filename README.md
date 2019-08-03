# AzeritePowerWeights

Helps you pick the best Azerite powers on your gear for your class and spec.

---

This addon calculates **Current score**, **Current potential** and **Maximum score** for Azerite gear based on your selected scale's weights.

- **Current score** is the sum of the currently selected Azerite powers in the Azerite item.
- **Current potential** is the sum of the highest weighted Azerite powers from each tier you have access to in the Azerite item.
- **Maximum score** is the sum of the highest weighted Azerite powers from each tier, including the locked ones, in the Azerite item.

![Score Legend](https://i.imgur.com/DGu2MtV.png "Score Legend")

---

This addon adds score markers on the Azerite powers on your Azerite gear to help you pick the best powers for your class and spec and tells you not only your current total score, but also the current and maximum score potential for the item. You can use built in `Default-scales`, make `New` scales for any class and spec or share them with others using `Export`/`Import`.

Only one scale can be active to be showing scores in the Azerite UI at any given time, but **you can check as many scales you want to be shown on tooltips** in the Weights Editor. Tooltips will have list of those scales with current score, current potential and maximum score for the item you hover on. **If you enable scales to be shown on tooltips for your offspecs or different scenarios, you can tell fast if an item has potential to be a possible upgrade for you or not without changing Default-scales**.

---

The addon can add itemlevel to the score calculations if you wish so. You can use either *+1 itemlevel = +1 score* or let the addon calculate the score value of *+1 itemlevel* based on your scales weight for `Azerite Empowered` (*+5ilvl center trait*).

![Itemlevel](https://i.imgur.com/KqL93Ns.png "Itemlevel")

---

You can also enable relative scores to replace the absolute number values with percentages compared to your current equipped item for that slot and have the tooltip texts shown only for relative scales if the possible gain is upgrade.

![Relative Scores](https://i.imgur.com/sDyn6J3.png "Relative Scores")

---

## Scales

`Default-scales` are meant to be a all-around starter weights for people who aren't good at simulating their own results. My plan is to NOT push updates for them after every small fix or fine tuning of `SimulationCraft`. For more accurate and/or up to date results, I strongly suggest you use `Custom-scales` by either simulating your own results tailored for your own characters, search for import-strings at sites specialized in theorycrafting for your own class and specialization or visit sites specialized at doing these simulations for all the different classes and specializations. **If you are min-maxing your character, running your own simulations after every item swap for every scenario you are interested in is the only way of getting accurate results. There isn't a single magic scale that works everytime all the time.**

Most of the current `Default-scales` are done by myself using `SimulationCraft` and **might contain some errors**. `SimulationCraft` doesn't support healers, so I can't simulate `Default-scales` for those specs. PM me if you want to help contribute for `Default-scales`.

At the time of writing this, at least https://www.herodamage.com/ and https://bloodmallet.com/ provides import-strings for all the specializations supported by `SimulationCraft` (I'm not affiliated with these sites).

If you have good source for ranking Azerite powers for your own spec, you make and export the best Custom-scale for your spec yourself, or you can help me improve my `SimulationCraft` templates, don't hesitate to contact me via PM, comment or ticket so everyone can benefit from the improved `Default-scales`.

---

## Read this if you can't find trait X in the Weight Editor!

If you are looking for role specific Azerite trait (not to be confused with specialization specific traits), but can't find it in the Weight Editor, the trait could be aimed for different role than you current (even though it could be usable by your class because you have access to specialization with that role). To make it appear in the Weight Editor, make sure `Show Role specific powers only for my own specialization role` is disabled in the Config (`ESC - Interface - AddOns - AzeritePowerWeights`)

For specialization specific traits addon only shows the traits returned by Blizzard's API for your specialization. If you are 110% sure you can use it, you can `Export` your current scale, add the weight for the trait manually (add `[azeritePowerID]=[YOUR WEIGHT]` to the list of weights in the export-string, without the brackets of course) and `Import` the scale to update your scale. You still won't see the trait in the Weight Editor, but it will be added to all calculations and will be visible in AzeriteUI.

If you still can't find a trait and you are 100% sure you should be able to find it, don't hesitate to open a issue ticket or contact me any other way!

---

## Errors, bugs and feature requests

If you run into errors or bugs or have request for new feature, **please check if someone has already made a ticket** for it. Going through same information posted across all the different pages and inboxes takes time away from actually fixing the problems.

You can find all the tickets at the [Curseforge's Issue tracker](https://www.curseforge.com/wow/addons/azeritepowerweights/issues) and post your new findings to the existing tickets if the new information is still relevant. If you can't find existing ticket for the bug/feature request, then you can create a new one.

If you don't get any errors but the addon is clearly not working, make sure you have Lua-errors turned on (**/console scriptErrors 1**).

---

### Translations
- deDE (German): **Aurielli, Bullseiify, imna1975, StellariMi, tiggye, zhavvorsa, Zonk87**
- esES (Spanish): **sinnkin**
- esMX (Latin American Spanish):
- frFR (French): **Marechoux, Matisk, tthegarde**
- itIT (Italian):
- koKR (Korean): **killberos**
- ptBR (Brazilian Portuguese): **mariogusman**
- ruRU (Russian): **dartraiden, Hubbotu, lorientalas, Wolfeg_xgm**
- zhCN (Simplified Chinese): **plok245, riggzh, xlfd2008**
- zhTW (Traditional Chinese): **BNS333, Zonk87**

Polish translations: available at https://wowpopolsku.pl/viewtopic.php?f=6&t=219&p=2263#p2263

---

### Default scales

Dates are in DD.MM.YYYY-format.

- **Shadow Priest** by WarcraftPriests (https://warcraftpriests.com/) [updated 02.08.2019]
- Default-scales for 8.2.0 [updated 02.08.2019]