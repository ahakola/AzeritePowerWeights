# AzeritePowerWeights

Helps you pick the best Azerite powers on your gear for your class and spec.

---

This addon calculates **Current score**, **Current potetial** and **Maximum score** for Azerite gear based on your selected scale's weights.

- **Current score** is the sum of the currently selected Azerite powers in the Azerite item.
- **Current potetial** is the sum of the highest weighted Azerite powers from each tier you have access to in the Azerite item.
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

`Default-scales` are ment to be a all-around starter weights for people who aren't good at simulating their own results. My plan is not to push updates for them after every small fix or fine tuning of `SimulationCraft`. For more accurate and/or up to date results, I strongly suggest either simulating your own results tailored for your own characters or search for import-strings at sites specialized in theorycrafting for your own class and specialization or sites specialized at doing these simulations for all the different classes and specializations. **If you are min-maxing your character, running your own simulations after every item swap for every scenario you are interested in is the only way of getting accurate results.**

Most of the current `Default-scales` are done by myself using `SimulationCraft` and `Excel` and **might contain some errors**. `SimulationCraft` doesn't support healers and, at the time of my last simulations, Protection Warriors.

At the time of writing this, at least https://www.herodamage.com/ and https://bloodmallet.com/ provides import-strings for all the specializations supported by `SimulationCraft` (I'm not affiliated with these sites).

If you have good source for ranking Azerite powers for your own spec, you make and export the best Custom-scale for your spec yourself, or you can help me improve my `SimulationCraft` templates, don't hesitate to contact me via PM, comment or ticket so I can improve the `Default-scales`.

---

## Read this if you can't find trait X in the Weight Editor!

If you are looking for role specific Azerite trait (not to be confused with specialization specific traits), but can't find it in the Weight Editor, the trait could be aimed for different role than you current (even though it could be usable by your class because you have access to specialization with that role). To make it appear in the Weight Editor, make sure `Show Role specific powers only for my own specialization role` is disabled in the Config (`ESC - Interface - AddOns - AzeritePowerWeights`)

For specialization specific traits addon only shows the traits returned by Blizzard's API for your specialization. If you are 110% sure you can use it, you can `Export` your current scale, add the weight for the trait manually (add `[azeritePowerID]=[YOUR WEIGHT]` to the list of weights in the export-string, without the brackets of course) and `Import` the scale to update your scale. You still won't see the trait in the Weight Editor, but it will be added to all calculations and will be visible in AzeriteUI.

If you still can't find a trait and you are 100% sure you should be able to find it, don't hesitate to open a issue ticket or contact me any other way!

---

### Translations
- deDE (German): **Sinusquell, Tiggi2702, Vivan, pas06**
- esES (Spanish): **isaracho**
- esMX (Latin American Spanish):
- frFR (French): **tthegarde, Marechoux**
- itIT (Italian):
- koKR (Korean): **Killberos**
- ptBR (Brazilian Portuguese): **mariogusman**
- ruRU (Russian): **dartraiden, Hubbotu, rtim0905, Wolfeg**
- zhCN (Simplified Chinese): **riggzh, plok245, xlfd2008**
- zhTW (Traditional Chinese): **BNSSNB**

---

### Default scales

Dates are in DD.MM.YY-format.

- **Shadow Priest** by WarcraftPriests (https://warcraftpriests.com/) [updated 25.09.18]