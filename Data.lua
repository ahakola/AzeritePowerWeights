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

-- 8.3 Powers for every Class and Spec
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
					["spellID"] = 275388,
					["icon"] = 237443,
					["name"] = "Lightning Conduit",
					["azeritePowerID"] = 223,
				}, -- [4]
				{
					["spellID"] = 278697,
					["icon"] = 136028,
					["name"] = "Natural Harmony",
					["azeritePowerID"] = 416,
				}, -- [5]
				{
					["spellID"] = 278719,
					["icon"] = 132314,
					["name"] = "Roiling Storm",
					["azeritePowerID"] = 420,
				}, -- [6]
				{
					["spellID"] = 277666,
					["icon"] = 451167,
					["name"] = "Ancestral Resonance",
					["azeritePowerID"] = 447,
				}, -- [7]
				{
					["spellID"] = 277671,
					["icon"] = 136048,
					["name"] = "Synapse Shock",
					["azeritePowerID"] = 448,
				}, -- [8]
				{
					["spellID"] = 287768,
					["icon"] = 136046,
					["name"] = "Thunderaan's Fury",
					["azeritePowerID"] = 530,
				}, -- [9]
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
					["spellID"] = 275488,
					["icon"] = 135127,
					["name"] = "Swelling Stream",
					["azeritePowerID"] = 224,
				}, -- [7]
				{
					["spellID"] = 278697,
					["icon"] = 136028,
					["name"] = "Natural Harmony",
					["azeritePowerID"] = 416,
				}, -- [8]
				{
					["spellID"] = 278713,
					["icon"] = 252995,
					["name"] = "Surging Tides",
					["azeritePowerID"] = 422,
				}, -- [9]
				{
					["spellID"] = 278715,
					["icon"] = 237586,
					["name"] = "Spouting Spirits",
					["azeritePowerID"] = 423,
				}, -- [10]
				{
					["spellID"] = 277666,
					["icon"] = 451167,
					["name"] = "Ancestral Resonance",
					["azeritePowerID"] = 447,
				}, -- [11]
				{
					["spellID"] = 277671,
					["icon"] = 136048,
					["name"] = "Synapse Shock",
					["azeritePowerID"] = 448,
				}, -- [12]
				{
					["spellID"] = 277658,
					["icon"] = 136037,
					["name"] = "Overflowing Shores",
					["azeritePowerID"] = 449,
				}, -- [13]
				{
					["spellID"] = 279829,
					["icon"] = 451169,
					["name"] = "Igneous Potential",
					["azeritePowerID"] = 457,
				}, -- [14]
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
					["spellID"] = 275381,
					["icon"] = 135790,
					["name"] = "Echo of the Elementals",
					["azeritePowerID"] = 222,
				}, -- [5]
				{
					["spellID"] = 278697,
					["icon"] = 136028,
					["name"] = "Natural Harmony",
					["azeritePowerID"] = 416,
				}, -- [6]
				{
					["spellID"] = 286949,
					["icon"] = 136025,
					["name"] = "Tectonic Thunder",
					["azeritePowerID"] = 417,
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
					["spellID"] = 279829,
					["icon"] = 451169,
					["name"] = "Igneous Potential",
					["azeritePowerID"] = 457,
				}, -- [10]
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
		{
			{
				["spellID"] = 274412,
				["icon"] = 538565,
				["name"] = "Serene Spirit",
				["azeritePowerID"] = 207,
			}, -- [1]
			{
				["spellID"] = 280021,
				["icon"] = 136095,
				["name"] = "Pack Spirit",
				["azeritePowerID"] = 474,
			}, -- [2]
			{
				["spellID"] = 287774,
				["icon"] = 133439,
				["name"] = "Ancient Ankh Talisman",
				["azeritePowerID"] = 539,
			}, -- [3]
		}, -- [7]
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
			{
				["spellID"] = 317137,
				["icon"] = 839910,
				["name"] = "Heart of Darkness",
				["azeritePowerID"] = 582,
			}, -- [7]
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
		{
			["spellID"] = 303008,
			["icon"] = 1698701,
			["name"] = "Undulating Tides",
			["azeritePowerID"] = 575,
		}, -- [6]
		{
			["spellID"] = 303007,
			["icon"] = 136159,
			["name"] = "Loyal to the End",
			["azeritePowerID"] = 576,
		}, -- [7]
		{
			["spellID"] = 303006,
			["icon"] = 1391778,
			["name"] = "Arcane Heart",
			["azeritePowerID"] = 577,
		}, -- [8]
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
		{
			["spellID"] = 300168,
			["icon"] = 2115322,
			["name"] = "Person-Computer Interface",
			["azeritePowerID"] = 568,
		}, -- [20]
		{
			["spellID"] = 300170,
			["icon"] = 134377,
			["name"] = "Clockwork Heart",
			["azeritePowerID"] = 569,
		}, -- [21]
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
	}
}
n.sourceData = sourceData
-- 8.3 Azerite Essences
local essenceData = {
	["common"] = {
		{
			["essenceID"] = 4,
			["name"] = "Worldvein Resonance",
			["icon"] = 1830317,
		}, -- [1]
		{
			["essenceID"] = 12,
			["name"] = "The Crucible of Flame",
			["icon"] = 3015740,
		}, -- [2]
		{
			["essenceID"] = 15,
			["name"] = "Ripple in Space",
			["icon"] = 2967109,
		}, -- [3]
		{
			["essenceID"] = 22,
			["name"] = "Vision of Perfection",
			["icon"] = 3015743,
		}, -- [4]
		{
			["essenceID"] = 27,
			["name"] = "Memory of Lucid Dreams",
			["icon"] = 2967104,
		}, -- [5]
		{
			["essenceID"] = 32,
			["name"] = "Conflict and Strife",
			["icon"] = 3015742,
		}, -- [6]
		{
			["essenceID"] = 37,
			["name"] = "The Formless Void",
			["icon"] = 3193845,
		}, -- [7]
	},
	["tank"] = {
		{
			["essenceID"] = 2,
			["name"] = "Azeroth's Undying Gift",
			["icon"] = 2967107,
		}, -- [1]
		{
			["essenceID"] = 3,
			["name"] = "Sphere of Suppression",
			["icon"] = 2065602,
		}, -- [2]
		{
			["essenceID"] = 7,
			["name"] = "Anima of Life and Death",
			["icon"] = 2967105,
		}, -- [3]
		{
			["essenceID"] = 13,
			["name"] = "Nullification Dynamo",
			["icon"] = 3015741,
		}, -- [4]
		{
			["essenceID"] = 25,
			["name"] = "Aegis of the Deep",
			["icon"] = 2967110,
		}, -- [5]
		{
			["essenceID"] = 33,
			["name"] = "Touch of the Everlasting",
			["icon"] = 3193847,
		}, -- [6]
		{
			["essenceID"] = 34,
			["name"] = "Strength of the Warden",
			["icon"] = 3193846,
		}, -- [7]
	},
	["healer"] = {
		{
			["essenceID"] = 16,
			["name"] = "Unwavering Ward",
			["icon"] = 3193842,
		}, -- [1]
		{
			["essenceID"] = 17,
			["name"] = "The Ever-Rising Tide",
			["icon"] = 2967108,
		}, -- [2]
		{
			["essenceID"] = 18,
			["name"] = "Artifice of Time",
			["icon"] = 2967112,
		}, -- [3]
		{
			["essenceID"] = 19,
			["name"] = "The Well of Existence",
			["icon"] = 516796,
		}, -- [4]
		{
			["essenceID"] = 20,
			["name"] = "Life-Binder's Invocation",
			["icon"] = 2967106,
		}, -- [5]
		{
			["essenceID"] = 21,
			["name"] = "Vitality Conduit",
			["icon"] = 2967100,
		}, -- [6]
		{
			["essenceID"] = 24,
			["name"] = "Spirit of Preservation",
			["icon"] = 2967101,
		}, -- [7]
	},
	["damager"] = {
		{
			["essenceID"] = 5,
			["name"] = "Essence of the Focusing Iris",
			["icon"] = 2967111,
		}, -- [1]
		{
			["essenceID"] = 6,
			["name"] = "Purification Protocol",
			["icon"] = 2967103,
		}, -- [2]
		{
			["essenceID"] = 14,
			["name"] = "Condensed Life-Force",
			["icon"] = 2967113,
		}, -- [3]
		{
			["essenceID"] = 23,
			["name"] = "Blood of the Enemy",
			["icon"] = 2032580,
		}, -- [4]
		{
			["essenceID"] = 28,
			["name"] = "The Unbound Force",
			["icon"] = 2967102,
		}, -- [5]
		{
			["essenceID"] = 35,
			["name"] = "Breath of the Dying",
			["icon"] = 3193844,
		}, -- [6]
		{
			["essenceID"] = 36,
			["name"] = "Spark of Inspiration",
			["icon"] = 3193843,
		}, -- [7]
	}
}
n.essenceData = essenceData

-- Default Scales Data
--[[
local defaultName = L.DefaultScaleName_Default
local defensiveName = L.DefaultScaleName_Defensive
local offensiveName = L.DefaultScaleName_Offensive
local defaultNameTable = {
	--[defaultName] = true,
	[defensiveName] = true,
	[offensiveName] = true
}
]]
local defaultName = "Default"
local defensiveName = "Defensive"
local offensiveName = "Offensive"
local defaultNameTable = {
	[defaultName] = L.DefaultScaleName_Default,
	[defensiveName] = L.DefaultScaleName_Defensive,
	[offensiveName] = L.DefaultScaleName_Offensive
}
n.defaultNameTable = defaultNameTable
local defaultScalesData = {}
n.defaultScalesData = defaultScalesData

local function insertDefaultScalesData(scaleName, classIndex, specNum, powerScales, essenceScales, timestamp)
	defaultScalesData[#defaultScalesData + 1] = {
		scaleName,
		classIndex,
		specNum,
		powerScales,
		essenceScales,
		timestamp
	}
end

do
		insertDefaultScalesData(defaultName, 12, 1, { -- Havoc Demon Hunter
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 18454 - 20792 (avg 19627), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 01.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[499] = 1.62, -- Ricocheting Inflatable Pyrosaw
			[496] = 1.66, -- Stronger Together
			[44] = 0.2, -- Vampiric Speed
			[30] = 3.45, -- Overwhelming Power
			[480] = 4.74, -- Blood Rite
			[157] = 4.19, -- Rezan's Fury
			[193] = 6.18, -- Blightborne Infusion
			[192] = 3.56, -- Meticulous Scheming
			[482] = 3.52, -- Thunderous Blast
			[483] = 3.37, -- Archive of the Titans
			[504] = 3.54, -- Unstable Catalyst
			[86] = 0.08, -- Azerite Fortification
			[126] = 4.16, -- Revolving Blades
			[220] = 3.82, -- Chaotic Transformation
			[31] = 2.1, -- Gutripper
			[569] = 4.66, -- Clockwork Heart
			[352] = 4.89, -- Thirsting Blades
			[497] = 0.8, -- Stand As One
			[105] = 0.2, -- Ephemeral Recovery
			[561] = 2.93, -- Seductive Power
			[22] = 1.87, -- Heed My Call
			[194] = 3.24, -- Filthy Transfusion
			[502] = 0.32, -- Personal Absorb-o-Tron
			[495] = 3.3, -- Anduin's Dedication
			[479] = 4.33, -- Dagger in the Back
			[575] = 6.32, -- Undulating Tides
			[245] = 3.45, -- Seething Power
			[541] = 1.37, -- Fight or Flight
			[577] = 3.56, -- Arcane Heart
			[562] = 4.88, -- Treacherous Covenant
			[568] = 0.18, -- Person-Computer Interface
			[564] = 0.24, -- Thrive in Chaos
			[459] = 2.01, -- Unstable Flames
			[522] = 6.23, -- Ancients' Bulwark
			[523] = 3.42, -- Apothecary's Concoctions
			[500] = 2.19, -- Synaptic Spark Capacitor
			[18] = 1.18, -- Blood Siphon
			[21] = 1.99, -- Elemental Whirl
			[526] = 6.03, -- Endless Hunger
			[195] = 3.06, -- Secrets of the Deep
			[85] = 0.02, -- Gemhide
			[461] = 1.11, -- Earthlink
			[83] = 0.09, -- Impassive Visage
			[353] = 5.92, -- Eyes of Rage
			[501] = 4.85, -- Relational Normalization Gizmo
			[492] = 4.06, -- Liberator's Might
			[103] = 0.06, -- Concentrated Mending
			[478] = 3.83, -- Tidal Surge
			[82] = 5.76, -- Champion of Azeroth
			[14] = 0.1, -- Longstrider
			[582] = 5.55, -- Heart of Darkness
			[481] = 2.78, -- Incite the Pack
			[13] = 0.33, -- Azerite Empowered
			[20] = 2.36, -- Lifespeed
			[19] = 0.24, -- Woundbinder
			[560] = 2.49, -- Bonded Souls
			[42] = 0.03, -- Savior
			[15] = 0.08, -- Resounding Protection
			[466] = 0.17, -- Burning Soul
			[505] = 2.94, -- Tradewinds
			[494] = 4.19, -- Battlefield Precision
			[493] = 1.74, -- Last Gift
			[521] = 4.6, -- Shadow of Elune
			[43] = 0.13, -- Winds of War
			[498] = 2.63, -- Barrage Of Many Bombs
			[462] = 1.13, -- Azerite Globules
			[196] = 5.4, -- Swirling Sands
			[87] = 0.13, -- Self Reliance
			[100] = 0.2, -- Strength in Numbers
			[101] = 0.1, -- Shimmering Haven
			[38] = 1.82, -- On My Way
			[576] = 1.99, -- Loyal to the End
			[156] = 2.3, -- Ruinous Bolt
			[159] = 10, -- Furious Gaze
			[84] = 0.15, -- Bulwark of the Masses
			[485] = 3.7, -- Laser Matrix
		}, { -- Azerite Essences
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 17739 - 20491 (avg 19329), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 01.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[4] = { 4.66, 1.06 }, -- Worldvein Resonance
			[35] = { 10, 5.63 }, -- Breath of the Dying
			[32] = { 0, 2.94 }, -- Conflict and Strife
			[27] = { 2.99, 1.75 }, -- Memory of Lucid Dreams
			[15] = { 3.66, 0.26 }, -- Ripple in Space
			[5] = { 9.27, 5.06 }, -- Essence of the Focusing Iris
			[22] = { 6.94, 0.46 }, -- Vision of Perfection
			[12] = { 6.46, 2.49 }, -- The Crucible of Flame
			[14] = { 7.7, 3.19 }, -- Condensed Life-Force
			[37] = { 3.07, 2.96 }, -- The Formless Void
			[36] = { 1.39, 1.43 }, -- Spark of Inspiration
			[23] = { 7.02, 3.46 }, -- Blood of the Enemy
			[6] = { 5.94, 2.69 }, -- Purification Protocol
			[28] = { 5.56, 2.19 }, -- The Unbound Force
		}, 1580551200)

		insertDefaultScalesData(offensiveName, 12, 2, { -- Vengeance Demon Hunter
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 1999 - 3412 (avg 2388), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[501] = 4.79, -- Relational Normalization Gizmo
			[493] = 1.81, -- Last Gift
			[561] = 3.82, -- Seductive Power
			[494] = 7.63, -- Battlefield Precision
			[497] = 1.16, -- Stand As One
			[569] = 5.42, -- Clockwork Heart
			[482] = 5.69, -- Thunderous Blast
			[521] = 3.6, -- Shadow of Elune
			[246] = 0.06, -- Hour of Reaping
			[87] = 0.1, -- Self Reliance
			[21] = 2.06, -- Elemental Whirl
			[576] = 2.44, -- Loyal to the End
			[481] = 3.26, -- Incite the Pack
			[18] = 1.33, -- Blood Siphon
			[82] = 6.25, -- Champion of Azeroth
			[83] = 0.24, -- Impassive Visage
			[505] = 3.56, -- Tradewinds
			[504] = 3.9, -- Unstable Catalyst
			[355] = 0.12, -- Essence Sever
			[22] = 2.63, -- Heed My Call
			[502] = 0.17, -- Personal Absorb-o-Tron
			[85] = 0.17, -- Gemhide
			[480] = 3.63, -- Blood Rite
			[495] = 3.36, -- Anduin's Dedication
			[202] = 0.03, -- Soulmonger
			[195] = 3.35, -- Secrets of the Deep
			[196] = 7.19, -- Swirling Sands
			[459] = 2.78, -- Unstable Flames
			[157] = 6.17, -- Rezan's Fury
			[582] = 0.22, -- Heart of Darkness
			[466] = 0.01, -- Burning Soul
			[101] = 0.08, -- Shimmering Haven
			[86] = 0.1, -- Azerite Fortification
			[156] = 4.25, -- Ruinous Bolt
			[498] = 3.93, -- Barrage Of Many Bombs
			[31] = 3.16, -- Gutripper
			[503] = 0.08, -- Auto-Self-Cauterizer
			[15] = 0.03, -- Resounding Protection
			[462] = 1.91, -- Azerite Globules
			[84] = 0.19, -- Bulwark of the Masses
			[523] = 5.04, -- Apothecary's Concoctions
			[42] = 0.06, -- Savior
			[30] = 2.71, -- Overwhelming Power
			[194] = 5.44, -- Filthy Transfusion
			[541] = 1.29, -- Fight or Flight
			[575] = 10, -- Undulating Tides
			[160] = 0.16, -- Infernal Armor
			[479] = 4.49, -- Dagger in the Back
			[89] = 0.16, -- Azerite Veins
			[500] = 3.36, -- Synaptic Spark Capacitor
			[193] = 8.03, -- Blightborne Infusion
			[105] = 0.15, -- Ephemeral Recovery
			[492] = 4.41, -- Liberator's Might
			[461] = 1.37, -- Earthlink
			[99] = 0.01, -- Ablative Shielding
			[526] = 6.56, -- Endless Hunger
			[483] = 3.75, -- Archive of the Titans
			[20] = 2.07, -- Lifespeed
			[104] = 0.13, -- Bracing Chill
			[43] = 0.2, -- Winds of War
			[522] = 6.86, -- Ancients' Bulwark
			[485] = 5.31, -- Laser Matrix
			[44] = 0.04, -- Vampiric Speed
			[463] = 0.1, -- Blessed Portents
			[496] = 1.71, -- Stronger Together
			[38] = 1.87, -- On My Way
			[14] = 0.22, -- Longstrider
			[134] = 0.1, -- Revel in Pain
			[562] = 5.46, -- Treacherous Covenant
			[192] = 4.9, -- Meticulous Scheming
			[577] = 1.98, -- Arcane Heart
			[499] = 2.35, -- Ricocheting Inflatable Pyrosaw
			[560] = 1.86, -- Bonded Souls
			[478] = 6.26, -- Tidal Surge
		}, { -- Azerite Essences
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 2100 - 2531 (avg 2312), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[3] = { 4.21, 4.2 }, -- Sphere of Suppression
			[32] = { 2.16, 2.13 }, -- Conflict and Strife
			[7] = { 5.74, 1.95 }, -- Anima of Life and Death
			[33] = { 0, 0.14 }, -- Touch of the Everlasting
			[13] = { 0, 0.04 }, -- Nullification Dynamo
			[27] = { 1.62, 1.42 }, -- Memory of Lucid Dreams
			[12] = { 10, 3.07 }, -- The Crucible of Flame
			[25] = { 1.05, 1.09 }, -- Aegis of the Deep
			[4] = { 4.11, 0.92 }, -- Worldvein Resonance
			[15] = { 4.22, 0 }, -- Ripple in Space
			[22] = { 3.05, 1.12 }, -- Vision of Perfection
			[37] = { 2.51, 2.64 }, -- The Formless Void
			[34] = { 0.06, 0.04 }, -- Strength of the Warden
		}, 1580637600)

		insertDefaultScalesData(offensiveName, 6, 1, { -- Blood Death Knight
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 3993 - 4809 (avg 4246), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[485] = 5.12, -- Laser Matrix
			[14] = 0.03, -- Longstrider
			[483] = 3.15, -- Archive of the Titans
			[569] = 6.22, -- Clockwork Heart
			[13] = 0.28, -- Azerite Empowered
			[541] = 0.85, -- Fight or Flight
			[495] = 2.83, -- Anduin's Dedication
			[501] = 4.71, -- Relational Normalization Gizmo
			[243] = 3.81, -- Bloody Runeblade
			[193] = 8.88, -- Blightborne Infusion
			[192] = 4.84, -- Meticulous Scheming
			[156] = 4.03, -- Ruinous Bolt
			[575] = 10, -- Undulating Tides
			[31] = 3.41, -- Gutripper
			[505] = 3.13, -- Tradewinds
			[576] = 1.91, -- Loyal to the End
			[479] = 4.78, -- Dagger in the Back
			[500] = 2.76, -- Synaptic Spark Capacitor
			[194] = 5.2, -- Filthy Transfusion
			[82] = 6.69, -- Champion of Azeroth
			[462] = 2.05, -- Azerite Globules
			[526] = 9.24, -- Endless Hunger
			[492] = 4.48, -- Liberator's Might
			[195] = 3.03, -- Secrets of the Deep
			[196] = 7.92, -- Swirling Sands
			[201] = 0.15, -- Runic Barrier
			[20] = 1.93, -- Lifespeed
			[561] = 4.52, -- Seductive Power
			[496] = 1.73, -- Stronger Together
			[562] = 4.55, -- Treacherous Covenant
			[494] = 7.63, -- Battlefield Precision
			[499] = 2.28, -- Ricocheting Inflatable Pyrosaw
			[502] = 0.26, -- Personal Absorb-o-Tron
			[18] = 1.24, -- Blood Siphon
			[493] = 1.67, -- Last Gift
			[481] = 3.19, -- Incite the Pack
			[157] = 6.08, -- Rezan's Fury
			[21] = 2.57, -- Elemental Whirl
			[106] = 1.48, -- Deep Cuts
			[480] = 3.99, -- Blood Rite
			[30] = 2.95, -- Overwhelming Power
			[577] = 2.27, -- Arcane Heart
			[348] = 3.07, -- Eternal Rune Weapon
			[498] = 3.73, -- Barrage Of Many Bombs
			[582] = 6.75, -- Heart of Darkness
			[560] = 1.81, -- Bonded Souls
			[461] = 1, -- Earthlink
			[459] = 3.46, -- Unstable Flames
			[103] = 0.1, -- Concentrated Mending
			[22] = 2.66, -- Heed My Call
			[349] = 0.31, -- Bones of the Damned
			[44] = 0.01, -- Vampiric Speed
			[140] = 0.63, -- Bone Spike Graveyard
			[38] = 2.67, -- On My Way
			[478] = 5.75, -- Tidal Surge
			[98] = 0.13, -- Crystalline Carapace
			[523] = 5.27, -- Apothecary's Concoctions
			[86] = 0.26, -- Azerite Fortification
			[19] = 0.14, -- Woundbinder
			[85] = 0.02, -- Gemhide
			[42] = 0.09, -- Savior
			[522] = 9.07, -- Ancients' Bulwark
			[482] = 5.35, -- Thunderous Blast
			[521] = 3.81, -- Shadow of Elune
			[87] = 0.02, -- Self Reliance
			[504] = 3.36, -- Unstable Catalyst
			[497] = 0.93, -- Stand As One
			[503] = 0.12, -- Auto-Self-Cauterizer
			[549] = 0.04, -- Cold Hearted
		}, { -- Azerite Essences
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 3680 - 4423 (avg 4205), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[22] = { 0.78, 0.04 }, -- Vision of Perfection
			[27] = { 3.88, 2.7 }, -- Memory of Lucid Dreams
			[3] = { 4.25, 4.14 }, -- Sphere of Suppression
			[13] = { 0.1, 0.06 }, -- Nullification Dynamo
			[15] = { 3.84, 0.11 }, -- Ripple in Space
			[32] = { 3.05, 3.07 }, -- Conflict and Strife
			[7] = { 6.82, 4.07 }, -- Anima of Life and Death
			[25] = { 1.45, 1.4 }, -- Aegis of the Deep
			[33] = { 0.17, 0.06 }, -- Touch of the Everlasting
			[37] = { 2.29, 2.46 }, -- The Formless Void
			[4] = { 3.68, 0.59 }, -- Worldvein Resonance
			[2] = { 0.14, 0 }, -- Azeroth's Undying Gift
			[12] = { 10, 3.37 }, -- The Crucible of Flame
			[34] = { 0, 0.09 }, -- Strength of the Warden
		}, 1580637600)

		insertDefaultScalesData(defaultName, 6, 2, { -- Frost Death Knight
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 16158 - 18053 (avg 16983), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[192] = 5.62, -- Meticulous Scheming
			[30] = 4.15, -- Overwhelming Power
			[492] = 5.38, -- Liberator's Might
			[346] = 4.08, -- Killer Frost
			[561] = 4.31, -- Seductive Power
			[98] = 0.11, -- Crystalline Carapace
			[500] = 2.35, -- Synaptic Spark Capacitor
			[521] = 5.42, -- Shadow of Elune
			[198] = 3.58, -- Frostwhelp's Indignation
			[462] = 1.43, -- Azerite Globules
			[576] = 3.91, -- Loyal to the End
			[562] = 7.69, -- Treacherous Covenant
			[84] = 0.02, -- Bulwark of the Masses
			[31] = 2.26, -- Gutripper
			[82] = 8.98, -- Champion of Azeroth
			[582] = 8.09, -- Heart of Darkness
			[522] = 10, -- Ancients' Bulwark
			[347] = 5.09, -- Frozen Tempest
			[560] = 2.73, -- Bonded Souls
			[193] = 8.39, -- Blightborne Infusion
			[104] = 0.02, -- Bracing Chill
			[481] = 5.62, -- Incite the Pack
			[157] = 5.09, -- Rezan's Fury
			[494] = 4.68, -- Battlefield Precision
			[575] = 7.8, -- Undulating Tides
			[505] = 6.22, -- Tradewinds
			[141] = 4.64, -- Latent Chill
			[22] = 2, -- Heed My Call
			[459] = 3.07, -- Unstable Flames
			[483] = 5.49, -- Archive of the Titans
			[497] = 1.24, -- Stand As One
			[496] = 2.12, -- Stronger Together
			[498] = 2.79, -- Barrage Of Many Bombs
			[242] = 4.05, -- Echoing Howl
			[541] = 1.77, -- Fight or Flight
			[501] = 6.6, -- Relational Normalization Gizmo
			[480] = 5.37, -- Blood Rite
			[493] = 3.2, -- Last Gift
			[461] = 1.35, -- Earthlink
			[478] = 4.38, -- Tidal Surge
			[482] = 4.15, -- Thunderous Blast
			[194] = 3.81, -- Filthy Transfusion
			[485] = 4.12, -- Laser Matrix
			[569] = 5.49, -- Clockwork Heart
			[156] = 2.75, -- Ruinous Bolt
			[577] = 5.67, -- Arcane Heart
			[20] = 2.51, -- Lifespeed
			[504] = 5.74, -- Unstable Catalyst
			[499] = 1.83, -- Ricocheting Inflatable Pyrosaw
			[526] = 9.96, -- Endless Hunger
			[523] = 3.79, -- Apothecary's Concoctions
			[196] = 7.98, -- Swirling Sands
			[18] = 2.26, -- Blood Siphon
			[21] = 2.98, -- Elemental Whirl
			[495] = 4.96, -- Anduin's Dedication
			[89] = 0.13, -- Azerite Veins
			[549] = 0.1, -- Cold Hearted
			[108] = 5.19, -- Icy Citadel
			[479] = 4.88, -- Dagger in the Back
			[195] = 5.02, -- Secrets of the Deep
			[38] = 2.77, -- On My Way
		}, { -- Azerite Essences
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 15517 - 17350 (avg 16581), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[14] = { 6.06, 2.65 }, -- Condensed Life-Force
			[12] = { 6.04, 2.15 }, -- The Crucible of Flame
			[28] = { 5.8, 2.55 }, -- The Unbound Force
			[32] = { 7.23, 3.28 }, -- Conflict and Strife
			[6] = { 5.63, 2.12 }, -- Purification Protocol
			[35] = { 9.83, 5.02 }, -- Breath of the Dying
			[37] = { 3.73, 3.56 }, -- The Formless Void
			[5] = { 9.05, 4.4 }, -- Essence of the Focusing Iris
			[23] = { 9.02, 2.09 }, -- Blood of the Enemy
			[4] = { 6.34, 1.04 }, -- Worldvein Resonance
			[15] = { 3.88, 0 }, -- Ripple in Space
			[27] = { 10, 5.75 }, -- Memory of Lucid Dreams
			[36] = { 1.07, 1.13 }, -- Spark of Inspiration
			[22] = { 2.88, 0 }, -- Vision of Perfection
		}, 1580637600)

		insertDefaultScalesData(defaultName, 6, 3, { -- Unholy Death Knight
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 20502 - 22944 (avg 21790), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[195] = 5.08, -- Secrets of the Deep
			[485] = 4.99, -- Laser Matrix
			[562] = 7.82, -- Treacherous Covenant
			[492] = 5.2, -- Liberator's Might
			[86] = 0.01, -- Azerite Fortification
			[38] = 2.67, -- On My Way
			[522] = 10, -- Ancients' Bulwark
			[82] = 8.05, -- Champion of Azeroth
			[194] = 4.47, -- Filthy Transfusion
			[459] = 3.29, -- Unstable Flames
			[541] = 1.77, -- Fight or Flight
			[244] = 5.92, -- Harrowing Decay
			[523] = 4.82, -- Apothecary's Concoctions
			[577] = 4.14, -- Arcane Heart
			[505] = 4.74, -- Tradewinds
			[44] = 0.01, -- Vampiric Speed
			[500] = 2.48, -- Synaptic Spark Capacitor
			[569] = 6.41, -- Clockwork Heart
			[351] = 2.35, -- Last Surprise
			[478] = 4.68, -- Tidal Surge
			[504] = 5.33, -- Unstable Catalyst
			[21] = 2.81, -- Elemental Whirl
			[526] = 9.69, -- Endless Hunger
			[481] = 4.54, -- Incite the Pack
			[479] = 5.62, -- Dagger in the Back
			[350] = 3.58, -- Cankerous Wounds
			[482] = 4.99, -- Thunderous Blast
			[521] = 5.35, -- Shadow of Elune
			[483] = 5.11, -- Archive of the Titans
			[101] = 0.04, -- Shimmering Haven
			[493] = 2.4, -- Last Gift
			[496] = 2.41, -- Stronger Together
			[501] = 6.33, -- Relational Normalization Gizmo
			[575] = 9.37, -- Undulating Tides
			[480] = 5.23, -- Blood Rite
			[461] = 1.67, -- Earthlink
			[494] = 5.94, -- Battlefield Precision
			[22] = 2.28, -- Heed My Call
			[157] = 5.79, -- Rezan's Fury
			[193] = 9.18, -- Blightborne Infusion
			[495] = 4.82, -- Anduin's Dedication
			[192] = 6.88, -- Meticulous Scheming
			[499] = 2.27, -- Ricocheting Inflatable Pyrosaw
			[576] = 3.29, -- Loyal to the End
			[498] = 3.56, -- Barrage Of Many Bombs
			[142] = 4.58, -- Helchains
			[18] = 1.93, -- Blood Siphon
			[30] = 3.89, -- Overwhelming Power
			[462] = 1.64, -- Azerite Globules
			[463] = 0.05, -- Blessed Portents
			[196] = 8.2, -- Swirling Sands
			[582] = 7.93, -- Heart of Darkness
			[20] = 2.62, -- Lifespeed
			[199] = 9.63, -- Festermight
			[561] = 4.49, -- Seductive Power
			[560] = 2.82, -- Bonded Souls
			[497] = 1.01, -- Stand As One
			[31] = 3.03, -- Gutripper
			[156] = 2.71, -- Ruinous Bolt
			[109] = 5.42, -- Magus of the Dead
		}, { -- Azerite Essences
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 19927 - 22291 (avg 21409), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[23] = { 6.1, 1.18 }, -- Blood of the Enemy
			[28] = { 5.91, 2.6 }, -- The Unbound Force
			[15] = { 4.04, 0.04 }, -- Ripple in Space
			[4] = { 5.92, 0.69 }, -- Worldvein Resonance
			[32] = { 2.47, 2.68 }, -- Conflict and Strife
			[36] = { 0.77, 0.77 }, -- Spark of Inspiration
			[27] = { 4.93, 3.28 }, -- Memory of Lucid Dreams
			[37] = { 3.23, 2.85 }, -- The Formless Void
			[6] = { 5.54, 2.18 }, -- Purification Protocol
			[22] = { 5.27, 1.71 }, -- Vision of Perfection
			[12] = { 6.71, 2.13 }, -- The Crucible of Flame
			[14] = { 6.77, 2.66 }, -- Condensed Life-Force
			[35] = { 9.81, 5.14 }, -- Breath of the Dying
			[5] = { 10, 3.8 }, -- Essence of the Focusing Iris
		}, 1580637600)

		insertDefaultScalesData(defaultName, 11, 1, { -- Balance Druid
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 5017 - 6244 (avg 5431), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[482] = 2.75, -- Thunderous Blast
			[522] = 6.61, -- Ancients' Bulwark
			[501] = 4.2, -- Relational Normalization Gizmo
			[499] = 1.12, -- Ricocheting Inflatable Pyrosaw
			[577] = 3.33, -- Arcane Heart
			[481] = 3.69, -- Incite the Pack
			[526] = 6.5, -- Endless Hunger
			[157] = 3.22, -- Rezan's Fury
			[86] = 0.01, -- Azerite Fortification
			[173] = 2.09, -- Power of the Moon
			[561] = 2.5, -- Seductive Power
			[505] = 4.08, -- Tradewinds
			[196] = 5.69, -- Swirling Sands
			[494] = 3.09, -- Battlefield Precision
			[194] = 2.78, -- Filthy Transfusion
			[200] = 10, -- Arcanic Pulsar
			[364] = 2.85, -- Lively Spirit
			[82] = 6.05, -- Champion of Azeroth
			[562] = 4.41, -- Treacherous Covenant
			[541] = 0.93, -- Fight or Flight
			[492] = 4.09, -- Liberator's Might
			[576] = 2.76, -- Loyal to the End
			[523] = 2.86, -- Apothecary's Concoctions
			[122] = 3.31, -- Streaking Stars
			[195] = 2.62, -- Secrets of the Deep
			[356] = 1.11, -- High Noon
			[582] = 5.55, -- Heart of Darkness
			[22] = 1.49, -- Heed My Call
			[485] = 2.88, -- Laser Matrix
			[156] = 1.62, -- Ruinous Bolt
			[495] = 2.99, -- Anduin's Dedication
			[478] = 2.97, -- Tidal Surge
			[459] = 2.29, -- Unstable Flames
			[20] = 2.06, -- Lifespeed
			[569] = 5.04, -- Clockwork Heart
			[462] = 0.61, -- Azerite Globules
			[43] = 0.05, -- Winds of War
			[493] = 2.1, -- Last Gift
			[480] = 3.73, -- Blood Rite
			[21] = 2.08, -- Elemental Whirl
			[193] = 6.47, -- Blightborne Infusion
			[31] = 1.61, -- Gutripper
			[560] = 1.94, -- Bonded Souls
			[250] = 3.01, -- Dawning Sun
			[38] = 1.74, -- On My Way
			[461] = 0.88, -- Earthlink
			[30] = 2.94, -- Overwhelming Power
			[575] = 5.41, -- Undulating Tides
			[500] = 1.57, -- Synaptic Spark Capacitor
			[496] = 1.32, -- Stronger Together
			[18] = 1.5, -- Blood Siphon
			[483] = 3.05, -- Archive of the Titans
			[479] = 3.4, -- Dagger in the Back
			[504] = 3.19, -- Unstable Catalyst
			[498] = 1.99, -- Barrage Of Many Bombs
			[192] = 4.87, -- Meticulous Scheming
			[521] = 3.74, -- Shadow of Elune
			[497] = 0.55, -- Stand As One
		}, { -- Azerite Essences
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 4703 - 5728 (avg 5336), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[27] = { 4.56, 2.47 }, -- Memory of Lucid Dreams
			[12] = { 3.59, 2.09 }, -- The Crucible of Flame
			[23] = { 5.39, 1.72 }, -- Blood of the Enemy
			[32] = { 10, 2.61 }, -- Conflict and Strife
			[4] = { 3.43, 0.78 }, -- Worldvein Resonance
			[35] = { 7.13, 4.43 }, -- Breath of the Dying
			[6] = { 3.91, 1.87 }, -- Purification Protocol
			[28] = { 4.63, 3.12 }, -- The Unbound Force
			[5] = { 6.73, 4.22 }, -- Essence of the Focusing Iris
			[37] = { 2.54, 2.75 }, -- The Formless Void
			[14] = { 5.77, 2.12 }, -- Condensed Life-Force
			[22] = { 5.97, 2.02 }, -- Vision of Perfection
			[15] = { 2.33, 0 }, -- Ripple in Space
			[36] = { 0.99, 0.84 }, -- Spark of Inspiration
		}, 1580637600)

		insertDefaultScalesData(defaultName, 11, 2, { -- Feral Druid
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 7121 - 8327 (avg 7471), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[482] = 2.49, -- Thunderous Blast
			[193] = 6.15, -- Blightborne Infusion
			[479] = 3.14, -- Dagger in the Back
			[541] = 0.96, -- Fight or Flight
			[577] = 3.32, -- Arcane Heart
			[521] = 3.1, -- Shadow of Elune
			[196] = 5.6, -- Swirling Sands
			[209] = 10, -- Jungle Fury
			[505] = 3.54, -- Tradewinds
			[169] = 1.58, -- Untamed Ferocity
			[83] = 0.22, -- Impassive Visage
			[582] = 5.21, -- Heart of Darkness
			[526] = 5.78, -- Endless Hunger
			[86] = 0.09, -- Azerite Fortification
			[30] = 2.36, -- Overwhelming Power
			[247] = 1.4, -- Iron Jaws
			[569] = 4.56, -- Clockwork Heart
			[502] = 0.19, -- Personal Absorb-o-Tron
			[523] = 2.44, -- Apothecary's Concoctions
			[44] = 0.04, -- Vampiric Speed
			[195] = 2.79, -- Secrets of the Deep
			[21] = 1.81, -- Elemental Whirl
			[42] = 0.11, -- Savior
			[562] = 4.04, -- Treacherous Covenant
			[157] = 2.99, -- Rezan's Fury
			[496] = 1.38, -- Stronger Together
			[85] = 0.16, -- Gemhide
			[101] = 0.09, -- Shimmering Haven
			[561] = 2.21, -- Seductive Power
			[485] = 2.69, -- Laser Matrix
			[478] = 3.22, -- Tidal Surge
			[500] = 1.81, -- Synaptic Spark Capacitor
			[241] = 0.08, -- Twisted Claws
			[13] = 0.07, -- Azerite Empowered
			[15] = 0.12, -- Resounding Protection
			[84] = 0.01, -- Bulwark of the Masses
			[22] = 1.35, -- Heed My Call
			[503] = 0.11, -- Auto-Self-Cauterizer
			[111] = 3.1, -- Blood Mist
			[483] = 2.93, -- Archive of the Titans
			[31] = 1.47, -- Gutripper
			[504] = 2.95, -- Unstable Catalyst
			[480] = 3.12, -- Blood Rite
			[540] = 0.05, -- Switch Hitter
			[100] = 0.02, -- Strength in Numbers
			[493] = 2.03, -- Last Gift
			[18] = 1.44, -- Blood Siphon
			[38] = 1.68, -- On My Way
			[560] = 1.63, -- Bonded Souls
			[495] = 2.81, -- Anduin's Dedication
			[522] = 5.74, -- Ancients' Bulwark
			[461] = 0.83, -- Earthlink
			[498] = 2.14, -- Barrage Of Many Bombs
			[156] = 1.81, -- Ruinous Bolt
			[359] = 4.1, -- Wild Fleshrending
			[358] = 3.33, -- Gushing Lacerations
			[497] = 0.77, -- Stand As One
			[194] = 2.24, -- Filthy Transfusion
			[501] = 3.53, -- Relational Normalization Gizmo
			[82] = 5.38, -- Champion of Azeroth
			[492] = 3.35, -- Liberator's Might
			[568] = 0.24, -- Person-Computer Interface
			[499] = 1.26, -- Ricocheting Inflatable Pyrosaw
			[575] = 5.01, -- Undulating Tides
			[87] = 0.2, -- Self Reliance
			[20] = 1.54, -- Lifespeed
			[192] = 3.73, -- Meticulous Scheming
			[494] = 2.96, -- Battlefield Precision
			[462] = 1.04, -- Azerite Globules
			[43] = 0.08, -- Winds of War
			[14] = 0.17, -- Longstrider
			[99] = 0.07, -- Ablative Shielding
			[481] = 3.37, -- Incite the Pack
			[459] = 2.14, -- Unstable Flames
			[576] = 2.66, -- Loyal to the End
		}, { -- Azerite Essences
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 6676 - 7706 (avg 7325), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[14] = { 4.48, 2.06 }, -- Condensed Life-Force
			[35] = { 5.82, 3.85 }, -- Breath of the Dying
			[6] = { 4.37, 1.88 }, -- Purification Protocol
			[22] = { 2.59, 0.86 }, -- Vision of Perfection
			[5] = { 6.3, 3.09 }, -- Essence of the Focusing Iris
			[23] = { 5.02, 1.16 }, -- Blood of the Enemy
			[4] = { 4, 0.94 }, -- Worldvein Resonance
			[36] = { 0.79, 0.81 }, -- Spark of Inspiration
			[28] = { 3.89, 1.8 }, -- The Unbound Force
			[15] = { 2.55, 0.01 }, -- Ripple in Space
			[32] = { 10, 2.3 }, -- Conflict and Strife
			[12] = { 4.92, 1.76 }, -- The Crucible of Flame
			[37] = { 2.42, 2.4 }, -- The Formless Void
			[27] = { 2.83, 2.21 }, -- Memory of Lucid Dreams
		}, 1580637600)

		insertDefaultScalesData(offensiveName, 11, 3, { -- Guardian Druid
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 1947 - 2956 (avg 2148), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[196] = 8.53, -- Swirling Sands
			[482] = 5.2, -- Thunderous Blast
			[461] = 1.39, -- Earthlink
			[478] = 6.71, -- Tidal Surge
			[582] = 7.51, -- Heart of Darkness
			[562] = 5.95, -- Treacherous Covenant
			[20] = 2.55, -- Lifespeed
			[479] = 4.67, -- Dagger in the Back
			[361] = 4.16, -- Guardian's Wrath
			[38] = 2.51, -- On My Way
			[499] = 2.45, -- Ricocheting Inflatable Pyrosaw
			[561] = 4.41, -- Seductive Power
			[526] = 8.25, -- Endless Hunger
			[485] = 5.38, -- Laser Matrix
			[560] = 2.29, -- Bonded Souls
			[523] = 5.09, -- Apothecary's Concoctions
			[21] = 2.89, -- Elemental Whirl
			[505] = 5.67, -- Tradewinds
			[498] = 3.81, -- Barrage Of Many Bombs
			[31] = 3.04, -- Gutripper
			[522] = 8.84, -- Ancients' Bulwark
			[22] = 2.61, -- Heed My Call
			[496] = 2.25, -- Stronger Together
			[497] = 1.31, -- Stand As One
			[194] = 5.15, -- Filthy Transfusion
			[359] = 1.47, -- Wild Fleshrending
			[481] = 5.08, -- Incite the Pack
			[504] = 4.16, -- Unstable Catalyst
			[493] = 2.82, -- Last Gift
			[30] = 3.98, -- Overwhelming Power
			[502] = 0.04, -- Personal Absorb-o-Tron
			[576] = 3.86, -- Loyal to the End
			[112] = 0.14, -- Layered Mane
			[82] = 8.71, -- Champion of Azeroth
			[483] = 4.22, -- Archive of the Titans
			[495] = 3.73, -- Anduin's Dedication
			[195] = 3.76, -- Secrets of the Deep
			[480] = 5.32, -- Blood Rite
			[156] = 4, -- Ruinous Bolt
			[500] = 3.37, -- Synaptic Spark Capacitor
			[540] = 0.03, -- Switch Hitter
			[569] = 6.55, -- Clockwork Heart
			[43] = 0.01, -- Winds of War
			[575] = 10, -- Undulating Tides
			[193] = 9.36, -- Blightborne Infusion
			[459] = 3.34, -- Unstable Flames
			[18] = 2.2, -- Blood Siphon
			[192] = 6.71, -- Meticulous Scheming
			[157] = 6.13, -- Rezan's Fury
			[462] = 1.83, -- Azerite Globules
			[501] = 6.18, -- Relational Normalization Gizmo
			[577] = 2.66, -- Arcane Heart
			[492] = 5.8, -- Liberator's Might
			[241] = 3.01, -- Twisted Claws
			[42] = 0.1, -- Savior
			[541] = 1.04, -- Fight or Flight
			[494] = 6.83, -- Battlefield Precision
			[521] = 5.51, -- Shadow of Elune
			[251] = 5.77, -- Burst of Savagery
		}, { -- Azerite Essences
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 1986 - 2209 (avg 2087), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[27] = { 1.12, 0.58 }, -- Memory of Lucid Dreams
			[32] = { 10, 3.1 }, -- Conflict and Strife
			[12] = { 9.1, 3.21 }, -- The Crucible of Flame
			[7] = { 7.4, 4.3 }, -- Anima of Life and Death
			[22] = { 1.2, 0.21 }, -- Vision of Perfection
			[13] = { 0.08, 0 }, -- Nullification Dynamo
			[37] = { 2.97, 3.21 }, -- The Formless Void
			[15] = { 3.68, 0 }, -- Ripple in Space
			[4] = { 3.65, 0.91 }, -- Worldvein Resonance
			[25] = { 1.52, 1.32 }, -- Aegis of the Deep
			[3] = { 7.01, 6.91 }, -- Sphere of Suppression
		}, 1580637600)

		insertDefaultScalesData(defaultName, 3, 1, { -- Beast Mastery Hunter
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 11786 - 13395 (avg 12800), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[30] = 4.95, -- Overwhelming Power
			[82] = 7.81, -- Champion of Azeroth
			[541] = 1.21, -- Fight or Flight
			[582] = 7.84, -- Heart of Darkness
			[479] = 4.39, -- Dagger in the Back
			[463] = 0.06, -- Blessed Portents
			[18] = 2.05, -- Blood Siphon
			[156] = 3, -- Ruinous Bolt
			[498] = 2.7, -- Barrage Of Many Bombs
			[504] = 4.83, -- Unstable Catalyst
			[22] = 1.83, -- Heed My Call
			[494] = 4.24, -- Battlefield Precision
			[505] = 4.92, -- Tradewinds
			[482] = 3.4, -- Thunderous Blast
			[31] = 1.99, -- Gutripper
			[492] = 5.48, -- Liberator's Might
			[21] = 2.64, -- Elemental Whirl
			[483] = 4.48, -- Archive of the Titans
			[577] = 1.84, -- Arcane Heart
			[569] = 7.03, -- Clockwork Heart
			[105] = 0.09, -- Ephemeral Recovery
			[84] = 0.06, -- Bulwark of the Masses
			[485] = 3.78, -- Laser Matrix
			[526] = 7.85, -- Endless Hunger
			[14] = 0.07, -- Longstrider
			[203] = 0.07, -- Shellshock
			[561] = 3.23, -- Seductive Power
			[499] = 1.38, -- Ricocheting Inflatable Pyrosaw
			[365] = 6.52, -- Dire Consequences
			[157] = 4.33, -- Rezan's Fury
			[496] = 1.93, -- Stronger Together
			[196] = 6.39, -- Swirling Sands
			[480] = 6.75, -- Blood Rite
			[99] = 0.04, -- Ablative Shielding
			[20] = 3.12, -- Lifespeed
			[462] = 1.29, -- Azerite Globules
			[100] = 0.01, -- Strength in Numbers
			[83] = 0.27, -- Impassive Visage
			[461] = 1.52, -- Earthlink
			[521] = 6.73, -- Shadow of Elune
			[497] = 1.08, -- Stand As One
			[543] = 0.04, -- Nature's Salve
			[101] = 0.05, -- Shimmering Haven
			[367] = 4.53, -- Feeding Frenzy
			[500] = 2.83, -- Synaptic Spark Capacitor
			[42] = 0.03, -- Savior
			[523] = 3.63, -- Apothecary's Concoctions
			[459] = 2.48, -- Unstable Flames
			[501] = 6.96, -- Relational Normalization Gizmo
			[481] = 4.56, -- Incite the Pack
			[562] = 6.39, -- Treacherous Covenant
			[576] = 3, -- Loyal to the End
			[493] = 2.82, -- Last Gift
			[38] = 2.08, -- On My Way
			[478] = 4.79, -- Tidal Surge
			[495] = 3.78, -- Anduin's Dedication
			[13] = 0.03, -- Azerite Empowered
			[211] = 9.78, -- Dance of Death
			[194] = 3.26, -- Filthy Transfusion
			[366] = 10, -- Primal Instincts
			[104] = 0.26, -- Bracing Chill
			[502] = 0.02, -- Personal Absorb-o-Tron
			[107] = 4.31, -- Serrated Jaws
			[161] = 5.5, -- Haze of Rage
			[19] = 0.02, -- Woundbinder
			[560] = 3.11, -- Bonded Souls
			[193] = 6.94, -- Blightborne Infusion
			[192] = 8.54, -- Meticulous Scheming
			[575] = 6.79, -- Undulating Tides
			[195] = 4.1, -- Secrets of the Deep
			[522] = 7.56, -- Ancients' Bulwark
		}, { -- Azerite Essences
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 11599 - 13079 (avg 12534), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[5] = { 10, 5.92 }, -- Essence of the Focusing Iris
			[27] = { 1.23, 1.05 }, -- Memory of Lucid Dreams
			[35] = { 8.56, 4.55 }, -- Breath of the Dying
			[23] = { 5.31, 1.21 }, -- Blood of the Enemy
			[6] = { 5.81, 2.08 }, -- Purification Protocol
			[22] = { 2.22, 0.65 }, -- Vision of Perfection
			[14] = { 4.65, 2.43 }, -- Condensed Life-Force
			[32] = { 2.59, 2.54 }, -- Conflict and Strife
			[4] = { 5.29, 0.99 }, -- Worldvein Resonance
			[15] = { 3.39, 0 }, -- Ripple in Space
			[37] = { 3.04, 3.23 }, -- The Formless Void
			[12] = { 6.43, 2.14 }, -- The Crucible of Flame
			[36] = { 1.37, 1.48 }, -- Spark of Inspiration
			[28] = { 5.52, 2.09 }, -- The Unbound Force
		}, 1580637600)

		insertDefaultScalesData(defaultName, 3, 2, { -- Marksmanship Hunter
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 13718 - 15432 (avg 14543), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[523] = 3.13, -- Apothecary's Concoctions
			[503] = 0.12, -- Auto-Self-Cauterizer
			[500] = 2.24, -- Synaptic Spark Capacitor
			[21] = 2.32, -- Elemental Whirl
			[560] = 2.6, -- Bonded Souls
			[521] = 4.98, -- Shadow of Elune
			[541] = 1.15, -- Fight or Flight
			[504] = 3.51, -- Unstable Catalyst
			[193] = 6.46, -- Blightborne Infusion
			[86] = 0.17, -- Azerite Fortification
			[22] = 1.66, -- Heed My Call
			[483] = 3.3, -- Archive of the Titans
			[101] = 0.3, -- Shimmering Haven
			[203] = 0.24, -- Shellshock
			[30] = 3.68, -- Overwhelming Power
			[577] = 3.29, -- Arcane Heart
			[100] = 0.18, -- Strength in Numbers
			[104] = 0.08, -- Bracing Chill
			[44] = 0.06, -- Vampiric Speed
			[195] = 2.91, -- Secrets of the Deep
			[576] = 2.99, -- Loyal to the End
			[370] = 6.21, -- Focused Fire
			[192] = 6.15, -- Meticulous Scheming
			[83] = 0.09, -- Impassive Visage
			[196] = 5.47, -- Swirling Sands
			[482] = 3.03, -- Thunderous Blast
			[87] = 0.08, -- Self Reliance
			[157] = 3.69, -- Rezan's Fury
			[14] = 0.09, -- Longstrider
			[98] = 0.02, -- Crystalline Carapace
			[156] = 2.37, -- Ruinous Bolt
			[493] = 2.22, -- Last Gift
			[85] = 0.1, -- Gemhide
			[162] = 4.88, -- Surging Shots
			[31] = 1.83, -- Gutripper
			[497] = 0.79, -- Stand As One
			[562] = 4.77, -- Treacherous Covenant
			[469] = 0.2, -- Duck and Cover
			[461] = 1.13, -- Earthlink
			[575] = 5.85, -- Undulating Tides
			[499] = 1.55, -- Ricocheting Inflatable Pyrosaw
			[105] = 0.03, -- Ephemeral Recovery
			[522] = 6.24, -- Ancients' Bulwark
			[568] = 0.1, -- Person-Computer Interface
			[526] = 6.16, -- Endless Hunger
			[19] = 0.02, -- Woundbinder
			[480] = 5.04, -- Blood Rite
			[561] = 2.39, -- Seductive Power
			[479] = 3.98, -- Dagger in the Back
			[569] = 5.26, -- Clockwork Heart
			[463] = 0.1, -- Blessed Portents
			[478] = 3.92, -- Tidal Surge
			[84] = 0.22, -- Bulwark of the Masses
			[38] = 1.87, -- On My Way
			[18] = 1.69, -- Blood Siphon
			[492] = 4.47, -- Liberator's Might
			[82] = 6.51, -- Champion of Azeroth
			[495] = 2.95, -- Anduin's Dedication
			[494] = 3.58, -- Battlefield Precision
			[496] = 1.69, -- Stronger Together
			[582] = 6.36, -- Heart of Darkness
			[20] = 2.72, -- Lifespeed
			[368] = 2.15, -- Steady Aim
			[462] = 0.89, -- Azerite Globules
			[459] = 2.25, -- Unstable Flames
			[194] = 3.2, -- Filthy Transfusion
			[212] = 6.52, -- Unerring Vision
			[99] = 0.12, -- Ablative Shielding
			[481] = 3.72, -- Incite the Pack
			[498] = 2.27, -- Barrage Of Many Bombs
			[505] = 4.27, -- Tradewinds
			[36] = 10, -- In The Rhythm
			[485] = 3.01, -- Laser Matrix
			[89] = 0.06, -- Azerite Veins
			[501] = 5.34, -- Relational Normalization Gizmo
		}, { -- Azerite Essences
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 13594 - 15191 (avg 14327), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = { 2.6, 0.11 }, -- Ripple in Space
			[5] = { 10, 6 }, -- Essence of the Focusing Iris
			[14] = { 5.35, 2.61 }, -- Condensed Life-Force
			[23] = { 5.43, 1.76 }, -- Blood of the Enemy
			[12] = { 5.65, 2.78 }, -- The Crucible of Flame
			[36] = { 1.73, 1.47 }, -- Spark of Inspiration
			[22] = { 5.55, 1.47 }, -- Vision of Perfection
			[6] = { 5.41, 2.29 }, -- Purification Protocol
			[28] = { 4.82, 2.57 }, -- The Unbound Force
			[35] = { 8.72, 5.34 }, -- Breath of the Dying
			[27] = { 1.54, 0.84 }, -- Memory of Lucid Dreams
			[32] = { 2.81, 2.62 }, -- Conflict and Strife
			[4] = { 4.31, 1.2 }, -- Worldvein Resonance
			[37] = { 3.08, 3.31 }, -- The Formless Void
		}, 1580637600)

		insertDefaultScalesData(defaultName, 3, 3, { -- Survival Hunter
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 10886 - 12510 (avg 11682), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[107] = 3.66, -- Serrated Jaws
			[575] = 9.62, -- Undulating Tides
			[505] = 6.15, -- Tradewinds
			[483] = 5.4, -- Archive of the Titans
			[504] = 5.88, -- Unstable Catalyst
			[38] = 2.68, -- On My Way
			[21] = 3.33, -- Elemental Whirl
			[461] = 1.52, -- Earthlink
			[193] = 9.9, -- Blightborne Infusion
			[192] = 8.48, -- Meticulous Scheming
			[526] = 10, -- Endless Hunger
			[501] = 8.13, -- Relational Normalization Gizmo
			[561] = 4.04, -- Seductive Power
			[196] = 9.11, -- Swirling Sands
			[495] = 5.13, -- Anduin's Dedication
			[569] = 7.58, -- Clockwork Heart
			[493] = 2.99, -- Last Gift
			[480] = 7.75, -- Blood Rite
			[31] = 2.87, -- Gutripper
			[481] = 5.24, -- Incite the Pack
			[213] = 5.18, -- Venomous Fangs
			[110] = 2.39, -- Wildfire Cluster
			[562] = 7.83, -- Treacherous Covenant
			[541] = 1.67, -- Fight or Flight
			[462] = 1.81, -- Azerite Globules
			[18] = 1.87, -- Blood Siphon
			[582] = 9.16, -- Heart of Darkness
			[485] = 5.09, -- Laser Matrix
			[492] = 6.71, -- Liberator's Might
			[482] = 4.69, -- Thunderous Blast
			[372] = 9.02, -- Wilderness Survival
			[195] = 5.09, -- Secrets of the Deep
			[101] = 0.03, -- Shimmering Haven
			[496] = 2.17, -- Stronger Together
			[87] = 0.13, -- Self Reliance
			[157] = 5.64, -- Rezan's Fury
			[163] = 6.7, -- Latent Poison
			[373] = 9.86, -- Primeval Intuition
			[22] = 2.32, -- Heed My Call
			[521] = 7.45, -- Shadow of Elune
			[577] = 5.77, -- Arcane Heart
			[194] = 4.54, -- Filthy Transfusion
			[500] = 3.18, -- Synaptic Spark Capacitor
			[371] = 9.15, -- Blur of Talons
			[522] = 9.93, -- Ancients' Bulwark
			[203] = 0.04, -- Shellshock
			[20] = 3.43, -- Lifespeed
			[576] = 3.75, -- Loyal to the End
			[523] = 4.81, -- Apothecary's Concoctions
			[82] = 9.97, -- Champion of Azeroth
			[560] = 3.56, -- Bonded Souls
			[478] = 5.56, -- Tidal Surge
			[498] = 3.48, -- Barrage Of Many Bombs
			[459] = 3.25, -- Unstable Flames
			[499] = 2.3, -- Ricocheting Inflatable Pyrosaw
			[494] = 5.56, -- Battlefield Precision
			[479] = 6.33, -- Dagger in the Back
			[365] = 6.05, -- Dire Consequences
			[497] = 0.98, -- Stand As One
			[30] = 5.39, -- Overwhelming Power
			[156] = 3, -- Ruinous Bolt
		}, { -- Azerite Essences
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 10440 - 12042 (avg 11449), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[5] = { 10, 5.05 }, -- Essence of the Focusing Iris
			[4] = { 4.87, 0.84 }, -- Worldvein Resonance
			[28] = { 5.22, 2.5 }, -- The Unbound Force
			[37] = { 3.12, 3.11 }, -- The Formless Void
			[23] = { 5.87, 1.17 }, -- Blood of the Enemy
			[35] = { 9.72, 5.2 }, -- Breath of the Dying
			[27] = { 7.3, 2.42 }, -- Memory of Lucid Dreams
			[6] = { 5.31, 2.12 }, -- Purification Protocol
			[22] = { 4.67, 0.93 }, -- Vision of Perfection
			[14] = { 5.67, 2.6 }, -- Condensed Life-Force
			[32] = { 2.7, 2.66 }, -- Conflict and Strife
			[36] = { 1.27, 1.11 }, -- Spark of Inspiration
			[15] = { 3.05, 0 }, -- Ripple in Space
			[12] = { 6.28, 2.44 }, -- The Crucible of Flame
		}, 1580637600)

		insertDefaultScalesData(defaultName, 8, 1, { -- Arcane Mage
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 6901 - 7879 (avg 7253), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[480] = 5.21, -- Blood Rite
			[104] = 0.14, -- Bracing Chill
			[495] = 4.6, -- Anduin's Dedication
			[84] = 0.11, -- Bulwark of the Masses
			[499] = 1.89, -- Ricocheting Inflatable Pyrosaw
			[127] = 9.51, -- Equipoise
			[15] = 0.07, -- Resounding Protection
			[481] = 4.48, -- Incite the Pack
			[546] = 0.29, -- Quick Thinking
			[167] = 2.82, -- Brain Storm
			[562] = 7.17, -- Treacherous Covenant
			[483] = 4.66, -- Archive of the Titans
			[20] = 4.66, -- Lifespeed
			[42] = 0.05, -- Savior
			[576] = 3.68, -- Loyal to the End
			[462] = 1.18, -- Azerite Globules
			[569] = 5.37, -- Clockwork Heart
			[577] = 5.31, -- Arcane Heart
			[461] = 1.87, -- Earthlink
			[575] = 6.6, -- Undulating Tides
			[459] = 2.97, -- Unstable Flames
			[485] = 3.93, -- Laser Matrix
			[568] = 0.07, -- Person-Computer Interface
			[101] = 0.31, -- Shimmering Haven
			[99] = 0.08, -- Ablative Shielding
			[582] = 6.89, -- Heart of Darkness
			[18] = 2.05, -- Blood Siphon
			[561] = 3.63, -- Seductive Power
			[105] = 0.21, -- Ephemeral Recovery
			[38] = 2.65, -- On My Way
			[494] = 3.89, -- Battlefield Precision
			[19] = 0.08, -- Woundbinder
			[493] = 2.78, -- Last Gift
			[374] = 6.2, -- Galvanizing Spark
			[30] = 4.61, -- Overwhelming Power
			[497] = 1.12, -- Stand As One
			[479] = 4.35, -- Dagger in the Back
			[13] = 0.08, -- Azerite Empowered
			[496] = 2.36, -- Stronger Together
			[523] = 3.76, -- Apothecary's Concoctions
			[505] = 4.82, -- Tradewinds
			[85] = 0.08, -- Gemhide
			[522] = 9.17, -- Ancients' Bulwark
			[478] = 4.46, -- Tidal Surge
			[482] = 3.4, -- Thunderous Blast
			[82] = 10, -- Champion of Azeroth
			[463] = 0.26, -- Blessed Portents
			[98] = 0.19, -- Crystalline Carapace
			[541] = 1.78, -- Fight or Flight
			[502] = 0.02, -- Personal Absorb-o-Tron
			[21] = 2.95, -- Elemental Whirl
			[196] = 7.68, -- Swirling Sands
			[214] = 2.44, -- Arcane Pressure
			[194] = 3.7, -- Filthy Transfusion
			[468] = 0.29, -- Cauterizing Blink
			[503] = 0.61, -- Auto-Self-Cauterizer
			[22] = 1.93, -- Heed My Call
			[521] = 5.23, -- Shadow of Elune
			[89] = 0.24, -- Azerite Veins
			[195] = 4.24, -- Secrets of the Deep
			[100] = 0.11, -- Strength in Numbers
			[526] = 9.51, -- Endless Hunger
			[375] = 0.23, -- Explosive Echo
			[560] = 3.62, -- Bonded Souls
			[492] = 6.19, -- Liberator's Might
			[86] = 0.12, -- Azerite Fortification
			[88] = 5.36, -- Arcane Pummeling
			[498] = 2.7, -- Barrage Of Many Bombs
			[192] = 3.46, -- Meticulous Scheming
			[205] = 0.2, -- Eldritch Warding
			[504] = 5.11, -- Unstable Catalyst
			[43] = 0.22, -- Winds of War
			[193] = 8.72, -- Blightborne Infusion
			[87] = 0.08, -- Self Reliance
			[83] = 0.09, -- Impassive Visage
			[156] = 2.57, -- Ruinous Bolt
			[157] = 4.22, -- Rezan's Fury
			[14] = 0.09, -- Longstrider
			[501] = 6.34, -- Relational Normalization Gizmo
			[31] = 2.32, -- Gutripper
			[103] = 0.09, -- Concentrated Mending
			[500] = 2.58, -- Synaptic Spark Capacitor
		}, { -- Azerite Essences
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 6868 - 7830 (avg 7266), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[5] = { 10, 6.26 }, -- Essence of the Focusing Iris
			[35] = { 7.55, 4.98 }, -- Breath of the Dying
			[14] = { 6.64, 2.47 }, -- Condensed Life-Force
			[36] = { 1.93, 1.7 }, -- Spark of Inspiration
			[6] = { 3.74, 2.19 }, -- Purification Protocol
			[15] = { 2.4, 0.23 }, -- Ripple in Space
			[12] = { 4.84, 2.51 }, -- The Crucible of Flame
			[22] = { 1.65, 0 }, -- Vision of Perfection
			[23] = { 4.32, 1.48 }, -- Blood of the Enemy
			[32] = { 3.22, 3.58 }, -- Conflict and Strife
			[4] = { 7.23, 1.29 }, -- Worldvein Resonance
			[28] = { 3.41, 2.39 }, -- The Unbound Force
			[37] = { 3.5, 4.06 }, -- The Formless Void
			[27] = { 3.02, 1.84 }, -- Memory of Lucid Dreams
		}, 1580637600)

		insertDefaultScalesData(defaultName, 8, 2, { -- Fire Mage
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 8029 - 9314 (avg 8523), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[526] = 9.39, -- Endless Hunger
			[21] = 2.75, -- Elemental Whirl
			[505] = 4.26, -- Tradewinds
			[462] = 1.32, -- Azerite Globules
			[196] = 8.76, -- Swirling Sands
			[523] = 4.15, -- Apothecary's Concoctions
			[82] = 8.18, -- Champion of Azeroth
			[377] = 4.52, -- Duplicative Incineration
			[193] = 10, -- Blightborne Infusion
			[22] = 2.16, -- Heed My Call
			[500] = 2.58, -- Synaptic Spark Capacitor
			[461] = 1.33, -- Earthlink
			[497] = 0.88, -- Stand As One
			[582] = 7.87, -- Heart of Darkness
			[576] = 3, -- Loyal to the End
			[192] = 5.31, -- Meticulous Scheming
			[18] = 1.76, -- Blood Siphon
			[38] = 2.68, -- On My Way
			[493] = 2.21, -- Last Gift
			[503] = 0.12, -- Auto-Self-Cauterizer
			[485] = 4.41, -- Laser Matrix
			[501] = 6.12, -- Relational Normalization Gizmo
			[376] = 2.93, -- Trailing Embers
			[481] = 4.01, -- Incite the Pack
			[521] = 5.36, -- Shadow of Elune
			[30] = 3.83, -- Overwhelming Power
			[482] = 3.88, -- Thunderous Blast
			[20] = 2.52, -- Lifespeed
			[43] = 0.08, -- Winds of War
			[215] = 5.12, -- Blaster Master
			[15] = 0.2, -- Resounding Protection
			[168] = 8.03, -- Wildfire
			[44] = 0.11, -- Vampiric Speed
			[194] = 4.14, -- Filthy Transfusion
			[479] = 4.73, -- Dagger in the Back
			[495] = 3.69, -- Anduin's Dedication
			[499] = 1.94, -- Ricocheting Inflatable Pyrosaw
			[560] = 2.44, -- Bonded Souls
			[480] = 5.47, -- Blood Rite
			[195] = 3.94, -- Secrets of the Deep
			[478] = 5.06, -- Tidal Surge
			[575] = 8.07, -- Undulating Tides
			[494] = 4.82, -- Battlefield Precision
			[504] = 4.29, -- Unstable Catalyst
			[569] = 7.95, -- Clockwork Heart
			[541] = 1.34, -- Fight or Flight
			[84] = 0.14, -- Bulwark of the Masses
			[459] = 3.01, -- Unstable Flames
			[156] = 2.76, -- Ruinous Bolt
			[562] = 6.18, -- Treacherous Covenant
			[502] = 0.04, -- Personal Absorb-o-Tron
			[561] = 3.45, -- Seductive Power
			[100] = 0.06, -- Strength in Numbers
			[498] = 3.08, -- Barrage Of Many Bombs
			[496] = 1.87, -- Stronger Together
			[492] = 5.3, -- Liberator's Might
			[157] = 5.12, -- Rezan's Fury
			[522] = 9.55, -- Ancients' Bulwark
			[378] = 5.28, -- Firemind
			[577] = 4.11, -- Arcane Heart
			[128] = 4.79, -- Flames of Alacrity
			[31] = 2.18, -- Gutripper
			[483] = 4.37, -- Archive of the Titans
		}, { -- Azerite Essences
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 7833 - 8742 (avg 8368), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[14] = { 4.05, 1.54 }, -- Condensed Life-Force
			[36] = { 0.59, 0.56 }, -- Spark of Inspiration
			[27] = { 10, 5 }, -- Memory of Lucid Dreams
			[15] = { 2.25, 0 }, -- Ripple in Space
			[32] = { 1.6, 1.81 }, -- Conflict and Strife
			[4] = { 3.19, 0.56 }, -- Worldvein Resonance
			[28] = { 3.28, 1.54 }, -- The Unbound Force
			[22] = { 1.36, 0 }, -- Vision of Perfection
			[6] = { 3.42, 1.33 }, -- Purification Protocol
			[37] = { 1.64, 1.67 }, -- The Formless Void
			[35] = { 4.91, 3.16 }, -- Breath of the Dying
			[5] = { 5.77, 2.65 }, -- Essence of the Focusing Iris
			[23] = { 2.42, 1.02 }, -- Blood of the Enemy
			[12] = { 3.3, 1.68 }, -- The Crucible of Flame
		}, 1580637600)

		insertDefaultScalesData(defaultName, 8, 3, { -- Frost Mage
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 7171 - 7952 (avg 7462), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[523] = 2.77, -- Apothecary's Concoctions
			[496] = 1.41, -- Stronger Together
			[38] = 1.72, -- On My Way
			[575] = 5.37, -- Undulating Tides
			[480] = 4.31, -- Blood Rite
			[82] = 6.31, -- Champion of Azeroth
			[379] = 3.6, -- Tunnel of Ice
			[485] = 2.88, -- Laser Matrix
			[492] = 4.47, -- Liberator's Might
			[505] = 3.49, -- Tradewinds
			[504] = 4.12, -- Unstable Catalyst
			[526] = 7.16, -- Endless Hunger
			[560] = 2.18, -- Bonded Souls
			[561] = 2.7, -- Seductive Power
			[20] = 1.88, -- Lifespeed
			[482] = 2.61, -- Thunderous Blast
			[381] = 2.99, -- Frigid Grasp
			[193] = 5.62, -- Blightborne Infusion
			[500] = 1.8, -- Synaptic Spark Capacitor
			[479] = 3.64, -- Dagger in the Back
			[195] = 3.46, -- Secrets of the Deep
			[225] = 2.88, -- Glacial Assault
			[483] = 3.81, -- Archive of the Titans
			[170] = 10, -- Flash Freeze
			[194] = 2.86, -- Filthy Transfusion
			[18] = 1.25, -- Blood Siphon
			[22] = 1.45, -- Heed My Call
			[461] = 1.03, -- Earthlink
			[30] = 3.09, -- Overwhelming Power
			[156] = 1.95, -- Ruinous Bolt
			[21] = 1.99, -- Elemental Whirl
			[576] = 2.1, -- Loyal to the End
			[521] = 4.24, -- Shadow of Elune
			[522] = 7.01, -- Ancients' Bulwark
			[157] = 3.57, -- Rezan's Fury
			[380] = 3.13, -- Whiteout
			[494] = 2.84, -- Battlefield Precision
			[497] = 0.73, -- Stand As One
			[499] = 1.11, -- Ricocheting Inflatable Pyrosaw
			[495] = 3.4, -- Anduin's Dedication
			[462] = 0.79, -- Azerite Globules
			[562] = 5.2, -- Treacherous Covenant
			[481] = 3.42, -- Incite the Pack
			[192] = 4.03, -- Meticulous Scheming
			[459] = 2.38, -- Unstable Flames
			[478] = 3.24, -- Tidal Surge
			[196] = 5.64, -- Swirling Sands
			[31] = 1.15, -- Gutripper
			[569] = 5.47, -- Clockwork Heart
			[577] = 1.99, -- Arcane Heart
			[582] = 6.02, -- Heart of Darkness
			[541] = 1.13, -- Fight or Flight
			[493] = 1.96, -- Last Gift
			[501] = 5.24, -- Relational Normalization Gizmo
			[132] = 3.03, -- Packed Ice
			[498] = 2.08, -- Barrage Of Many Bombs
		}, { -- Azerite Essences
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 6804 - 7637 (avg 7344), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[28] = { 5.77, 3.12 }, -- The Unbound Force
			[4] = { 5.64, 1.23 }, -- Worldvein Resonance
			[35] = { 9.38, 6.37 }, -- Breath of the Dying
			[12] = { 4.37, 3.15 }, -- The Crucible of Flame
			[6] = { 5.08, 2.67 }, -- Purification Protocol
			[22] = { 6.77, 1.5 }, -- Vision of Perfection
			[37] = { 4.65, 4.43 }, -- The Formless Void
			[32] = { 4.04, 4.27 }, -- Conflict and Strife
			[23] = { 6.09, 1.75 }, -- Blood of the Enemy
			[15] = { 3, 0 }, -- Ripple in Space
			[5] = { 10, 6.78 }, -- Essence of the Focusing Iris
			[27] = { 7.22, 4.67 }, -- Memory of Lucid Dreams
			[36] = { 1.27, 1.3 }, -- Spark of Inspiration
			[14] = { 8.25, 2.9 }, -- Condensed Life-Force
		}, 1580637600)

		insertDefaultScalesData(offensiveName, 10, 1, { -- Brewmaster Monk
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 3098 - 4050 (avg 3335), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[238] = 0.04, -- Fit to Burst
			[461] = 0.86, -- Earthlink
			[561] = 3.36, -- Seductive Power
			[575] = 10, -- Undulating Tides
			[500] = 3.23, -- Synaptic Spark Capacitor
			[21] = 1.6, -- Elemental Whirl
			[101] = 0.03, -- Shimmering Haven
			[541] = 0.8, -- Fight or Flight
			[15] = 0.26, -- Resounding Protection
			[82] = 5.01, -- Champion of Azeroth
			[194] = 4.98, -- Filthy Transfusion
			[105] = 0.07, -- Ephemeral Recovery
			[116] = 2.23, -- Boiling Brew
			[382] = 0.12, -- Straight, No Chaser
			[31] = 2.72, -- Gutripper
			[218] = 0.09, -- Strength of Spirit
			[22] = 2.66, -- Heed My Call
			[494] = 7.35, -- Battlefield Precision
			[43] = 0.1, -- Winds of War
			[384] = 2.81, -- Elusive Footwork
			[522] = 6.5, -- Ancients' Bulwark
			[479] = 4.57, -- Dagger in the Back
			[576] = 1.92, -- Loyal to the End
			[470] = 0.03, -- Sweep the Leg
			[505] = 2.99, -- Tradewinds
			[156] = 4.27, -- Ruinous Bolt
			[195] = 2.41, -- Secrets of the Deep
			[157] = 6.04, -- Rezan's Fury
			[562] = 4.06, -- Treacherous Covenant
			[496] = 1.33, -- Stronger Together
			[501] = 4.08, -- Relational Normalization Gizmo
			[459] = 2.41, -- Unstable Flames
			[383] = 4.59, -- Training of Niuzao
			[526] = 6.79, -- Endless Hunger
			[481] = 2.78, -- Incite the Pack
			[38] = 1.87, -- On My Way
			[503] = 0.06, -- Auto-Self-Cauterizer
			[582] = 4.78, -- Heart of Darkness
			[497] = 0.89, -- Stand As One
			[462] = 1.94, -- Azerite Globules
			[495] = 2.48, -- Anduin's Dedication
			[30] = 2.46, -- Overwhelming Power
			[499] = 2.35, -- Ricocheting Inflatable Pyrosaw
			[192] = 4.16, -- Meticulous Scheming
			[193] = 7.38, -- Blightborne Infusion
			[483] = 2.91, -- Archive of the Titans
			[103] = 0.11, -- Concentrated Mending
			[87] = 0.13, -- Self Reliance
			[98] = 0.08, -- Crystalline Carapace
			[521] = 3.3, -- Shadow of Elune
			[485] = 5.32, -- Laser Matrix
			[568] = 0.1, -- Person-Computer Interface
			[577] = 2.43, -- Arcane Heart
			[523] = 5.06, -- Apothecary's Concoctions
			[560] = 1.33, -- Bonded Souls
			[196] = 6.28, -- Swirling Sands
			[569] = 4.51, -- Clockwork Heart
			[478] = 6.48, -- Tidal Surge
			[504] = 2.89, -- Unstable Catalyst
			[20] = 0.88, -- Lifespeed
			[498] = 3.95, -- Barrage Of Many Bombs
			[492] = 3.68, -- Liberator's Might
			[493] = 1.44, -- Last Gift
			[566] = 0.22, -- Exit Strategy
			[83] = 0.01, -- Impassive Visage
			[482] = 5.55, -- Thunderous Blast
			[18] = 1.17, -- Blood Siphon
			[14] = 0.19, -- Longstrider
			[480] = 3.26, -- Blood Rite
		}, { -- Azerite Essences
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 2956 - 3477 (avg 3286), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = { 0, 0.01 }, -- Nullification Dynamo
			[12] = { 10, 3.11 }, -- The Crucible of Flame
			[27] = { 1.17, 0.9 }, -- Memory of Lucid Dreams
			[34] = { 0.02, 0.08 }, -- Strength of the Warden
			[15] = { 3.75, 0.16 }, -- Ripple in Space
			[37] = { 1.83, 1.76 }, -- The Formless Void
			[4] = { 2.85, 0.64 }, -- Worldvein Resonance
			[3] = { 3.4, 3.25 }, -- Sphere of Suppression
			[25] = { 0.91, 0.92 }, -- Aegis of the Deep
			[7] = { 5.34, 3.28 }, -- Anima of Life and Death
			[32] = { 2.08, 1.89 }, -- Conflict and Strife
		}, 1580637600)

		insertDefaultScalesData(defaultName, 10, 3, { -- Windwalker Monk
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 2948 - 3723 (avg 3177), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[541] = 1.56, -- Fight or Flight
			[85] = 0.13, -- Gemhide
			[18] = 2.17, -- Blood Siphon
			[388] = 6.51, -- Glory of the Dawn
			[582] = 7.11, -- Heart of Darkness
			[562] = 6.77, -- Treacherous Covenant
			[569] = 7.38, -- Clockwork Heart
			[502] = 0.16, -- Personal Absorb-o-Tron
			[391] = 6.89, -- Dance of Chi-Ji
			[505] = 4.99, -- Tradewinds
			[523] = 4.47, -- Apothecary's Concoctions
			[478] = 5.64, -- Tidal Surge
			[83] = 0.23, -- Impassive Visage
			[521] = 4.51, -- Shadow of Elune
			[499] = 2.26, -- Ricocheting Inflatable Pyrosaw
			[157] = 5.31, -- Rezan's Fury
			[30] = 3.19, -- Overwhelming Power
			[101] = 0.26, -- Shimmering Haven
			[100] = 0.04, -- Strength in Numbers
			[494] = 5.95, -- Battlefield Precision
			[577] = 3.32, -- Arcane Heart
			[44] = 0.17, -- Vampiric Speed
			[498] = 3.36, -- Barrage Of Many Bombs
			[103] = 0.08, -- Concentrated Mending
			[22] = 2.48, -- Heed My Call
			[218] = 0.2, -- Strength of Spirit
			[462] = 1.31, -- Azerite Globules
			[485] = 4.91, -- Laser Matrix
			[19] = 0.14, -- Woundbinder
			[492] = 4.78, -- Liberator's Might
			[389] = 8.11, -- Open Palm Strikes
			[193] = 8.5, -- Blightborne Infusion
			[497] = 1.42, -- Stand As One
			[192] = 5.38, -- Meticulous Scheming
			[526] = 9.12, -- Endless Hunger
			[566] = 0.2, -- Exit Strategy
			[470] = 0.32, -- Sweep the Leg
			[156] = 3.59, -- Ruinous Bolt
			[459] = 3.3, -- Unstable Flames
			[482] = 4.84, -- Thunderous Blast
			[196] = 7.83, -- Swirling Sands
			[390] = 6.42, -- Pressure Point
			[561] = 4.61, -- Seductive Power
			[483] = 4.72, -- Archive of the Titans
			[560] = 2, -- Bonded Souls
			[463] = 0.36, -- Blessed Portents
			[20] = 1.99, -- Lifespeed
			[184] = 5.01, -- Sunrise Technique
			[493] = 2.9, -- Last Gift
			[568] = 0.05, -- Person-Computer Interface
			[86] = 0.04, -- Azerite Fortification
			[481] = 4.85, -- Incite the Pack
			[82] = 7.57, -- Champion of Azeroth
			[194] = 4.72, -- Filthy Transfusion
			[500] = 3.22, -- Synaptic Spark Capacitor
			[480] = 4.43, -- Blood Rite
			[479] = 5.66, -- Dagger in the Back
			[38] = 2.7, -- On My Way
			[495] = 4.23, -- Anduin's Dedication
			[195] = 4.31, -- Secrets of the Deep
			[496] = 2.04, -- Stronger Together
			[42] = 0.09, -- Savior
			[461] = 1.54, -- Earthlink
			[503] = 0.26, -- Auto-Self-Cauterizer
			[13] = 0.41, -- Azerite Empowered
			[117] = 10, -- Fury of Xuen
			[15] = 0.18, -- Resounding Protection
			[576] = 3.98, -- Loyal to the End
			[501] = 5.61, -- Relational Normalization Gizmo
			[522] = 9.43, -- Ancients' Bulwark
			[21] = 2.48, -- Elemental Whirl
			[99] = 0.32, -- Ablative Shielding
			[31] = 2.89, -- Gutripper
			[504] = 4.82, -- Unstable Catalyst
			[14] = 0.17, -- Longstrider
			[575] = 8.58, -- Undulating Tides
		}, { -- Azerite Essences
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 2646 - 3537 (avg 3120), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[6] = { 3.82, 1.23 }, -- Purification Protocol
			[37] = { 1.56, 1.45 }, -- The Formless Void
			[23] = { 3.59, 0.47 }, -- Blood of the Enemy
			[28] = { 3.53, 1.32 }, -- The Unbound Force
			[5] = { 4.99, 1.87 }, -- Essence of the Focusing Iris
			[12] = { 4.32, 1.44 }, -- The Crucible of Flame
			[27] = { 0.39, 0.1 }, -- Memory of Lucid Dreams
			[14] = { 3.51, 1.38 }, -- Condensed Life-Force
			[32] = { 10, 1.49 }, -- Conflict and Strife
			[22] = { 1.1, 1.03 }, -- Vision of Perfection
			[35] = { 5.93, 2.72 }, -- Breath of the Dying
			[36] = { 0.36, 0.39 }, -- Spark of Inspiration
			[4] = { 3.11, 0.57 }, -- Worldvein Resonance
			[15] = { 2.36, 0.06 }, -- Ripple in Space
		}, 1580637600)

		insertDefaultScalesData(offensiveName, 2, 2, { -- Protection Paladin
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 29315 - 33571 (avg 32210), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[206] = 0.01, -- Stalwart Protector
			[499] = 2.24, -- Ricocheting Inflatable Pyrosaw
			[98] = 0.09, -- Crystalline Carapace
			[86] = 0.05, -- Azerite Fortification
			[497] = 1, -- Stand As One
			[83] = 0.04, -- Impassive Visage
			[500] = 2.98, -- Synaptic Spark Capacitor
			[582] = 5.84, -- Heart of Darkness
			[462] = 1.69, -- Azerite Globules
			[18] = 1.26, -- Blood Siphon
			[31] = 3.18, -- Gutripper
			[575] = 10, -- Undulating Tides
			[479] = 4.22, -- Dagger in the Back
			[195] = 3.37, -- Secrets of the Deep
			[569] = 4.72, -- Clockwork Heart
			[526] = 7.16, -- Endless Hunger
			[521] = 4.38, -- Shadow of Elune
			[541] = 1.18, -- Fight or Flight
			[576] = 2.3, -- Loyal to the End
			[194] = 4.79, -- Filthy Transfusion
			[560] = 2.14, -- Bonded Souls
			[523] = 5.07, -- Apothecary's Concoctions
			[501] = 4.94, -- Relational Normalization Gizmo
			[562] = 5.25, -- Treacherous Covenant
			[483] = 3.62, -- Archive of the Titans
			[193] = 7.46, -- Blightborne Infusion
			[82] = 6.37, -- Champion of Azeroth
			[493] = 1.97, -- Last Gift
			[498] = 4.08, -- Barrage Of Many Bombs
			[20] = 2.01, -- Lifespeed
			[504] = 3.94, -- Unstable Catalyst
			[485] = 5.46, -- Laser Matrix
			[157] = 6.16, -- Rezan's Fury
			[22] = 2.54, -- Heed My Call
			[481] = 3.2, -- Incite the Pack
			[459] = 2.51, -- Unstable Flames
			[125] = 2.74, -- Avenger's Might
			[30] = 3.16, -- Overwhelming Power
			[522] = 6.98, -- Ancients' Bulwark
			[480] = 4.46, -- Blood Rite
			[21] = 2.04, -- Elemental Whirl
			[471] = 0.07, -- Gallant Steed
			[461] = 1.03, -- Earthlink
			[478] = 5.31, -- Tidal Surge
			[43] = 0.09, -- Winds of War
			[492] = 4.27, -- Liberator's Might
			[196] = 6.63, -- Swirling Sands
			[495] = 3.46, -- Anduin's Dedication
			[192] = 5.7, -- Meticulous Scheming
			[38] = 2, -- On My Way
			[234] = 1.43, -- Inner Light
			[561] = 3.27, -- Seductive Power
			[156] = 3.09, -- Ruinous Bolt
			[395] = 8.59, -- Inspiring Vanguard
			[235] = 3.18, -- Indomitable Justice
			[577] = 3.76, -- Arcane Heart
			[150] = 1.59, -- Soaring Shield
			[505] = 3.42, -- Tradewinds
			[482] = 5.06, -- Thunderous Blast
			[494] = 6.35, -- Battlefield Precision
			[496] = 1.45, -- Stronger Together
		}, { -- Azerite Essences
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 29022 - 33050 (avg 32077), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[7] = { 2.35, 0.06 }, -- Anima of Life and Death
			[4] = { 5.07, 1.01 }, -- Worldvein Resonance
			[3] = { 5.97, 6.06 }, -- Sphere of Suppression
			[25] = { 1.11, 1.18 }, -- Aegis of the Deep
			[27] = { 0.86, 0.52 }, -- Memory of Lucid Dreams
			[12] = { 10, 3.47 }, -- The Crucible of Flame
			[22] = { 5, 2.39 }, -- Vision of Perfection
			[32] = { 2.72, 2.72 }, -- Conflict and Strife
			[15] = { 3.3, 0 }, -- Ripple in Space
			[37] = { 3.22, 3.02 }, -- The Formless Void
		}, 1580637600)

		insertDefaultScalesData(defaultName, 2, 3, { -- Retribution Paladin
			-- SimulationCraft 830-02 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 7600 - 8901 (avg 7989), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 14.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[478] = 3.63, -- Tidal Surge
			[498] = 2.89, -- Barrage Of Many Bombs
			[187] = 4.96, -- Expurgation
			[459] = 1.94, -- Unstable Flames
			[562] = 5.13, -- Treacherous Covenant
			[492] = 3.59, -- Liberator's Might
			[20] = 1.83, -- Lifespeed
			[497] = 0.98, -- Stand As One
			[18] = 1.58, -- Blood Siphon
			[522] = 6.31, -- Ancients' Bulwark
			[569] = 5.01, -- Clockwork Heart
			[499] = 1.73, -- Ricocheting Inflatable Pyrosaw
			[192] = 4.55, -- Meticulous Scheming
			[541] = 1.05, -- Fight or Flight
			[576] = 2.59, -- Loyal to the End
			[31] = 2.12, -- Gutripper
			[462] = 1.32, -- Azerite Globules
			[30] = 2.78, -- Overwhelming Power
			[481] = 3.71, -- Incite the Pack
			[577] = 3.55, -- Arcane Heart
			[496] = 1.39, -- Stronger Together
			[195] = 3.42, -- Secrets of the Deep
			[396] = 10, -- Light's Decree
			[22] = 1.9, -- Heed My Call
			[453] = 4.78, -- Empyrean Power
			[101] = 0.07, -- Shimmering Haven
			[521] = 3.72, -- Shadow of Elune
			[15] = 0.05, -- Resounding Protection
			[501] = 4.44, -- Relational Normalization Gizmo
			[154] = 5.53, -- Relentless Inquisitor
			[495] = 3.22, -- Anduin's Dedication
			[483] = 3.79, -- Archive of the Titans
			[494] = 4.37, -- Battlefield Precision
			[505] = 3.99, -- Tradewinds
			[235] = 3.52, -- Indomitable Justice
			[482] = 3.44, -- Thunderous Blast
			[575] = 7.01, -- Undulating Tides
			[38] = 1.77, -- On My Way
			[493] = 2.21, -- Last Gift
			[479] = 4.51, -- Dagger in the Back
			[504] = 3.8, -- Unstable Catalyst
			[500] = 1.95, -- Synaptic Spark Capacitor
			[523] = 3.72, -- Apothecary's Concoctions
			[87] = 0.03, -- Self Reliance
			[582] = 5.24, -- Heart of Darkness
			[21] = 1.97, -- Elemental Whirl
			[193] = 5.78, -- Blightborne Infusion
			[485] = 3.72, -- Laser Matrix
			[156] = 2.09, -- Ruinous Bolt
			[560] = 2.15, -- Bonded Souls
			[98] = 0.05, -- Crystalline Carapace
			[461] = 1.19, -- Earthlink
			[82] = 5.67, -- Champion of Azeroth
			[503] = 0.09, -- Auto-Self-Cauterizer
			[526] = 6.22, -- Endless Hunger
			[196] = 5.08, -- Swirling Sands
			[157] = 4.25, -- Rezan's Fury
			[125] = 4.56, -- Avenger's Might
			[480] = 3.61, -- Blood Rite
			[194] = 3.74, -- Filthy Transfusion
			[561] = 3.34, -- Seductive Power
		}, { -- Azerite Essences
			-- SimulationCraft 830-02 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 7301 - 8303 (avg 7846), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 14.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[32] = { 2.36, 2.49 }, -- Conflict and Strife
			[28] = { 4.46, 1.78 }, -- The Unbound Force
			[36] = { 1.03, 0.97 }, -- Spark of Inspiration
			[4] = { 5.05, 0.96 }, -- Worldvein Resonance
			[22] = { 8.68, 2.95 }, -- Vision of Perfection
			[14] = { 6.39, 2.73 }, -- Condensed Life-Force
			[23] = { 3.92, 0.6 }, -- Blood of the Enemy
			[15] = { 0.03, 0.1 }, -- Ripple in Space
			[5] = { 7.46, 3.53 }, -- Essence of the Focusing Iris
			[6] = { 5.01, 2.31 }, -- Purification Protocol
			[12] = { 5.87, 2.32 }, -- The Crucible of Flame
			[27] = { 4.53, 2.76 }, -- Memory of Lucid Dreams
			[35] = { 10, 5.29 }, -- Breath of the Dying
			[37] = { 2.75, 2.86 }, -- The Formless Void
		}, 1581674400)

		insertDefaultScalesData(defaultName, 4, 1, { -- Assassination Rogue
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 5643 - 6868 (avg 6116), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[217] = 0.71, -- Footpad
			[195] = 4.89, -- Secrets of the Deep
			[483] = 5.27, -- Archive of the Titans
			[502] = 0.3, -- Personal Absorb-o-Tron
			[98] = 0.19, -- Crystalline Carapace
			[494] = 5.14, -- Battlefield Precision
			[194] = 4.2, -- Filthy Transfusion
			[181] = 6.24, -- Twist the Knife
			[44] = 0.14, -- Vampiric Speed
			[196] = 8.73, -- Swirling Sands
			[473] = 0.16, -- Shrouded Mantle
			[562] = 7.33, -- Treacherous Covenant
			[575] = 8.07, -- Undulating Tides
			[561] = 4.23, -- Seductive Power
			[485] = 4.75, -- Laser Matrix
			[493] = 2.72, -- Last Gift
			[479] = 5.43, -- Dagger in the Back
			[31] = 2.56, -- Gutripper
			[522] = 10, -- Ancients' Bulwark
			[136] = 7.78, -- Double Dose
			[505] = 4.94, -- Tradewinds
			[157] = 5.18, -- Rezan's Fury
			[462] = 1.59, -- Azerite Globules
			[21] = 3.21, -- Elemental Whirl
			[100] = 0.19, -- Strength in Numbers
			[576] = 3.55, -- Loyal to the End
			[478] = 4.57, -- Tidal Surge
			[541] = 1.57, -- Fight or Flight
			[526] = 9.95, -- Endless Hunger
			[492] = 5.75, -- Liberator's Might
			[482] = 4.22, -- Thunderous Blast
			[82] = 8.6, -- Champion of Azeroth
			[480] = 5.57, -- Blood Rite
			[568] = 0.36, -- Person-Computer Interface
			[499] = 2.02, -- Ricocheting Inflatable Pyrosaw
			[15] = 0.48, -- Resounding Protection
			[407] = 0.21, -- Echoing Blades
			[569] = 7.19, -- Clockwork Heart
			[459] = 3.35, -- Unstable Flames
			[193] = 9.54, -- Blightborne Infusion
			[406] = 3.08, -- Scent of Blood
			[408] = 1.01, -- Shrouded Suffocation
			[156] = 2.83, -- Ruinous Bolt
			[500] = 2.71, -- Synaptic Spark Capacitor
			[89] = 0.2, -- Azerite Veins
			[463] = 0.26, -- Blessed Portents
			[43] = 0.28, -- Winds of War
			[503] = 0.3, -- Auto-Self-Cauterizer
			[577] = 4.62, -- Arcane Heart
			[582] = 8.14, -- Heart of Darkness
			[85] = 0.16, -- Gemhide
			[548] = 0.02, -- Lying In Wait
			[504] = 5.2, -- Unstable Catalyst
			[42] = 0.19, -- Savior
			[14] = 0.23, -- Longstrider
			[501] = 6.27, -- Relational Normalization Gizmo
			[87] = 0.41, -- Self Reliance
			[523] = 4.41, -- Apothecary's Concoctions
			[18] = 2.05, -- Blood Siphon
			[496] = 2.19, -- Stronger Together
			[13] = 0.24, -- Azerite Empowered
			[192] = 5.27, -- Meticulous Scheming
			[105] = 0.39, -- Ephemeral Recovery
			[103] = 0.34, -- Concentrated Mending
			[560] = 2.66, -- Bonded Souls
			[249] = 9.42, -- Nothing Personal
			[22] = 2.75, -- Heed My Call
			[497] = 1.5, -- Stand As One
			[101] = 0.13, -- Shimmering Haven
			[495] = 4.97, -- Anduin's Dedication
			[83] = 0.33, -- Impassive Visage
			[498] = 3.46, -- Barrage Of Many Bombs
			[481] = 4.85, -- Incite the Pack
			[19] = 0.2, -- Woundbinder
			[38] = 2.98, -- On My Way
			[30] = 4.13, -- Overwhelming Power
			[20] = 2.73, -- Lifespeed
			[99] = 0.15, -- Ablative Shielding
			[461] = 1.82, -- Earthlink
			[521] = 5.56, -- Shadow of Elune
			[84] = 0.06, -- Bulwark of the Masses
		}, { -- Azerite Essences
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 5449 - 6353 (avg 6008), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[36] = { 1.1, 1.2 }, -- Spark of Inspiration
			[27] = { 9.5, 5.08 }, -- Memory of Lucid Dreams
			[37] = { 3.41, 3.23 }, -- The Formless Void
			[22] = { 5.62, 1.06 }, -- Vision of Perfection
			[5] = { 9.6, 4.52 }, -- Essence of the Focusing Iris
			[35] = { 10, 5.04 }, -- Breath of the Dying
			[4] = { 6.96, 1.08 }, -- Worldvein Resonance
			[14] = { 6.34, 2.7 }, -- Condensed Life-Force
			[23] = { 7.04, 2.27 }, -- Blood of the Enemy
			[28] = { 6.57, 3.03 }, -- The Unbound Force
			[15] = { 4.48, 0.12 }, -- Ripple in Space
			[12] = { 6.87, 2.12 }, -- The Crucible of Flame
			[6] = { 5.83, 2.44 }, -- Purification Protocol
			[32] = { 3.19, 3.07 }, -- Conflict and Strife
		}, 1580637600)

		insertDefaultScalesData(defaultName, 4, 2, { -- Outlaw Rogue
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 9411 - 11415 (avg 10170), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[495] = 4.11, -- Anduin's Dedication
			[459] = 3.26, -- Unstable Flames
			[502] = 0.02, -- Personal Absorb-o-Tron
			[493] = 2.14, -- Last Gift
			[478] = 5.69, -- Tidal Surge
			[192] = 7.19, -- Meticulous Scheming
			[526] = 9.34, -- Endless Hunger
			[20] = 2.93, -- Lifespeed
			[501] = 6.48, -- Relational Normalization Gizmo
			[13] = 0.22, -- Azerite Empowered
			[104] = 0.03, -- Bracing Chill
			[504] = 4.91, -- Unstable Catalyst
			[576] = 2.75, -- Loyal to the End
			[31] = 2.83, -- Gutripper
			[577] = 3.86, -- Arcane Heart
			[410] = 3.46, -- Paradise Lost
			[19] = 0.01, -- Woundbinder
			[129] = 5.97, -- Deadshot
			[87] = 0.18, -- Self Reliance
			[44] = 0.23, -- Vampiric Speed
			[461] = 1.2, -- Earthlink
			[482] = 4.58, -- Thunderous Blast
			[569] = 6.5, -- Clockwork Heart
			[195] = 4.51, -- Secrets of the Deep
			[194] = 4.66, -- Filthy Transfusion
			[22] = 2.49, -- Heed My Call
			[14] = 0.14, -- Longstrider
			[481] = 3.79, -- Incite the Pack
			[541] = 1.67, -- Fight or Flight
			[498] = 3.5, -- Barrage Of Many Bombs
			[84] = 0.08, -- Bulwark of the Masses
			[483] = 4.93, -- Archive of the Titans
			[21] = 3.12, -- Elemental Whirl
			[497] = 0.9, -- Stand As One
			[193] = 8.66, -- Blightborne Infusion
			[462] = 1.75, -- Azerite Globules
			[239] = 3.65, -- Snake Eyes
			[89] = 0.4, -- Azerite Veins
			[575] = 9.2, -- Undulating Tides
			[156] = 3.16, -- Ruinous Bolt
			[499] = 2.22, -- Ricocheting Inflatable Pyrosaw
			[560] = 3.28, -- Bonded Souls
			[485] = 4.96, -- Laser Matrix
			[157] = 5.69, -- Rezan's Fury
			[99] = 0.07, -- Ablative Shielding
			[446] = 10, -- Brigand's Blitz
			[85] = 0.3, -- Gemhide
			[196] = 7.93, -- Swirling Sands
			[180] = 4.24, -- Keep Your Wits About You
			[500] = 2.84, -- Synaptic Spark Capacitor
			[479] = 6.04, -- Dagger in the Back
			[18] = 1.39, -- Blood Siphon
			[505] = 4.07, -- Tradewinds
			[30] = 4.7, -- Overwhelming Power
			[86] = 0.14, -- Azerite Fortification
			[83] = 0.07, -- Impassive Visage
			[492] = 6.01, -- Liberator's Might
			[582] = 7.58, -- Heart of Darkness
			[480] = 5.8, -- Blood Rite
			[496] = 2.24, -- Stronger Together
			[548] = 0.03, -- Lying In Wait
			[561] = 3.69, -- Seductive Power
			[523] = 4.77, -- Apothecary's Concoctions
			[521] = 6.16, -- Shadow of Elune
			[38] = 2.92, -- On My Way
			[522] = 9.36, -- Ancients' Bulwark
			[15] = 0.1, -- Resounding Protection
			[82] = 8.48, -- Champion of Azeroth
			[562] = 6.65, -- Treacherous Covenant
			[411] = 7.25, -- Ace Up Your Sleeve
			[494] = 5.97, -- Battlefield Precision
		}, { -- Azerite Essences
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 9090 - 10436 (avg 9911), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[22] = { 5.78, 2.89 }, -- Vision of Perfection
			[28] = { 4.85, 1.83 }, -- The Unbound Force
			[35] = { 10, 5.1 }, -- Breath of the Dying
			[36] = { 1.02, 1.03 }, -- Spark of Inspiration
			[4] = { 4.15, 1 }, -- Worldvein Resonance
			[37] = { 2.67, 2.52 }, -- The Formless Void
			[15] = { 3.37, 0.04 }, -- Ripple in Space
			[5] = { 8.44, 4.3 }, -- Essence of the Focusing Iris
			[27] = { 7.15, 5.2 }, -- Memory of Lucid Dreams
			[23] = { 3.91, 1.54 }, -- Blood of the Enemy
			[32] = { 2.73, 2.67 }, -- Conflict and Strife
			[12] = { 7.26, 2.34 }, -- The Crucible of Flame
			[6] = { 5.99, 2.3 }, -- Purification Protocol
			[14] = { 6.22, 2.74 }, -- Condensed Life-Force
		}, 1580637600)

		insertDefaultScalesData(defaultName, 4, 3, { -- Subtlety Rogue
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 6793 - 7957 (avg 7471), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[98] = 0.11, -- Crystalline Carapace
			[480] = 3.13, -- Blood Rite
			[38] = 1.53, -- On My Way
			[44] = 0.14, -- Vampiric Speed
			[496] = 1.17, -- Stronger Together
			[20] = 1.56, -- Lifespeed
			[445] = 1.75, -- Perforate
			[569] = 3.95, -- Clockwork Heart
			[492] = 2.88, -- Liberator's Might
			[478] = 3.01, -- Tidal Surge
			[105] = 0.16, -- Ephemeral Recovery
			[156] = 1.79, -- Ruinous Bolt
			[194] = 2.47, -- Filthy Transfusion
			[459] = 1.9, -- Unstable Flames
			[30] = 2.46, -- Overwhelming Power
			[87] = 0.3, -- Self Reliance
			[575] = 4.61, -- Undulating Tides
			[495] = 2.26, -- Anduin's Dedication
			[196] = 4.27, -- Swirling Sands
			[577] = 2.39, -- Arcane Heart
			[541] = 1.14, -- Fight or Flight
			[582] = 4.24, -- Heart of Darkness
			[82] = 4.45, -- Champion of Azeroth
			[521] = 3.13, -- Shadow of Elune
			[503] = 0.09, -- Auto-Self-Cauterizer
			[103] = 0.14, -- Concentrated Mending
			[482] = 2.47, -- Thunderous Blast
			[240] = 3.93, -- Blade In The Shadows
			[498] = 1.92, -- Barrage Of Many Bombs
			[501] = 3.6, -- Relational Normalization Gizmo
			[13] = 0.06, -- Azerite Empowered
			[85] = 0.17, -- Gemhide
			[561] = 2.08, -- Seductive Power
			[31] = 1.47, -- Gutripper
			[502] = 0.19, -- Personal Absorb-o-Tron
			[493] = 1.42, -- Last Gift
			[497] = 0.63, -- Stand As One
			[483] = 2.59, -- Archive of the Titans
			[463] = 0.07, -- Blessed Portents
			[84] = 0.21, -- Bulwark of the Masses
			[42] = 0.26, -- Savior
			[560] = 1.53, -- Bonded Souls
			[500] = 1.64, -- Synaptic Spark Capacitor
			[485] = 2.72, -- Laser Matrix
			[18] = 1.06, -- Blood Siphon
			[99] = 0.19, -- Ablative Shielding
			[43] = 0.07, -- Winds of War
			[193] = 4.79, -- Blightborne Infusion
			[504] = 2.71, -- Unstable Catalyst
			[479] = 3.36, -- Dagger in the Back
			[562] = 3.64, -- Treacherous Covenant
			[89] = 0.17, -- Azerite Veins
			[548] = 0.21, -- Lying In Wait
			[413] = 10, -- The First Dance
			[100] = 0.29, -- Strength in Numbers
			[175] = 3.39, -- Night's Vengeance
			[124] = 1.38, -- Replicating Shadows
			[83] = 0.27, -- Impassive Visage
			[104] = 0.13, -- Bracing Chill
			[14] = 0.29, -- Longstrider
			[157] = 3.12, -- Rezan's Fury
			[217] = 0.15, -- Footpad
			[462] = 1.01, -- Azerite Globules
			[576] = 1.79, -- Loyal to the End
			[481] = 2.24, -- Incite the Pack
			[526] = 5.12, -- Endless Hunger
			[86] = 0.08, -- Azerite Fortification
			[22] = 1.44, -- Heed My Call
			[505] = 2.55, -- Tradewinds
			[494] = 2.96, -- Battlefield Precision
			[523] = 2.52, -- Apothecary's Concoctions
			[192] = 3.26, -- Meticulous Scheming
			[195] = 2.42, -- Secrets of the Deep
			[101] = 0.13, -- Shimmering Haven
			[522] = 5.21, -- Ancients' Bulwark
			[473] = 0.19, -- Shrouded Mantle
			[499] = 1.42, -- Ricocheting Inflatable Pyrosaw
			[414] = 3.68, -- Inevitability
			[19] = 0.17, -- Woundbinder
			[461] = 1, -- Earthlink
			[568] = 0.09, -- Person-Computer Interface
			[15] = 0.27, -- Resounding Protection
			[21] = 1.52, -- Elemental Whirl
		}, { -- Azerite Essences
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 6613 - 7697 (avg 7319), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[6] = { 6.19, 2.46 }, -- Purification Protocol
			[5] = { 9.1, 4.3 }, -- Essence of the Focusing Iris
			[32] = { 2.71, 2.72 }, -- Conflict and Strife
			[28] = { 5.27, 1.87 }, -- The Unbound Force
			[22] = { 4.11, 1.18 }, -- Vision of Perfection
			[37] = { 2.88, 2.71 }, -- The Formless Void
			[23] = { 5.8, 1.52 }, -- Blood of the Enemy
			[14] = { 6.39, 2.56 }, -- Condensed Life-Force
			[15] = { 4.09, 0.18 }, -- Ripple in Space
			[27] = { 9.31, 6.15 }, -- Memory of Lucid Dreams
			[4] = { 5.74, 1.11 }, -- Worldvein Resonance
			[36] = { 1.23, 1.19 }, -- Spark of Inspiration
			[12] = { 7.12, 2.39 }, -- The Crucible of Flame
			[35] = { 10, 5.01 }, -- Breath of the Dying
		}, 1580637600)

		insertDefaultScalesData(defaultName, 7, 1, { -- Elemental Shaman
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 13505 - 15313 (avg 14500), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[495] = 4.1, -- Anduin's Dedication
			[504] = 4.53, -- Unstable Catalyst
			[44] = 0.02, -- Vampiric Speed
			[448] = 3.82, -- Synapse Shock
			[105] = 0.1, -- Ephemeral Recovery
			[178] = 3.98, -- Lava Shock
			[575] = 6.86, -- Undulating Tides
			[30] = 3.45, -- Overwhelming Power
			[21] = 1.95, -- Elemental Whirl
			[22] = 1.96, -- Heed My Call
			[38] = 2.2, -- On My Way
			[195] = 3.99, -- Secrets of the Deep
			[459] = 2.93, -- Unstable Flames
			[497] = 1.17, -- Stand As One
			[582] = 6.17, -- Heart of Darkness
			[541] = 1.43, -- Fight or Flight
			[222] = 2.9, -- Echo of the Elementals
			[480] = 4.91, -- Blood Rite
			[501] = 5.57, -- Relational Normalization Gizmo
			[194] = 3.87, -- Filthy Transfusion
			[457] = 10, -- Igneous Potential
			[192] = 6.14, -- Meticulous Scheming
			[447] = 4.66, -- Ancestral Resonance
			[494] = 4.06, -- Battlefield Precision
			[479] = 5.27, -- Dagger in the Back
			[498] = 2.83, -- Barrage Of Many Bombs
			[482] = 3.75, -- Thunderous Blast
			[569] = 5.52, -- Clockwork Heart
			[493] = 1.39, -- Last Gift
			[18] = 0.76, -- Blood Siphon
			[561] = 3.32, -- Seductive Power
			[20] = 2.18, -- Lifespeed
			[481] = 2.16, -- Incite the Pack
			[492] = 4.92, -- Liberator's Might
			[522] = 7.44, -- Ancients' Bulwark
			[196] = 7.26, -- Swirling Sands
			[483] = 4.4, -- Archive of the Titans
			[82] = 6.82, -- Champion of Azeroth
			[499] = 1.78, -- Ricocheting Inflatable Pyrosaw
			[562] = 6.3, -- Treacherous Covenant
			[193] = 8.08, -- Blightborne Infusion
			[577] = 4.83, -- Arcane Heart
			[526] = 7.65, -- Endless Hunger
			[500] = 2.27, -- Synaptic Spark Capacitor
			[523] = 3.77, -- Apothecary's Concoctions
			[156] = 2.79, -- Ruinous Bolt
			[31] = 2.1, -- Gutripper
			[416] = 8.37, -- Natural Harmony
			[100] = 0.02, -- Strength in Numbers
			[496] = 1.84, -- Stronger Together
			[485] = 4.12, -- Laser Matrix
			[560] = 2.16, -- Bonded Souls
			[576] = 1.84, -- Loyal to the End
			[99] = 0.13, -- Ablative Shielding
			[462] = 1.38, -- Azerite Globules
			[157] = 4.64, -- Rezan's Fury
			[478] = 4.49, -- Tidal Surge
			[521] = 4.99, -- Shadow of Elune
			[461] = 1.43, -- Earthlink
			[505] = 2.42, -- Tradewinds
		}, { -- Azerite Essences
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 13133 - 14865 (avg 14188), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[6] = { 5.41, 2.58 }, -- Purification Protocol
			[36] = { 0.99, 0.92 }, -- Spark of Inspiration
			[12] = { 5.27, 2.66 }, -- The Crucible of Flame
			[14] = { 6.82, 2.71 }, -- Condensed Life-Force
			[28] = { 5.45, 3.05 }, -- The Unbound Force
			[5] = { 9.37, 4.82 }, -- Essence of the Focusing Iris
			[37] = { 3.86, 3.47 }, -- The Formless Void
			[23] = { 6.47, 1.33 }, -- Blood of the Enemy
			[15] = { 3.1, 0 }, -- Ripple in Space
			[22] = { 5.51, 1.36 }, -- Vision of Perfection
			[4] = { 5.78, 1.1 }, -- Worldvein Resonance
			[27] = { 2.1, 1.2 }, -- Memory of Lucid Dreams
			[35] = { 8.79, 5.53 }, -- Breath of the Dying
			[32] = { 10, 2.8 }, -- Conflict and Strife
		}, 1580637600)

		insertDefaultScalesData(defaultName, 7, 2, { -- Enhancement Shaman
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 7841 - 9295 (avg 8468), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[38] = 1.99, -- On My Way
			[19] = 0.01, -- Woundbinder
			[495] = 3.58, -- Anduin's Dedication
			[505] = 4.18, -- Tradewinds
			[420] = 10, -- Roiling Storm
			[82] = 6.09, -- Champion of Azeroth
			[85] = 0.01, -- Gemhide
			[462] = 1.22, -- Azerite Globules
			[569] = 4.71, -- Clockwork Heart
			[447] = 6.9, -- Ancestral Resonance
			[179] = 3.86, -- Strength of Earth
			[482] = 3.16, -- Thunderous Blast
			[416] = 8.69, -- Natural Harmony
			[478] = 3.61, -- Tidal Surge
			[499] = 1.6, -- Ricocheting Inflatable Pyrosaw
			[207] = 0.08, -- Serene Spirit
			[560] = 2.24, -- Bonded Souls
			[481] = 3.89, -- Incite the Pack
			[501] = 4.79, -- Relational Normalization Gizmo
			[20] = 2.07, -- Lifespeed
			[448] = 0.22, -- Synapse Shock
			[196] = 5.9, -- Swirling Sands
			[500] = 1.94, -- Synaptic Spark Capacitor
			[483] = 3.92, -- Archive of the Titans
			[530] = 7.27, -- Thunderaan's Fury
			[504] = 3.98, -- Unstable Catalyst
			[526] = 7.14, -- Endless Hunger
			[192] = 5.28, -- Meticulous Scheming
			[498] = 2.65, -- Barrage Of Many Bombs
			[575] = 6.56, -- Undulating Tides
			[195] = 3.35, -- Secrets of the Deep
			[492] = 3.86, -- Liberator's Might
			[497] = 0.83, -- Stand As One
			[156] = 2.03, -- Ruinous Bolt
			[157] = 4.12, -- Rezan's Fury
			[137] = 1.38, -- Primal Primer
			[101] = 0.07, -- Shimmering Haven
			[485] = 3.76, -- Laser Matrix
			[30] = 3.03, -- Overwhelming Power
			[18] = 1.42, -- Blood Siphon
			[461] = 1.33, -- Earthlink
			[577] = 3.38, -- Arcane Heart
			[479] = 4.22, -- Dagger in the Back
			[100] = 0.09, -- Strength in Numbers
			[582] = 5.9, -- Heart of Darkness
			[502] = 0.2, -- Personal Absorb-o-Tron
			[541] = 1.34, -- Fight or Flight
			[523] = 3.26, -- Apothecary's Concoctions
			[561] = 3.15, -- Seductive Power
			[193] = 6.52, -- Blightborne Infusion
			[22] = 1.73, -- Heed My Call
			[576] = 2.88, -- Loyal to the End
			[42] = 0.2, -- Savior
			[494] = 4.25, -- Battlefield Precision
			[459] = 2.25, -- Unstable Flames
			[493] = 2.19, -- Last Gift
			[562] = 5.31, -- Treacherous Covenant
			[568] = 0.01, -- Person-Computer Interface
			[223] = 2.05, -- Lightning Conduit
			[44] = 0.03, -- Vampiric Speed
			[194] = 3.35, -- Filthy Transfusion
			[496] = 1.52, -- Stronger Together
			[21] = 2.21, -- Elemental Whirl
			[521] = 4.04, -- Shadow of Elune
			[105] = 0.04, -- Ephemeral Recovery
			[480] = 4.18, -- Blood Rite
			[522] = 7.09, -- Ancients' Bulwark
			[31] = 1.93, -- Gutripper
		}, { -- Azerite Essences
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 7247 - 8865 (avg 8227), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = { 3.81, 0 }, -- Ripple in Space
			[32] = { 7.72, 2.91 }, -- Conflict and Strife
			[6] = { 6.03, 2.62 }, -- Purification Protocol
			[12] = { 6.57, 2.58 }, -- The Crucible of Flame
			[36] = { 0.97, 1.15 }, -- Spark of Inspiration
			[37] = { 3.39, 3.39 }, -- The Formless Void
			[23] = { 9.49, 4.22 }, -- Blood of the Enemy
			[27] = { 2.81, 1.94 }, -- Memory of Lucid Dreams
			[5] = { 9.29, 4.62 }, -- Essence of the Focusing Iris
			[28] = { 5.48, 2.62 }, -- The Unbound Force
			[4] = { 6.16, 1.23 }, -- Worldvein Resonance
			[35] = { 10, 5.73 }, -- Breath of the Dying
			[22] = { 2.02, 0.39 }, -- Vision of Perfection
			[14] = { 7.51, 3.22 }, -- Condensed Life-Force
		}, 1580637600)

		insertDefaultScalesData(offensiveName, 7, 3, { -- Restoration Shaman
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 22407 - 26841 (avg 25208), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[22] = 1.54, -- Heed My Call
			[569] = 3.86, -- Clockwork Heart
			[194] = 3.75, -- Filthy Transfusion
			[38] = 1.63, -- On My Way
			[483] = 3.05, -- Archive of the Titans
			[98] = 0.1, -- Crystalline Carapace
			[497] = 0.69, -- Stand As One
			[575] = 6.31, -- Undulating Tides
			[496] = 1.14, -- Stronger Together
			[577] = 3.59, -- Arcane Heart
			[157] = 4.2, -- Rezan's Fury
			[500] = 2.19, -- Synaptic Spark Capacitor
			[449] = 0.03, -- Overflowing Shores
			[495] = 2.5, -- Anduin's Dedication
			[522] = 5.73, -- Ancients' Bulwark
			[85] = 0.03, -- Gemhide
			[459] = 1.57, -- Unstable Flames
			[526] = 5.73, -- Endless Hunger
			[21] = 1.41, -- Elemental Whirl
			[521] = 4.34, -- Shadow of Elune
			[105] = 0.08, -- Ephemeral Recovery
			[422] = 0.08, -- Surging Tides
			[503] = 0.03, -- Auto-Self-Cauterizer
			[560] = 2.15, -- Bonded Souls
			[20] = 1.98, -- Lifespeed
			[523] = 3.65, -- Apothecary's Concoctions
			[482] = 3.3, -- Thunderous Blast
			[474] = 0.05, -- Pack Spirit
			[195] = 2.6, -- Secrets of the Deep
			[192] = 2.38, -- Meticulous Scheming
			[479] = 4.71, -- Dagger in the Back
			[447] = 1.46, -- Ancestral Resonance
			[478] = 3.82, -- Tidal Surge
			[457] = 10, -- Igneous Potential
			[501] = 4.39, -- Relational Normalization Gizmo
			[30] = 3.11, -- Overwhelming Power
			[448] = 2.54, -- Synapse Shock
			[156] = 2.35, -- Ruinous Bolt
			[541] = 0.88, -- Fight or Flight
			[196] = 4.12, -- Swirling Sands
			[485] = 3.56, -- Laser Matrix
			[103] = 0.04, -- Concentrated Mending
			[462] = 1.11, -- Azerite Globules
			[539] = 0.06, -- Ancient Ankh Talisman
			[461] = 0.81, -- Earthlink
			[31] = 1.88, -- Gutripper
			[499] = 1.53, -- Ricocheting Inflatable Pyrosaw
			[99] = 0.05, -- Ablative Shielding
			[480] = 4.32, -- Blood Rite
			[498] = 2.51, -- Barrage Of Many Bombs
			[504] = 2.84, -- Unstable Catalyst
			[416] = 5.52, -- Natural Harmony
			[582] = 4.02, -- Heart of Darkness
			[82] = 4.4, -- Champion of Azeroth
			[492] = 3.5, -- Liberator's Might
			[561] = 2.21, -- Seductive Power
			[494] = 3.76, -- Battlefield Precision
			[42] = 0.04, -- Savior
			[562] = 4.09, -- Treacherous Covenant
			[193] = 4.85, -- Blightborne Infusion
		}, { -- Azerite Essences
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 23431 - 26245 (avg 24968), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[28] = { 3.06, 3.05 }, -- The Unbound Force
			[35] = { 7.39, 7.4 }, -- Breath of the Dying
			[27] = { 0, 0.18 }, -- Memory of Lucid Dreams
			[4] = { 3.5, 1.22 }, -- Worldvein Resonance
			[37] = { 3.41, 3.18 }, -- The Formless Void
			[32] = { 3.6, 3.52 }, -- Conflict and Strife
			[5] = { 6.68, 6.67 }, -- Essence of the Focusing Iris
			[14] = { 3.87, 4.04 }, -- Condensed Life-Force
			[15] = { 3.35, 0 }, -- Ripple in Space
			[6] = { 3.23, 3.39 }, -- Purification Protocol
			[22] = { 0, 0.09 }, -- Vision of Perfection
			[23] = { 1.04, 1.35 }, -- Blood of the Enemy
			[36] = { 1.32, 1.35 }, -- Spark of Inspiration
			[12] = { 10, 5.04 }, -- The Crucible of Flame
		}, 1580637600)

		insertDefaultScalesData(defaultName, 9, 1, { -- Affliction Warlock
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 20307 - 23436 (avg 21986), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[459] = 2.52, -- Unstable Flames
			[21] = 2.43, -- Elemental Whirl
			[505] = 4.7, -- Tradewinds
			[541] = 1.09, -- Fight or Flight
			[478] = 4.41, -- Tidal Surge
			[576] = 2.97, -- Loyal to the End
			[38] = 2.34, -- On My Way
			[569] = 5.35, -- Clockwork Heart
			[582] = 7.52, -- Heart of Darkness
			[20] = 2.85, -- Lifespeed
			[495] = 3.09, -- Anduin's Dedication
			[479] = 5.29, -- Dagger in the Back
			[501] = 5.93, -- Relational Normalization Gizmo
			[499] = 1.72, -- Ricocheting Inflatable Pyrosaw
			[492] = 4.98, -- Liberator's Might
			[123] = 4.96, -- Wracking Brilliance
			[481] = 4.25, -- Incite the Pack
			[496] = 1.64, -- Stronger Together
			[500] = 2.34, -- Synaptic Spark Capacitor
			[480] = 5.74, -- Blood Rite
			[230] = 10, -- Cascading Calamity
			[497] = 0.79, -- Stand As One
			[196] = 7.02, -- Swirling Sands
			[504] = 3.83, -- Unstable Catalyst
			[485] = 4.23, -- Laser Matrix
			[526] = 8.35, -- Endless Hunger
			[193] = 8.07, -- Blightborne Infusion
			[192] = 6.68, -- Meticulous Scheming
			[498] = 3.15, -- Barrage Of Many Bombs
			[461] = 1.09, -- Earthlink
			[195] = 3.12, -- Secrets of the Deep
			[18] = 1.72, -- Blood Siphon
			[483] = 3.43, -- Archive of the Titans
			[30] = 4.55, -- Overwhelming Power
			[494] = 5.26, -- Battlefield Precision
			[425] = 3.51, -- Sudden Onset
			[577] = 5.73, -- Arcane Heart
			[22] = 1.99, -- Heed My Call
			[157] = 4.95, -- Rezan's Fury
			[183] = 5.7, -- Inevitable Demise
			[521] = 5.98, -- Shadow of Elune
			[462] = 1.12, -- Azerite Globules
			[442] = 4.46, -- Pandemic Invocation
			[522] = 8.46, -- Ancients' Bulwark
			[426] = 3.44, -- Dreadful Calling
			[562] = 5.15, -- Treacherous Covenant
			[194] = 4.03, -- Filthy Transfusion
			[82] = 7.72, -- Champion of Azeroth
			[575] = 7.89, -- Undulating Tides
			[523] = 3.98, -- Apothecary's Concoctions
			[156] = 2.62, -- Ruinous Bolt
			[31] = 2.14, -- Gutripper
			[561] = 2.93, -- Seductive Power
			[493] = 2.48, -- Last Gift
			[482] = 4.02, -- Thunderous Blast
			[560] = 2.98, -- Bonded Souls
		}, { -- Azerite Essences
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 19729 - 22789 (avg 21593), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[4] = { 2.71, 0.58 }, -- Worldvein Resonance
			[27] = { 2.11, 0.97 }, -- Memory of Lucid Dreams
			[15] = { 2.72, 0 }, -- Ripple in Space
			[22] = { 1.68, 3.45 }, -- Vision of Perfection
			[6] = { 5.16, 2.05 }, -- Purification Protocol
			[32] = { 2.43, 2.44 }, -- Conflict and Strife
			[5] = { 10, 4.68 }, -- Essence of the Focusing Iris
			[23] = { 7.01, 2.08 }, -- Blood of the Enemy
			[14] = { 5.82, 2.4 }, -- Condensed Life-Force
			[36] = { 0.9, 0.96 }, -- Spark of Inspiration
			[12] = { 6.08, 2.29 }, -- The Crucible of Flame
			[35] = { 8.93, 4.71 }, -- Breath of the Dying
			[37] = { 2.27, 2.25 }, -- The Formless Void
			[28] = { 4.87, 2.44 }, -- The Unbound Force
		}, 1580637600)

		insertDefaultScalesData(defaultName, 9, 2, { -- Demonology Warlock
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 15194 - 17292 (avg 16139), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[98] = 0.17, -- Crystalline Carapace
			[22] = 1.93, -- Heed My Call
			[461] = 1.46, -- Earthlink
			[531] = 0.05, -- Terror of the Mind
			[500] = 2.51, -- Synaptic Spark Capacitor
			[42] = 0.11, -- Savior
			[576] = 3.13, -- Loyal to the End
			[38] = 2.44, -- On My Way
			[231] = 5.52, -- Explosive Potential
			[87] = 0.11, -- Self Reliance
			[526] = 8.46, -- Endless Hunger
			[475] = 0.22, -- Desperate Power
			[495] = 3.88, -- Anduin's Dedication
			[541] = 1.35, -- Fight or Flight
			[31] = 2.2, -- Gutripper
			[497] = 1.14, -- Stand As One
			[577] = 2.17, -- Arcane Heart
			[485] = 4.04, -- Laser Matrix
			[501] = 6.32, -- Relational Normalization Gizmo
			[193] = 8.39, -- Blightborne Infusion
			[195] = 4.15, -- Secrets of the Deep
			[208] = 0.07, -- Lifeblood
			[104] = 0.05, -- Bracing Chill
			[496] = 1.91, -- Stronger Together
			[575] = 6.87, -- Undulating Tides
			[492] = 5.35, -- Liberator's Might
			[458] = 4.09, -- Supreme Commander
			[190] = 3.81, -- Umbral Blaze
			[483] = 4.34, -- Archive of the Titans
			[89] = 0.24, -- Azerite Veins
			[562] = 6.19, -- Treacherous Covenant
			[103] = 0.04, -- Concentrated Mending
			[494] = 3.57, -- Battlefield Precision
			[429] = 10, -- Baleful Invocation
			[523] = 4, -- Apothecary's Concoctions
			[21] = 2.5, -- Elemental Whirl
			[522] = 8.37, -- Ancients' Bulwark
			[561] = 3.39, -- Seductive Power
			[462] = 1.26, -- Azerite Globules
			[569] = 6.63, -- Clockwork Heart
			[99] = 0.12, -- Ablative Shielding
			[105] = 0.16, -- Ephemeral Recovery
			[505] = 4.35, -- Tradewinds
			[504] = 4.68, -- Unstable Catalyst
			[156] = 2.89, -- Ruinous Bolt
			[82] = 7.37, -- Champion of Azeroth
			[14] = 0.08, -- Longstrider
			[493] = 2.33, -- Last Gift
			[582] = 7.13, -- Heart of Darkness
			[479] = 5.33, -- Dagger in the Back
			[130] = 2.52, -- Shadow's Bite
			[44] = 0.11, -- Vampiric Speed
			[18] = 1.74, -- Blood Siphon
			[194] = 4.32, -- Filthy Transfusion
			[428] = 4.4, -- Demonic Meteor
			[157] = 4.68, -- Rezan's Fury
			[499] = 1.94, -- Ricocheting Inflatable Pyrosaw
			[480] = 5.81, -- Blood Rite
			[101] = 0.18, -- Shimmering Haven
			[192] = 7, -- Meticulous Scheming
			[196] = 6.64, -- Swirling Sands
			[459] = 3.13, -- Unstable Flames
			[482] = 3.54, -- Thunderous Blast
			[521] = 5.6, -- Shadow of Elune
			[568] = 0.02, -- Person-Computer Interface
			[30] = 3.57, -- Overwhelming Power
			[86] = 0.12, -- Azerite Fortification
			[498] = 2.63, -- Barrage Of Many Bombs
			[15] = 0.1, -- Resounding Protection
			[478] = 4.15, -- Tidal Surge
			[481] = 4.55, -- Incite the Pack
			[20] = 2.13, -- Lifespeed
			[560] = 2.55, -- Bonded Souls
		}, { -- Azerite Essences
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 14808 - 16795 (avg 15894), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[32] = { 4.18, 4.09 }, -- Conflict and Strife
			[4] = { 6.74, 1.4 }, -- Worldvein Resonance
			[5] = { 9.9, 4.54 }, -- Essence of the Focusing Iris
			[23] = { 6.16, 0.49 }, -- Blood of the Enemy
			[28] = { 7.23, 3.47 }, -- The Unbound Force
			[27] = { 5.64, 3.38 }, -- Memory of Lucid Dreams
			[14] = { 7.44, 3.01 }, -- Condensed Life-Force
			[15] = { 3.42, 0.17 }, -- Ripple in Space
			[12] = { 6.36, 3.58 }, -- The Crucible of Flame
			[22] = { 9.1, 4.78 }, -- Vision of Perfection
			[37] = { 4.03, 3.81 }, -- The Formless Void
			[36] = { 1.25, 1.47 }, -- Spark of Inspiration
			[35] = { 10, 5.94 }, -- Breath of the Dying
			[6] = { 5.83, 2.48 }, -- Purification Protocol
		}, 1580637600)

		insertDefaultScalesData(defaultName, 9, 3, { -- Destruction Warlock
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 17302 - 19459 (avg 18251), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[195] = 4.59, -- Secrets of the Deep
			[462] = 1.4, -- Azerite Globules
			[194] = 4.8, -- Filthy Transfusion
			[31] = 2.76, -- Gutripper
			[504] = 4.87, -- Unstable Catalyst
			[496] = 2.34, -- Stronger Together
			[582] = 8.92, -- Heart of Darkness
			[499] = 1.7, -- Ricocheting Inflatable Pyrosaw
			[523] = 4.53, -- Apothecary's Concoctions
			[480] = 7.43, -- Blood Rite
			[526] = 9.92, -- Endless Hunger
			[478] = 4.89, -- Tidal Surge
			[485] = 4.74, -- Laser Matrix
			[232] = 7.45, -- Flashpoint
			[560] = 3.82, -- Bonded Souls
			[18] = 2.18, -- Blood Siphon
			[492] = 6.29, -- Liberator's Might
			[493] = 2.85, -- Last Gift
			[505] = 5.67, -- Tradewinds
			[431] = 0.23, -- Rolling Havoc
			[482] = 4.52, -- Thunderous Blast
			[193] = 9.9, -- Blightborne Infusion
			[89] = 0.05, -- Azerite Veins
			[521] = 7.54, -- Shadow of Elune
			[569] = 6.38, -- Clockwork Heart
			[104] = 0.03, -- Bracing Chill
			[44] = 0.09, -- Vampiric Speed
			[444] = 5.66, -- Crashing Chaos
			[42] = 0.01, -- Savior
			[495] = 4.52, -- Anduin's Dedication
			[483] = 4.97, -- Archive of the Titans
			[494] = 5.02, -- Battlefield Precision
			[86] = 0.06, -- Azerite Fortification
			[21] = 3.2, -- Elemental Whirl
			[83] = 0.12, -- Impassive Visage
			[577] = 6.75, -- Arcane Heart
			[461] = 1.29, -- Earthlink
			[576] = 3.95, -- Loyal to the End
			[531] = 0.02, -- Terror of the Mind
			[568] = 0.19, -- Person-Computer Interface
			[156] = 3.33, -- Ruinous Bolt
			[432] = 6.64, -- Chaotic Inferno
			[43] = 0.27, -- Winds of War
			[19] = 0.14, -- Woundbinder
			[575] = 8.56, -- Undulating Tides
			[460] = 6.23, -- Bursting Flare
			[500] = 2.67, -- Synaptic Spark Capacitor
			[463] = 0.05, -- Blessed Portents
			[98] = 0.04, -- Crystalline Carapace
			[82] = 9.28, -- Champion of Azeroth
			[131] = 6.18, -- Chaos Shards
			[30] = 5.35, -- Overwhelming Power
			[522] = 10, -- Ancients' Bulwark
			[541] = 1.61, -- Fight or Flight
			[497] = 1.29, -- Stand As One
			[87] = 0.05, -- Self Reliance
			[479] = 6.31, -- Dagger in the Back
			[481] = 5.21, -- Incite the Pack
			[105] = 0.15, -- Ephemeral Recovery
			[38] = 2.85, -- On My Way
			[502] = 0.09, -- Personal Absorb-o-Tron
			[14] = 0.16, -- Longstrider
			[15] = 0.26, -- Resounding Protection
			[20] = 3.47, -- Lifespeed
			[99] = 0.05, -- Ablative Shielding
			[459] = 3.6, -- Unstable Flames
			[498] = 3.19, -- Barrage Of Many Bombs
			[196] = 8.9, -- Swirling Sands
			[208] = 0.13, -- Lifeblood
			[157] = 5.84, -- Rezan's Fury
			[501] = 7.56, -- Relational Normalization Gizmo
			[192] = 8.06, -- Meticulous Scheming
			[562] = 7.2, -- Treacherous Covenant
			[561] = 3.87, -- Seductive Power
			[22] = 2.12, -- Heed My Call
			[85] = 0.17, -- Gemhide
		}, { -- Azerite Essences
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 16989 - 18934 (avg 18020), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[32] = { 2.47, 2.4 }, -- Conflict and Strife
			[23] = { 3.32, 0.7 }, -- Blood of the Enemy
			[12] = { 3.82, 2.05 }, -- The Crucible of Flame
			[36] = { 1.12, 1.07 }, -- Spark of Inspiration
			[5] = { 7.38, 4.21 }, -- Essence of the Focusing Iris
			[27] = { 7.94, 2.01 }, -- Memory of Lucid Dreams
			[6] = { 3.36, 1.81 }, -- Purification Protocol
			[15] = { 1.9, 0 }, -- Ripple in Space
			[28] = { 3.02, 1.65 }, -- The Unbound Force
			[22] = { 10, 4.07 }, -- Vision of Perfection
			[35] = { 6.03, 3.79 }, -- Breath of the Dying
			[37] = { 2.37, 2.33 }, -- The Formless Void
			[4] = { 3.35, 0.87 }, -- Worldvein Resonance
			[14] = { 4.4, 2.07 }, -- Condensed Life-Force
		}, 1580637600)

		insertDefaultScalesData(defaultName, 1, 1, { -- Arms Warrior
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 4033 - 5324 (avg 4464), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[121] = 4.9, -- Striking the Anvil
			[582] = 5.8, -- Heart of Darkness
			[503] = 0.19, -- Auto-Self-Cauterizer
			[22] = 2.14, -- Heed My Call
			[481] = 4.76, -- Incite the Pack
			[505] = 5.19, -- Tradewinds
			[156] = 2.09, -- Ruinous Bolt
			[476] = 0.07, -- Moment of Glory
			[575] = 7.18, -- Undulating Tides
			[434] = 6.33, -- Crushing Assault
			[459] = 2.25, -- Unstable Flames
			[569] = 4.96, -- Clockwork Heart
			[433] = 3.27, -- Seismic Wave
			[523] = 3.38, -- Apothecary's Concoctions
			[495] = 3.64, -- Anduin's Dedication
			[568] = 0.02, -- Person-Computer Interface
			[522] = 5.97, -- Ancients' Bulwark
			[485] = 3.96, -- Laser Matrix
			[498] = 3.02, -- Barrage Of Many Bombs
			[86] = 0.15, -- Azerite Fortification
			[521] = 4.16, -- Shadow of Elune
			[194] = 3.45, -- Filthy Transfusion
			[541] = 1.52, -- Fight or Flight
			[560] = 2.59, -- Bonded Souls
			[38] = 1.54, -- On My Way
			[14] = 0.05, -- Longstrider
			[21] = 2.16, -- Elemental Whirl
			[192] = 5.15, -- Meticulous Scheming
			[562] = 5.81, -- Treacherous Covenant
			[30] = 3.11, -- Overwhelming Power
			[554] = 0.18, -- Intimidating Presence
			[482] = 3.65, -- Thunderous Blast
			[480] = 4.1, -- Blood Rite
			[504] = 4.32, -- Unstable Catalyst
			[492] = 3.95, -- Liberator's Might
			[500] = 1.65, -- Synaptic Spark Capacitor
			[42] = 0.16, -- Savior
			[44] = 0.03, -- Vampiric Speed
			[89] = 0.08, -- Azerite Veins
			[435] = 2.84, -- Lord of War
			[195] = 3.84, -- Secrets of the Deep
			[15] = 0.19, -- Resounding Protection
			[83] = 0.04, -- Impassive Visage
			[501] = 4.86, -- Relational Normalization Gizmo
			[499] = 1.76, -- Ricocheting Inflatable Pyrosaw
			[497] = 1.12, -- Stand As One
			[103] = 0.31, -- Concentrated Mending
			[20] = 2.22, -- Lifespeed
			[85] = 0.1, -- Gemhide
			[576] = 3.49, -- Loyal to the End
			[101] = 0.04, -- Shimmering Haven
			[526] = 5.96, -- Endless Hunger
			[82] = 6.34, -- Champion of Azeroth
			[19] = 0.14, -- Woundbinder
			[100] = 0.1, -- Strength in Numbers
			[43] = 0.23, -- Winds of War
			[561] = 3.95, -- Seductive Power
			[226] = 10, -- Test of Might
			[502] = 0.09, -- Personal Absorb-o-Tron
			[105] = 0.12, -- Ephemeral Recovery
			[478] = 3.24, -- Tidal Surge
			[494] = 4.35, -- Battlefield Precision
			[479] = 4.52, -- Dagger in the Back
			[13] = 0.21, -- Azerite Empowered
			[31] = 2.07, -- Gutripper
			[196] = 5.57, -- Swirling Sands
			[461] = 1.32, -- Earthlink
			[174] = 3.11, -- Gathering Storm
			[98] = 0.17, -- Crystalline Carapace
			[493] = 2.72, -- Last Gift
			[483] = 4.25, -- Archive of the Titans
			[577] = 4.31, -- Arcane Heart
			[462] = 1.38, -- Azerite Globules
			[463] = 0.04, -- Blessed Portents
			[157] = 4.28, -- Rezan's Fury
			[193] = 6.24, -- Blightborne Infusion
			[18] = 1.94, -- Blood Siphon
			[477] = 0.04, -- Bury the Hatchet
			[496] = 1.64, -- Stronger Together
		}, { -- Azerite Essences
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 3977 - 4550 (avg 4341), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[22] = { 0.06, 0.09 }, -- Vision of Perfection
			[15] = { 3.17, 0 }, -- Ripple in Space
			[27] = { 10, 3.94 }, -- Memory of Lucid Dreams
			[36] = { 0.94, 0.98 }, -- Spark of Inspiration
			[32] = { 2.15, 2.2 }, -- Conflict and Strife
			[4] = { 5.15, 1.16 }, -- Worldvein Resonance
			[23] = { 4.95, 1.31 }, -- Blood of the Enemy
			[5] = { 7.71, 3.92 }, -- Essence of the Focusing Iris
			[6] = { 4.97, 2.31 }, -- Purification Protocol
			[37] = { 2.99, 3.04 }, -- The Formless Void
			[28] = { 4.28, 2.06 }, -- The Unbound Force
			[14] = { 6.41, 2.77 }, -- Condensed Life-Force
			[12] = { 5.47, 2.13 }, -- The Crucible of Flame
			[35] = { 8.32, 5.17 }, -- Breath of the Dying
		}, 1580637600)

		insertDefaultScalesData(defaultName, 1, 2, { -- Fury Warrior
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 4242 - 5449 (avg 4701), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[176] = 10, -- Cold Steel, Hot Blood
			[192] = 3.7, -- Meticulous Scheming
			[576] = 3.09, -- Loyal to the End
			[38] = 1.58, -- On My Way
			[498] = 3.37, -- Barrage Of Many Bombs
			[476] = 0.27, -- Moment of Glory
			[14] = 0.09, -- Longstrider
			[459] = 2.23, -- Unstable Flames
			[494] = 4.86, -- Battlefield Precision
			[194] = 3.52, -- Filthy Transfusion
			[492] = 3.42, -- Liberator's Might
			[15] = 0.02, -- Resounding Protection
			[438] = 5.35, -- Reckless Flurry
			[21] = 1.86, -- Elemental Whirl
			[99] = 0.06, -- Ablative Shielding
			[156] = 2.14, -- Ruinous Bolt
			[30] = 1.94, -- Overwhelming Power
			[582] = 5.27, -- Heart of Darkness
			[462] = 1.31, -- Azerite Globules
			[493] = 2.43, -- Last Gift
			[195] = 3.1, -- Secrets of the Deep
			[479] = 4.16, -- Dagger in the Back
			[526] = 5.65, -- Endless Hunger
			[481] = 4.11, -- Incite the Pack
			[103] = 0.05, -- Concentrated Mending
			[31] = 2.38, -- Gutripper
			[461] = 1.01, -- Earthlink
			[437] = 4.84, -- Simmering Rage
			[22] = 2.16, -- Heed My Call
			[501] = 3.5, -- Relational Normalization Gizmo
			[44] = 0.06, -- Vampiric Speed
			[569] = 4.83, -- Clockwork Heart
			[20] = 1.31, -- Lifespeed
			[505] = 4.62, -- Tradewinds
			[504] = 3.45, -- Unstable Catalyst
			[495] = 3.04, -- Anduin's Dedication
			[577] = 2.88, -- Arcane Heart
			[483] = 3.39, -- Archive of the Titans
			[229] = 3.97, -- Pulverizing Blows
			[500] = 1.92, -- Synaptic Spark Capacitor
			[560] = 1.58, -- Bonded Souls
			[82] = 5.68, -- Champion of Azeroth
			[522] = 5.6, -- Ancients' Bulwark
			[196] = 5.57, -- Swirling Sands
			[193] = 5.97, -- Blightborne Infusion
			[575] = 7.98, -- Undulating Tides
			[451] = 3.26, -- Infinite Fury
			[98] = 0.1, -- Crystalline Carapace
			[480] = 2.85, -- Blood Rite
			[561] = 3.18, -- Seductive Power
			[482] = 3.96, -- Thunderous Blast
			[499] = 1.9, -- Ricocheting Inflatable Pyrosaw
			[523] = 3.24, -- Apothecary's Concoctions
			[84] = 0.02, -- Bulwark of the Masses
			[157] = 4.72, -- Rezan's Fury
			[496] = 1.39, -- Stronger Together
			[541] = 1.12, -- Fight or Flight
			[119] = 5.9, -- Unbridled Ferocity
			[18] = 1.78, -- Blood Siphon
			[497] = 0.76, -- Stand As One
			[562] = 4.68, -- Treacherous Covenant
			[478] = 3.62, -- Tidal Surge
			[485] = 4.56, -- Laser Matrix
			[502] = 0.07, -- Personal Absorb-o-Tron
			[521] = 2.88, -- Shadow of Elune
		}, { -- Azerite Essences
			-- SimulationCraft 830-01 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 4109 - 4933 (avg 4626), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[14] = { 7.68, 4.02 }, -- Condensed Life-Force
			[22] = { 3.07, 0.95 }, -- Vision of Perfection
			[32] = { 2.68, 2.52 }, -- Conflict and Strife
			[35] = { 10, 7.61 }, -- Breath of the Dying
			[6] = { 6.43, 3.29 }, -- Purification Protocol
			[37] = { 3.18, 3.1 }, -- The Formless Void
			[36] = { 0.66, 0.8 }, -- Spark of Inspiration
			[12] = { 6.07, 3.03 }, -- The Crucible of Flame
			[28] = { 2.48, 0.84 }, -- The Unbound Force
			[23] = { 1.63, 1.72 }, -- Blood of the Enemy
			[4] = { 4.5, 1.13 }, -- Worldvein Resonance
			[5] = { 7.37, 3.15 }, -- Essence of the Focusing Iris
			[15] = { 2.53, 0 }, -- Ripple in Space
			[27] = { 6.89, 2.85 }, -- Memory of Lucid Dreams
		}, 1580637600)

		insertDefaultScalesData(offensiveName, 1, 3, { -- Protection Warrior
			-- SimulationCraft 830-02 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 26560 - 30339 (avg 29008), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 07.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[156] = 3.09, -- Ruinous Bolt
			[237] = 5.03, -- Bastion of Might
			[496] = 1.64, -- Stronger Together
			[482] = 5.32, -- Thunderous Blast
			[196] = 6.69, -- Swirling Sands
			[492] = 4.67, -- Liberator's Might
			[562] = 5.38, -- Treacherous Covenant
			[575] = 10, -- Undulating Tides
			[192] = 6.07, -- Meticulous Scheming
			[441] = 2.03, -- Iron Fortress
			[577] = 4.26, -- Arcane Heart
			[31] = 3.03, -- Gutripper
			[38] = 1.9, -- On My Way
			[30] = 3.59, -- Overwhelming Power
			[461] = 1.14, -- Earthlink
			[480] = 4.5, -- Blood Rite
			[21] = 2.12, -- Elemental Whirl
			[478] = 5.14, -- Tidal Surge
			[501] = 5.12, -- Relational Normalization Gizmo
			[523] = 4.34, -- Apothecary's Concoctions
			[82] = 6.54, -- Champion of Azeroth
			[497] = 0.81, -- Stand As One
			[495] = 3.32, -- Anduin's Dedication
			[498] = 4.14, -- Barrage Of Many Bombs
			[493] = 1.76, -- Last Gift
			[494] = 5.67, -- Battlefield Precision
			[561] = 3.16, -- Seductive Power
			[479] = 3.75, -- Dagger in the Back
			[118] = 1.94, -- Deafening Crash
			[560] = 2.7, -- Bonded Souls
			[440] = 1.37, -- Callous Reprisal
			[505] = 3.68, -- Tradewinds
			[481] = 3.5, -- Incite the Pack
			[194] = 5.1, -- Filthy Transfusion
			[22] = 2.73, -- Heed My Call
			[459] = 2.38, -- Unstable Flames
			[569] = 5.43, -- Clockwork Heart
			[157] = 6.17, -- Rezan's Fury
			[521] = 4.57, -- Shadow of Elune
			[504] = 3.74, -- Unstable Catalyst
			[522] = 7.11, -- Ancients' Bulwark
			[541] = 1, -- Fight or Flight
			[193] = 7.53, -- Blightborne Infusion
			[526] = 7.26, -- Endless Hunger
			[20] = 2.3, -- Lifespeed
			[18] = 1.59, -- Blood Siphon
			[582] = 6.51, -- Heart of Darkness
			[105] = 0.03, -- Ephemeral Recovery
			[450] = 4.43, -- Brace for Impact
			[500] = 2.76, -- Synaptic Spark Capacitor
			[485] = 5.68, -- Laser Matrix
			[499] = 2.2, -- Ricocheting Inflatable Pyrosaw
			[483] = 3.99, -- Archive of the Titans
			[462] = 1.69, -- Azerite Globules
			[15] = 0.06, -- Resounding Protection
			[576] = 2.67, -- Loyal to the End
			[195] = 3.61, -- Secrets of the Deep
			[98] = 0.1, -- Crystalline Carapace
		}, { -- Azerite Essences
			-- SimulationCraft 830-02 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 26441 - 29766 (avg 28927), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 07.02.2020, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[25] = { 1.25, 1.38 }, -- Aegis of the Deep
			[27] = { 2.4, 0.77 }, -- Memory of Lucid Dreams
			[34] = { 0, 0.03 }, -- Strength of the Warden
			[15] = { 4.09, 0.15 }, -- Ripple in Space
			[4] = { 4.33, 1.23 }, -- Worldvein Resonance
			[32] = { 2.93, 3.09 }, -- Conflict and Strife
			[37] = { 3.23, 3.34 }, -- The Formless Void
			[7] = { 3.63, 0 }, -- Anima of Life and Death
			[12] = { 10, 3.58 }, -- The Crucible of Flame
			[13] = { 0, 0.05 }, -- Nullification Dynamo
			[3] = { 7.48, 7.47 }, -- Sphere of Suppression
			[22] = { 8.09, 5.47 }, -- Vision of Perfection
		}, 1581069600)

		insertDefaultScalesData(defensiveName, 12, 2, { -- Vengeance Demon Hunter (TMI)
			-- SimulationCraft 830-02 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 2300 - 2610 (avg 2506), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 07.02.2020, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[522] = 4.05, -- Ancients' Bulwark
			[202] = 3.58, -- Soulmonger
			[30] = 7.9, -- Overwhelming Power
			[21] = 7.94, -- Elemental Whirl
			[482] = 9.41, -- Thunderous Blast
			[493] = 0.7, -- Last Gift
			[462] = 4.55, -- Azerite Globules
			[87] = 0.08, -- Self Reliance
			[20] = 3.4, -- Lifespeed
			[98] = 10, -- Crystalline Carapace
			[564] = 1.88, -- Thrive in Chaos
			[195] = 7.54, -- Secrets of the Deep
			[485] = 2.61, -- Laser Matrix
			[504] = 2.38, -- Unstable Catalyst
			[492] = 5.24, -- Liberator's Might
			[44] = 5.71, -- Vampiric Speed
			[85] = 1.31, -- Gemhide
			[463] = 5.18, -- Blessed Portents
			[523] = 2.95, -- Apothecary's Concoctions
			[541] = 7.21, -- Fight or Flight
			[38] = 6.82, -- On My Way
			[15] = 5.97, -- Resounding Protection
			[499] = 8.42, -- Ricocheting Inflatable Pyrosaw
			[355] = 0.82, -- Essence Sever
			[498] = 4.47, -- Barrage Of Many Bombs
			[31] = 0.48, -- Gutripper
			[466] = 7.93, -- Burning Soul
			[526] = 0.42, -- Endless Hunger
			[561] = 3.84, -- Seductive Power
			[479] = 3.97, -- Dagger in the Back
			[582] = 7.4, -- Heart of Darkness
			[18] = 2.65, -- Blood Siphon
			[480] = 2.33, -- Blood Rite
			[13] = 9.16, -- Azerite Empowered
			[157] = 6.13, -- Rezan's Fury
			[100] = 0.83, -- Strength in Numbers
			[105] = 2.83, -- Ephemeral Recovery
			[576] = 9.9, -- Loyal to the End
			[521] = 5.67, -- Shadow of Elune
			[494] = 0.23, -- Battlefield Precision
			[503] = 0.56, -- Auto-Self-Cauterizer
			[42] = 1.97, -- Savior
			[82] = 4.96, -- Champion of Azeroth
			[483] = 6.77, -- Archive of the Titans
			[562] = 3.62, -- Treacherous Covenant
			[500] = 5.94, -- Synaptic Spark Capacitor
			[505] = 2.06, -- Tradewinds
			[246] = 1.79, -- Hour of Reaping
			[497] = 4.65, -- Stand As One
			[502] = 6.04, -- Personal Absorb-o-Tron
			[496] = 4.22, -- Stronger Together
			[569] = 2.59, -- Clockwork Heart
			[192] = 5.48, -- Meticulous Scheming
			[481] = 3.09, -- Incite the Pack
			[156] = 9.76, -- Ruinous Bolt
		}, { -- Azerite Essences
			-- SimulationCraft 830-02 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 2400 - 2604 (avg 2509), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 07.02.2020, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[22] = { 6.29, 3.31 }, -- Vision of Perfection
			[33] = { 0.93, 4.81 }, -- Touch of the Everlasting
			[2] = { 1.12, 0.97 }, -- Azeroth's Undying Gift
			[34] = { 2.28, 0 }, -- Strength of the Warden
			[15] = { 1.67, 6.58 }, -- Ripple in Space
			[37] = { 0, 6.72 }, -- The Formless Void
			[12] = { 0.27, 10 }, -- The Crucible of Flame
			[25] = { 7.23, 5.71 }, -- Aegis of the Deep
			[4] = { 0, 3.96 }, -- Worldvein Resonance
			[3] = { 4.84, 3.42 }, -- Sphere of Suppression
			[13] = { 1.08, 0 }, -- Nullification Dynamo
			[27] = { 5.99, 7.9 }, -- Memory of Lucid Dreams
			[32] = { 0, 6.55 }, -- Conflict and Strife
			[7] = { 0, 7.8 }, -- Anima of Life and Death
		}, 1581069600)

		insertDefaultScalesData(defensiveName, 11, 3, { -- Guardian Druid (TMI)
			-- SimulationCraft 830-02 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 1802 - 2436 (avg 2030), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 07.02.2020, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[495] = 5.92, -- Anduin's Dedication
			[100] = 2.67, -- Strength in Numbers
			[575] = 0.44, -- Undulating Tides
			[463] = 0.08, -- Blessed Portents
			[568] = 5.02, -- Person-Computer Interface
			[561] = 4.94, -- Seductive Power
			[361] = 2.44, -- Guardian's Wrath
			[481] = 5.32, -- Incite the Pack
			[480] = 1.49, -- Blood Rite
			[492] = 0.54, -- Liberator's Might
			[462] = 8, -- Azerite Globules
			[496] = 2.15, -- Stronger Together
			[193] = 1.6, -- Blightborne Infusion
			[569] = 4.72, -- Clockwork Heart
			[479] = 0.31, -- Dagger in the Back
			[30] = 1.64, -- Overwhelming Power
			[540] = 6.3, -- Switch Hitter
			[42] = 0.32, -- Savior
			[192] = 2.83, -- Meticulous Scheming
			[85] = 0.91, -- Gemhide
			[13] = 7.27, -- Azerite Empowered
			[461] = 3.87, -- Earthlink
			[101] = 10, -- Shimmering Haven
			[83] = 0.04, -- Impassive Visage
			[43] = 1.49, -- Winds of War
			[14] = 1.46, -- Longstrider
			[505] = 1.9, -- Tradewinds
			[503] = 2.39, -- Auto-Self-Cauterizer
			[21] = 4.99, -- Elemental Whirl
			[44] = 6.46, -- Vampiric Speed
			[86] = 3.84, -- Azerite Fortification
			[560] = 4.65, -- Bonded Souls
			[541] = 5.85, -- Fight or Flight
			[15] = 9.04, -- Resounding Protection
			[504] = 4.63, -- Unstable Catalyst
			[498] = 2.06, -- Barrage Of Many Bombs
			[31] = 6.61, -- Gutripper
			[522] = 0.76, -- Ancients' Bulwark
			[360] = 0.41, -- Gory Regeneration
			[499] = 2.56, -- Ricocheting Inflatable Pyrosaw
			[18] = 1.27, -- Blood Siphon
			[196] = 3.72, -- Swirling Sands
		}, { -- Azerite Essences
			-- SimulationCraft 830-02 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 1900 - 2203 (avg 2045), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 07.02.2020, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[37] = { 3.45, 0 }, -- The Formless Void
			[13] = { 0, 3.06 }, -- Nullification Dynamo
			[34] = { 2.53, 0 }, -- Strength of the Warden
			[12] = { 6.27, 10 }, -- The Crucible of Flame
			[25] = { 1.97, 0 }, -- Aegis of the Deep
			[15] = { 0, 6.46 }, -- Ripple in Space
			[4] = { 2.28, 0 }, -- Worldvein Resonance
			[27] = { 1.86, 3.33 }, -- Memory of Lucid Dreams
			[33] = { 0, 5.93 }, -- Touch of the Everlasting
			[2] = { 1.57, 1.89 }, -- Azeroth's Undying Gift
			[22] = { 0, 2.13 }, -- Vision of Perfection
		}, 1581069600)

		insertDefaultScalesData(defensiveName, 10, 1, { -- Brewmaster Monk (TMI)
			-- SimulationCraft 830-02 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 3400 - 3802 (avg 3548), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 07.02.2020, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[504] = 2.74, -- Unstable Catalyst
			[14] = 2.16, -- Longstrider
			[156] = 6.84, -- Ruinous Bolt
			[526] = 0.04, -- Endless Hunger
			[470] = 4.2, -- Sweep the Leg
			[502] = 2.66, -- Personal Absorb-o-Tron
			[462] = 8.05, -- Azerite Globules
			[85] = 0.83, -- Gemhide
			[13] = 0.61, -- Azerite Empowered
			[192] = 6.27, -- Meticulous Scheming
			[84] = 0.97, -- Bulwark of the Masses
			[105] = 1.85, -- Ephemeral Recovery
			[18] = 7.36, -- Blood Siphon
			[479] = 3.61, -- Dagger in the Back
			[186] = 0.51, -- Staggering Strikes
			[116] = 4.73, -- Boiling Brew
			[495] = 7.43, -- Anduin's Dedication
			[196] = 5.26, -- Swirling Sands
			[43] = 1.85, -- Winds of War
			[499] = 3.86, -- Ricocheting Inflatable Pyrosaw
			[560] = 7.57, -- Bonded Souls
			[576] = 4.36, -- Loyal to the End
			[481] = 1.71, -- Incite the Pack
			[42] = 1.88, -- Savior
			[86] = 6.08, -- Azerite Fortification
			[15] = 0.61, -- Resounding Protection
			[157] = 2.81, -- Rezan's Fury
			[382] = 1.16, -- Straight, No Chaser
			[218] = 0.26, -- Strength of Spirit
			[496] = 0.41, -- Stronger Together
			[30] = 2.18, -- Overwhelming Power
			[31] = 4.29, -- Gutripper
			[577] = 3.69, -- Arcane Heart
			[384] = 7.38, -- Elusive Footwork
			[19] = 2.95, -- Woundbinder
			[482] = 4.03, -- Thunderous Blast
			[521] = 10, -- Shadow of Elune
		}, { -- Azerite Essences
			-- SimulationCraft 830-02 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 3400 - 3703 (avg 3542), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 07.02.2020, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[27] = { 1.45, 0 }, -- Memory of Lucid Dreams
			[22] = { 0, 0.47 }, -- Vision of Perfection
			[13] = { 10, 5.74 }, -- Nullification Dynamo
			[3] = { 1.18, 4.1 }, -- Sphere of Suppression
			[2] = { 0, 2.42 }, -- Azeroth's Undying Gift
			[34] = { 0.43, 9.21 }, -- Strength of the Warden
			[4] = { 0, 0.46 }, -- Worldvein Resonance
			[7] = { 6.84, 0 }, -- Anima of Life and Death
			[33] = { 7.34, 0 }, -- Touch of the Everlasting
			[15] = { 6.69, 0 }, -- Ripple in Space
		}, 1581069600)

		insertDefaultScalesData(defensiveName, 2, 2, { -- Protection Paladin (TMI)
			-- SimulationCraft 830-02 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 32202 - 33500 (avg 32750), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 08.02.2020, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[89] = 3.82, -- Azerite Veins
			[395] = 5.24, -- Inspiring Vanguard
			[86] = 1.86, -- Azerite Fortification
			[82] = 1.36, -- Champion of Azeroth
			[44] = 5.16, -- Vampiric Speed
			[43] = 7.77, -- Winds of War
			[494] = 3.71, -- Battlefield Precision
			[496] = 7.84, -- Stronger Together
			[100] = 2.39, -- Strength in Numbers
			[504] = 7.11, -- Unstable Catalyst
			[98] = 4.07, -- Crystalline Carapace
			[538] = 2.82, -- Empyreal Ward
			[105] = 2.32, -- Ephemeral Recovery
			[133] = 8.25, -- Bulwark of Light
			[156] = 4.58, -- Ruinous Bolt
			[471] = 5.56, -- Gallant Steed
			[20] = 1.46, -- Lifespeed
			[454] = 0.49, -- Judicious Defense
			[495] = 2.59, -- Anduin's Dedication
			[13] = 1.86, -- Azerite Empowered
			[196] = 1.56, -- Swirling Sands
			[14] = 3.44, -- Longstrider
			[478] = 2.53, -- Tidal Surge
			[150] = 3.14, -- Soaring Shield
			[575] = 4.54, -- Undulating Tides
			[483] = 5.38, -- Archive of the Titans
			[99] = 10, -- Ablative Shielding
			[38] = 3.98, -- On My Way
			[502] = 5.84, -- Personal Absorb-o-Tron
			[193] = 6.2, -- Blightborne Infusion
			[18] = 1.18, -- Blood Siphon
			[499] = 5.78, -- Ricocheting Inflatable Pyrosaw
			[521] = 0.75, -- Shadow of Elune
			[393] = 7.45, -- Grace of the Justicar
			[206] = 3.65, -- Stalwart Protector
			[569] = 0.3, -- Clockwork Heart
			[85] = 1.34, -- Gemhide
			[485] = 0.93, -- Laser Matrix
			[526] = 2.45, -- Endless Hunger
			[498] = 0.38, -- Barrage Of Many Bombs
			[157] = 2.62, -- Rezan's Fury
			[463] = 2.13, -- Blessed Portents
			[83] = 6, -- Impassive Visage
			[577] = 1.2, -- Arcane Heart
			[84] = 0.33, -- Bulwark of the Masses
			[19] = 0.58, -- Woundbinder
			[459] = 3.68, -- Unstable Flames
			[31] = 3.72, -- Gutripper
			[582] = 1.17, -- Heart of Darkness
			[461] = 4.05, -- Earthlink
			[541] = 1.94, -- Fight or Flight
			[189] = 1.62, -- Righteous Conviction
			[103] = 4.31, -- Concentrated Mending
			[560] = 3.99, -- Bonded Souls
			[497] = 0.63, -- Stand As One
			[235] = 5.25, -- Indomitable Justice
			[505] = 4.92, -- Tradewinds
			[234] = 7.8, -- Inner Light
			[493] = 8.68, -- Last Gift
			[522] = 7.64, -- Ancients' Bulwark
			[21] = 3.63, -- Elemental Whirl
			[101] = 4.63, -- Shimmering Haven
			[30] = 2.46, -- Overwhelming Power
			[492] = 3.83, -- Liberator's Might
			[500] = 4.95, -- Synaptic Spark Capacitor
			[561] = 4.08, -- Seductive Power
			[480] = 0.54, -- Blood Rite
			[87] = 4.35, -- Self Reliance
			[194] = 2.36, -- Filthy Transfusion
			[576] = 0.32, -- Loyal to the End
			[15] = 6.03, -- Resounding Protection
		}, { -- Azerite Essences
			-- SimulationCraft 830-02 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 32100 - 33202 (avg 32736), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 08.02.2020, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[7] = { 5.48, 2.62 }, -- Anima of Life and Death
			[3] = { 0, 4.96 }, -- Sphere of Suppression
			[2] = { 4.21, 0 }, -- Azeroth's Undying Gift
			[32] = { 0, 2.33 }, -- Conflict and Strife
			[37] = { 1.2, 0.22 }, -- The Formless Void
			[25] = { 6.24, 0 }, -- Aegis of the Deep
			[33] = { 7.98, 2.58 }, -- Touch of the Everlasting
			[12] = { 2.32, 10 }, -- The Crucible of Flame
			[15] = { 4.68, 3.82 }, -- Ripple in Space
			[34] = { 1.77, 0 }, -- Strength of the Warden
			[27] = { 2.48, 3.66 }, -- Memory of Lucid Dreams
			[4] = { 4.31, 4.5 }, -- Worldvein Resonance
			[22] = { 1.92, 3.14 }, -- Vision of Perfection
			[13] = { 4.65, 2.93 }, -- Nullification Dynamo
		}, 1581156000)

		insertDefaultScalesData(defensiveName, 1, 3, { -- Protection Warrior (TMI)
			-- SimulationCraft 830-02 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 28903 - 30007 (avg 29506), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 08.02.2020, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[560] = 10, -- Bonded Souls
			[526] = 0.35, -- Endless Hunger
		}, { -- Azerite Essences
			-- SimulationCraft 830-02 for World of Warcraft 8.3.0 Live (wow build 33051)
			-- Iterations: 29100 - 30103 (avg 29530), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 08.02.2020, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[37] = { 0, 10 }, -- The Formless Void
		}, 1581156000)

		insertDefaultScalesData(defaultName, 5, 3, { -- Shadow Priest
			-- Shadow Priest by WarcraftPriests (https://warcraftpriests.com/)
			-- https://github.com/WarcraftPriests/bfa-shadow-priest/blob/master/azerite-traits/AzeritePowerWeights_AS.md
			-- First Imported: 03.09.2018, Updated: 14.02.2020
			[575] = 4.96,
			[405] = 4.93,
			[193] = 4.81,
			[236] = 4.49,
			[82] = 4.48,
			[196] = 4.33,
			[522] = 4.29,
			[526] = 4.28,
			[569] = 3.77,
			[192] = 3.7,
			[479] = 3.42,
			[488] = 3.32,
			[501] = 3.3,
			[157] = 3.09,
			[480] = 2.9,
			[521] = 2.89,
			[505] = 2.89,
			[486] = 2.88,
			[481] = 2.72,
			[523] = 2.68,
			[482] = 2.66,
			[577] = 2.63,
			[194] = 2.6,
			[504] = 2.56,
			[478] = 2.41,
			[404] = 2.37,
			[403] = 2.34,
			[195] = 2.31,
			[30] = 2.23,
			[489] = 2.2,
			[498] = 2.06,
			[459] = 1.68,
			[487] = 1.57,
			[31] = 1.53,
			[21] = 1.49,
			[156] = 1.47,
			[22] = 1.39,
			[500] = 1.31,
			[38] = 1.24,
			[499] = 1.24,
			[490] = 1.11,
			[18] = 1.05,
			[166] = 1.02,
			[491] = 1.02,
			[462] = 0.95,
			[541] = 0.9,
			[461] = 0.75,
			[13] = 0.36,
			[115] = 0.04,
			[582] = 0.01,
		}, {
		}, 1581674400)

		insertDefaultScalesData(defensiveName, 6, 1, { -- Blood Death Knight
			-- Blood Death Knight by Acherus
			-- https://github.com/ahakola/AzeritePowerWeights/pull/3
			-- First Imported: 07.09.2019, Updated: 07.09.2019
			[560] = 2.25,
			[243] = 2.5,
			[481] = 5.85,
			[196] = 3.81,
			[193] = 4.12,
			[461] = 0.72,
			[496] = 1.05,
			[43] = 0.11,
			[83] = 10,
			[349] = 1,
			[197] = 0.3,
			[495] = 1.99,
			[82] = 6.03,
			[15] = 10,
			[348] = 2,
			[18] = 5.65,
			[526] = 3.6,
			[577] = 0.92,
			[561] = 4.22,
			[30] = 3.86,
			[192] = 5.2,
			[505] = 6.41,
			[501] = 4.85,
			[493] = 3.5,
			[521] = 4.16,
			[497] = 0.9,
			[459] = 1.6,
			[195] = 2.38,
			[201] = 0.04,
			[106] = 3.85,
			[492] = 3.38,
			[21] = 1.77,
			[480] = 3.98,
			[140] = 2.69,
			[485] = 0.06,
			[44] = 3,
			[498] = 0.08,
			[19] = 0.06,
			[504] = 2.8,
			[20] = 2.2,
			[541] = 0.91,
			[562] = 3.78,
			[479] = 0.01,
			[569] = 4.52,
			[522] = 3.34,
			[38] = 0.81,
			[22] = 0.05,
			[576] = 4.35,
			[483] = 3.04,
			[104] = 0.13,
		}, {
			[32] = { 0.71, 3.7 },
			[3] = { 1.2, 0.5 },
			[7] = { 0.7, 0.3 },
			[4] = { 0.69, 0.48 },
			[25] = { 0.36, 2.5 },
			[12] = { 3, 1.7 },
			[2] = { 1.2, 0.03 },
			[22] = { 0.4, 0 },
			[15] = { 0.56, 0 },
			[27] = { 1.5, 0.7 },
		}, 1581674400)


		insertDefaultScalesData(defaultName, 2, 1, { -- Holy Paladin

		}, {})

		insertDefaultScalesData(defaultName, 5, 1, { -- Discipline Priest

		}, {})

		insertDefaultScalesData(defaultName, 5, 2, { -- Holy Priest

		}, {})

		insertDefaultScalesData(defaultName, 7, 3, { -- Restoration Shaman

		}, {})

		insertDefaultScalesData(defaultName, 10, 2, { -- Mistweaver Monk

		}, {})

		insertDefaultScalesData(defaultName, 11, 4, { -- Restoration Druid

		}, {})

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