--[[----------------------------------------------------------------------------
	AzeritePowerWeights

	Helps you pick the best Azerite powers on your gear for your class and spec.

	(c) 2018 -
	Sanex @ EU-Arathor / ahak @ Curseforge

---------------------------------------------------------------------------------
	1	Warrior
		71 - Arms
		72 - Fury
		73 - Protection
	2	Paladin
		65 - Holy
		66 - Protection
		70 - Retribution
	3	Hunter
		253 - Beast Mastery
		254 - Marksmanship
		255 - Survival
	4	Rogue
		259 - Assassination
		260 - Outlaw
		261 - Subtlety
	5	Priest
		256 - Discipline
		257 - Holy
		258 - Shadow
	6	Death Knight
		250 - Blood
		251 - Frost
		252 - Unholy
	7	Shaman
		262 - Elemental
		263 - Enhancement
		264 - Restoration
	8	Mage
		62 - Arcane
		63 - Fire
		64 - Frost
	9	Warlock
		265 - Affliction
		266 - Demonology
		267 - Destruction
	10	Monk
		268 - Brewmaster
		269 - Windwalker
		270 - Mistweaver
	11	Druid
		102 - Balance
		103 - Feral
		104 - Guardian
		105 - Restoration
	12	Demon Hunter
		577 - Havoc
		581 - Vengeance
----------------------------------------------------------------------------]]--
local ADDON_NAME, n = ...

local L = n.L

-- Powers for every Class and Spec
local sourceData = {
	["center"] = {
		["spellID"] = 263978,
		["icon"] = 2065624,
		["name"] = "Azerite Empowered",
		["azeritePowerID"] = 13,
	},
	["class"] = {
		{
			[73] = {
				{
					["spellID"] = 272824,
					["icon"] = 136105,
					["name"] = "Deafening Crash",
					["azeritePowerID"] = 118,
				}, -- [1]
				{
					["spellID"] = 279172,
					["icon"] = 1377132,
					["name"] = "Bloodsport",
					["azeritePowerID"] = 177,
				}, -- [2]
				{
					["spellID"] = 287377,
					["icon"] = 254108,
					["name"] = "Bastion of Might",
					["azeritePowerID"] = 237,
				}, -- [3]
				{
					["spellID"] = 278760,
					["icon"] = 132353,
					["name"] = "Callous Reprisal",
					["azeritePowerID"] = 440,
				}, -- [4]
				{
					["spellID"] = 278765,
					["icon"] = 942783,
					["name"] = "Iron Fortress",
					["azeritePowerID"] = 441,
				}, -- [5]
				{
					["spellID"] = 277636,
					["icon"] = 134951,
					["name"] = "Brace for Impact",
					["azeritePowerID"] = 450,
				}, -- [6]
				{
					["spellID"] = 287377,
					["icon"] = 254108,
					["name"] = "Bastion of Might",
					["azeritePowerID"] = 520,
				}, -- [7]
			},
			[71] = {
				{
					["spellID"] = 288452,
					["icon"] = 236317,
					["name"] = "Striking the Anvil",
					["azeritePowerID"] = 121,
				}, -- [1]
				{
					["spellID"] = 273409,
					["icon"] = 236303,
					["name"] = "Gathering Storm",
					["azeritePowerID"] = 174,
				}, -- [2]
				{
					["spellID"] = 275529,
					["icon"] = 236314,
					["name"] = "Test of Might",
					["azeritePowerID"] = 226,
				}, -- [3]
				{
					["spellID"] = 277639,
					["icon"] = 132223,
					["name"] = "Seismic Wave",
					["azeritePowerID"] = 433,
				}, -- [4]
				{
					["spellID"] = 278751,
					["icon"] = 132340,
					["name"] = "Crushing Assault",
					["azeritePowerID"] = 434,
				}, -- [5]
				{
					["spellID"] = 278752,
					["icon"] = 464973,
					["name"] = "Lord of War",
					["azeritePowerID"] = 435,
				}, -- [6]
				{
					["spellID"] = 287377,
					["icon"] = 254108,
					["name"] = "Bastion of Might",
					["azeritePowerID"] = 520,
				}, -- [7]
				{
					["spellID"] = 288452,
					["icon"] = 236317,
					["name"] = "Striking the Anvil",
					["azeritePowerID"] = 550,
				}, -- [8]
			},
			[72] = {
				{
					["spellID"] = 288056,
					["icon"] = 132344,
					["name"] = "Unbridled Ferocity",
					["azeritePowerID"] = 119,
				}, -- [1]
				{
					["spellID"] = 273409,
					["icon"] = 236303,
					["name"] = "Gathering Storm",
					["azeritePowerID"] = 174,
				}, -- [2]
				{
					["spellID"] = 288080,
					["icon"] = 236276,
					["name"] = "Cold Steel, Hot Blood",
					["azeritePowerID"] = 176,
				}, -- [3]
				{
					["spellID"] = 275632,
					["icon"] = 132352,
					["name"] = "Pulverizing Blows",
					["azeritePowerID"] = 229,
				}, -- [4]
				{
					["spellID"] = 278757,
					["icon"] = 136110,
					["name"] = "Simmering Rage",
					["azeritePowerID"] = 437,
				}, -- [5]
				{
					["spellID"] = 278758,
					["icon"] = 132147,
					["name"] = "Reckless Flurry",
					["azeritePowerID"] = 438,
				}, -- [6]
				{
					["spellID"] = 277638,
					["icon"] = 458972,
					["name"] = "Infinite Fury",
					["azeritePowerID"] = 451,
				}, -- [7]
				{
					["spellID"] = 288056,
					["icon"] = 132344,
					["name"] = "Unbridled Ferocity",
					["azeritePowerID"] = 544,
				}, -- [8]
				{
					["spellID"] = 288080,
					["icon"] = 236276,
					["name"] = "Cold Steel, Hot Blood",
					["azeritePowerID"] = 545,
				}, -- [9]
			},
		}, -- [1]
		{
			[70] = {
				{
					["spellID"] = 272898,
					["icon"] = 135875,
					["name"] = "Avenger's Might",
					["azeritePowerID"] = 125,
				}, -- [1]
				{
					["spellID"] = 278617,
					["icon"] = 135897,
					["name"] = "Relentless Inquisitor",
					["azeritePowerID"] = 154,
				}, -- [2]
				{
					["spellID"] = 273473,
					["icon"] = 1360757,
					["name"] = "Expurgation",
					["azeritePowerID"] = 187,
				}, -- [3]
				{
					["spellID"] = 275496,
					["icon"] = 135959,
					["name"] = "Indomitable Justice",
					["azeritePowerID"] = 235,
				}, -- [4]
				{
					["spellID"] = 278593,
					["icon"] = 135917,
					["name"] = "Grace of the Justicar",
					["azeritePowerID"] = 393,
				}, -- [5]
				{
					["spellID"] = 286229,
					["icon"] = 135878,
					["name"] = "Light's Decree",
					["azeritePowerID"] = 396,
				}, -- [6]
				{
					["spellID"] = 286390,
					["icon"] = 236263,
					["name"] = "Empyrean Power",
					["azeritePowerID"] = 453,
				}, -- [7]
				{
					["spellID"] = 277675,
					["icon"] = 1603010,
					["name"] = "Judicious Defense",
					["azeritePowerID"] = 454,
				}, -- [8]
				{
					["spellID"] = 286390,
					["icon"] = 236263,
					["name"] = "Empyrean Power",
					["azeritePowerID"] = 507,
				}, -- [9]
				{
					["spellID"] = 286229,
					["icon"] = 135878,
					["name"] = "Light's Decree",
					["azeritePowerID"] = 508,
				}, -- [10]
			},
			[65] = {
				{
					["spellID"] = 267892,
					["icon"] = 513195,
					["name"] = "Synergistic Growth",
					["azeritePowerID"] = 102,
				}, -- [1]
				{
					["spellID"] = 272898,
					["icon"] = 135875,
					["name"] = "Avenger's Might",
					["azeritePowerID"] = 125,
				}, -- [2]
				{
					["spellID"] = 287268,
					["icon"] = 1360764,
					["name"] = "Glimmer of Light",
					["azeritePowerID"] = 139,
				}, -- [3]
				{
					["spellID"] = 273513,
					["icon"] = 135907,
					["name"] = "Moment of Compassion",
					["azeritePowerID"] = 188,
				}, -- [4]
				{
					["spellID"] = 275463,
					["icon"] = 236254,
					["name"] = "Divine Revelations",
					["azeritePowerID"] = 233,
				}, -- [5]
				{
					["spellID"] = 275496,
					["icon"] = 135959,
					["name"] = "Indomitable Justice",
					["azeritePowerID"] = 235,
				}, -- [6]
				{
					["spellID"] = 278593,
					["icon"] = 135917,
					["name"] = "Grace of the Justicar",
					["azeritePowerID"] = 393,
				}, -- [7]
				{
					["spellID"] = 278594,
					["icon"] = 461859,
					["name"] = "Breaking Dawn",
					["azeritePowerID"] = 394,
				}, -- [8]
				{
					["spellID"] = 277674,
					["icon"] = 135972,
					["name"] = "Radiant Incandescence",
					["azeritePowerID"] = 452,
				}, -- [9]
				{
					["spellID"] = 277675,
					["icon"] = 1603010,
					["name"] = "Judicious Defense",
					["azeritePowerID"] = 454,
				}, -- [10]
				{
					["spellID"] = 287268,
					["icon"] = 1360764,
					["name"] = "Glimmer of Light",
					["azeritePowerID"] = 533,
				}, -- [11]
			},
			[66] = {
				{
					["spellID"] = 272898,
					["icon"] = 135875,
					["name"] = "Avenger's Might",
					["azeritePowerID"] = 125,
				}, -- [1]
				{
					["spellID"] = 272976,
					["icon"] = 135943,
					["name"] = "Bulwark of Light",
					["azeritePowerID"] = 133,
				}, -- [2]
				{
					["spellID"] = 278605,
					["icon"] = 135874,
					["name"] = "Soaring Shield",
					["azeritePowerID"] = 150,
				}, -- [3]
				{
					["spellID"] = 287126,
					["icon"] = 135981,
					["name"] = "Righteous Conviction",
					["azeritePowerID"] = 189,
				}, -- [4]
				{
					["spellID"] = 275477,
					["icon"] = 236265,
					["name"] = "Inner Light",
					["azeritePowerID"] = 234,
				}, -- [5]
				{
					["spellID"] = 275496,
					["icon"] = 135959,
					["name"] = "Indomitable Justice",
					["azeritePowerID"] = 235,
				}, -- [6]
				{
					["spellID"] = 278593,
					["icon"] = 135917,
					["name"] = "Grace of the Justicar",
					["azeritePowerID"] = 393,
				}, -- [7]
				{
					["spellID"] = 278609,
					["icon"] = 133176,
					["name"] = "Inspiring Vanguard",
					["azeritePowerID"] = 395,
				}, -- [8]
				{
					["spellID"] = 277675,
					["icon"] = 1603010,
					["name"] = "Judicious Defense",
					["azeritePowerID"] = 454,
				}, -- [9]
				{
					["spellID"] = 287126,
					["icon"] = 135981,
					["name"] = "Righteous Conviction",
					["azeritePowerID"] = 527,
				}, -- [10]
			},
		}, -- [2]
		{
			[255] = {
				{
					["spellID"] = 272717,
					["icon"] = 132176,
					["name"] = "Serrated Jaws",
					["azeritePowerID"] = 107,
				}, -- [1]
				{
					["spellID"] = 272742,
					["icon"] = 451164,
					["name"] = "Wildfire Cluster",
					["azeritePowerID"] = 110,
				}, -- [2]
				{
					["spellID"] = 273283,
					["icon"] = 1033905,
					["name"] = "Latent Poison",
					["azeritePowerID"] = 163,
				}, -- [3]
				{
					["spellID"] = 274590,
					["icon"] = 136067,
					["name"] = "Venomous Fangs",
					["azeritePowerID"] = 213,
				}, -- [4]
				{
					["spellID"] = 287093,
					["icon"] = 236186,
					["name"] = "Dire Consequences",
					["azeritePowerID"] = 365,
				}, -- [5]
				{
					["spellID"] = 277653,
					["icon"] = 2065565,
					["name"] = "Blur of Talons",
					["azeritePowerID"] = 371,
				}, -- [6]
				{
					["spellID"] = 278532,
					["icon"] = 132214,
					["name"] = "Wilderness Survival",
					["azeritePowerID"] = 372,
				}, -- [7]
				{
					["spellID"] = 288570,
					["icon"] = 132210,
					["name"] = "Primeval Intuition",
					["azeritePowerID"] = 373,
				}, -- [8]
				{
					["spellID"] = 287093,
					["icon"] = 236186,
					["name"] = "Dire Consequences",
					["azeritePowerID"] = 518,
				}, -- [9]
				{
					["spellID"] = 288570,
					["icon"] = 132210,
					["name"] = "Primeval Intuition",
					["azeritePowerID"] = 551,
				}, -- [10]
			},
			[254] = {
				{
					["spellID"] = 264198,
					["icon"] = 461115,
					["name"] = "In The Rhythm",
					["azeritePowerID"] = 36,
				}, -- [1]
				{
					["spellID"] = 287707,
					["icon"] = 132212,
					["name"] = "Surging Shots",
					["azeritePowerID"] = 162,
				}, -- [2]
				{
					["spellID"] = 274444,
					["icon"] = 132329,
					["name"] = "Unerring Vision",
					["azeritePowerID"] = 212,
				}, -- [3]
				{
					["spellID"] = 277651,
					["icon"] = 135130,
					["name"] = "Steady Aim",
					["azeritePowerID"] = 368,
				}, -- [4]
				{
					["spellID"] = 278530,
					["icon"] = 132330,
					["name"] = "Rapid Reload",
					["azeritePowerID"] = 369,
				}, -- [5]
				{
					["spellID"] = 278531,
					["icon"] = 878211,
					["name"] = "Focused Fire",
					["azeritePowerID"] = 370,
				}, -- [6]
				{
					["spellID"] = 287707,
					["icon"] = 132212,
					["name"] = "Surging Shots",
					["azeritePowerID"] = 528,
				}, -- [7]
			},
			[253] = {
				{
					["spellID"] = 272717,
					["icon"] = 132176,
					["name"] = "Serrated Jaws",
					["azeritePowerID"] = 107,
				}, -- [1]
				{
					["spellID"] = 273262,
					["icon"] = 132127,
					["name"] = "Haze of Rage",
					["azeritePowerID"] = 161,
				}, -- [2]
				{
					["spellID"] = 274441,
					["icon"] = 132133,
					["name"] = "Dance of Death",
					["azeritePowerID"] = 211,
				}, -- [3]
				{
					["spellID"] = 287093,
					["icon"] = 236186,
					["name"] = "Dire Consequences",
					["azeritePowerID"] = 365,
				}, -- [4]
				{
					["spellID"] = 279806,
					["icon"] = 136074,
					["name"] = "Primal Instincts",
					["azeritePowerID"] = 366,
				}, -- [5]
				{
					["spellID"] = 278529,
					["icon"] = 2058007,
					["name"] = "Feeding Frenzy",
					["azeritePowerID"] = 367,
				}, -- [6]
				{
					["spellID"] = 278530,
					["icon"] = 132330,
					["name"] = "Rapid Reload",
					["azeritePowerID"] = 369,
				}, -- [7]
				{
					["spellID"] = 287093,
					["icon"] = 236186,
					["name"] = "Dire Consequences",
					["azeritePowerID"] = 518,
				}, -- [8]
			},
		}, -- [3]
		{
			[260] = {
				{
					["spellID"] = 272935,
					["icon"] = 1373908,
					["name"] = "Deadshot",
					["azeritePowerID"] = 129,
				}, -- [1]
				{
					["spellID"] = 288979,
					["icon"] = 132350,
					["name"] = "Keep Your Wits About You",
					["azeritePowerID"] = 180,
				}, -- [2]
				{
					["spellID"] = 275846,
					["icon"] = 132336,
					["name"] = "Snake Eyes",
					["azeritePowerID"] = 239,
				}, -- [3]
				{
					["spellID"] = 278675,
					["icon"] = 1373910,
					["name"] = "Paradise Lost",
					["azeritePowerID"] = 410,
				}, -- [4]
				{
					["spellID"] = 278676,
					["icon"] = 135610,
					["name"] = "Ace Up Your Sleeve",
					["azeritePowerID"] = 411,
				}, -- [5]
				{
					["spellID"] = 277676,
					["icon"] = 136206,
					["name"] = "Brigand's Blitz",
					["azeritePowerID"] = 446,
				}, -- [6]
				{
					["spellID"] = 288979,
					["icon"] = 132350,
					["name"] = "Keep Your Wits About You",
					["azeritePowerID"] = 559,
				}, -- [7]
			},
			[261] = {
				{
					["spellID"] = 286121,
					["icon"] = 237532,
					["name"] = "Replicating Shadows",
					["azeritePowerID"] = 124,
				}, -- [1]
				{
					["spellID"] = 273418,
					["icon"] = 1373907,
					["name"] = "Night's Vengeance",
					["azeritePowerID"] = 175,
				}, -- [2]
				{
					["spellID"] = 275896,
					["icon"] = 1373912,
					["name"] = "Blade In The Shadows",
					["azeritePowerID"] = 240,
				}, -- [3]
				{
					["spellID"] = 278681,
					["icon"] = 236279,
					["name"] = "The First Dance",
					["azeritePowerID"] = 413,
				}, -- [4]
				{
					["spellID"] = 278683,
					["icon"] = 252272,
					["name"] = "Inevitability",
					["azeritePowerID"] = 414,
				}, -- [5]
				{
					["spellID"] = 277673,
					["icon"] = 132090,
					["name"] = "Perforate",
					["azeritePowerID"] = 445,
				}, -- [6]
				{
					["spellID"] = 286121,
					["icon"] = 237532,
					["name"] = "Replicating Shadows",
					["azeritePowerID"] = 506,
				}, -- [7]
			},
			[259] = {
				{
					["spellID"] = 273007,
					["icon"] = 132304,
					["name"] = "Double Dose",
					["azeritePowerID"] = 136,
				}, -- [1]
				{
					["spellID"] = 273488,
					["icon"] = 132287,
					["name"] = "Twist the Knife",
					["azeritePowerID"] = 181,
				}, -- [2]
				{
					["spellID"] = 286573,
					["icon"] = 458726,
					["name"] = "Nothing Personal",
					["azeritePowerID"] = 249,
				}, -- [3]
				{
					["spellID"] = 277679,
					["icon"] = 132302,
					["name"] = "Scent of Blood",
					["azeritePowerID"] = 406,
				}, -- [4]
				{
					["spellID"] = 287649,
					["icon"] = 236273,
					["name"] = "Echoing Blades",
					["azeritePowerID"] = 407,
				}, -- [5]
				{
					["spellID"] = 278666,
					["icon"] = 132297,
					["name"] = "Shrouded Suffocation",
					["azeritePowerID"] = 408,
				}, -- [6]
				{
					["spellID"] = 286573,
					["icon"] = 458726,
					["name"] = "Nothing Personal",
					["azeritePowerID"] = 509,
				}, -- [7]
				{
					["spellID"] = 287649,
					["icon"] = 236273,
					["name"] = "Echoing Blades",
					["azeritePowerID"] = 524,
				}, -- [8]
			},
		}, -- [4]
		{
			[257] = {
				{
					["spellID"] = 267892,
					["icon"] = 513195,
					["name"] = "Synergistic Growth",
					["azeritePowerID"] = 102,
				}, -- [1]
				{
					["spellID"] = 272780,
					["icon"] = 135907,
					["name"] = "Permeating Glow",
					["azeritePowerID"] = 114,
				}, -- [2]
				{
					["spellID"] = 273313,
					["icon"] = 237541,
					["name"] = "Blessed Sanctuary",
					["azeritePowerID"] = 165,
				}, -- [3]
				{
					["spellID"] = 275602,
					["icon"] = 135943,
					["name"] = "Prayerful Litany",
					["azeritePowerID"] = 228,
				}, -- [4]
				{
					["spellID"] = 277681,
					["icon"] = 135913,
					["name"] = "Everlasting Light",
					["azeritePowerID"] = 400,
				}, -- [5]
				{
					["spellID"] = 278645,
					["icon"] = 135944,
					["name"] = "Word of Mending",
					["azeritePowerID"] = 401,
				}, -- [6]
				{
					["spellID"] = 287336,
					["icon"] = 135937,
					["name"] = "Promise of Deliverance",
					["azeritePowerID"] = 402,
				}, -- [7]
				{
					["spellID"] = 287336,
					["icon"] = 135937,
					["name"] = "Promise of Deliverance",
					["azeritePowerID"] = 534,
				}, -- [8]
			},
			[258] = {
				{
					["spellID"] = 272788,
					["icon"] = 237565,
					["name"] = "Searing Dialogue",
					["azeritePowerID"] = 115,
				}, -- [1]
				{
					["spellID"] = 288340,
					["icon"] = 135978,
					["name"] = "Thought Harvester",
					["azeritePowerID"] = 166,
				}, -- [2]
				{
					["spellID"] = 275541,
					["icon"] = 136202,
					["name"] = "Depth of the Shadows",
					["azeritePowerID"] = 227,
				}, -- [3]
				{
					["spellID"] = 275722,
					["icon"] = 237298,
					["name"] = "Whispers of the Damned",
					["azeritePowerID"] = 236,
				}, -- [4]
				{
					["spellID"] = 277682,
					["icon"] = 458229,
					["name"] = "Spiteful Apparitions",
					["azeritePowerID"] = 403,
				}, -- [5]
				{
					["spellID"] = 278659,
					["icon"] = 136163,
					["name"] = "Death Throes",
					["azeritePowerID"] = 404,
				}, -- [6]
				{
					["spellID"] = 278661,
					["icon"] = 1386549,
					["name"] = "Chorus of Insanity",
					["azeritePowerID"] = 405,
				}, -- [7]
			},
			[256] = {
				{
					["spellID"] = 267892,
					["icon"] = 513195,
					["name"] = "Synergistic Growth",
					["azeritePowerID"] = 102,
				}, -- [1]
				{
					["spellID"] = 272775,
					["icon"] = 135936,
					["name"] = "Moment of Repose",
					["azeritePowerID"] = 113,
				}, -- [2]
				{
					["spellID"] = 273307,
					["icon"] = 237545,
					["name"] = "Weal and Woe",
					["azeritePowerID"] = 164,
				}, -- [3]
				{
					["spellID"] = 275541,
					["icon"] = 136202,
					["name"] = "Depth of the Shadows",
					["azeritePowerID"] = 227,
				}, -- [4]
				{
					["spellID"] = 287355,
					["icon"] = 135922,
					["name"] = "Sudden Revelation",
					["azeritePowerID"] = 397,
				}, -- [5]
				{
					["spellID"] = 278629,
					["icon"] = 237567,
					["name"] = "Contemptuous Homily",
					["azeritePowerID"] = 398,
				}, -- [6]
				{
					["spellID"] = 278643,
					["icon"] = 1386546,
					["name"] = "Enduring Luminescence",
					["azeritePowerID"] = 399,
				}, -- [7]
				{
					["spellID"] = 287355,
					["icon"] = 135922,
					["name"] = "Sudden Revelation",
					["azeritePowerID"] = 535,
				}, -- [8]
			},
		}, -- [5]
		{
			[252] = {
				{
					["spellID"] = 288417,
					["icon"] = 348276,
					["name"] = "Magus of the Dead",
					["azeritePowerID"] = 109,
				}, -- [1]
				{
					["spellID"] = 273088,
					["icon"] = 136144,
					["name"] = "Bone Spike Graveyard",
					["azeritePowerID"] = 140,
				}, -- [2]
				{
					["spellID"] = 286832,
					["icon"] = 342913,
					["name"] = "Helchains",
					["azeritePowerID"] = 142,
				}, -- [3]
				{
					["spellID"] = 274081,
					["icon"] = 1129420,
					["name"] = "Festermight",
					["azeritePowerID"] = 199,
				}, -- [4]
				{
					["spellID"] = 275929,
					["icon"] = 136145,
					["name"] = "Harrowing Decay",
					["azeritePowerID"] = 244,
				}, -- [5]
				{
					["spellID"] = 278482,
					["icon"] = 879926,
					["name"] = "Cankerous Wounds",
					["azeritePowerID"] = 350,
				}, -- [6]
				{
					["spellID"] = 278489,
					["icon"] = 136133,
					["name"] = "Last Surprise",
					["azeritePowerID"] = 351,
				}, -- [7]
				{
					["spellID"] = 286832,
					["icon"] = 342913,
					["name"] = "Helchains",
					["azeritePowerID"] = 511,
				}, -- [8]
				{
					["spellID"] = 288417,
					["icon"] = 348276,
					["name"] = "Magus of the Dead",
					["azeritePowerID"] = 552,
				}, -- [9]
			},
			[251] = {
				{
					["spellID"] = 272718,
					["icon"] = 135372,
					["name"] = "Icy Citadel",
					["azeritePowerID"] = 108,
				}, -- [1]
				{
					["spellID"] = 273093,
					["icon"] = 237520,
					["name"] = "Latent Chill",
					["azeritePowerID"] = 141,
				}, -- [2]
				{
					["spellID"] = 287283,
					["icon"] = 1580450,
					["name"] = "Frostwhelp's Indignation",
					["azeritePowerID"] = 198,
				}, -- [3]
				{
					["spellID"] = 275917,
					["icon"] = 135833,
					["name"] = "Echoing Howl",
					["azeritePowerID"] = 242,
				}, -- [4]
				{
					["spellID"] = 278480,
					["icon"] = 135305,
					["name"] = "Killer Frost",
					["azeritePowerID"] = 346,
				}, -- [5]
				{
					["spellID"] = 278487,
					["icon"] = 538770,
					["name"] = "Frozen Tempest",
					["azeritePowerID"] = 347,
				}, -- [6]
				{
					["spellID"] = 287283,
					["icon"] = 1580450,
					["name"] = "Frostwhelp's Indignation",
					["azeritePowerID"] = 519,
				}, -- [7]
			},
			[250] = {
				{
					["spellID"] = 272684,
					["icon"] = 132155,
					["name"] = "Deep Cuts",
					["azeritePowerID"] = 106,
				}, -- [1]
				{
					["spellID"] = 273088,
					["icon"] = 136144,
					["name"] = "Bone Spike Graveyard",
					["azeritePowerID"] = 140,
				}, -- [2]
				{
					["spellID"] = 274057,
					["icon"] = 237517,
					["name"] = "Marrowblood",
					["azeritePowerID"] = 197,
				}, -- [3]
				{
					["spellID"] = 289339,
					["icon"] = 135338,
					["name"] = "Bloody Runeblade",
					["azeritePowerID"] = 243,
				}, -- [4]
				{
					["spellID"] = 278479,
					["icon"] = 135277,
					["name"] = "Eternal Rune Weapon",
					["azeritePowerID"] = 348,
				}, -- [5]
				{
					["spellID"] = 278484,
					["icon"] = 1376745,
					["name"] = "Bones of the Damned",
					["azeritePowerID"] = 349,
				}, -- [6]
				{
					["spellID"] = 289339,
					["icon"] = 135338,
					["name"] = "Bloody Runeblade",
					["azeritePowerID"] = 557,
				}, -- [7]
			},
		}, -- [6]
		{
			[263] = {
				{
					["spellID"] = 263786,
					["icon"] = 538565,
					["name"] = "Astral Shift",
					["azeritePowerID"] = 17,
				}, -- [1]
				{
					["spellID"] = 272992,
					["icon"] = 236289,
					["name"] = "Primal Primer",
					["azeritePowerID"] = 137,
				}, -- [2]
				{
					["spellID"] = 273461,
					["icon"] = 136086,
					["name"] = "Strength of Earth",
					["azeritePowerID"] = 179,
				}, -- [3]
				{
					["spellID"] = 274412,
					["icon"] = 538565,
					["name"] = "Serene Spirit",
					["azeritePowerID"] = 207,
				}, -- [4]
				{
					["spellID"] = 275388,
					["icon"] = 237443,
					["name"] = "Lightning Conduit",
					["azeritePowerID"] = 223,
				}, -- [5]
				{
					["spellID"] = 278697,
					["icon"] = 136028,
					["name"] = "Natural Harmony",
					["azeritePowerID"] = 416,
				}, -- [6]
				{
					["spellID"] = 278719,
					["icon"] = 132314,
					["name"] = "Roiling Storm",
					["azeritePowerID"] = 420,
				}, -- [7]
				{
					["spellID"] = 277666,
					["icon"] = 451167,
					["name"] = "Ancestral Resonance",
					["azeritePowerID"] = 447,
				}, -- [8]
				{
					["spellID"] = 277671,
					["icon"] = 136048,
					["name"] = "Synapse Shock",
					["azeritePowerID"] = 448,
				}, -- [9]
				{
					["spellID"] = 280021,
					["icon"] = 136095,
					["name"] = "Pack Spirit",
					["azeritePowerID"] = 474,
				}, -- [10]
				{
					["spellID"] = 287768,
					["icon"] = 136046,
					["name"] = "Thunderaan's Fury",
					["azeritePowerID"] = 530,
				}, -- [11]
				{
					["spellID"] = 287774,
					["icon"] = 133439,
					["name"] = "Ancient Ankh Talisman",
					["azeritePowerID"] = 539,
				}, -- [12]
			},
			[264] = {
				{
					["spellID"] = 263786,
					["icon"] = 538565,
					["name"] = "Astral Shift",
					["azeritePowerID"] = 17,
				}, -- [1]
				{
					["spellID"] = 263792,
					["icon"] = 136015,
					["name"] = "Lightningburn",
					["azeritePowerID"] = 24,
				}, -- [2]
				{
					["spellID"] = 267892,
					["icon"] = 513195,
					["name"] = "Synergistic Growth",
					["azeritePowerID"] = 102,
				}, -- [3]
				{
					["spellID"] = 272978,
					["icon"] = 237582,
					["name"] = "Volcanic Lightning",
					["azeritePowerID"] = 135,
				}, -- [4]
				{
					["spellID"] = 272989,
					["icon"] = 136042,
					["name"] = "Soothing Waters",
					["azeritePowerID"] = 138,
				}, -- [5]
				{
					["spellID"] = 287300,
					["icon"] = 237590,
					["name"] = "Turn of the Tide",
					["azeritePowerID"] = 191,
				}, -- [6]
				{
					["spellID"] = 274412,
					["icon"] = 538565,
					["name"] = "Serene Spirit",
					["azeritePowerID"] = 207,
				}, -- [7]
				{
					["spellID"] = 275488,
					["icon"] = 135127,
					["name"] = "Swelling Stream",
					["azeritePowerID"] = 224,
				}, -- [8]
				{
					["spellID"] = 278697,
					["icon"] = 136028,
					["name"] = "Natural Harmony",
					["azeritePowerID"] = 416,
				}, -- [9]
				{
					["spellID"] = 278713,
					["icon"] = 252995,
					["name"] = "Surging Tides",
					["azeritePowerID"] = 422,
				}, -- [10]
				{
					["spellID"] = 278715,
					["icon"] = 237586,
					["name"] = "Spouting Spirits",
					["azeritePowerID"] = 423,
				}, -- [11]
				{
					["spellID"] = 277666,
					["icon"] = 451167,
					["name"] = "Ancestral Resonance",
					["azeritePowerID"] = 447,
				}, -- [12]
				{
					["spellID"] = 277671,
					["icon"] = 136048,
					["name"] = "Synapse Shock",
					["azeritePowerID"] = 448,
				}, -- [13]
				{
					["spellID"] = 277658,
					["icon"] = 136037,
					["name"] = "Overflowing Shores",
					["azeritePowerID"] = 449,
				}, -- [14]
				{
					["spellID"] = 279829,
					["icon"] = 451169,
					["name"] = "Igneous Potential",
					["azeritePowerID"] = 457,
				}, -- [15]
				{
					["spellID"] = 280021,
					["icon"] = 136095,
					["name"] = "Pack Spirit",
					["azeritePowerID"] = 474,
				}, -- [16]
				{
					["spellID"] = 287774,
					["icon"] = 133439,
					["name"] = "Ancient Ankh Talisman",
					["azeritePowerID"] = 539,
				}, -- [17]
				{
					["spellID"] = 287300,
					["icon"] = 237590,
					["name"] = "Turn of the Tide",
					["azeritePowerID"] = 563,
				}, -- [18]
			},
			[262] = {
				{
					["spellID"] = 263786,
					["icon"] = 538565,
					["name"] = "Astral Shift",
					["azeritePowerID"] = 17,
				}, -- [1]
				{
					["spellID"] = 263792,
					["icon"] = 136015,
					["name"] = "Lightningburn",
					["azeritePowerID"] = 24,
				}, -- [2]
				{
					["spellID"] = 272978,
					["icon"] = 237582,
					["name"] = "Volcanic Lightning",
					["azeritePowerID"] = 135,
				}, -- [3]
				{
					["spellID"] = 273448,
					["icon"] = 136026,
					["name"] = "Lava Shock",
					["azeritePowerID"] = 178,
				}, -- [4]
				{
					["spellID"] = 274412,
					["icon"] = 538565,
					["name"] = "Serene Spirit",
					["azeritePowerID"] = 207,
				}, -- [5]
				{
					["spellID"] = 275381,
					["icon"] = 135790,
					["name"] = "Echo of the Elementals",
					["azeritePowerID"] = 222,
				}, -- [6]
				{
					["spellID"] = 278697,
					["icon"] = 136028,
					["name"] = "Natural Harmony",
					["azeritePowerID"] = 416,
				}, -- [7]
				{
					["spellID"] = 286949,
					["icon"] = 136025,
					["name"] = "Tectonic Thunder",
					["azeritePowerID"] = 417,
				}, -- [8]
				{
					["spellID"] = 277666,
					["icon"] = 451167,
					["name"] = "Ancestral Resonance",
					["azeritePowerID"] = 447,
				}, -- [9]
				{
					["spellID"] = 277671,
					["icon"] = 136048,
					["name"] = "Synapse Shock",
					["azeritePowerID"] = 448,
				}, -- [10]
				{
					["spellID"] = 279829,
					["icon"] = 451169,
					["name"] = "Igneous Potential",
					["azeritePowerID"] = 457,
				}, -- [11]
				{
					["spellID"] = 280021,
					["icon"] = 136095,
					["name"] = "Pack Spirit",
					["azeritePowerID"] = 474,
				}, -- [12]
				{
					["spellID"] = 286949,
					["icon"] = 136025,
					["name"] = "Tectonic Thunder",
					["azeritePowerID"] = 512,
				}, -- [13]
				{
					["spellID"] = 287774,
					["icon"] = 133439,
					["name"] = "Ancient Ankh Talisman",
					["azeritePowerID"] = 539,
				}, -- [14]
			},
		}, -- [7]
		{
			[64] = {
				{
					["spellID"] = 272968,
					["icon"] = 612394,
					["name"] = "Packed Ice",
					["azeritePowerID"] = 132,
				}, -- [1]
				{
					["spellID"] = 288164,
					["icon"] = 236209,
					["name"] = "Flash Freeze",
					["azeritePowerID"] = 170,
				}, -- [2]
				{
					["spellID"] = 279854,
					["icon"] = 2126034,
					["name"] = "Glacial Assault",
					["azeritePowerID"] = 225,
				}, -- [3]
				{
					["spellID"] = 277663,
					["icon"] = 135846,
					["name"] = "Tunnel of Ice",
					["azeritePowerID"] = 379,
				}, -- [4]
				{
					["spellID"] = 278541,
					["icon"] = 135844,
					["name"] = "Whiteout",
					["azeritePowerID"] = 380,
				}, -- [5]
				{
					["spellID"] = 278542,
					["icon"] = 135838,
					["name"] = "Frigid Grasp",
					["azeritePowerID"] = 381,
				}, -- [6]
				{
					["spellID"] = 288164,
					["icon"] = 236209,
					["name"] = "Flash Freeze",
					["azeritePowerID"] = 547,
				}, -- [7]
			},
			[63] = {
				{
					["spellID"] = 272932,
					["icon"] = 135810,
					["name"] = "Flames of Alacrity",
					["azeritePowerID"] = 128,
				}, -- [1]
				{
					["spellID"] = 288755,
					["icon"] = 460698,
					["name"] = "Wildfire",
					["azeritePowerID"] = 168,
				}, -- [2]
				{
					["spellID"] = 274596,
					["icon"] = 135807,
					["name"] = "Blaster Master",
					["azeritePowerID"] = 215,
				}, -- [3]
				{
					["spellID"] = 277656,
					["icon"] = 135808,
					["name"] = "Trailing Embers",
					["azeritePowerID"] = 376,
				}, -- [4]
				{
					["spellID"] = 278538,
					["icon"] = 135812,
					["name"] = "Duplicative Incineration",
					["azeritePowerID"] = 377,
				}, -- [5]
				{
					["spellID"] = 278539,
					["icon"] = 236218,
					["name"] = "Firemind",
					["azeritePowerID"] = 378,
				}, -- [6]
				{
					["spellID"] = 288755,
					["icon"] = 460698,
					["name"] = "Wildfire",
					["azeritePowerID"] = 556,
				}, -- [7]
			},
			[62] = {
				{
					["spellID"] = 270669,
					["icon"] = 136096,
					["name"] = "Arcane Pummeling",
					["azeritePowerID"] = 88,
				}, -- [1]
				{
					["spellID"] = 286027,
					["icon"] = 135732,
					["name"] = "Equipoise",
					["azeritePowerID"] = 127,
				}, -- [2]
				{
					["spellID"] = 273326,
					["icon"] = 136075,
					["name"] = "Brain Storm",
					["azeritePowerID"] = 167,
				}, -- [3]
				{
					["spellID"] = 274594,
					["icon"] = 236205,
					["name"] = "Arcane Pressure",
					["azeritePowerID"] = 214,
				}, -- [4]
				{
					["spellID"] = 278536,
					["icon"] = 135730,
					["name"] = "Galvanizing Spark",
					["azeritePowerID"] = 374,
				}, -- [5]
				{
					["spellID"] = 278537,
					["icon"] = 136116,
					["name"] = "Explosive Echo",
					["azeritePowerID"] = 375,
				}, -- [6]
				{
					["spellID"] = 286027,
					["icon"] = 135732,
					["name"] = "Equipoise",
					["azeritePowerID"] = 514,
				}, -- [7]
			},
		}, -- [8]
		{
			[266] = {
				{
					["spellID"] = 272944,
					["icon"] = 136181,
					["name"] = "Shadow's Bite",
					["azeritePowerID"] = 130,
				}, -- [1]
				{
					["spellID"] = 273523,
					["icon"] = 236296,
					["name"] = "Umbral Blaze",
					["azeritePowerID"] = 190,
				}, -- [2]
				{
					["spellID"] = 275395,
					["icon"] = 2032610,
					["name"] = "Explosive Potential",
					["azeritePowerID"] = 231,
				}, -- [3]
				{
					["spellID"] = 278737,
					["icon"] = 535592,
					["name"] = "Demonic Meteor",
					["azeritePowerID"] = 428,
				}, -- [4]
				{
					["spellID"] = 287059,
					["icon"] = 237561,
					["name"] = "Baleful Invocation",
					["azeritePowerID"] = 429,
				}, -- [5]
				{
					["spellID"] = 276007,
					["icon"] = 460856,
					["name"] = "Excoriate",
					["azeritePowerID"] = 443,
				}, -- [6]
				{
					["spellID"] = 279878,
					["icon"] = 2065628,
					["name"] = "Supreme Commander",
					["azeritePowerID"] = 458,
				}, -- [7]
				{
					["spellID"] = 287059,
					["icon"] = 237561,
					["name"] = "Baleful Invocation",
					["azeritePowerID"] = 515,
				}, -- [8]
			},
			[267] = {
				{
					["spellID"] = 287637,
					["icon"] = 134075,
					["name"] = "Chaos Shards",
					["azeritePowerID"] = 131,
				}, -- [1]
				{
					["spellID"] = 275425,
					["icon"] = 135817,
					["name"] = "Flashpoint",
					["azeritePowerID"] = 232,
				}, -- [2]
				{
					["spellID"] = 278747,
					["icon"] = 1380866,
					["name"] = "Rolling Havoc",
					["azeritePowerID"] = 431,
				}, -- [3]
				{
					["spellID"] = 278748,
					["icon"] = 135789,
					["name"] = "Chaotic Inferno",
					["azeritePowerID"] = 432,
				}, -- [4]
				{
					["spellID"] = 277644,
					["icon"] = 236291,
					["name"] = "Crashing Chaos",
					["azeritePowerID"] = 444,
				}, -- [5]
				{
					["spellID"] = 279909,
					["icon"] = 135807,
					["name"] = "Bursting Flare",
					["azeritePowerID"] = 460,
				}, -- [6]
				{
					["spellID"] = 287637,
					["icon"] = 134075,
					["name"] = "Chaos Shards",
					["azeritePowerID"] = 525,
				}, -- [7]
			},
			[265] = {
				{
					["spellID"] = 272891,
					["icon"] = 237564,
					["name"] = "Wracking Brilliance",
					["azeritePowerID"] = 123,
				}, -- [1]
				{
					["spellID"] = 273521,
					["icon"] = 537517,
					["name"] = "Inevitable Demise",
					["azeritePowerID"] = 183,
				}, -- [2]
				{
					["spellID"] = 275372,
					["icon"] = 136228,
					["name"] = "Cascading Calamity",
					["azeritePowerID"] = 230,
				}, -- [3]
				{
					["spellID"] = 278721,
					["icon"] = 136139,
					["name"] = "Sudden Onset",
					["azeritePowerID"] = 425,
				}, -- [4]
				{
					["spellID"] = 278727,
					["icon"] = 1416161,
					["name"] = "Dreadful Calling",
					["azeritePowerID"] = 426,
				}, -- [5]
				{
					["spellID"] = 289364,
					["icon"] = 136230,
					["name"] = "Pandemic Invocation",
					["azeritePowerID"] = 442,
				}, -- [6]
				{
					["spellID"] = 289364,
					["icon"] = 136230,
					["name"] = "Pandemic Invocation",
					["azeritePowerID"] = 565,
				}, -- [7]
			},
		}, -- [9]
		{
			[269] = {
				{
					["spellID"] = 287055,
					["icon"] = 606548,
					["name"] = "Fury of Xuen",
					["azeritePowerID"] = 117,
				}, -- [1]
				{
					["spellID"] = 273291,
					["icon"] = 642415,
					["name"] = "Sunrise Technique",
					["azeritePowerID"] = 184,
				}, -- [2]
				{
					["spellID"] = 288634,
					["icon"] = 1381297,
					["name"] = "Glory of the Dawn",
					["azeritePowerID"] = 388,
				}, -- [3]
				{
					["spellID"] = 279918,
					["icon"] = 627606,
					["name"] = "Open Palm Strikes",
					["azeritePowerID"] = 389,
				}, -- [4]
				{
					["spellID"] = 278577,
					["icon"] = 606551,
					["name"] = "Pressure Point",
					["azeritePowerID"] = 390,
				}, -- [5]
				{
					["spellID"] = 286585,
					["icon"] = 607849,
					["name"] = "Dance of Chi-Ji",
					["azeritePowerID"] = 391,
				}, -- [6]
				{
					["spellID"] = 286585,
					["icon"] = 607849,
					["name"] = "Dance of Chi-Ji",
					["azeritePowerID"] = 516,
				}, -- [7]
				{
					["spellID"] = 287055,
					["icon"] = 606548,
					["name"] = "Fury of Xuen",
					["azeritePowerID"] = 517,
				}, -- [8]
				{
					["spellID"] = 288634,
					["icon"] = 1381297,
					["name"] = "Glory of the Dawn",
					["azeritePowerID"] = 553,
				}, -- [9]
			},
			[270] = {
				{
					["spellID"] = 287829,
					["icon"] = 611418,
					["name"] = "Secret Infusion",
					["azeritePowerID"] = 76,
				}, -- [1]
				{
					["spellID"] = 267892,
					["icon"] = 513195,
					["name"] = "Synergistic Growth",
					["azeritePowerID"] = 102,
				}, -- [2]
				{
					["spellID"] = 273291,
					["icon"] = 642415,
					["name"] = "Sunrise Technique",
					["azeritePowerID"] = 184,
				}, -- [3]
				{
					["spellID"] = 273328,
					["icon"] = 775461,
					["name"] = "Overflowing Mists",
					["azeritePowerID"] = 185,
				}, -- [4]
				{
					["spellID"] = 275975,
					["icon"] = 627487,
					["name"] = "Misty Peaks",
					["azeritePowerID"] = 248,
				}, -- [5]
				{
					["spellID"] = 277667,
					["icon"] = 627485,
					["name"] = "Burst of Life",
					["azeritePowerID"] = 385,
				}, -- [6]
				{
					["spellID"] = 279875,
					["icon"] = 1360978,
					["name"] = "Font of Life",
					["azeritePowerID"] = 386,
				}, -- [7]
				{
					["spellID"] = 278576,
					["icon"] = 1020466,
					["name"] = "Uplifted Spirits",
					["azeritePowerID"] = 387,
				}, -- [8]
				{
					["spellID"] = 288634,
					["icon"] = 1381297,
					["name"] = "Glory of the Dawn",
					["azeritePowerID"] = 388,
				}, -- [9]
				{
					["spellID"] = 287829,
					["icon"] = 611418,
					["name"] = "Secret Infusion",
					["azeritePowerID"] = 536,
				}, -- [10]
			},
			[268] = {
				{
					["spellID"] = 272792,
					["icon"] = 615339,
					["name"] = "Boiling Brew",
					["azeritePowerID"] = 116,
				}, -- [1]
				{
					["spellID"] = 273464,
					["icon"] = 1500803,
					["name"] = "Staggering Strikes",
					["azeritePowerID"] = 186,
				}, -- [2]
				{
					["spellID"] = 275892,
					["icon"] = 133701,
					["name"] = "Fit to Burst",
					["azeritePowerID"] = 238,
				}, -- [3]
				{
					["spellID"] = 285958,
					["icon"] = 1360979,
					["name"] = "Straight, No Chaser",
					["azeritePowerID"] = 382,
				}, -- [4]
				{
					["spellID"] = 278569,
					["icon"] = 611419,
					["name"] = "Training of Niuzao",
					["azeritePowerID"] = 383,
				}, -- [5]
				{
					["spellID"] = 278571,
					["icon"] = 642416,
					["name"] = "Elusive Footwork",
					["azeritePowerID"] = 384,
				}, -- [6]
				{
					["spellID"] = 285958,
					["icon"] = 1360979,
					["name"] = "Straight, No Chaser",
					["azeritePowerID"] = 513,
				}, -- [7]
			},
		}, -- [10]
		{
			[103] = {
				{
					["spellID"] = 279524,
					["icon"] = 236149,
					["name"] = "Blood Mist",
					["azeritePowerID"] = 111,
				}, -- [1]
				{
					["spellID"] = 273338,
					["icon"] = 132122,
					["name"] = "Untamed Ferocity",
					["azeritePowerID"] = 169,
				}, -- [2]
				{
					["spellID"] = 273344,
					["icon"] = 236169,
					["name"] = "Masterful Instincts",
					["azeritePowerID"] = 171,
				}, -- [3]
				{
					["spellID"] = 274424,
					["icon"] = 132242,
					["name"] = "Jungle Fury",
					["azeritePowerID"] = 209,
				}, -- [4]
				{
					["spellID"] = 275906,
					["icon"] = 451161,
					["name"] = "Twisted Claws",
					["azeritePowerID"] = 241,
				}, -- [5]
				{
					["spellID"] = 276021,
					["icon"] = 132134,
					["name"] = "Iron Jaws",
					["azeritePowerID"] = 247,
				}, -- [6]
				{
					["spellID"] = 278509,
					["icon"] = 132152,
					["name"] = "Gushing Lacerations",
					["azeritePowerID"] = 358,
				}, -- [7]
				{
					["spellID"] = 279527,
					["icon"] = 236305,
					["name"] = "Wild Fleshrending",
					["azeritePowerID"] = 359,
				}, -- [8]
			},
			[104] = {
				{
					["spellID"] = 269379,
					["icon"] = 136096,
					["name"] = "Long Night",
					["azeritePowerID"] = 51,
				}, -- [1]
				{
					["spellID"] = 279552,
					["icon"] = 1378702,
					["name"] = "Layered Mane",
					["azeritePowerID"] = 112,
				}, -- [2]
				{
					["spellID"] = 273344,
					["icon"] = 236169,
					["name"] = "Masterful Instincts",
					["azeritePowerID"] = 171,
				}, -- [3]
				{
					["spellID"] = 275906,
					["icon"] = 451161,
					["name"] = "Twisted Claws",
					["azeritePowerID"] = 241,
				}, -- [4]

				{
					["spellID"] = 289314,
					["icon"] = 571585,
					["name"] = "Burst of Savagery",
					["azeritePowerID"] = 251,
				}, -- [5]
				{
					["spellID"] = 279527,
					["icon"] = 236305,
					["name"] = "Wild Fleshrending",
					["azeritePowerID"] = 359,
				}, -- [6]
				{
					["spellID"] = 278510,
					["icon"] = 132091,
					["name"] = "Gory Regeneration",
					["azeritePowerID"] = 360,
				}, -- [7]
				{
					["spellID"] = 278511,
					["icon"] = 132136,
					["name"] = "Guardian's Wrath",
					["azeritePowerID"] = 361,
				}, -- [8]
				{
					["spellID"] = 289314,
					["icon"] = 571585,
					["name"] = "Burst of Savagery",
					["azeritePowerID"] = 567,
				}, -- [9]
			},
			[102] = {
				{
					["spellID"] = 269379,
					["icon"] = 136096,
					["name"] = "Long Night",
					["azeritePowerID"] = 51,
				}, -- [1]
				{
					["spellID"] = 272871,
					["icon"] = 136060,
					["name"] = "Streaking Stars",
					["azeritePowerID"] = 122,
				}, -- [2]
				{
					["spellID"] = 273367,
					["icon"] = 136096,
					["name"] = "Power of the Moon",
					["azeritePowerID"] = 173,
				}, -- [3]
				{
					["spellID"] = 287773,
					["icon"] = 135730,
					["name"] = "Arcanic Pulsar",
					["azeritePowerID"] = 200,
				}, -- [4]
				{
					["spellID"] = 276152,
					["icon"] = 135753,
					["name"] = "Dawning Sun",
					["azeritePowerID"] = 250,
				}, -- [5]
				{
					["spellID"] = 278505,
					["icon"] = 236216,
					["name"] = "High Noon",
					["azeritePowerID"] = 356,
				}, -- [6]
				{
					["spellID"] = 278507,
					["icon"] = 236168,
					["name"] = "Lunar Shrapnel",
					["azeritePowerID"] = 357,
				}, -- [7]
				{
					["spellID"] = 279642,
					["icon"] = 136048,
					["name"] = "Lively Spirit",
					["azeritePowerID"] = 364,
				}, -- [8]
				{
					["spellID"] = 287773,
					["icon"] = 135730,
					["name"] = "Arcanic Pulsar",
					["azeritePowerID"] = 529,
				}, -- [9]
			},
			[105] = {
				{
					["spellID"] = 269379,
					["icon"] = 136096,
					["name"] = "Long Night",
					["azeritePowerID"] = 51,
				}, -- [1]
				{
					["spellID"] = 267892,
					["icon"] = 513195,
					["name"] = "Synergistic Growth",
					["azeritePowerID"] = 102,
				}, -- [2]
				{
					["spellID"] = 287251,
					["icon"] = 236153,
					["name"] = "Early Harvest",
					["azeritePowerID"] = 120,
				}, -- [3]
				{
					["spellID"] = 279778,
					["icon"] = 134914,
					["name"] = "Grove Tending",
					["azeritePowerID"] = 172,
				}, -- [4]
				{
					["spellID"] = 274432,
					["icon"] = 136081,
					["name"] = "Autumn Leaves",
					["azeritePowerID"] = 210,
				}, -- [5]
				{
					["spellID"] = 278505,
					["icon"] = 236216,
					["name"] = "High Noon",
					["azeritePowerID"] = 356,
				}, -- [6]
				{
					["spellID"] = 278515,
					["icon"] = 136085,
					["name"] = "Rampant Growth",
					["azeritePowerID"] = 362,
				}, -- [7]
				{
					["spellID"] = 278513,
					["icon"] = 134157,
					["name"] = "Waking Dream",
					["azeritePowerID"] = 363,
				}, -- [8]
				{
					["spellID"] = 279642,
					["icon"] = 136048,
					["name"] = "Lively Spirit",
					["azeritePowerID"] = 364,
				}, -- [9]
				{
					["spellID"] = 287251,
					["icon"] = 236153,
					["name"] = "Early Harvest",
					["azeritePowerID"] = 532,
				}, -- [10]
			},
		}, -- [11]
		{
			[577] = {
				{
					["spellID"] = 279581,
					["icon"] = 1305149,
					["name"] = "Revolving Blades",
					["azeritePowerID"] = 126,
				}, -- [1]
				{
					["spellID"] = 273231,
					["icon"] = 1305156,
					["name"] = "Furious Gaze",
					["azeritePowerID"] = 159,
				}, -- [2]
				{
					["spellID"] = 273236,
					["icon"] = 1344649,
					["name"] = "Infernal Armor",
					["azeritePowerID"] = 160,
				}, -- [3]
				{
					["spellID"] = 288754,
					["icon"] = 1305157,
					["name"] = "Chaotic Transformation",
					["azeritePowerID"] = 220,
				}, -- [4]
				{
					["spellID"] = 275934,
					["icon"] = 1097741,
					["name"] = "Seething Power",
					["azeritePowerID"] = 245,
				}, -- [5]
				{
					["spellID"] = 278493,
					["icon"] = 1305152,
					["name"] = "Thirsting Blades",
					["azeritePowerID"] = 352,
				}, -- [6]
				{
					["spellID"] = 278500,
					["icon"] = 463286,
					["name"] = "Eyes of Rage",
					["azeritePowerID"] = 353,
				}, -- [7]
				{
					["spellID"] = 288754,
					["icon"] = 1305157,
					["name"] = "Chaotic Transformation",
					["azeritePowerID"] = 555,
				}, -- [8]
			},
			[581] = {
				{
					["spellID"] = 272983,
					["icon"] = 1344647,
					["name"] = "Revel in Pain",
					["azeritePowerID"] = 134,
				}, -- [1]
				{
					["spellID"] = 273236,
					["icon"] = 1344649,
					["name"] = "Infernal Armor",
					["azeritePowerID"] = 160,
				}, -- [2]
				{
					["spellID"] = 275350,
					["icon"] = 1344645,
					["name"] = "Rigid Carapace",
					["azeritePowerID"] = 221,
				}, -- [3]
				{
					["spellID"] = 288878,
					["icon"] = 615099,
					["name"] = "Hour of Reaping",
					["azeritePowerID"] = 246,
				}, -- [4]
				{
					["spellID"] = 278502,
					["icon"] = 1344652,
					["name"] = "Cycle of Binding",
					["azeritePowerID"] = 354,
				}, -- [5]
				{
					["spellID"] = 278501,
					["icon"] = 1344648,
					["name"] = "Essence Sever",
					["azeritePowerID"] = 355,
				}, -- [6]
				{
					["spellID"] = 288878,
					["icon"] = 615099,
					["name"] = "Hour of Reaping",
					["azeritePowerID"] = 558,
				}, -- [7]
			},
		}, -- [12]
	},
	["defensive"] = {
		{
			{
				["spellID"] = 280023,
				["icon"] = 132351,
				["name"] = "Moment of Glory",
				["azeritePowerID"] = 476,
			}, -- [1]
			{
				["spellID"] = 280128,
				["icon"] = 132342,
				["name"] = "Bury the Hatchet",
				["azeritePowerID"] = 477,
			}, -- [2]
			{
				["spellID"] = 288641,
				["icon"] = 132126,
				["name"] = "Intimidating Presence",
				["azeritePowerID"] = 554,
			}, -- [3]
		}, -- [1]
		{
			{
				["spellID"] = 274388,
				["icon"] = 524354,
				["name"] = "Stalwart Protector",
				["azeritePowerID"] = 206,
			}, -- [1]
			{
				["spellID"] = 280017,
				["icon"] = 1360759,
				["name"] = "Gallant Steed",
				["azeritePowerID"] = 471,
			}, -- [2]
			{
				["spellID"] = 287729,
				["icon"] = 135928,
				["name"] = "Empyreal Ward",
				["azeritePowerID"] = 538,
			}, -- [3]
		}, -- [2]
		{
			{
				["spellID"] = 274355,
				["icon"] = 132199,
				["name"] = "Shellshock",
				["azeritePowerID"] = 203,
			}, -- [1]
			{
				["spellID"] = 280014,
				["icon"] = 132293,
				["name"] = "Duck and Cover",
				["azeritePowerID"] = 469,
			}, -- [2]
			{
				["spellID"] = 287938,
				["icon"] = 1014024,
				["name"] = "Nature's Salve",
				["azeritePowerID"] = 543,
			}, -- [3]
		}, -- [3]
		{
			{
				["spellID"] = 274692,
				["icon"] = 132307,
				["name"] = "Footpad",
				["azeritePowerID"] = 217,
			}, -- [1]
			{
				["spellID"] = 280020,
				["icon"] = 136177,
				["name"] = "Shrouded Mantle",
				["azeritePowerID"] = 473,
			}, -- [2]
			{
				["spellID"] = 288079,
				["icon"] = 132301,
				["name"] = "Lying In Wait",
				["azeritePowerID"] = 548,
			}, -- [3]
		}, -- [4]
		{
			{
				["spellID"] = 274366,
				["icon"] = 135994,
				["name"] = "Sanctum",
				["azeritePowerID"] = 204,
			}, -- [1]
			{
				["spellID"] = 280018,
				["icon"] = 136066,
				["name"] = "Twist Magic",
				["azeritePowerID"] = 472,
			}, -- [2]
			{
				["spellID"] = 287717,
				["icon"] = 463835,
				["name"] = "Death Denied",
				["azeritePowerID"] = 537,
			}, -- [3]
		}, -- [5]
		{
			{
				["spellID"] = 280010,
				["icon"] = 136120,
				["name"] = "Runic Barrier",
				["azeritePowerID"] = 201,
			}, -- [1]
			{
				["spellID"] = 280011,
				["icon"] = 237561,
				["name"] = "March of the Damned",
				["azeritePowerID"] = 465,
			}, -- [2]
			{
				["spellID"] = 288424,
				["icon"] = 237525,
				["name"] = "Cold Hearted",
				["azeritePowerID"] = 549,
			}, -- [3]
		}, -- [6]
		nil, -- [7]
		{
			{
				["spellID"] = 274379,
				["icon"] = 135991,
				["name"] = "Eldritch Warding",
				["azeritePowerID"] = 205,
			}, -- [1]
			{
				["spellID"] = 280015,
				["icon"] = 135736,
				["name"] = "Cauterizing Blink",
				["azeritePowerID"] = 468,
			}, -- [2]
			{
				["spellID"] = 288121,
				["icon"] = 135754,
				["name"] = "Quick Thinking",
				["azeritePowerID"] = 546,
			}, -- [3]
		}, -- [8]
		{
			{
				["spellID"] = 274418,
				["icon"] = 538745,
				["name"] = "Lifeblood",
				["azeritePowerID"] = 208,
			}, -- [1]
			{
				["spellID"] = 280022,
				["icon"] = 136169,
				["name"] = "Desperate Power",
				["azeritePowerID"] = 475,
			}, -- [2]
			{
				["spellID"] = 287822,
				["icon"] = 136183,
				["name"] = "Terror of the Mind",
				["azeritePowerID"] = 531,
			}, -- [3]
		}, -- [9]
		{
			{
				["spellID"] = 274762,
				["icon"] = 606546,
				["name"] = "Strength of Spirit",
				["azeritePowerID"] = 218,
			}, -- [1]
			{
				["spellID"] = 280016,
				["icon"] = 642414,
				["name"] = "Sweep the Leg",
				["azeritePowerID"] = 470,
			}, -- [2]
			{
				["spellID"] = 289322,
				["icon"] = 574574,
				["name"] = "Exit Strategy",
				["azeritePowerID"] = 566,
			}, -- [3]
		}, -- [10]
		{
			{
				["spellID"] = 274813,
				["icon"] = 136080,
				["name"] = "Reawakening",
				["azeritePowerID"] = 219,
			}, -- [1]
			{
				["spellID"] = 280013,
				["icon"] = 136097,
				["name"] = "Ursoc's Endurance",
				["azeritePowerID"] = 467,
			}, -- [2]
			{
				["spellID"] = 287803,
				["icon"] = 135879,
				["name"] = "Switch Hitter",
				["azeritePowerID"] = 540,
			}, -- [3]
		}, -- [11]
		{
			{
				["spellID"] = 274344,
				["icon"] = 1305158,
				["name"] = "Soulmonger",
				["azeritePowerID"] = 202,
			}, -- [1]
			{
				["spellID"] = 280012,
				["icon"] = 828455,
				["name"] = "Burning Soul",
				["azeritePowerID"] = 466,
			}, -- [2]
			{
				["spellID"] = 288973,
				["icon"] = 1392554,
				["name"] = "Thrive in Chaos",
				["azeritePowerID"] = 564,
			}, -- [3]
		}, -- [12]
		["common"] = {
			{
				["spellID"] = 268594,
				["icon"] = 538536,
				["name"] = "Longstrider",
				["azeritePowerID"] = 14,
			}, -- [1]
			{
				["spellID"] = 263962,
				["icon"] = 1769069,
				["name"] = "Resounding Protection",
				["azeritePowerID"] = 15,
			}, -- [2]
			{
				["spellID"] = 268599,
				["icon"] = 237395,
				["name"] = "Vampiric Speed",
				["azeritePowerID"] = 44,
			}, -- [3]
			{
				["spellID"] = 268437,
				["icon"] = 1387707,
				["name"] = "Impassive Visage",
				["azeritePowerID"] = 83,
			}, -- [4]
			{
				["spellID"] = 268595,
				["icon"] = 651746,
				["name"] = "Bulwark of the Masses",
				["azeritePowerID"] = 84,
			}, -- [5]
			{
				["spellID"] = 268596,
				["icon"] = 1686575,
				["name"] = "Gemhide",
				["azeritePowerID"] = 85,
			}, -- [6]
			{
				["spellID"] = 268435,
				["icon"] = 646669,
				["name"] = "Azerite Fortification",
				["azeritePowerID"] = 86,
			}, -- [7]
			{
				["spellID"] = 268600,
				["icon"] = 413591,
				["name"] = "Self Reliance",
				["azeritePowerID"] = 87,
			}, -- [8]
		},
	},
	["role"] = {
		["tank"] = {
			{
				["spellID"] = 267671,
				["icon"] = 1029596,
				["name"] = "Winds of War",
				["azeritePowerID"] = 43,
			}, -- [1]
			{
				["spellID"] = 267683,
				["icon"] = 1129419,
				["name"] = "Azerite Veins",
				["azeritePowerID"] = 89,
			}, -- [2]
			{
				["spellID"] = 271536,
				["icon"] = 134978,
				["name"] = "Crystalline Carapace",
				["azeritePowerID"] = 98,
			}, -- [3]
			{
				["spellID"] = 271540,
				["icon"] = 645224,
				["name"] = "Ablative Shielding",
				["azeritePowerID"] = 99,
			}, -- [4]
			{
				["spellID"] = 271546,
				["icon"] = 136031,
				["name"] = "Strength in Numbers",
				["azeritePowerID"] = 100,
			}, -- [5]
			{
				["spellID"] = 271557,
				["icon"] = 1323035,
				["name"] = "Shimmering Haven",
				["azeritePowerID"] = 101,
			}, -- [6]
		},
		["nonhealer"] = {
			{
				["spellID"] = 263984,
				["icon"] = 1029585,
				["name"] = "Elemental Whirl",
				["azeritePowerID"] = 21,
			}, -- [1]
			{
				["spellID"] = 266180,
				["icon"] = 252174,
				["name"] = "Overwhelming Power",
				["azeritePowerID"] = 30,
			}, -- [2]
			{
				["spellID"] = 266937,
				["icon"] = 132109,
				["name"] = "Gutripper",
				["azeritePowerID"] = 31,
			}, -- [3]
			{
				["spellID"] = 266936,
				["icon"] = 646670,
				["name"] = "Azerite Globules",
				["azeritePowerID"] = 462,
			}, -- [4]
		},
		["healer"] = {
			{
				["spellID"] = 267880,
				["icon"] = 463526,
				["name"] = "Woundbinder",
				["azeritePowerID"] = 19,
			}, -- [1]
			{
				["spellID"] = 267883,
				["icon"] = 413576,
				["name"] = "Savior",
				["azeritePowerID"] = 42,
			}, -- [2]
			{
				["spellID"] = 267882,
				["icon"] = 970412,
				["name"] = "Concentrated Mending",
				["azeritePowerID"] = 103,
			}, -- [3]
			{
				["spellID"] = 267884,
				["icon"] = 236832,
				["name"] = "Bracing Chill",
				["azeritePowerID"] = 104,
			}, -- [4]
			{
				["spellID"] = 267886,
				["icon"] = 133020,
				["name"] = "Ephemeral Recovery",
				["azeritePowerID"] = 105,
			}, -- [5]
			{
				["spellID"] = 267889,
				["icon"] = 135905,
				["name"] = "Blessed Portents",
				["azeritePowerID"] = 463,
			}, -- [6]
		},
		["common"] = {
			{
				["spellID"] = 264108,
				["icon"] = 538560,
				["name"] = "Blood Siphon",
				["azeritePowerID"] = 18,
			}, -- [1]
			{
				["spellID"] = 267665,
				["icon"] = 236166,
				["name"] = "Lifespeed",
				["azeritePowerID"] = 20,
			}, -- [2]
			{
				["spellID"] = 263987,
				["icon"] = 237589,
				["name"] = "Heed My Call",
				["azeritePowerID"] = 22,
			}, -- [3]
			{
				["spellID"] = 267879,
				["icon"] = 132565,
				["name"] = "On My Way",
				["azeritePowerID"] = 38,
			}, -- [4]
			{
				["spellID"] = 279899,
				["icon"] = 514016,
				["name"] = "Unstable Flames",
				["azeritePowerID"] = 459,
			}, -- [5]
			{
				["spellID"] = 279926,
				["icon"] = 2065623,
				["name"] = "Earthlink",
				["azeritePowerID"] = 461,
			}, -- [6]
		},
	},
	["raid"] = {
		{
			["spellID"] = 280555,
			["icon"] = 2000853,
			["name"] = "Archive of the Titans",
			["azeritePowerID"] = 483,
		}, -- [1]
		{
			["spellID"] = 280559,
			["icon"] = 136039,
			["name"] = "Laser Matrix",
			["azeritePowerID"] = 485,
		}, -- [2]
		{
			["spellID"] = 288802,
			["icon"] = 895888,
			["name"] = "Bonded Souls",
			["azeritePowerID"] = 560,
		}, -- [3]
		{
			["spellID"] = 288749,
			["icon"] = 2442247,
			["name"] = "Seductive Power",
			["azeritePowerID"] = 561,
		}, -- [4]
		{
			["spellID"] = 288953,
			["icon"] = 1778226,
			["name"] = "Treacherous Covenant",
			["azeritePowerID"] = 562,
		}, -- [5]
	},
	["zone"] = {
		{
			["spellID"] = 280710,
			["icon"] = 135885,
			["name"] = "Champion of Azeroth",
			["azeritePowerID"] = 82,
		}, -- [1]
		{
			["spellID"] = 273150,
			["icon"] = 135780,
			["name"] = "Ruinous Bolt",
			["azeritePowerID"] = 156,
		}, -- [2]
		{
			["spellID"] = 273790,
			["icon"] = 2011133,
			["name"] = "Rezan's Fury",
			["azeritePowerID"] = 157,
		}, -- [3]
		{
			["spellID"] = 273682,
			["icon"] = 132299,
			["name"] = "Meticulous Scheming",
			["azeritePowerID"] = 192,
		}, -- [4]
		{
			["spellID"] = 273823,
			["icon"] = 1778229,
			["name"] = "Blightborne Infusion",
			["azeritePowerID"] = 193,
		}, -- [5]
		{
			["spellID"] = 273834,
			["icon"] = 840409,
			["name"] = "Filthy Transfusion",
			["azeritePowerID"] = 194,
		}, -- [6]
		{
			["spellID"] = 273829,
			["icon"] = 463858,
			["name"] = "Secrets of the Deep",
			["azeritePowerID"] = 195,
		}, -- [7]
		{
			["spellID"] = 280429,
			["icon"] = 796638,
			["name"] = "Swirling Sands",
			["azeritePowerID"] = 196,
		}, -- [8]
		{
			["spellID"] = 280402,
			["icon"] = 1698701,
			["name"] = "Tidal Surge",
			["azeritePowerID"] = 478,
		}, -- [9]
		{
			["spellID"] = 280284,
			["icon"] = 135642,
			["name"] = "Dagger in the Back",
			["azeritePowerID"] = 479,
		}, -- [10]
		{
			["spellID"] = 280407,
			["icon"] = 463568,
			["name"] = "Blood Rite",
			["azeritePowerID"] = 480,
		}, -- [11]
		{
			["spellID"] = 280410,
			["icon"] = 132193,
			["name"] = "Incite the Pack",
			["azeritePowerID"] = 481,
		}, -- [12]
		{
			["spellID"] = 280380,
			["icon"] = 839983,
			["name"] = "Thunderous Blast",
			["azeritePowerID"] = 482,
		}, -- [13]
		{
			["spellID"] = 281514,
			["icon"] = 2032578,
			["name"] = "Unstable Catalyst",
			["azeritePowerID"] = 504,
		}, -- [14]
		{
			["spellID"] = 281841,
			["icon"] = 1029595,
			["name"] = "Tradewinds",
			["azeritePowerID"] = 505,
		}, -- [15]
		{
			["spellID"] = 287467,
			["icon"] = 135900,
			["name"] = "Shadow of Elune",
			["azeritePowerID"] = 521,
		}, -- [16]
		{
			["spellID"] = 287604,
			["icon"] = 874580,
			["name"] = "Ancients' Bulwark",
			["azeritePowerID"] = 522,
		}, -- [17]
		{
			["spellID"] = 287631,
			["icon"] = 463547,
			["name"] = "Apothecary's Concoctions",
			["azeritePowerID"] = 523,
		}, -- [18]
		{
			["spellID"] = 287662,
			["icon"] = 2357388,
			["name"] = "Endless Hunger",
			["azeritePowerID"] = 526,
		}, -- [19]
	},
	["profession"] = {
		{
			["spellID"] = 280163,
			["icon"] = 463515,
			["name"] = "Barrage Of Many Bombs",
			["azeritePowerID"] = 498,
		}, -- [1]
		{
			["spellID"] = 280168,
			["icon"] = 134427,
			["name"] = "Ricocheting Inflatable Pyrosaw",
			["azeritePowerID"] = 499,
		}, -- [2]
		{
			["spellID"] = 280174,
			["icon"] = 1320373,
			["name"] = "Synaptic Spark Capacitor",
			["azeritePowerID"] = 500,
		}, -- [3]
		{
			["spellID"] = 280178,
			["icon"] = 133873,
			["name"] = "Relational Normalization Gizmo",
			["azeritePowerID"] = 501,
		}, -- [4]
		{
			["spellID"] = 280181,
			["icon"] = 1336885,
			["name"] = "Personal Absorb-o-Tron",
			["azeritePowerID"] = 502,
		}, -- [5]
		{
			["spellID"] = 280172,
			["icon"] = 514950,
			["name"] = "Auto-Self-Cauterizer",
			["azeritePowerID"] = 503,
		}, -- [6]
	},
	["pvp"] = {
		{
			["spellID"] = 280577,
			["icon"] = 1028980,
			["name"] = "Glory in Battle",
			["azeritePowerID"] = 486,
		}, -- [1]
		{
			["spellID"] = 280579,
			["icon"] = 1035504,
			["name"] = "Retaliatory Fury",
			["azeritePowerID"] = 487,
		}, -- [2]
		{
			["spellID"] = 280582,
			["icon"] = 236646,
			["name"] = "Battlefield Focus",
			["azeritePowerID"] = 488,
		}, -- [3]
		{
			["spellID"] = 280598,
			["icon"] = 236560,
			["name"] = "Sylvanas' Resolve",
			["azeritePowerID"] = 489,
		}, -- [4]
		{
			["spellID"] = 280580,
			["icon"] = 236324,
			["name"] = "Combined Might",
			["azeritePowerID"] = 490,
		}, -- [5]
		{
			["spellID"] = 280581,
			["icon"] = 136003,
			["name"] = "Collective Will",
			["azeritePowerID"] = 491,
		}, -- [6]
		{
			["spellID"] = 280623,
			["icon"] = 1028984,
			["name"] = "Liberator's Might",
			["azeritePowerID"] = 492,
		}, -- [7]
		{
			["spellID"] = 280624,
			["icon"] = 236478,
			["name"] = "Last Gift",
			["azeritePowerID"] = 493,
		}, -- [8]
		{
			["spellID"] = 280627,
			["icon"] = 132486,
			["name"] = "Battlefield Precision",
			["azeritePowerID"] = 494,
		}, -- [9]
		{
			["spellID"] = 280628,
			["icon"] = 1042294,
			["name"] = "Anduin's Dedication",
			["azeritePowerID"] = 495,
		}, -- [10]
		{
			["spellID"] = 280625,
			["icon"] = 2022762,
			["name"] = "Stronger Together",
			["azeritePowerID"] = 496,
		}, -- [11]
		{
			["spellID"] = 280626,
			["icon"] = 236344,
			["name"] = "Stand As One",
			["azeritePowerID"] = 497,
		}, -- [12]
		{
			["spellID"] = 287818,
			["icon"] = 236310,
			["name"] = "Fight or Flight",
			["azeritePowerID"] = 541,
		}, -- [13]
	},
}
n.sourceData = sourceData

-- Default Scales Data
local defaultName = L.DefaultScaleName_Default
local defensiveName = L.DefaultScaleName_Defensive
local offensiveName = L.DefaultScaleName_Offensive
local defaultNameTable = {
	--[defaultName] = true,
	[defensiveName] = true,
	[offensiveName] = true

}
n.defaultNameTable = defaultNameTable
local defaultScalesData = {}
n.defaultScalesData = defaultScalesData

local function insertDefaultScalesData(scaleName, classIndex, specNum, powerScales)
	defaultScalesData[#defaultScalesData + 1] = {
		scaleName,
		classIndex,
		specNum,
		powerScales
	}
end

do
	-- Warrior
		-- Arms
		insertDefaultScalesData(defaultName, 1, 1, {
			[13] = 0.08, -- Azerite Empowered
			[18] = 2.03, -- Blood Siphon
			[20] = 2.23, -- Lifespeed
			[21] = 2.59, -- Elemental Whirl
			[22] = 3.11, -- Heed My Call
			[30] = 3.55, -- Overwhelming Power
			[31] = 3.50, -- Gutripper
			[43] = 0.11, -- Winds of War
			[44] = 0.11, -- Vampiric Speed
			[82] = 8.81, -- Champion of Azeroth
			[84] = 0.79, -- Bulwark of the Masses
			[86] = 0.18, -- Azerite Fortification
			[98] = 0.43, -- Crystalline Carapace
			[99] = 0.01, -- Ablative Shielding
			[156] = 4.63, -- Ruinous Bolt
			[157] = 7.85, -- Rezan's Fury
			[174] = 7.11, -- Gathering Storm
			[192] = 6.71, -- Meticulous Scheming
			[193] = 8.33, -- Blightborne Infusion
			[194] = 6.40, -- Filthy Transfusion
			[195] = 5.90, -- Secrets of the Deep
			[196] = 6.91, -- Swirling Sands
			[226] = 7.74, -- Test of Might
			[433] = 5.10, -- Seismic Wave
			[434] = 10.00, -- Crushing Assault
			[435] = 5.68, -- Lord of War
			[459] = 3.13, -- Unstable Flames
			[461] = 2.13, -- Earthlink
			[462] = 2.76, -- Azerite Globules
			[477] = 0.28, -- Bury the Hatchet
			[478] = 7.42, -- Tidal Surge
			[479] = 8.27, -- Dagger in the Back
			[480] = 5.04, -- Blood Rite
			[481] = 5.01, -- Incite the Pack
			[482] = 6.30, -- Thunderous Blast
			[483] = 6.41, -- Archive of the Titans
			[485] = 6.82, -- Laser Matrix
			[492] = 5.02, -- Liberator's Might
			[494] = 7.17, -- Battlefield Precision
			[495] = 6.13, -- Anduin's Dedication
			[496] = 2.11, -- Stronger Together
			[497] = 1.76, -- Stand As One
			[498] = 4.64, -- Barrage Of Many Bombs
			[499] = 3.13, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.28, -- Synaptic Spark Capacitor
			[501] = 6.58, -- Relational Normalization Gizmo
			[502] = 0.36, -- Personal Absorb-o-Tron
			[503] = 0.10, -- Auto-Self-Cauterizer
			[504] = 6.73, -- Unstable Catalyst
			[505] = 5.90, -- Tradewinds
			[520] = 0.11, -- Bastion of Might
			[521] = 0.03, -- Shadow of Elune
			[522] = 0.06, -- Ancients' Bulwark
			[526] = 0.06, -- Endless Hunger
			[554] = 0.17, -- Intimidating Presence
		})

		-- Fury
		insertDefaultScalesData(defaultName, 1, 2, {
			[13] = 0.45, -- Azerite Empowered
			[14] = 0.69, -- Longstrider
			[15] = 0.90, -- Resounding Protection
			[18] = 2.77, -- Blood Siphon
			[20] = 3.52, -- Lifespeed
			[21] = 3.43, -- Elemental Whirl
			[22] = 4.89, -- Heed My Call
			[30] = 6.11, -- Overwhelming Power
			[31] = 4.89, -- Gutripper
			[43] = 0.52, -- Winds of War
			[44] = 0.71, -- Vampiric Speed
			[82] = 9.38, -- Champion of Azeroth
			[84] = 0.30, -- Bulwark of the Masses
			[85] = 0.18, -- Gemhide
			[86] = 0.93, -- Azerite Fortification
			[87] = 0.59, -- Self Reliance
			[89] = 0.05, -- Azerite Veins
			[98] = 0.82, -- Crystalline Carapace
			[99] = 0.54, -- Ablative Shielding
			[100] = 0.40, -- Strength in Numbers
			[101] = 0.29, -- Shimmering Haven
			[156] = 5.46, -- Ruinous Bolt
			[157] = 9.42, -- Rezan's Fury
			[174] = 0.77, -- Gathering Storm
			[192] = 7.38, -- Meticulous Scheming
			[193] = 7.69, -- Blightborne Infusion
			[194] = 8.25, -- Filthy Transfusion
			[195] = 6.34, -- Secrets of the Deep
			[196] = 6.46, -- Swirling Sands
			[229] = 7.77, -- Pulverizing Blows
			[437] = 10.00, -- Simmering Rage
			[438] = 2.71, -- Reckless Flurry
			[451] = 6.59, -- Infinite Fury
			[459] = 3.57, -- Unstable Flames
			[461] = 2.52, -- Earthlink
			[462] = 3.16, -- Azerite Globules
			[476] = 0.66, -- Moment of Glory
			[477] = 0.69, -- Bury the Hatchet
			[478] = 8.03, -- Tidal Surge
			[479] = 9.05, -- Dagger in the Back
			[480] = 5.30, -- Blood Rite
			[481] = 6.77, -- Incite the Pack
			[482] = 8.12, -- Thunderous Blast
			[483] = 7.03, -- Archive of the Titans
			[485] = 8.64, -- Laser Matrix
			[492] = 5.09, -- Liberator's Might
			[493] = 0.56, -- Last Gift
			[494] = 8.88, -- Battlefield Precision
			[495] = 5.72, -- Anduin's Dedication
			[496] = 1.75, -- Stronger Together
			[497] = 1.83, -- Stand As One
			[498] = 6.31, -- Barrage Of Many Bombs
			[499] = 4.10, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.28, -- Synaptic Spark Capacitor
			[501] = 6.56, -- Relational Normalization Gizmo
			[502] = 0.26, -- Personal Absorb-o-Tron
			[503] = 0.39, -- Auto-Self-Cauterizer
			[504] = 6.86, -- Unstable Catalyst
			[505] = 6.94, -- Tradewinds
			[521] = 0.40, -- Shadow of Elune
			[522] = 0.93, -- Ancients' Bulwark
			[523] = 0.59, -- Apothecary's Concoctions
			[526] = 0.78, -- Endless Hunger
			[541] = 0.13, -- Fight or Flight
			[544] = 0.34, -- Unbridled Ferocity
			[545] = 0.50, -- Cold Steel, Hot Blood
			[554] = 0.32, -- Intimidating Presence
			[560] = 0.30, -- Bonded Souls
			[561] = 0.99, -- Seductive Power
			[562] = 0.34, -- Treacherous Covenant
		})

		-- Protection
		insertDefaultScalesData(offensiveName, 1, 3, {

		})
		insertDefaultScalesData(defensiveName, 1, 3, {

		})

	-- Paladin
		-- Holy
		insertDefaultScalesData(defaultName, 2, 1, {

		})

		-- Protection
		insertDefaultScalesData(offensiveName, 2, 2, {
			[13] = 0.42, -- Azerite Empowered
			[14] = 0.32, -- Longstrider
			[18] = 1.62, -- Blood Siphon
			[19] = 0.26, -- Woundbinder
			[20] = 1.78, -- Lifespeed
			[21] = 2.02, -- Elemental Whirl
			[22] = 3.84, -- Heed My Call
			[30] = 3.28, -- Overwhelming Power
			[31] = 3.82, -- Gutripper
			[38] = 1.59, -- On My Way
			[42] = 0.05, -- Savior
			[44] = 0.10, -- Vampiric Speed
			[82] = 6.08, -- Champion of Azeroth
			[83] = 0.12, -- Impassive Visage
			[84] = 0.04, -- Bulwark of the Masses
			[87] = 0.02, -- Self Reliance
			[98] = 0.16, -- Crystalline Carapace
			[99] = 0.25, -- Ablative Shielding
			[104] = 0.40, -- Bracing Chill
			[125] = 3.10, -- Avenger's Might
			[133] = 0.17, -- Bulwark of Light
			[143] = 0.03, -- Inspiring Beacon
			[144] = 0.36, -- Rejuvenating Grace
			[149] = 0.22, -- Healing Hammer
			[150] = 1.82, -- Soaring Shield
			[156] = 4.84, -- Ruinous Bolt
			[157] = 8.48, -- Rezan's Fury
			[192] = 4.38, -- Meticulous Scheming
			[193] = 5.43, -- Blightborne Infusion
			[194] = 7.56, -- Filthy Transfusion
			[195] = 4.06, -- Secrets of the Deep
			[196] = 5.14, -- Swirling Sands
			[206] = 0.06, -- Stalwart Protector
			[234] = 1.26, -- Inner Light
			[235] = 3.86, -- Indomitable Justice
			[395] = 10.00, -- Inspiring Vanguard
			[454] = 0.39, -- Judicious Defense
			[459] = 1.92, -- Unstable Flames
			[461] = 1.36, -- Earthlink
			[462] = 2.36, -- Azerite Globules
			[463] = 0.06, -- Blessed Portents
			[471] = 0.06, -- Gallant Steed
			[478] = 8.39, -- Tidal Surge
			[479] = 6.88, -- Dagger in the Back
			[480] = 3.62, -- Blood Rite
			[481] = 3.75, -- Incite the Pack
			[482] = 7.03, -- Thunderous Blast
			[483] = 5.12, -- Archive of the Titans
			[485] = 7.33, -- Laser Matrix
			[492] = 3.27, -- Liberator's Might
			[493] = 0.17, -- Last Gift
			[494] = 8.17, -- Battlefield Precision
			[495] = 4.46, -- Anduin's Dedication
			[496] = 1.00, -- Stronger Together
			[497] = 1.01, -- Stand As One
			[498] = 5.19, -- Barrage Of Many Bombs
			[499] = 3.25, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.46, -- Synaptic Spark Capacitor
			[501] = 4.96, -- Relational Normalization Gizmo
			[502] = 0.10, -- Personal Absorb-o-Tron
			[504] = 5.49, -- Unstable Catalyst
			[505] = 3.84, -- Tradewinds
			[521] = 0.34, -- Shadow of Elune
			[526] = 0.15, -- Endless Hunger
			[541] = 0.13, -- Fight or Flight
			[561] = 0.40, -- Seductive Power
		})
		insertDefaultScalesData(defensiveName, 2, 2, {
			[13] = 0.01, -- Azerite Empowered
			[15] = 10.00, -- Resounding Protection
			[18] = 2.88, -- Blood Siphon
			[20] = 0.01, -- Lifespeed
			[21] = 0.05, -- Elemental Whirl
			[22] = 0.02, -- Heed My Call
			[31] = 0.01, -- Gutripper
			[38] = 0.02, -- On My Way
			[42] = 0.01, -- Savior
			[44] = 0.01, -- Vampiric Speed
			[82] = 0.09, -- Champion of Azeroth
			[83] = 0.01, -- Impassive Visage
			[84] = 0.02, -- Bulwark of the Masses
			[85] = 0.02, -- Gemhide
			[86] = 0.02, -- Azerite Fortification
			[87] = 0.02, -- Self Reliance
			[89] = 0.02, -- Azerite Veins
			[98] = 0.03, -- Crystalline Carapace
			[99] = 0.03, -- Ablative Shielding
			[101] = 0.02, -- Shimmering Haven
			[104] = 0.01, -- Bracing Chill
			[105] = 0.01, -- Ephemeral Recovery
			[125] = 0.10, -- Avenger's Might
			[133] = 0.02, -- Bulwark of Light
			[144] = 0.01, -- Rejuvenating Grace
			[145] = 0.02, -- Fortifying Auras
			[148] = 0.03, -- Righteous Flames
			[150] = 0.06, -- Soaring Shield
			[156] = 0.03, -- Ruinous Bolt
			[157] = 0.01, -- Rezan's Fury
			[193] = 0.01, -- Blightborne Infusion
			[196] = 0.04, -- Swirling Sands
			[206] = 0.05, -- Stalwart Protector
			[234] = 0.04, -- Inner Light
			[393] = 0.02, -- Grace of the Justicar
			[395] = 0.03, -- Inspiring Vanguard
			[454] = 0.01, -- Judicious Defense
			[461] = 0.02, -- Earthlink
			[462] = 0.02, -- Azerite Globules
			[471] = 0.01, -- Gallant Steed
			[478] = 0.03, -- Tidal Surge
			[480] = 0.02, -- Blood Rite
			[481] = 0.17, -- Incite the Pack
			[483] = 0.03, -- Archive of the Titans
			[485] = 0.02, -- Laser Matrix
			[493] = 0.02, -- Last Gift
			[494] = 0.01, -- Battlefield Precision
			[495] = 0.01, -- Anduin's Dedication
			[496] = 0.02, -- Stronger Together
			[497] = 0.01, -- Stand As One
			[498] = 0.02, -- Barrage Of Many Bombs
			[499] = 0.01, -- Ricocheting Inflatable Pyrosaw
			[501] = 0.01, -- Relational Normalization Gizmo
			[502] = 0.02, -- Personal Absorb-o-Tron
			[503] = 0.01, -- Auto-Self-Cauterizer
			[505] = 0.18, -- Tradewinds
			[521] = 0.03, -- Shadow of Elune
			[522] = 0.01, -- Ancients' Bulwark
			[523] = 0.02, -- Apothecary's Concoctions
			[526] = 0.02, -- Endless Hunger
			[527] = 0.04, -- Righteous Conviction
			[560] = 0.05, -- Bonded Souls
			[561] = 0.01, -- Seductive Power
			[562] = 0.01, -- Treacherous Covenant
		})

		-- Retribution
		insertDefaultScalesData(defaultName, 2, 3, {
			[18] = 2.47, -- Blood Siphon
			[19] = 0.62, -- Woundbinder
			[20] = 3.23, -- Lifespeed
			[21] = 3.32, -- Elemental Whirl
			[22] = 4.11, -- Heed My Call
			[30] = 5.15, -- Overwhelming Power
			[31] = 5.05, -- Gutripper
			[38] = 2.89, -- On My Way
			[42] = 0.70, -- Savior
			[43] = 0.96, -- Winds of War
			[82] = 10.00, -- Champion of Azeroth
			[83] = 0.54, -- Impassive Visage
			[84] = 0.04, -- Bulwark of the Masses
			[85] = 0.87, -- Gemhide
			[86] = 0.78, -- Azerite Fortification
			[87] = 0.66, -- Self Reliance
			[89] = 0.10, -- Azerite Veins
			[98] = 0.90, -- Crystalline Carapace
			[100] = 0.33, -- Strength in Numbers
			[101] = 0.26, -- Shimmering Haven
			[103] = 0.33, -- Concentrated Mending
			[104] = 0.13, -- Bracing Chill
			[125] = 6.12, -- Avenger's Might
			[143] = 0.02, -- Inspiring Beacon
			[144] = 0.44, -- Rejuvenating Grace
			[145] = 1.35, -- Fortifying Auras
			[149] = 0.31, -- Healing Hammer
			[154] = 8.56, -- Relentless Inquisitor
			[156] = 5.76, -- Ruinous Bolt
			[157] = 8.98, -- Rezan's Fury
			[187] = 7.94, -- Expurgation
			[192] = 7.58, -- Meticulous Scheming
			[193] = 7.67, -- Blightborne Infusion
			[194] = 7.97, -- Filthy Transfusion
			[195] = 7.37, -- Secrets of the Deep
			[196] = 7.06, -- Swirling Sands
			[206] = 0.21, -- Stalwart Protector
			[235] = 7.01, -- Indomitable Justice
			[393] = 0.36, -- Grace of the Justicar
			[454] = 0.36, -- Judicious Defense
			[459] = 3.32, -- Unstable Flames
			[461] = 2.07, -- Earthlink
			[462] = 2.59, -- Azerite Globules
			[463] = 0.36, -- Blessed Portents
			[471] = 0.35, -- Gallant Steed
			[478] = 8.85, -- Tidal Surge
			[479] = 9.48, -- Dagger in the Back
			[480] = 6.06, -- Blood Rite
			[481] = 5.31, -- Incite the Pack
			[482] = 7.60, -- Thunderous Blast
			[483] = 7.57, -- Archive of the Titans
			[485] = 8.49, -- Laser Matrix
			[492] = 5.51, -- Liberator's Might
			[493] = 0.09, -- Last Gift
			[494] = 8.60, -- Battlefield Precision
			[495] = 6.45, -- Anduin's Dedication
			[496] = 1.45, -- Stronger Together
			[497] = 1.87, -- Stand As One
			[498] = 6.22, -- Barrage Of Many Bombs
			[499] = 3.85, -- Ricocheting Inflatable Pyrosaw
			[500] = 5.36, -- Synaptic Spark Capacitor
			[501] = 8.21, -- Relational Normalization Gizmo
			[502] = 0.16, -- Personal Absorb-o-Tron
			[503] = 0.29, -- Auto-Self-Cauterizer
			[504] = 7.97, -- Unstable Catalyst
			[505] = 6.12, -- Tradewinds
			[508] = 0.13, -- Light's Decree
			[521] = 0.18, -- Shadow of Elune
			[523] = 0.63, -- Apothecary's Concoctions
			[526] = 0.57, -- Endless Hunger
			[538] = 0.66, -- Empyreal Ward
			[541] = 0.60, -- Fight or Flight
			[560] = 0.07, -- Bonded Souls
			[561] = 0.91, -- Seductive Power
			[562] = 0.18, -- Treacherous Covenant
		})

	-- Hunter
		-- Beast Mastery
		insertDefaultScalesData(defaultName, 3, 1, {
			[14] = 0.01, -- Longstrider
			[18] = 1.94, -- Blood Siphon
			[21] = 2.48, -- Elemental Whirl
			[22] = 3.48, -- Heed My Call
			[30] = 3.14, -- Overwhelming Power
			[31] = 3.13, -- Gutripper
			[82] = 7.41, -- Champion of Azeroth
			[84] = 0.03, -- Bulwark of the Masses
			[85] = 0.38, -- Gemhide
			[87] = 0.44, -- Self Reliance
			[107] = 4.80, -- Serrated Jaws
			[156] = 3.48, -- Ruinous Bolt
			[157] = 6.31, -- Rezan's Fury
			[161] = 6.10, -- Haze of Rage
			[192] = 5.58, -- Meticulous Scheming
			[193] = 6.50, -- Blightborne Infusion
			[194] = 6.04, -- Filthy Transfusion
			[195] = 5.40, -- Secrets of the Deep
			[196] = 5.51, -- Swirling Sands
			[211] = 4.08, -- Dance of Death
			[366] = 10.00, -- Primal Instincts
			[367] = 6.82, -- Feeding Frenzy
			[369] = 0.63, -- Rapid Reload
			[459] = 1.97, -- Unstable Flames
			[461] = 1.51, -- Earthlink
			[462] = 1.77, -- Azerite Globules
			[478] = 7.08, -- Tidal Surge
			[479] = 7.80, -- Dagger in the Back
			[480] = 3.89, -- Blood Rite
			[481] = 5.07, -- Incite the Pack
			[482] = 4.86, -- Thunderous Blast
			[483] = 5.75, -- Archive of the Titans
			[485] = 5.75, -- Laser Matrix
			[492] = 3.94, -- Liberator's Might
			[494] = 6.42, -- Battlefield Precision
			[495] = 5.37, -- Anduin's Dedication
			[496] = 1.03, -- Stronger Together
			[497] = 1.48, -- Stand As One
			[498] = 3.93, -- Barrage Of Many Bombs
			[499] = 2.38, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.27, -- Synaptic Spark Capacitor
			[501] = 5.40, -- Relational Normalization Gizmo
			[504] = 5.99, -- Unstable Catalyst
			[505] = 5.14, -- Tradewinds
			[523] = 0.19, -- Apothecary's Concoctions
			[526] = 0.27, -- Endless Hunger
			[541] = 0.17, -- Fight or Flight
			[543] = 0.52, -- Nature's Salve
			[560] = 0.05, -- Bonded Souls
		})

		-- Marksmanship
		insertDefaultScalesData(defaultName, 3, 2, {
			[13] = 0.24, -- Azerite Empowered
			[14] = 0.29, -- Longstrider
			[15] = 0.30, -- Resounding Protection
			[18] = 2.34, -- Blood Siphon
			[21] = 2.34, -- Elemental Whirl
			[22] = 3.43, -- Heed My Call
			[30] = 3.75, -- Overwhelming Power
			[31] = 3.86, -- Gutripper
			[36] = 9.24, -- In The Rhythm
			[82] = 7.33, -- Champion of Azeroth
			[83] = 0.10, -- Impassive Visage
			[84] = 0.56, -- Bulwark of the Masses
			[85] = 0.42, -- Gemhide
			[87] = 0.35, -- Self Reliance
			[156] = 4.97, -- Ruinous Bolt
			[157] = 7.43, -- Rezan's Fury
			[192] = 5.38, -- Meticulous Scheming
			[193] = 7.04, -- Blightborne Infusion
			[194] = 6.87, -- Filthy Transfusion
			[195] = 5.66, -- Secrets of the Deep
			[196] = 6.32, -- Swirling Sands
			[212] = 10.00, -- Unerring Vision
			[368] = 4.27, -- Steady Aim
			[369] = 0.22, -- Rapid Reload
			[370] = 7.63, -- Focused Fire
			[459] = 2.83, -- Unstable Flames
			[461] = 1.92, -- Earthlink
			[462] = 1.87, -- Azerite Globules
			[469] = 0.45, -- Duck and Cover
			[478] = 7.73, -- Tidal Surge
			[479] = 8.44, -- Dagger in the Back
			[480] = 4.13, -- Blood Rite
			[481] = 5.80, -- Incite the Pack
			[482] = 6.06, -- Thunderous Blast
			[483] = 5.76, -- Archive of the Titans
			[485] = 6.86, -- Laser Matrix
			[492] = 4.71, -- Liberator's Might
			[493] = 0.03, -- Last Gift
			[494] = 7.78, -- Battlefield Precision
			[495] = 5.64, -- Anduin's Dedication
			[496] = 1.38, -- Stronger Together
			[497] = 1.86, -- Stand As One
			[498] = 4.95, -- Barrage Of Many Bombs
			[499] = 3.51, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.49, -- Synaptic Spark Capacitor
			[501] = 5.67, -- Relational Normalization Gizmo
			[502] = 0.39, -- Personal Absorb-o-Tron
			[503] = 0.19, -- Auto-Self-Cauterizer
			[504] = 6.13, -- Unstable Catalyst
			[505] = 5.23, -- Tradewinds
			[522] = 0.13, -- Ancients' Bulwark
			[523] = 0.04, -- Apothecary's Concoctions
			[528] = 0.59, -- Surging Shots
			[541] = 0.41, -- Fight or Flight
			[543] = 0.38, -- Nature's Salve
			[560] = 0.04, -- Bonded Souls
			[561] = 0.27, -- Seductive Power
			[562] = 0.04, -- Treacherous Covenant
		})

		-- Survival
		insertDefaultScalesData(defaultName, 3, 3, {
			[13] = 0.28, -- Azerite Empowered
			[14] = 0.17, -- Longstrider
			[15] = 0.22, -- Resounding Protection
			[18] = 1.50, -- Blood Siphon
			[21] = 1.77, -- Elemental Whirl
			[22] = 1.86, -- Heed My Call
			[30] = 3.38, -- Overwhelming Power
			[31] = 2.52, -- Gutripper
			[44] = 0.29, -- Vampiric Speed
			[82] = 4.77, -- Champion of Azeroth
			[83] = 0.15, -- Impassive Visage
			[84] = 0.64, -- Bulwark of the Masses
			[85] = 0.33, -- Gemhide
			[86] = 0.25, -- Azerite Fortification
			[87] = 0.09, -- Self Reliance
			[107] = 3.10, -- Serrated Jaws
			[110] = 2.00, -- Wildfire Cluster
			[156] = 2.88, -- Ruinous Bolt
			[157] = 4.72, -- Rezan's Fury
			[163] = 6.44, -- Latent Poison
			[192] = 3.88, -- Meticulous Scheming
			[193] = 4.13, -- Blightborne Infusion
			[194] = 4.07, -- Filthy Transfusion
			[195] = 4.39, -- Secrets of the Deep
			[196] = 4.11, -- Swirling Sands
			[203] = 0.03, -- Shellshock
			[213] = 3.69, -- Venomous Fangs
			[371] = 10.00, -- Blur of Talons
			[372] = 7.80, -- Wilderness Survival
			[459] = 1.76, -- Unstable Flames
			[461] = 1.33, -- Earthlink
			[462] = 1.55, -- Azerite Globules
			[469] = 0.20, -- Duck and Cover
			[478] = 4.75, -- Tidal Surge
			[479] = 5.71, -- Dagger in the Back
			[480] = 3.34, -- Blood Rite
			[481] = 2.77, -- Incite the Pack
			[482] = 4.30, -- Thunderous Blast
			[483] = 4.21, -- Archive of the Titans
			[485] = 4.40, -- Laser Matrix
			[492] = 3.18, -- Liberator's Might
			[493] = 0.37, -- Last Gift
			[494] = 4.71, -- Battlefield Precision
			[495] = 3.88, -- Anduin's Dedication
			[496] = 0.96, -- Stronger Together
			[497] = 1.00, -- Stand As One
			[498] = 3.42, -- Barrage Of Many Bombs
			[499] = 1.77, -- Ricocheting Inflatable Pyrosaw
			[500] = 2.64, -- Synaptic Spark Capacitor
			[501] = 4.68, -- Relational Normalization Gizmo
			[502] = 0.02, -- Personal Absorb-o-Tron
			[503] = 0.45, -- Auto-Self-Cauterizer
			[504] = 4.45, -- Unstable Catalyst
			[505] = 3.02, -- Tradewinds
			[518] = 0.35, -- Dire Consequences
			[521] = 0.15, -- Shadow of Elune
			[522] = 0.32, -- Ancients' Bulwark
			[523] = 0.51, -- Apothecary's Concoctions
			[526] = 0.11, -- Endless Hunger
			[541] = 0.28, -- Fight or Flight
			[543] = 0.27, -- Nature's Salve
			[551] = 0.45, -- Primeval Intuition
			[560] = 0.59, -- Bonded Souls
			[561] = 0.36, -- Seductive Power
		})

	-- Rogue
		-- Assassination
		insertDefaultScalesData(defaultName, 4, 1, {
			[18] = 1.77, -- Blood Siphon
			[21] = 2.43, -- Elemental Whirl
			[22] = 2.96, -- Heed My Call
			[30] = 4.34, -- Overwhelming Power
			[31] = 3.61, -- Gutripper
			[82] = 7.97, -- Champion of Azeroth
			[136] = 10.00, -- Double Dose
			[156] = 3.87, -- Ruinous Bolt
			[157] = 7.33, -- Rezan's Fury
			[181] = 7.11, -- Twist the Knife
			[192] = 4.18, -- Meticulous Scheming
			[193] = 7.73, -- Blightborne Infusion
			[194] = 5.94, -- Filthy Transfusion
			[195] = 5.88, -- Secrets of the Deep
			[196] = 7.05, -- Swirling Sands
			[217] = 0.07, -- Footpad
			[406] = 3.90, -- Scent of Blood
			[408] = 1.04, -- Shrouded Suffocation
			[459] = 3.02, -- Unstable Flames
			[461] = 1.83, -- Earthlink
			[462] = 1.85, -- Azerite Globules
			[478] = 7.21, -- Tidal Surge
			[479] = 8.61, -- Dagger in the Back
			[480] = 5.05, -- Blood Rite
			[481] = 5.33, -- Incite the Pack
			[482] = 5.94, -- Thunderous Blast
			[483] = 6.12, -- Archive of the Titans
			[485] = 6.13, -- Laser Matrix
			[492] = 4.08, -- Liberator's Might
			[493] = 0.22, -- Last Gift
			[494] = 7.52, -- Battlefield Precision
			[495] = 5.85, -- Anduin's Dedication
			[496] = 1.22, -- Stronger Together
			[497] = 1.19, -- Stand As One
			[498] = 4.62, -- Barrage Of Many Bombs
			[499] = 2.66, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.22, -- Synaptic Spark Capacitor
			[501] = 5.71, -- Relational Normalization Gizmo
			[503] = 0.22, -- Auto-Self-Cauterizer
			[504] = 6.49, -- Unstable Catalyst
			[505] = 5.29, -- Tradewinds
			[522] = 0.06, -- Ancients' Bulwark
			[541] = 0.08, -- Fight or Flight
		})

		-- Outlaw
		insertDefaultScalesData(defaultName, 4, 2, {
			[13] = 0.37, -- Azerite Empowered
			[14] = 0.10, -- Longstrider
			[15] = 0.42, -- Resounding Protection
			[18] = 1.63, -- Blood Siphon
			[21] = 1.93, -- Elemental Whirl
			[22] = 3.81, -- Heed My Call
			[30] = 4.09, -- Overwhelming Power
			[31] = 4.27, -- Gutripper
			[44] = 0.01, -- Vampiric Speed
			[82] = 6.98, -- Champion of Azeroth
			[83] = 0.54, -- Impassive Visage
			[84] = 0.39, -- Bulwark of the Masses
			[86] = 0.57, -- Azerite Fortification
			[129] = 9.13, -- Deadshot
			[156] = 5.46, -- Ruinous Bolt
			[157] = 8.83, -- Rezan's Fury
			[180] = 5.96, -- Keep Your Wits About You
			[192] = 5.35, -- Meticulous Scheming
			[193] = 6.29, -- Blightborne Infusion
			[194] = 6.72, -- Filthy Transfusion
			[195] = 5.90, -- Secrets of the Deep
			[196] = 6.24, -- Swirling Sands
			[217] = 0.41, -- Footpad
			[239] = 4.99, -- Snake Eyes
			[410] = 4.91, -- Paradise Lost
			[411] = 8.27, -- Ace Up Your Sleeve
			[446] = 7.16, -- Brigand's Blitz
			[459] = 2.11, -- Unstable Flames
			[461] = 1.58, -- Earthlink
			[462] = 2.36, -- Azerite Globules
			[478] = 8.02, -- Tidal Surge
			[479] = 10.00, -- Dagger in the Back
			[480] = 4.52, -- Blood Rite
			[481] = 4.03, -- Incite the Pack
			[482] = 6.81, -- Thunderous Blast
			[483] = 6.65, -- Archive of the Titans
			[485] = 7.48, -- Laser Matrix
			[492] = 3.73, -- Liberator's Might
			[493] = 0.45, -- Last Gift
			[494] = 8.54, -- Battlefield Precision
			[495] = 5.94, -- Anduin's Dedication
			[496] = 1.54, -- Stronger Together
			[497] = 1.52, -- Stand As One
			[498] = 5.82, -- Barrage Of Many Bombs
			[499] = 3.60, -- Ricocheting Inflatable Pyrosaw
			[500] = 5.18, -- Synaptic Spark Capacitor
			[501] = 5.93, -- Relational Normalization Gizmo
			[502] = 0.21, -- Personal Absorb-o-Tron
			[504] = 6.91, -- Unstable Catalyst
			[505] = 4.53, -- Tradewinds
			[522] = 0.08, -- Ancients' Bulwark
			[526] = 0.28, -- Endless Hunger
			[548] = 0.21, -- Lying In Wait
			[560] = 0.13, -- Bonded Souls
			[562] = 0.28, -- Treacherous Covenant
		})

		-- Subtley
		insertDefaultScalesData(defaultName, 4, 3, {
			[13] = 0.12, -- Azerite Empowered
			[14] = 0.12, -- Longstrider
			[18] = 1.00, -- Blood Siphon
			[21] = 0.98, -- Elemental Whirl
			[22] = 1.87, -- Heed My Call
			[30] = 1.57, -- Overwhelming Power
			[31] = 2.06, -- Gutripper
			[44] = 0.01, -- Vampiric Speed
			[82] = 3.98, -- Champion of Azeroth
			[83] = 0.11, -- Impassive Visage
			[156] = 2.73, -- Ruinous Bolt
			[157] = 4.41, -- Rezan's Fury
			[175] = 3.47, -- Night's Vengeance
			[192] = 1.80, -- Meticulous Scheming
			[193] = 3.59, -- Blightborne Infusion
			[194] = 3.75, -- Filthy Transfusion
			[195] = 3.48, -- Secrets of the Deep
			[196] = 3.20, -- Swirling Sands
			[240] = 5.36, -- Blade In The Shadows
			[413] = 10.00, -- The First Dance
			[414] = 8.03, -- Inevitability
			[445] = 2.43, -- Perforate
			[459] = 1.16, -- Unstable Flames
			[461] = 0.91, -- Earthlink
			[462] = 1.30, -- Azerite Globules
			[478] = 4.69, -- Tidal Surge
			[479] = 5.01, -- Dagger in the Back
			[480] = 1.98, -- Blood Rite
			[481] = 2.84, -- Incite the Pack
			[482] = 3.69, -- Thunderous Blast
			[483] = 3.72, -- Archive of the Titans
			[485] = 4.17, -- Laser Matrix
			[492] = 2.11, -- Liberator's Might
			[494] = 4.51, -- Battlefield Precision
			[495] = 3.40, -- Anduin's Dedication
			[496] = 0.71, -- Stronger Together
			[497] = 0.85, -- Stand As One
			[498] = 2.75, -- Barrage Of Many Bombs
			[499] = 1.91, -- Ricocheting Inflatable Pyrosaw
			[500] = 2.35, -- Synaptic Spark Capacitor
			[501] = 3.13, -- Relational Normalization Gizmo
			[502] = 0.08, -- Personal Absorb-o-Tron
			[503] = 0.03, -- Auto-Self-Cauterizer
			[504] = 3.46, -- Unstable Catalyst
			[505] = 2.85, -- Tradewinds
			[521] = 0.25, -- Shadow of Elune
			[523] = 0.04, -- Apothecary's Concoctions
			[526] = 0.10, -- Endless Hunger
			[548] = 0.02, -- Lying In Wait
			[562] = 0.08, -- Treacherous Covenant
		})

	-- Priest
		-- Discipline
		insertDefaultScalesData(defaultName, 5, 1, {

		})
		insertDefaultScalesData(offensiveName, 5, 1, {
			--[[
			-- 8.0 scales
			[20] = 1.11, -- Lifespeed
			[21] = 1.11, -- Elemental Whirl
			[22] = 3.72, -- Heed My Call
			[30] = 2.25, -- Overwhelming Power
			[31] = 3.48, -- Gutripper
			[38] = 1.26, -- On My Way
			[82] = 3.45, -- Champion of Azeroth
			[156] = 5.15, -- Ruinous Bolt
			[157] = 8.6, -- Rezan's Fury
			[192] = 1.5, -- Meticulous Scheming
			[193] = 4.5, -- Blightborne Infusion
			[194] = 7.52, -- Filthy Transfusion
			[195] = 3.99, -- Secrets of the Deep
			[196] = 3.84, -- Swirling Sands
			[402] = 0.06, -- Sacred Flame
			[459] = 1.5, -- Unstable Flames
			[462] = 2.43, -- Azerite Globules
			[478] = 8.78, -- Tidal Surge
			[479] = 10, -- Dagger in the Back
			[480] = 2.67, -- Blood Rite
			[482] = 7.19, -- Thunderous Blast
			[483] = 4.35, -- Archive of the Titans
			[485] = 7.58, -- Laser Matrix
			[504] = 4.5, -- Unstable Catalyst
			]]--
		})

		-- Holy
		insertDefaultScalesData(defaultName, 5, 2, {

		})
		insertDefaultScalesData(offensiveName, 5, 2, {
			[13] = 0.34, -- Azerite Empowered
			[19] = 0.59, -- Woundbinder
			[21] = 2.12, -- Elemental Whirl
			[22] = 3.36, -- Heed My Call
			[30] = 3.63, -- Overwhelming Power
			[31] = 4.56, -- Gutripper
			[38] = 1.61, -- On My Way
			[82] = 5.51, -- Champion of Azeroth
			[83] = 0.14, -- Impassive Visage
			[84] = 0.06, -- Bulwark of the Masses
			[85] = 0.70, -- Gemhide
			[86] = 0.28, -- Azerite Fortification
			[102] = 0.01, -- Synergistic Growth
			[114] = 0.07, -- Permeating Glow
			[156] = 5.75, -- Ruinous Bolt
			[157] = 8.49, -- Rezan's Fury
			[165] = 0.09, -- Blessed Sanctuary
			[192] = 4.06, -- Meticulous Scheming
			[193] = 6.82, -- Blightborne Infusion
			[194] = 7.69, -- Filthy Transfusion
			[195] = 5.29, -- Secrets of the Deep
			[196] = 5.73, -- Swirling Sands
			[400] = 0.09, -- Everlasting Light
			[459] = 2.39, -- Unstable Flames
			[461] = 2.25, -- Earthlink
			[462] = 2.46, -- Azerite Globules
			[478] = 9.02, -- Tidal Surge
			[479] = 10.00, -- Dagger in the Back
			[480] = 5.04, -- Blood Rite
			[482] = 7.57, -- Thunderous Blast
			[483] = 6.18, -- Archive of the Titans
			[485] = 7.38, -- Laser Matrix
			[492] = 4.81, -- Liberator's Might
			[494] = 8.65, -- Battlefield Precision
			[495] = 5.14, -- Anduin's Dedication
			[496] = 1.03, -- Stronger Together
			[497] = 1.63, -- Stand As One
			[498] = 5.68, -- Barrage Of Many Bombs
			[499] = 3.90, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.87, -- Synaptic Spark Capacitor
			[501] = 7.34, -- Relational Normalization Gizmo
			[504] = 6.28, -- Unstable Catalyst
			[505] = 0.13, -- Tradewinds
			[521] = 0.42, -- Shadow of Elune
			[522] = 0.11, -- Ancients' Bulwark
			[560] = 0.03, -- Bonded Souls
			[561] = 0.39, -- Seductive Power
		})

		-- Shadow
		insertDefaultScalesData(defaultName, 5, 3, {
			-- https://github.com/WarcraftPriests/bfa-shadow-priest/blob/master/azerite-traits/AzeritePowerWeights_DA.md
			-- First imported 03.09.2018, last updated 16.12.2018
			[13] = 0.78,
			[18] = 0.96,
			[21] = 1.15,
			[22] = 1.50,
			[30] = 2.34,
			[31] = 1.65,
			[38] = 0.90,
			[82] = 3.73,
			[115] = -0.01,
			[156] = 1.84,
			[157] = 3.39,
			[166] = 1.08,
			[192] = 2.96,
			[193] = 3.94,
			[194] = 2.98,
			[195] = 2.57,
			[196] = 3.51,
			[236] = 2.88,
			[403] = 2.91,
			[404] = 2.55,
			[405] = 4.01,
			[459] = 1.37,
			[461] = 0.88,
			[462] = 1.02,
			[478] = 3.08,
			[479] = 3.86,
			[480] = 2.37,
			[481] = 2.39,
			[482] = 2.88,
			[483] = 2.94,
			[485] = 3.02,
			[486] = 2.35,
			[487] = 0.02,
			[488] = 3.40,
			[489] = 2.45,
			[490] = 0.61,
			[491] = 0.94,
			[498] = 2.18,
			[499] = 1.32,
			[500] = 1.65,
			[501] = 3.07,
			[504] = 2.88,
			[505] = 2.56,
			[521] = 0.00,
			[522] = 0.00,
			[523] = 0.02,
			[526] = 0.03,
			[541] = 0.00,
		})

	-- Death Knight
		-- Blood
		insertDefaultScalesData(offensiveName, 6, 1, {
			[13] = 0.27, -- Azerite Empowered
			[14] = 0.17, -- Longstrider
			[15] = 0.08, -- Resounding Protection
			[18] = 1.56, -- Blood Siphon
			[20] = 2.19, -- Lifespeed
			[21] = 1.56, -- Elemental Whirl
			[22] = 3.95, -- Heed My Call
			[30] = 3.57, -- Overwhelming Power
			[31] = 4.47, -- Gutripper
			[44] = 0.42, -- Vampiric Speed
			[82] = 7.18, -- Champion of Azeroth
			[83] = 0.20, -- Impassive Visage
			[84] = 0.18, -- Bulwark of the Masses
			[85] = 0.13, -- Gemhide
			[86] = 0.46, -- Azerite Fortification
			[89] = 0.13, -- Azerite Veins
			[98] = 0.47, -- Crystalline Carapace
			[99] = 0.29, -- Ablative Shielding
			[100] = 0.19, -- Strength in Numbers
			[101] = 0.19, -- Shimmering Haven
			[106] = 2.68, -- Deep Cuts
			[140] = 1.24, -- Bone Spike Graveyard
			[156] = 5.42, -- Ruinous Bolt
			[157] = 10.00, -- Rezan's Fury
			[192] = 4.52, -- Meticulous Scheming
			[193] = 6.40, -- Blightborne Infusion
			[194] = 8.53, -- Filthy Transfusion
			[195] = 4.76, -- Secrets of the Deep
			[196] = 5.58, -- Swirling Sands
			[197] = 0.41, -- Marrowblood
			[201] = 0.29, -- Runic Barrier
			[348] = 5.09, -- Eternal Rune Weapon
			[349] = 0.56, -- Bones of the Damned
			[459] = 2.35, -- Unstable Flames
			[461] = 1.96, -- Earthlink
			[462] = 2.67, -- Azerite Globules
			[465] = 0.42, -- March of the Damned
			[478] = 8.61, -- Tidal Surge
			[479] = 7.36, -- Dagger in the Back
			[480] = 3.59, -- Blood Rite
			[481] = 3.14, -- Incite the Pack
			[482] = 8.14, -- Thunderous Blast
			[483] = 5.43, -- Archive of the Titans
			[485] = 8.68, -- Laser Matrix
			[492] = 3.92, -- Liberator's Might
			[493] = 0.01, -- Last Gift
			[494] = 9.31, -- Battlefield Precision
			[495] = 4.63, -- Anduin's Dedication
			[496] = 1.41, -- Stronger Together
			[497] = 1.16, -- Stand As One
			[498] = 5.86, -- Barrage Of Many Bombs
			[499] = 3.58, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.65, -- Synaptic Spark Capacitor
			[501] = 4.87, -- Relational Normalization Gizmo
			[502] = 0.29, -- Personal Absorb-o-Tron
			[503] = 0.23, -- Auto-Self-Cauterizer
			[504] = 5.30, -- Unstable Catalyst
			[505] = 4.04, -- Tradewinds
			[522] = 0.07, -- Ancients' Bulwark
			[526] = 0.14, -- Endless Hunger
			[541] = 0.16, -- Fight or Flight
			[549] = 0.02, -- Cold Hearted
			[557] = 0.42, -- Bloody Runeblade
			[560] = 0.21, -- Bonded Souls
			[561] = 0.48, -- Seductive Power
		})
		insertDefaultScalesData(defensiveName, 6, 1, {
			[13] = 0.05, -- Azerite Empowered
			[15] = 10.00, -- Resounding Protection
			[18] = 1.49, -- Blood Siphon
			[20] = 1.33, -- Lifespeed
			[21] = 0.48, -- Elemental Whirl
			[30] = 1.42, -- Overwhelming Power
			[44] = 0.08, -- Vampiric Speed
			[82] = 1.66, -- Champion of Azeroth
			[99] = 0.07, -- Ablative Shielding
			[100] = 0.03, -- Strength in Numbers
			[101] = 0.12, -- Shimmering Haven
			[106] = 2.18, -- Deep Cuts
			[140] = 1.79, -- Bone Spike Graveyard
			[157] = 0.14, -- Rezan's Fury
			[192] = 2.18, -- Meticulous Scheming
			[193] = 0.48, -- Blightborne Infusion
			[195] = 0.21, -- Secrets of the Deep
			[196] = 0.53, -- Swirling Sands
			[197] = 3.30, -- Marrowblood
			[348] = 0.76, -- Eternal Rune Weapon
			[349] = 0.35, -- Bones of the Damned
			[461] = 0.26, -- Earthlink
			[465] = 0.03, -- March of the Damned
			[479] = 0.12, -- Dagger in the Back
			[480] = 1.49, -- Blood Rite
			[481] = 0.38, -- Incite the Pack
			[482] = 0.08, -- Thunderous Blast
			[483] = 0.54, -- Archive of the Titans
			[485] = 0.39, -- Laser Matrix
			[492] = 1.03, -- Liberator's Might
			[495] = 0.16, -- Anduin's Dedication
			[496] = 0.21, -- Stronger Together
			[497] = 0.22, -- Stand As One
			[501] = 1.06, -- Relational Normalization Gizmo
			[504] = 0.67, -- Unstable Catalyst
			[505] = 0.47, -- Tradewinds
			[522] = 0.14, -- Ancients' Bulwark
			[523] = 0.26, -- Apothecary's Concoctions
			[557] = 0.08, -- Bloody Runeblade
			[560] = 0.01, -- Bonded Souls
			[562] = 0.15, -- Treacherous Covenant
		})

		-- Frost
		insertDefaultScalesData(defaultName, 6, 2, {
			[13] = 0.31, -- Azerite Empowered
			[14] = 0.01, -- Longstrider
			[15] = 0.01, -- Resounding Protection
			[18] = 2.25, -- Blood Siphon
			[20] = 2.21, -- Lifespeed
			[21] = 3.32, -- Elemental Whirl
			[22] = 3.69, -- Heed My Call
			[30] = 4.23, -- Overwhelming Power
			[31] = 3.66, -- Gutripper
			[43] = 0.03, -- Winds of War
			[44] = 0.49, -- Vampiric Speed
			[82] = 7.90, -- Champion of Azeroth
			[83] = 0.74, -- Impassive Visage
			[84] = 0.82, -- Bulwark of the Masses
			[85] = 0.04, -- Gemhide
			[86] = 0.52, -- Azerite Fortification
			[89] = 0.77, -- Azerite Veins
			[98] = 0.25, -- Crystalline Carapace
			[99] = 0.54, -- Ablative Shielding
			[100] = 0.34, -- Strength in Numbers
			[108] = 5.63, -- Icy Citadel
			[141] = 5.65, -- Latent Chill
			[156] = 5.43, -- Ruinous Bolt
			[157] = 7.53, -- Rezan's Fury
			[192] = 4.25, -- Meticulous Scheming
			[193] = 7.82, -- Blightborne Infusion
			[194] = 6.54, -- Filthy Transfusion
			[195] = 7.96, -- Secrets of the Deep
			[196] = 6.54, -- Swirling Sands
			[242] = 4.51, -- Echoing Howl
			[346] = 5.14, -- Killer Frost
			[347] = 3.49, -- Frozen Tempest
			[459] = 2.80, -- Unstable Flames
			[461] = 2.74, -- Earthlink
			[462] = 2.35, -- Azerite Globules
			[478] = 10.00, -- Tidal Surge
			[479] = 8.94, -- Dagger in the Back
			[480] = 4.29, -- Blood Rite
			[481] = 6.97, -- Incite the Pack
			[482] = 6.25, -- Thunderous Blast
			[483] = 7.66, -- Archive of the Titans
			[485] = 6.42, -- Laser Matrix
			[492] = 4.74, -- Liberator's Might
			[494] = 7.71, -- Battlefield Precision
			[495] = 7.00, -- Anduin's Dedication
			[496] = 1.94, -- Stronger Together
			[497] = 2.61, -- Stand As One
			[498] = 4.77, -- Barrage Of Many Bombs
			[499] = 2.44, -- Ricocheting Inflatable Pyrosaw
			[500] = 5.16, -- Synaptic Spark Capacitor
			[501] = 6.29, -- Relational Normalization Gizmo
			[502] = 0.24, -- Personal Absorb-o-Tron
			[503] = 0.51, -- Auto-Self-Cauterizer
			[504] = 8.24, -- Unstable Catalyst
			[505] = 6.97, -- Tradewinds
			[522] = 0.09, -- Ancients' Bulwark
			[549] = 0.04, -- Cold Hearted
			[560] = 0.41, -- Bonded Souls
			[562] = 0.49, -- Treacherous Covenant
		})

		-- Unholy
		insertDefaultScalesData(defaultName, 6, 3, {
			[15] = 0.02, -- Resounding Protection
			[18] = 1.53, -- Blood Siphon
			[20] = 2.56, -- Lifespeed
			[21] = 2.59, -- Elemental Whirl
			[22] = 3.49, -- Heed My Call
			[30] = 5.26, -- Overwhelming Power
			[31] = 3.78, -- Gutripper
			[82] = 8.55, -- Champion of Azeroth
			[89] = 0.36, -- Azerite Veins
			[140] = 0.73, -- Bone Spike Graveyard
			[156] = 4.80, -- Ruinous Bolt
			[157] = 8.46, -- Rezan's Fury
			[192] = 5.48, -- Meticulous Scheming
			[193] = 8.26, -- Blightborne Infusion
			[194] = 7.75, -- Filthy Transfusion
			[195] = 6.24, -- Secrets of the Deep
			[196] = 7.50, -- Swirling Sands
			[199] = 10.00, -- Festermight
			[244] = 6.68, -- Harrowing Decay
			[350] = 3.97, -- Cankerous Wounds
			[351] = 4.07, -- Last Surprise
			[459] = 2.78, -- Unstable Flames
			[461] = 1.84, -- Earthlink
			[462] = 1.87, -- Azerite Globules
			[478] = 8.33, -- Tidal Surge
			[479] = 9.99, -- Dagger in the Back
			[480] = 5.04, -- Blood Rite
			[481] = 5.03, -- Incite the Pack
			[482] = 6.58, -- Thunderous Blast
			[483] = 6.90, -- Archive of the Titans
			[485] = 7.44, -- Laser Matrix
			[492] = 4.70, -- Liberator's Might
			[494] = 8.95, -- Battlefield Precision
			[495] = 6.62, -- Anduin's Dedication
			[496] = 1.17, -- Stronger Together
			[497] = 1.48, -- Stand As One
			[498] = 5.25, -- Barrage Of Many Bombs
			[499] = 3.20, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.36, -- Synaptic Spark Capacitor
			[501] = 7.26, -- Relational Normalization Gizmo
			[504] = 7.55, -- Unstable Catalyst
			[505] = 5.86, -- Tradewinds
			[541] = 0.19, -- Fight or Flight
		})

	-- Shaman
		-- Elemental
		insertDefaultScalesData(defaultName, 7, 1, {
			[13] = 0.19, -- Azerite Empowered
			[14] = 0.16, -- Longstrider
			[18] = 1.50, -- Blood Siphon
			[19] = 0.11, -- Woundbinder
			[21] = 1.62, -- Elemental Whirl
			[22] = 3.17, -- Heed My Call
			[30] = 3.55, -- Overwhelming Power
			[31] = 2.41, -- Gutripper
			[38] = 2.23, -- On My Way
			[42] = 0.14, -- Savior
			[82] = 7.00, -- Champion of Azeroth
			[84] = 0.19, -- Bulwark of the Masses
			[85] = 0.12, -- Gemhide
			[86] = 0.26, -- Azerite Fortification
			[103] = 0.21, -- Concentrated Mending
			[104] = 0.12, -- Bracing Chill
			[105] = 0.27, -- Ephemeral Recovery
			[156] = 4.41, -- Ruinous Bolt
			[157] = 6.70, -- Rezan's Fury
			[178] = 4.87, -- Lava Shock
			[192] = 3.88, -- Meticulous Scheming
			[193] = 7.39, -- Blightborne Infusion
			[194] = 5.05, -- Filthy Transfusion
			[195] = 6.47, -- Secrets of the Deep
			[196] = 6.74, -- Swirling Sands
			[207] = 0.16, -- Serene Spirit
			[222] = 10.00, -- Echo of the Elementals
			[416] = 6.07, -- Natural Harmony
			[447] = 6.62, -- Ancestral Resonance
			[448] = 6.32, -- Synapse Shock
			[457] = 3.14, -- Igneous Potential
			[459] = 2.79, -- Unstable Flames
			[461] = 2.17, -- Earthlink
			[462] = 2.02, -- Azerite Globules
			[463] = 0.07, -- Blessed Portents
			[474] = 0.03, -- Pack Spirit
			[478] = 6.62, -- Tidal Surge
			[479] = 7.53, -- Dagger in the Back
			[480] = 4.76, -- Blood Rite
			[481] = 4.26, -- Incite the Pack
			[482] = 5.60, -- Thunderous Blast
			[483] = 5.60, -- Archive of the Titans
			[485] = 6.20, -- Laser Matrix
			[492] = 4.90, -- Liberator's Might
			[494] = 6.03, -- Battlefield Precision
			[495] = 5.57, -- Anduin's Dedication
			[496] = 1.31, -- Stronger Together
			[497] = 1.46, -- Stand As One
			[498] = 4.05, -- Barrage Of Many Bombs
			[499] = 2.26, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.67, -- Synaptic Spark Capacitor
			[501] = 6.05, -- Relational Normalization Gizmo
			[502] = 0.31, -- Personal Absorb-o-Tron
			[503] = 0.18, -- Auto-Self-Cauterizer
			[504] = 6.42, -- Unstable Catalyst
			[505] = 4.04, -- Tradewinds
			[512] = 0.05, -- Tectonic Thunder
			[522] = 0.26, -- Ancients' Bulwark
			[523] = 0.22, -- Apothecary's Concoctions
			[526] = 0.16, -- Endless Hunger
			[541] = 0.31, -- Fight or Flight
			[561] = 0.11, -- Seductive Power
			[562] = 0.37, -- Treacherous Covenant
		})

		-- Enhancement
		insertDefaultScalesData(defaultName, 7, 2, {
			[18] = 1.43, -- Blood Siphon
			[19] = 0.25, -- Woundbinder
			[21] = 1.57, -- Elemental Whirl
			[22] = 2.40, -- Heed My Call
			[30] = 3.14, -- Overwhelming Power
			[31] = 2.52, -- Gutripper
			[38] = 1.42, -- On My Way
			[42] = 0.02, -- Savior
			[82] = 5.72, -- Champion of Azeroth
			[87] = 0.07, -- Self Reliance
			[104] = 0.31, -- Bracing Chill
			[137] = 4.48, -- Primal Primer
			[156] = 2.98, -- Ruinous Bolt
			[157] = 5.12, -- Rezan's Fury
			[179] = 6.59, -- Strength of Earth
			[192] = 4.07, -- Meticulous Scheming
			[193] = 5.40, -- Blightborne Infusion
			[194] = 4.24, -- Filthy Transfusion
			[195] = 4.22, -- Secrets of the Deep
			[196] = 4.78, -- Swirling Sands
			[223] = 2.74, -- Lightning Conduit
			[416] = 4.36, -- Natural Harmony
			[420] = 7.00, -- Roiling Storm
			[447] = 6.56, -- Ancestral Resonance
			[459] = 1.66, -- Unstable Flames
			[461] = 1.11, -- Earthlink
			[462] = 1.49, -- Azerite Globules
			[478] = 5.29, -- Tidal Surge
			[479] = 6.15, -- Dagger in the Back
			[480] = 3.42, -- Blood Rite
			[481] = 3.66, -- Incite the Pack
			[482] = 4.47, -- Thunderous Blast
			[483] = 5.01, -- Archive of the Titans
			[485] = 4.73, -- Laser Matrix
			[492] = 3.21, -- Liberator's Might
			[494] = 5.19, -- Battlefield Precision
			[495] = 4.60, -- Anduin's Dedication
			[496] = 0.95, -- Stronger Together
			[497] = 0.98, -- Stand As One
			[498] = 3.37, -- Barrage Of Many Bombs
			[499] = 2.00, -- Ricocheting Inflatable Pyrosaw
			[500] = 2.59, -- Synaptic Spark Capacitor
			[501] = 4.55, -- Relational Normalization Gizmo
			[502] = 0.03, -- Personal Absorb-o-Tron
			[503] = 0.12, -- Auto-Self-Cauterizer
			[504] = 5.00, -- Unstable Catalyst
			[505] = 4.59, -- Tradewinds
			[521] = 0.22, -- Shadow of Elune
			[522] = 0.28, -- Ancients' Bulwark
			[523] = 0.02, -- Apothecary's Concoctions
			[526] = 0.18, -- Endless Hunger
			[530] = 10.00, -- Thunderaan's Fury
			[539] = 0.29, -- Ancient Ankh Talisman
			[541] = 0.21, -- Fight or Flight
		})

		-- Restoration
		insertDefaultScalesData(defaultName, 7, 3, {

		})

	-- Mage
		-- Arcane
		insertDefaultScalesData(defaultName, 8, 1, {
			[13] = 0.14, -- Azerite Empowered
			[14] = 1.02, -- Longstrider
			[15] = 0.39, -- Resounding Protection
			[18] = 3.01, -- Blood Siphon
			[21] = 2.30, -- Elemental Whirl
			[22] = 3.79, -- Heed My Call
			[30] = 3.40, -- Overwhelming Power
			[31] = 2.92, -- Gutripper
			[44] = 0.19, -- Vampiric Speed
			[82] = 8.48, -- Champion of Azeroth
			[83] = 0.61, -- Impassive Visage
			[84] = 0.22, -- Bulwark of the Masses
			[87] = 0.11, -- Self Reliance
			[88] = 7.12, -- Arcane Pummeling
			[156] = 5.23, -- Ruinous Bolt
			[157] = 9.06, -- Rezan's Fury
			[167] = 4.85, -- Brain Storm
			[192] = 2.73, -- Meticulous Scheming
			[193] = 9.26, -- Blightborne Infusion
			[194] = 7.90, -- Filthy Transfusion
			[195] = 6.97, -- Secrets of the Deep
			[196] = 7.56, -- Swirling Sands
			[205] = 0.98, -- Eldritch Warding
			[214] = 4.46, -- Arcane Pressure
			[374] = 9.75, -- Galvanizing Spark
			[459] = 3.04, -- Unstable Flames
			[461] = 2.56, -- Earthlink
			[462] = 2.44, -- Azerite Globules
			[478] = 9.64, -- Tidal Surge
			[479] = 10.00, -- Dagger in the Back
			[480] = 3.96, -- Blood Rite
			[481] = 6.41, -- Incite the Pack
			[482] = 6.74, -- Thunderous Blast
			[483] = 8.54, -- Archive of the Titans
			[485] = 7.42, -- Laser Matrix
			[492] = 5.01, -- Liberator's Might
			[493] = 0.41, -- Last Gift
			[494] = 7.32, -- Battlefield Precision
			[495] = 7.35, -- Anduin's Dedication
			[496] = 1.57, -- Stronger Together
			[497] = 2.15, -- Stand As One
			[498] = 5.36, -- Barrage Of Many Bombs
			[499] = 3.64, -- Ricocheting Inflatable Pyrosaw
			[500] = 5.61, -- Synaptic Spark Capacitor
			[501] = 6.79, -- Relational Normalization Gizmo
			[502] = 0.41, -- Personal Absorb-o-Tron
			[504] = 8.24, -- Unstable Catalyst
			[505] = 5.91, -- Tradewinds
			[521] = 0.17, -- Shadow of Elune
			[546] = 0.15, -- Quick Thinking
			[560] = 0.52, -- Bonded Souls
			[561] = 0.09, -- Seductive Power
		})

		-- Fire
		insertDefaultScalesData(defaultName, 8, 2, {
			[13] = 0.22, -- Azerite Empowered
			[14] = 0.58, -- Longstrider
			[15] = 0.57, -- Resounding Protection
			[18] = 1.90, -- Blood Siphon
			[21] = 2.65, -- Elemental Whirl
			[22] = 3.64, -- Heed My Call
			[30] = 4.00, -- Overwhelming Power
			[31] = 4.75, -- Gutripper
			[44] = 0.33, -- Vampiric Speed
			[82] = 7.33, -- Champion of Azeroth
			[85] = 0.01, -- Gemhide
			[87] = 0.07, -- Self Reliance
			[128] = 5.57, -- Flames of Alacrity
			[156] = 5.42, -- Ruinous Bolt
			[157] = 8.54, -- Rezan's Fury
			[192] = 5.04, -- Meticulous Scheming
			[193] = 6.91, -- Blightborne Infusion
			[194] = 7.67, -- Filthy Transfusion
			[195] = 6.26, -- Secrets of the Deep
			[196] = 6.58, -- Swirling Sands
			[215] = 8.52, -- Blaster Master
			[376] = 4.68, -- Trailing Embers
			[377] = 8.83, -- Duplicative Incineration
			[378] = 8.52, -- Firemind
			[459] = 3.10, -- Unstable Flames
			[461] = 3.02, -- Earthlink
			[462] = 2.48, -- Azerite Globules
			[468] = 0.65, -- Cauterizing Blink
			[478] = 9.29, -- Tidal Surge
			[479] = 10.00, -- Dagger in the Back
			[480] = 4.88, -- Blood Rite
			[481] = 5.84, -- Incite the Pack
			[482] = 7.50, -- Thunderous Blast
			[483] = 6.98, -- Archive of the Titans
			[485] = 6.97, -- Laser Matrix
			[492] = 3.16, -- Liberator's Might
			[493] = 0.13, -- Last Gift
			[494] = 8.58, -- Battlefield Precision
			[495] = 6.39, -- Anduin's Dedication
			[496] = 1.22, -- Stronger Together
			[497] = 1.97, -- Stand As One
			[498] = 6.09, -- Barrage Of Many Bombs
			[499] = 2.94, -- Ricocheting Inflatable Pyrosaw
			[500] = 5.33, -- Synaptic Spark Capacitor
			[501] = 6.51, -- Relational Normalization Gizmo
			[503] = 0.21, -- Auto-Self-Cauterizer
			[504] = 7.47, -- Unstable Catalyst
			[505] = 5.66, -- Tradewinds
			[522] = 0.37, -- Ancients' Bulwark
			[526] = 0.12, -- Endless Hunger
			[556] = 0.89, -- Wildfire
			[560] = 0.16, -- Bonded Souls
			[561] = 0.04, -- Seductive Power
		})

		-- Frost
		insertDefaultScalesData(defaultName, 8, 3, {
			[18] = 2.44, -- Blood Siphon
			[21] = 2.74, -- Elemental Whirl
			[22] = 3.02, -- Heed My Call
			[30] = 4.33, -- Overwhelming Power
			[31] = 4.43, -- Gutripper
			[82] = 8.55, -- Champion of Azeroth
			[85] = 0.55, -- Gemhide
			[132] = 7.34, -- Packed Ice
			[156] = 6.01, -- Ruinous Bolt
			[157] = 9.06, -- Rezan's Fury
			[192] = 5.19, -- Meticulous Scheming
			[193] = 6.55, -- Blightborne Infusion
			[194] = 7.64, -- Filthy Transfusion
			[195] = 6.74, -- Secrets of the Deep
			[196] = 6.63, -- Swirling Sands
			[225] = 7.40, -- Glacial Assault
			[379] = 7.64, -- Tunnel of Ice
			[380] = 7.89, -- Whiteout
			[381] = 7.16, -- Frigid Grasp
			[459] = 2.81, -- Unstable Flames
			[461] = 2.49, -- Earthlink
			[462] = 2.28, -- Azerite Globules
			[468] = 0.04, -- Cauterizing Blink
			[478] = 9.27, -- Tidal Surge
			[479] = 10.00, -- Dagger in the Back
			[480] = 5.10, -- Blood Rite
			[481] = 5.49, -- Incite the Pack
			[482] = 7.26, -- Thunderous Blast
			[483] = 7.81, -- Archive of the Titans
			[485] = 7.60, -- Laser Matrix
			[492] = 5.17, -- Liberator's Might
			[494] = 8.05, -- Battlefield Precision
			[495] = 7.09, -- Anduin's Dedication
			[496] = 1.06, -- Stronger Together
			[497] = 1.54, -- Stand As One
			[498] = 5.74, -- Barrage Of Many Bombs
			[499] = 2.78, -- Ricocheting Inflatable Pyrosaw
			[500] = 5.17, -- Synaptic Spark Capacitor
			[501] = 7.14, -- Relational Normalization Gizmo
			[504] = 8.02, -- Unstable Catalyst
			[505] = 5.51, -- Tradewinds
			[521] = 0.28, -- Shadow of Elune
			[560] = 0.22, -- Bonded Souls
		})

	-- Warlock
		-- Affliction
		insertDefaultScalesData(defaultName, 9, 1, {
			[18] = 2.42, -- Blood Siphon
			[21] = 2.28, -- Elemental Whirl
			[22] = 3.13, -- Heed My Call
			[30] = 4.39, -- Overwhelming Power
			[31] = 3.59, -- Gutripper
			[82] = 7.85, -- Champion of Azeroth
			[123] = 8.72, -- Wracking Brilliance
			[156] = 4.92, -- Ruinous Bolt
			[157] = 7.43, -- Rezan's Fury
			[183] = 7.14, -- Inevitable Demise
			[192] = 5.41, -- Meticulous Scheming
			[193] = 6.93, -- Blightborne Infusion
			[194] = 7.13, -- Filthy Transfusion
			[195] = 6.72, -- Secrets of the Deep
			[196] = 6.21, -- Swirling Sands
			[230] = 6.13, -- Cascading Calamity
			[425] = 7.09, -- Sudden Onset
			[426] = 4.75, -- Dreadful Calling
			[442] = 7.30, -- Pandemic Invocation
			[459] = 2.18, -- Unstable Flames
			[461] = 2.04, -- Earthlink
			[462] = 1.51, -- Azerite Globules
			[475] = 0.27, -- Desperate Power
			[478] = 9.01, -- Tidal Surge
			[479] = 10.00, -- Dagger in the Back
			[480] = 5.05, -- Blood Rite
			[481] = 5.91, -- Incite the Pack
			[482] = 6.55, -- Thunderous Blast
			[483] = 7.00, -- Archive of the Titans
			[485] = 7.42, -- Laser Matrix
			[492] = 4.37, -- Liberator's Might
			[494] = 8.35, -- Battlefield Precision
			[495] = 5.82, -- Anduin's Dedication
			[496] = 0.74, -- Stronger Together
			[497] = 1.47, -- Stand As One
			[498] = 5.54, -- Barrage Of Many Bombs
			[499] = 3.49, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.56, -- Synaptic Spark Capacitor
			[501] = 6.58, -- Relational Normalization Gizmo
			[503] = 0.30, -- Auto-Self-Cauterizer
			[504] = 6.89, -- Unstable Catalyst
			[505] = 6.61, -- Tradewinds
			[521] = 0.31, -- Shadow of Elune
		})

		-- Demonology
		insertDefaultScalesData(defaultName, 9, 2, {
			[18] = 1.77, -- Blood Siphon
			[21] = 1.81, -- Elemental Whirl
			[22] = 1.76, -- Heed My Call
			[30] = 3.25, -- Overwhelming Power
			[31] = 2.92, -- Gutripper
			[82] = 6.38, -- Champion of Azeroth
			[130] = 3.73, -- Shadow's Bite
			[156] = 3.18, -- Ruinous Bolt
			[157] = 5.79, -- Rezan's Fury
			[190] = 2.64, -- Umbral Blaze
			[192] = 3.23, -- Meticulous Scheming
			[193] = 6.13, -- Blightborne Infusion
			[194] = 4.94, -- Filthy Transfusion
			[195] = 5.22, -- Secrets of the Deep
			[196] = 4.11, -- Swirling Sands
			[428] = 3.93, -- Demonic Meteor
			[429] = 10.00, -- Baleful Invocation
			[458] = 5.86, -- Supreme Commander
			[459] = 2.24, -- Unstable Flames
			[461] = 1.29, -- Earthlink
			[462] = 1.05, -- Azerite Globules
			[478] = 5.25, -- Tidal Surge
			[479] = 5.87, -- Dagger in the Back
			[480] = 3.43, -- Blood Rite
			[481] = 3.80, -- Incite the Pack
			[482] = 4.82, -- Thunderous Blast
			[483] = 5.38, -- Archive of the Titans
			[485] = 4.58, -- Laser Matrix
			[492] = 3.65, -- Liberator's Might
			[494] = 4.15, -- Battlefield Precision
			[495] = 4.91, -- Anduin's Dedication
			[496] = 0.48, -- Stronger Together
			[497] = 0.68, -- Stand As One
			[498] = 3.29, -- Barrage Of Many Bombs
			[499] = 1.39, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.38, -- Synaptic Spark Capacitor
			[501] = 4.73, -- Relational Normalization Gizmo
			[504] = 5.64, -- Unstable Catalyst
			[505] = 5.00, -- Tradewinds
			[541] = 0.31, -- Fight or Flight
		})

		-- Destruction
		insertDefaultScalesData(defaultName, 9, 3, {
			[14] = 0.22, -- Longstrider
			[15] = 0.87, -- Resounding Protection
			[18] = 2.82, -- Blood Siphon
			[21] = 2.70, -- Elemental Whirl
			[22] = 4.33, -- Heed My Call
			[30] = 4.62, -- Overwhelming Power
			[31] = 3.90, -- Gutripper
			[44] = 1.07, -- Vampiric Speed
			[82] = 9.37, -- Champion of Azeroth
			[85] = 0.03, -- Gemhide
			[86] = 0.94, -- Azerite Fortification
			[156] = 5.35, -- Ruinous Bolt
			[157] = 9.15, -- Rezan's Fury
			[192] = 5.65, -- Meticulous Scheming
			[193] = 8.42, -- Blightborne Infusion
			[194] = 7.79, -- Filthy Transfusion
			[195] = 6.61, -- Secrets of the Deep
			[196] = 7.69, -- Swirling Sands
			[232] = 5.99, -- Flashpoint
			[431] = 0.18, -- Rolling Havoc
			[432] = 9.16, -- Chaotic Inferno
			[444] = 9.71, -- Crashing Chaos
			[459] = 2.85, -- Unstable Flames
			[460] = 7.01, -- Bursting Flare
			[461] = 2.48, -- Earthlink
			[462] = 2.10, -- Azerite Globules
			[475] = 0.71, -- Desperate Power
			[478] = 8.67, -- Tidal Surge
			[479] = 10.00, -- Dagger in the Back
			[480] = 4.79, -- Blood Rite
			[481] = 6.84, -- Incite the Pack
			[482] = 7.28, -- Thunderous Blast
			[483] = 6.05, -- Archive of the Titans
			[485] = 8.11, -- Laser Matrix
			[492] = 5.29, -- Liberator's Might
			[493] = 0.90, -- Last Gift
			[494] = 8.31, -- Battlefield Precision
			[495] = 6.98, -- Anduin's Dedication
			[496] = 1.54, -- Stronger Together
			[497] = 2.61, -- Stand As One
			[498] = 6.41, -- Barrage Of Many Bombs
			[499] = 3.29, -- Ricocheting Inflatable Pyrosaw
			[500] = 5.29, -- Synaptic Spark Capacitor
			[501] = 7.29, -- Relational Normalization Gizmo
			[502] = 0.83, -- Personal Absorb-o-Tron
			[503] = 0.45, -- Auto-Self-Cauterizer
			[504] = 8.08, -- Unstable Catalyst
			[505] = 7.28, -- Tradewinds
			[521] = 0.73, -- Shadow of Elune
			[523] = 0.12, -- Apothecary's Concoctions
			[525] = 0.24, -- Chaos Shards
			[526] = 0.64, -- Endless Hunger
			[531] = 0.09, -- Terror of the Mind
			[541] = 0.16, -- Fight or Flight
			[560] = 0.45, -- Bonded Souls
			[561] = 0.19, -- Seductive Power
			[562] = 0.14, -- Treacherous Covenant
		})

	-- Monk
		-- Brewmaster
		insertDefaultScalesData(offensiveName, 10, 1, {
			[13] = 0.08, -- Azerite Empowered
			[14] = 0.45, -- Longstrider
			[15] = 0.04, -- Resounding Protection
			[18] = 1.62, -- Blood Siphon
			[20] = 1.98, -- Lifespeed
			[21] = 1.29, -- Elemental Whirl
			[22] = 4.70, -- Heed My Call
			[30] = 2.15, -- Overwhelming Power
			[31] = 4.80, -- Gutripper
			[38] = 2.20, -- On My Way
			[42] = 0.12, -- Savior
			[44] = 0.03, -- Vampiric Speed
			[82] = 5.56, -- Champion of Azeroth
			[83] = 0.05, -- Impassive Visage
			[85] = 0.33, -- Gemhide
			[86] = 0.02, -- Azerite Fortification
			[89] = 0.60, -- Azerite Veins
			[98] = 0.12, -- Crystalline Carapace
			[99] = 0.28, -- Ablative Shielding
			[100] = 0.17, -- Strength in Numbers
			[105] = 0.71, -- Ephemeral Recovery
			[116] = 2.52, -- Boiling Brew
			[156] = 6.13, -- Ruinous Bolt
			[157] = 9.95, -- Rezan's Fury
			[186] = 0.07, -- Staggering Strikes
			[192] = 2.15, -- Meticulous Scheming
			[193] = 5.76, -- Blightborne Infusion
			[194] = 8.89, -- Filthy Transfusion
			[195] = 4.20, -- Secrets of the Deep
			[196] = 5.11, -- Swirling Sands
			[218] = 0.07, -- Strength of Spirit
			[383] = 2.46, -- Training of Niuzao
			[384] = 4.85, -- Elusive Footwork
			[459] = 1.65, -- Unstable Flames
			[461] = 1.74, -- Earthlink
			[462] = 3.09, -- Azerite Globules
			[463] = 0.39, -- Blessed Portents
			[478] = 9.82, -- Tidal Surge
			[479] = 8.00, -- Dagger in the Back
			[480] = 1.77, -- Blood Rite
			[481] = 4.34, -- Incite the Pack
			[482] = 8.29, -- Thunderous Blast
			[483] = 4.84, -- Archive of the Titans
			[485] = 8.61, -- Laser Matrix
			[492] = 3.15, -- Liberator's Might
			[493] = 0.09, -- Last Gift
			[494] = 10.00, -- Battlefield Precision
			[495] = 4.46, -- Anduin's Dedication
			[496] = 1.31, -- Stronger Together
			[497] = 1.22, -- Stand As One
			[498] = 6.37, -- Barrage Of Many Bombs
			[499] = 3.97, -- Ricocheting Inflatable Pyrosaw
			[500] = 5.66, -- Synaptic Spark Capacitor
			[501] = 3.82, -- Relational Normalization Gizmo
			[504] = 5.01, -- Unstable Catalyst
			[505] = 4.66, -- Tradewinds
			[521] = 0.14, -- Shadow of Elune
			[523] = 0.18, -- Apothecary's Concoctions
			[526] = 0.09, -- Endless Hunger
			[541] = 0.43, -- Fight or Flight
			[560] = 0.04, -- Bonded Souls
			[562] = 0.33, -- Treacherous Covenant
			[566] = 0.01, -- Exit Strategy
		})
		insertDefaultScalesData(defensiveName, 10, 1, {
			[15] = 8.07, -- Resounding Protection
			[18] = 1.62, -- Blood Siphon
			[21] = 0.02, -- Elemental Whirl
			[31] = 0.08, -- Gutripper
			[38] = 0.10, -- On My Way
			[82] = 0.33, -- Champion of Azeroth
			[87] = 0.02, -- Self Reliance
			[89] = 0.04, -- Azerite Veins
			[104] = 0.01, -- Bracing Chill
			[116] = 10.00, -- Boiling Brew
			[186] = 0.57, -- Staggering Strikes
			[193] = 0.43, -- Blightborne Infusion
			[195] = 0.35, -- Secrets of the Deep
			[196] = 0.41, -- Swirling Sands
			[383] = 0.21, -- Training of Niuzao
			[384] = 0.09, -- Elusive Footwork
			[459] = 0.20, -- Unstable Flames
			[461] = 0.04, -- Earthlink
			[481] = 0.20, -- Incite the Pack
			[483] = 0.41, -- Archive of the Titans
			[492] = 0.12, -- Liberator's Might
			[495] = 0.32, -- Anduin's Dedication
			[498] = 0.05, -- Barrage Of Many Bombs
			[504] = 0.33, -- Unstable Catalyst
			[505] = 0.32, -- Tradewinds
			[560] = 0.01, -- Bonded Souls
		})

		-- Mistweaver
		insertDefaultScalesData(defaultName, 10, 2, {

		})

		-- Windwalker
		insertDefaultScalesData(defaultName, 10, 3, {
			[13] = 0.56, -- Azerite Empowered
			[14] = 0.23, -- Longstrider
			[15] = 0.81, -- Resounding Protection
			[18] = 2.11, -- Blood Siphon
			[19] = 0.04, -- Woundbinder
			[20] = 2.63, -- Lifespeed
			[21] = 2.30, -- Elemental Whirl
			[22] = 3.72, -- Heed My Call
			[30] = 3.49, -- Overwhelming Power
			[31] = 3.99, -- Gutripper
			[38] = 2.39, -- On My Way
			[42] = 0.75, -- Savior
			[43] = 0.71, -- Winds of War
			[44] = 1.12, -- Vampiric Speed
			[82] = 6.57, -- Champion of Azeroth
			[83] = 0.55, -- Impassive Visage
			[84] = 0.83, -- Bulwark of the Masses
			[85] = 0.88, -- Gemhide
			[86] = 0.64, -- Azerite Fortification
			[87] = 0.45, -- Self Reliance
			[89] = 0.08, -- Azerite Veins
			[98] = 0.55, -- Crystalline Carapace
			[99] = 0.25, -- Ablative Shielding
			[100] = 0.72, -- Strength in Numbers
			[101] = 0.55, -- Shimmering Haven
			[103] = 0.17, -- Concentrated Mending
			[104] = 0.98, -- Bracing Chill
			[105] = 1.00, -- Ephemeral Recovery
			[156] = 4.98, -- Ruinous Bolt
			[157] = 6.64, -- Rezan's Fury
			[184] = 6.16, -- Sunrise Technique
			[192] = 4.36, -- Meticulous Scheming
			[193] = 6.07, -- Blightborne Infusion
			[194] = 5.68, -- Filthy Transfusion
			[195] = 4.91, -- Secrets of the Deep
			[196] = 5.33, -- Swirling Sands
			[218] = 0.33, -- Strength of Spirit
			[388] = 10.00, -- Glory of the Dawn
			[389] = 9.04, -- Open Palm Strikes
			[390] = 7.25, -- Pressure Point
			[459] = 2.24, -- Unstable Flames
			[461] = 2.92, -- Earthlink
			[462] = 2.79, -- Azerite Globules
			[463] = 0.57, -- Blessed Portents
			[470] = 0.66, -- Sweep the Leg
			[478] = 7.55, -- Tidal Surge
			[479] = 8.11, -- Dagger in the Back
			[480] = 3.98, -- Blood Rite
			[481] = 4.82, -- Incite the Pack
			[482] = 5.98, -- Thunderous Blast
			[483] = 5.18, -- Archive of the Titans
			[485] = 5.74, -- Laser Matrix
			[492] = 4.31, -- Liberator's Might
			[493] = 0.57, -- Last Gift
			[494] = 6.70, -- Battlefield Precision
			[495] = 5.03, -- Anduin's Dedication
			[496] = 1.16, -- Stronger Together
			[497] = 1.97, -- Stand As One
			[498] = 4.62, -- Barrage Of Many Bombs
			[499] = 3.24, -- Ricocheting Inflatable Pyrosaw
			[500] = 1.07, -- Synaptic Spark Capacitor
			[501] = 6.00, -- Relational Normalization Gizmo
			[502] = 0.82, -- Personal Absorb-o-Tron
			[503] = 0.72, -- Auto-Self-Cauterizer
			[504] = 5.70, -- Unstable Catalyst
			[505] = 4.68, -- Tradewinds
			[516] = 0.70, -- Dance of Chi-Ji
			[517] = 0.56, -- Fury of Xuen
			[521] = 0.32, -- Shadow of Elune
			[522] = 0.32, -- Ancients' Bulwark
			[523] = 0.81, -- Apothecary's Concoctions
			[526] = 0.83, -- Endless Hunger
			[541] = 0.84, -- Fight or Flight
			[560] = 0.70, -- Bonded Souls
			[561] = 0.23, -- Seductive Power
			[562] = 0.78, -- Treacherous Covenant
			[566] = 0.55, -- Exit Strategy
		})

	-- Druid
		-- Balance
		insertDefaultScalesData(defaultName, 11, 1, {
			[13] = 0.16, -- Azerite Empowered
			[18] = 2.86, -- Blood Siphon
			[19] = 0.05, -- Woundbinder
			[20] = 3.52, -- Lifespeed
			[21] = 3.46, -- Elemental Whirl
			[22] = 4.04, -- Heed My Call
			[30] = 5.68, -- Overwhelming Power
			[31] = 4.39, -- Gutripper
			[38] = 3.20, -- On My Way
			[44] = 0.40, -- Vampiric Speed
			[82] = 10.00, -- Champion of Azeroth
			[83] = 0.33, -- Impassive Visage
			[84] = 0.06, -- Bulwark of the Masses
			[85] = 0.47, -- Gemhide
			[86] = 0.57, -- Azerite Fortification
			[87] = 0.10, -- Self Reliance
			[89] = 0.20, -- Azerite Veins
			[99] = 0.06, -- Ablative Shielding
			[100] = 0.40, -- Strength in Numbers
			[101] = 0.41, -- Shimmering Haven
			[103] = 0.15, -- Concentrated Mending
			[104] = 0.07, -- Bracing Chill
			[105] = 0.83, -- Ephemeral Recovery
			[122] = 6.12, -- Streaking Stars
			[156] = 5.03, -- Ruinous Bolt
			[157] = 8.04, -- Rezan's Fury
			[173] = 5.61, -- Power of the Moon
			[192] = 7.23, -- Meticulous Scheming
			[193] = 8.16, -- Blightborne Infusion
			[194] = 7.45, -- Filthy Transfusion
			[195] = 6.79, -- Secrets of the Deep
			[196] = 7.29, -- Swirling Sands
			[219] = 0.81, -- Reawakening
			[250] = 7.40, -- Dawning Sun
			[356] = 3.80, -- High Noon
			[364] = 5.46, -- Lively Spirit
			[459] = 3.10, -- Unstable Flames
			[461] = 2.50, -- Earthlink
			[462] = 2.45, -- Azerite Globules
			[463] = 0.16, -- Blessed Portents
			[467] = 0.50, -- Ursoc's Endurance
			[478] = 8.01, -- Tidal Surge
			[479] = 9.33, -- Dagger in the Back
			[480] = 5.89, -- Blood Rite
			[481] = 7.07, -- Incite the Pack
			[482] = 7.63, -- Thunderous Blast
			[483] = 7.52, -- Archive of the Titans
			[485] = 7.57, -- Laser Matrix
			[492] = 5.08, -- Liberator's Might
			[493] = 0.15, -- Last Gift
			[494] = 8.19, -- Battlefield Precision
			[495] = 5.85, -- Anduin's Dedication
			[496] = 2.44, -- Stronger Together
			[497] = 2.08, -- Stand As One
			[498] = 5.62, -- Barrage Of Many Bombs
			[499] = 2.83, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.42, -- Synaptic Spark Capacitor
			[501] = 8.05, -- Relational Normalization Gizmo
			[502] = 0.88, -- Personal Absorb-o-Tron
			[504] = 7.42, -- Unstable Catalyst
			[505] = 7.65, -- Tradewinds
			[522] = 0.05, -- Ancients' Bulwark
			[523] = 0.63, -- Apothecary's Concoctions
			[529] = 0.07, -- Arcanic Pulsar
			[540] = 0.35, -- Switch Hitter
			[541] = 0.37, -- Fight or Flight
			[561] = 0.26, -- Seductive Power
			[562] = 0.17, -- Treacherous Covenant
		})

		-- Feral
		insertDefaultScalesData(defaultName, 11, 2, {
			[13] = 0.36, -- Azerite Empowered
			[14] = 0.43, -- Longstrider
			[15] = 0.33, -- Resounding Protection
			[18] = 2.08, -- Blood Siphon
			[20] = 1.79, -- Lifespeed
			[21] = 2.46, -- Elemental Whirl
			[22] = 3.05, -- Heed My Call
			[30] = 3.28, -- Overwhelming Power
			[31] = 3.67, -- Gutripper
			[38] = 2.15, -- On My Way
			[42] = 0.15, -- Savior
			[43] = 0.17, -- Winds of War
			[82] = 8.46, -- Champion of Azeroth
			[84] = 0.51, -- Bulwark of the Masses
			[86] = 0.07, -- Azerite Fortification
			[99] = 0.28, -- Ablative Shielding
			[101] = 0.04, -- Shimmering Haven
			[103] = 0.11, -- Concentrated Mending
			[105] = 0.47, -- Ephemeral Recovery
			[111] = 6.59, -- Blood Mist
			[156] = 4.31, -- Ruinous Bolt
			[157] = 7.12, -- Rezan's Fury
			[169] = 3.48, -- Untamed Ferocity
			[173] = 0.38, -- Power of the Moon
			[192] = 4.15, -- Meticulous Scheming
			[193] = 8.63, -- Blightborne Infusion
			[194] = 6.72, -- Filthy Transfusion
			[195] = 6.02, -- Secrets of the Deep
			[196] = 8.39, -- Swirling Sands
			[209] = 10.00, -- Jungle Fury
			[219] = 0.10, -- Reawakening
			[241] = 0.20, -- Twisted Claws
			[247] = 2.36, -- Iron Jaws
			[358] = 6.31, -- Gushing Lacerations
			[359] = 7.88, -- Wild Fleshrending
			[459] = 3.52, -- Unstable Flames
			[461] = 1.80, -- Earthlink
			[462] = 2.28, -- Azerite Globules
			[463] = 0.34, -- Blessed Portents
			[467] = 0.12, -- Ursoc's Endurance
			[478] = 7.88, -- Tidal Surge
			[479] = 9.06, -- Dagger in the Back
			[480] = 4.44, -- Blood Rite
			[481] = 5.86, -- Incite the Pack
			[482] = 6.54, -- Thunderous Blast
			[483] = 6.83, -- Archive of the Titans
			[485] = 6.30, -- Laser Matrix
			[492] = 4.66, -- Liberator's Might
			[494] = 7.64, -- Battlefield Precision
			[495] = 6.22, -- Anduin's Dedication
			[496] = 1.58, -- Stronger Together
			[497] = 1.77, -- Stand As One
			[498] = 4.71, -- Barrage Of Many Bombs
			[499] = 2.39, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.93, -- Synaptic Spark Capacitor
			[501] = 6.41, -- Relational Normalization Gizmo
			[504] = 7.01, -- Unstable Catalyst
			[505] = 6.51, -- Tradewinds
			[522] = 0.03, -- Ancients' Bulwark
			[523] = 0.26, -- Apothecary's Concoctions
			[526] = 0.11, -- Endless Hunger
		})

		-- Guardian
		insertDefaultScalesData(offensiveName, 11, 3, {
			[13] = 0.19, -- Azerite Empowered
			[14] = 0.02, -- Longstrider
			[18] = 1.88, -- Blood Siphon
			[19] = 0.35, -- Woundbinder
			[20] = 2.16, -- Lifespeed
			[21] = 2.47, -- Elemental Whirl
			[22] = 3.90, -- Heed My Call
			[30] = 3.28, -- Overwhelming Power
			[31] = 4.80, -- Gutripper
			[38] = 2.14, -- On My Way
			[42] = 0.27, -- Savior
			[82] = 6.70, -- Champion of Azeroth
			[84] = 0.20, -- Bulwark of the Masses
			[85] = 0.43, -- Gemhide
			[86] = 0.37, -- Azerite Fortification
			[89] = 0.21, -- Azerite Veins
			[98] = 0.03, -- Crystalline Carapace
			[101] = 0.19, -- Shimmering Haven
			[104] = 0.35, -- Bracing Chill
			[156] = 5.19, -- Ruinous Bolt
			[157] = 10.00, -- Rezan's Fury
			[192] = 4.80, -- Meticulous Scheming
			[193] = 6.19, -- Blightborne Infusion
			[194] = 8.60, -- Filthy Transfusion
			[195] = 4.91, -- Secrets of the Deep
			[196] = 5.86, -- Swirling Sands
			[219] = 0.03, -- Reawakening
			[241] = 6.30, -- Twisted Claws
			[251] = 4.92, -- Burst of Savagery
			[359] = 0.89, -- Wild Fleshrending
			[360] = 0.35, -- Gory Regeneration
			[361] = 4.65, -- Guardian's Wrath
			[459] = 2.37, -- Unstable Flames
			[461] = 1.70, -- Earthlink
			[462] = 2.95, -- Azerite Globules
			[463] = 0.12, -- Blessed Portents
			[467] = 0.71, -- Ursoc's Endurance
			[478] = 9.46, -- Tidal Surge
			[479] = 7.27, -- Dagger in the Back
			[480] = 4.43, -- Blood Rite
			[481] = 4.09, -- Incite the Pack
			[482] = 7.82, -- Thunderous Blast
			[483] = 5.03, -- Archive of the Titans
			[485] = 8.26, -- Laser Matrix
			[492] = 3.79, -- Liberator's Might
			[493] = 0.49, -- Last Gift
			[494] = 9.81, -- Battlefield Precision
			[495] = 5.18, -- Anduin's Dedication
			[496] = 1.52, -- Stronger Together
			[497] = 1.50, -- Stand As One
			[498] = 5.96, -- Barrage Of Many Bombs
			[499] = 3.62, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.93, -- Synaptic Spark Capacitor
			[501] = 5.34, -- Relational Normalization Gizmo
			[503] = 0.67, -- Auto-Self-Cauterizer
			[504] = 5.35, -- Unstable Catalyst
			[505] = 4.12, -- Tradewinds
			[521] = 0.25, -- Shadow of Elune
			[522] = 0.07, -- Ancients' Bulwark
			[523] = 0.19, -- Apothecary's Concoctions
			[526] = 0.36, -- Endless Hunger
			[540] = 0.33, -- Switch Hitter
			[541] = 0.22, -- Fight or Flight
		})
		-- Guardian
		insertDefaultScalesData(defensiveName, 11, 3, {
			[13] = 0.08, -- Azerite Empowered
			[14] = 0.04, -- Longstrider
			[18] = 10.00, -- Blood Siphon
			[19] = 0.20, -- Woundbinder
			[20] = 0.09, -- Lifespeed
			[21] = 0.04, -- Elemental Whirl
			[30] = 0.03, -- Overwhelming Power
			[31] = 0.16, -- Gutripper
			[42] = 0.09, -- Savior
			[43] = 0.05, -- Winds of War
			[44] = 0.07, -- Vampiric Speed
			[83] = 0.08, -- Impassive Visage
			[84] = 0.06, -- Bulwark of the Masses
			[87] = 0.06, -- Self Reliance
			[89] = 0.06, -- Azerite Veins
			[98] = 0.05, -- Crystalline Carapace
			[99] = 0.06, -- Ablative Shielding
			[101] = 0.12, -- Shimmering Haven
			[103] = 0.12, -- Concentrated Mending
			[104] = 0.18, -- Bracing Chill
			[112] = 0.03, -- Layered Mane
			[157] = 0.07, -- Rezan's Fury
			[192] = 0.10, -- Meticulous Scheming
			[194] = 0.09, -- Filthy Transfusion
			[195] = 0.18, -- Secrets of the Deep
			[196] = 0.08, -- Swirling Sands
			[219] = 0.05, -- Reawakening
			[359] = 0.08, -- Wild Fleshrending
			[360] = 0.04, -- Gory Regeneration
			[361] = 0.13, -- Guardian's Wrath
			[461] = 0.07, -- Earthlink
			[463] = 0.01, -- Blessed Portents
			[467] = 0.06, -- Ursoc's Endurance
			[479] = 0.05, -- Dagger in the Back
			[480] = 0.20, -- Blood Rite
			[482] = 0.16, -- Thunderous Blast
			[483] = 0.08, -- Archive of the Titans
			[485] = 0.08, -- Laser Matrix
			[492] = 0.13, -- Liberator's Might
			[493] = 0.06, -- Last Gift
			[494] = 0.02, -- Battlefield Precision
			[495] = 0.02, -- Anduin's Dedication
			[499] = 0.01, -- Ricocheting Inflatable Pyrosaw
			[502] = 0.10, -- Personal Absorb-o-Tron
			[503] = 0.08, -- Auto-Self-Cauterizer
			[522] = 0.14, -- Ancients' Bulwark
			[523] = 0.05, -- Apothecary's Concoctions
			[526] = 0.06, -- Endless Hunger
			[540] = 0.08, -- Switch Hitter
			[560] = 0.04, -- Bonded Souls
			[561] = 0.07, -- Seductive Power
			[562] = 0.06, -- Treacherous Covenant
		})

		-- Restoration
		insertDefaultScalesData(defaultName, 11, 4, {

		})

	-- Demon Hunter
		-- Havoc
		insertDefaultScalesData(defaultName, 12, 1, {
			[18] = 1.16, -- Blood Siphon
			[20] = 1.50, -- Lifespeed
			[21] = 1.41, -- Elemental Whirl
			[22] = 2.84, -- Heed My Call
			[30] = 3.28, -- Overwhelming Power
			[31] = 3.46, -- Gutripper
			[82] = 6.30, -- Champion of Azeroth
			[83] = 0.01, -- Impassive Visage
			[126] = 7.81, -- Revolving Blades
			[156] = 3.55, -- Ruinous Bolt
			[157] = 6.77, -- Rezan's Fury
			[159] = 6.71, -- Furious Gaze
			[192] = 3.96, -- Meticulous Scheming
			[193] = 5.82, -- Blightborne Infusion
			[194] = 5.74, -- Filthy Transfusion
			[195] = 5.02, -- Secrets of the Deep
			[196] = 5.23, -- Swirling Sands
			[245] = 6.66, -- Seething Power
			[352] = 10.00, -- Thirsting Blades
			[353] = 2.86, -- Eyes of Rage
			[459] = 1.95, -- Unstable Flames
			[461] = 1.63, -- Earthlink
			[462] = 1.56, -- Azerite Globules
			[478] = 6.66, -- Tidal Surge
			[479] = 7.68, -- Dagger in the Back
			[480] = 2.69, -- Blood Rite
			[481] = 2.93, -- Incite the Pack
			[482] = 5.65, -- Thunderous Blast
			[483] = 6.25, -- Archive of the Titans
			[485] = 5.97, -- Laser Matrix
			[492] = 3.31, -- Liberator's Might
			[494] = 6.63, -- Battlefield Precision
			[495] = 5.11, -- Anduin's Dedication
			[496] = 1.24, -- Stronger Together
			[497] = 1.25, -- Stand As One
			[498] = 4.06, -- Barrage Of Many Bombs
			[499] = 2.36, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.32, -- Synaptic Spark Capacitor
			[501] = 5.07, -- Relational Normalization Gizmo
			[502] = 0.29, -- Personal Absorb-o-Tron
			[504] = 6.13, -- Unstable Catalyst
			[505] = 3.59, -- Tradewinds
		})

		-- Vengeance
		insertDefaultScalesData(offensiveName, 12, 2, {
			[14] = 0.01, -- Longstrider
			[15] = 0.12, -- Resounding Protection
			[18] = 1.93, -- Blood Siphon
			[20] = 1.52, -- Lifespeed
			[21] = 2.40, -- Elemental Whirl
			[22] = 4.43, -- Heed My Call
			[30] = 3.25, -- Overwhelming Power
			[31] = 5.10, -- Gutripper
			[82] = 6.20, -- Champion of Azeroth
			[83] = 0.02, -- Impassive Visage
			[84] = 0.44, -- Bulwark of the Masses
			[86] = 0.31, -- Azerite Fortification
			[89] = 0.44, -- Azerite Veins
			[98] = 0.20, -- Crystalline Carapace
			[99] = 0.03, -- Ablative Shielding
			[100] = 0.79, -- Strength in Numbers
			[101] = 0.19, -- Shimmering Haven
			[134] = 0.25, -- Revel in Pain
			[156] = 6.29, -- Ruinous Bolt
			[157] = 9.86, -- Rezan's Fury
			[192] = 4.57, -- Meticulous Scheming
			[193] = 6.89, -- Blightborne Infusion
			[194] = 8.60, -- Filthy Transfusion
			[195] = 5.17, -- Secrets of the Deep
			[196] = 6.10, -- Swirling Sands
			[221] = 0.40, -- Rigid Carapace
			[354] = 0.07, -- Cycle of Binding
			[355] = 0.01, -- Essence Sever
			[459] = 2.47, -- Unstable Flames
			[461] = 1.31, -- Earthlink
			[462] = 2.80, -- Azerite Globules
			[478] = 10.00, -- Tidal Surge
			[479] = 7.54, -- Dagger in the Back
			[480] = 4.12, -- Blood Rite
			[481] = 3.76, -- Incite the Pack
			[482] = 7.70, -- Thunderous Blast
			[483] = 5.25, -- Archive of the Titans
			[485] = 8.52, -- Laser Matrix
			[492] = 4.08, -- Liberator's Might
			[493] = 0.43, -- Last Gift
			[494] = 9.80, -- Battlefield Precision
			[495] = 4.63, -- Anduin's Dedication
			[496] = 1.24, -- Stronger Together
			[497] = 1.64, -- Stand As One
			[498] = 6.33, -- Barrage Of Many Bombs
			[499] = 3.55, -- Ricocheting Inflatable Pyrosaw
			[500] = 7.43, -- Synaptic Spark Capacitor
			[501] = 5.00, -- Relational Normalization Gizmo
			[502] = 0.11, -- Personal Absorb-o-Tron
			[503] = 0.24, -- Auto-Self-Cauterizer
			[504] = 5.66, -- Unstable Catalyst
			[505] = 4.50, -- Tradewinds
			[522] = 0.18, -- Ancients' Bulwark
			[523] = 0.07, -- Apothecary's Concoctions
			[541] = 0.56, -- Fight or Flight
			[558] = 0.33, -- Hour of Reaping
			[560] = 0.43, -- Bonded Souls
			[561] = 0.47, -- Seductive Power
			[562] = 0.43, -- Treacherous Covenant
			[564] = 0.60, -- Thrive in Chaos
		})
		insertDefaultScalesData(defensiveName, 12, 2, {
			[13] = 0.14, -- Azerite Empowered
			[15] = 10.00, -- Resounding Protection
			[18] = 2.58, -- Blood Siphon
			[20] = 1.17, -- Lifespeed
			[21] = 0.82, -- Elemental Whirl
			[30] = 2.04, -- Overwhelming Power
			[43] = 0.17, -- Winds of War
			[82] = 2.46, -- Champion of Azeroth
			[83] = 0.01, -- Impassive Visage
			[85] = 0.17, -- Gemhide
			[86] = 0.05, -- Azerite Fortification
			[99] = 0.02, -- Ablative Shielding
			[100] = 0.22, -- Strength in Numbers
			[101] = 0.09, -- Shimmering Haven
			[157] = 0.09, -- Rezan's Fury
			[192] = 2.97, -- Meticulous Scheming
			[193] = 1.61, -- Blightborne Infusion
			[195] = 1.36, -- Secrets of the Deep
			[196] = 1.18, -- Swirling Sands
			[459] = 0.47, -- Unstable Flames
			[461] = 0.46, -- Earthlink
			[462] = 0.31, -- Azerite Globules
			[479] = 0.05, -- Dagger in the Back
			[480] = 2.21, -- Blood Rite
			[481] = 1.26, -- Incite the Pack
			[482] = 0.02, -- Thunderous Blast
			[483] = 1.65, -- Archive of the Titans
			[485] = 0.07, -- Laser Matrix
			[492] = 1.76, -- Liberator's Might
			[495] = 1.41, -- Anduin's Dedication
			[496] = 0.42, -- Stronger Together
			[497] = 0.28, -- Stand As One
			[501] = 2.07, -- Relational Normalization Gizmo
			[502] = 0.06, -- Personal Absorb-o-Tron
			[504] = 1.52, -- Unstable Catalyst
			[505] = 1.17, -- Tradewinds
			[521] = 0.05, -- Shadow of Elune
			[526] = 0.01, -- Endless Hunger
			[541] = 0.14, -- Fight or Flight
		})
end

local tankSpecs = {
	[1] = 3, -- Protection Warrior
	[2] = 2, -- Protection Paladin
	[6] = 1, -- Blood Death Knight
	[10] = 1, -- Brewmaster Monk
	[11] = 3, -- Guardian Druid
	[12] = 2 -- Vengeance Demon Hunter
}

-- Default ScaleSets for Class and Spec Combinations
local function GetDefaultScaleSet(classID, specNum)
	if (classID) and (specNum) then
		if tankSpecs[classID] == specNum then -- Tank Case
			return "D/"..classID.."/"..specNum.."/"..defensiveName
		else -- Generic Case
			return "D/"..classID.."/"..specNum.."/"..defaultName
		end
	end
end

n.GetDefaultScaleSet = GetDefaultScaleSet

--#EOF