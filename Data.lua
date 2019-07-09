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
-- 8.2 Azerite Essences
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
	},
	["healer"] = {
		{
			["essenceID"] = 17,
			["name"] = "The Ever-Rising Tide",
			["icon"] = 2967108,
		}, -- [1]
		{
			["essenceID"] = 18,
			["name"] = "Artifice of Time",
			["icon"] = 2967112,
		}, -- [2]
		{
			["essenceID"] = 19,
			["name"] = "The Well of Existence",
			["icon"] = 516796,
		}, -- [3]
		{
			["essenceID"] = 20,
			["name"] = "Life-Binder's Invocation",
			["icon"] = 2967106,
		}, -- [4]
		{
			["essenceID"] = 21,
			["name"] = "Vitality Conduit",
			["icon"] = 2967100,
		}, -- [5]
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
	},
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
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 3154 - 5462 (avg 4045), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[99] = 0.04, -- Ablative Shielding
			[505] = 4.4, -- Tradewinds
			[30] = 4.59, -- Overwhelming Power
			[202] = 0.03, -- Soulmonger
			[560] = 2.57, -- Bonded Souls
			[13] = 0.05, -- Azerite Empowered
			[478] = 7.93, -- Tidal Surge
			[196] = 6.65, -- Swirling Sands
			[44] = 0.1, -- Vampiric Speed
			[497] = 1.75, -- Stand As One
			[126] = 8.37, -- Revolving Blades
			[18] = 1.74, -- Blood Siphon
			[496] = 1.56, -- Stronger Together
			[462] = 2.62, -- Azerite Globules
			[87] = 0.09, -- Self Reliance
			[20] = 2.14, -- Lifespeed
			[195] = 6.44, -- Secrets of the Deep
			[21] = 2.29, -- Elemental Whirl
			[43] = 0.06, -- Winds of War
			[483] = 6.86, -- Archive of the Titans
			[353] = 4.93, -- Eyes of Rage
			[541] = 2.38, -- Fight or Flight
			[561] = 5.74, -- Seductive Power
			[157] = 8.47, -- Rezan's Fury
			[498] = 5.58, -- Barrage Of Many Bombs
			[82] = 6.63, -- Champion of Azeroth
			[352] = 9.58, -- Thirsting Blades
			[494] = 8.69, -- Battlefield Precision
			[220] = 7.51, -- Chaotic Transformation
			[562] = 10, -- Treacherous Covenant
			[499] = 3.4, -- Ricocheting Inflatable Pyrosaw
			[504] = 7.3, -- Unstable Catalyst
			[500] = 4.29, -- Synaptic Spark Capacitor
			[31] = 4.2, -- Gutripper
			[482] = 7.1, -- Thunderous Blast
			[492] = 4.46, -- Liberator's Might
			[245] = 7.01, -- Seething Power
			[480] = 4.6, -- Blood Rite
			[192] = 3.41, -- Meticulous Scheming
			[98] = 0.1, -- Crystalline Carapace
			[22] = 3.79, -- Heed My Call
			[159] = 9.93, -- Furious Gaze
			[85] = 0.18, -- Gemhide
			[502] = 0.21, -- Personal Absorb-o-Tron
			[495] = 6.16, -- Anduin's Dedication
			[15] = 0.19, -- Resounding Protection
			[466] = 0.11, -- Burning Soul
			[501] = 6.47, -- Relational Normalization Gizmo
			[485] = 7.7, -- Laser Matrix
			[84] = 0.17, -- Bulwark of the Masses
			[86] = 0.06, -- Azerite Fortification
			[194] = 7.16, -- Filthy Transfusion
			[522] = 8.03, -- Ancients' Bulwark
			[160] = 0.22, -- Infernal Armor
			[193] = 7.32, -- Blightborne Infusion
			[521] = 4.69, -- Shadow of Elune
			[481] = 4.04, -- Incite the Pack
			[493] = 2.31, -- Last Gift
			[479] = 8.87, -- Dagger in the Back
			[156] = 4.71, -- Ruinous Bolt
			[526] = 8.14, -- Endless Hunger
			[459] = 2.65, -- Unstable Flames
			[523] = 6.84, -- Apothecary's Concoctions
			[461] = 2.38, -- Earthlink
		}, {}, 1557133200)

		insertDefaultScalesData(offensiveName, 12, 2, { -- Vengeance Demon Hunter
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 4819 - 7946 (avg 5415), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[492] = 3.95, -- Liberator's Might
			[246] = 0.04, -- Hour of Reaping
			[196] = 6.75, -- Swirling Sands
			[497] = 1.28, -- Stand As One
			[21] = 1.97, -- Elemental Whirl
			[31] = 4.6, -- Gutripper
			[160] = 0.1, -- Infernal Armor
			[480] = 3.66, -- Blood Rite
			[496] = 1.16, -- Stronger Together
			[494] = 9.7, -- Battlefield Precision
			[482] = 8.25, -- Thunderous Blast
			[501] = 5.3, -- Relational Normalization Gizmo
			[82] = 6, -- Champion of Azeroth
			[503] = 0.06, -- Auto-Self-Cauterizer
			[84] = 0.05, -- Bulwark of the Masses
			[20] = 1.37, -- Lifespeed
			[500] = 7.61, -- Synaptic Spark Capacitor
			[22] = 4.23, -- Heed My Call
			[522] = 6.15, -- Ancients' Bulwark
			[504] = 6.1, -- Unstable Catalyst
			[485] = 8.58, -- Laser Matrix
			[193] = 7.34, -- Blightborne Infusion
			[192] = 4.83, -- Meticulous Scheming
			[562] = 8.23, -- Treacherous Covenant
			[194] = 8.87, -- Filthy Transfusion
			[499] = 3.73, -- Ricocheting Inflatable Pyrosaw
			[354] = 0.02, -- Cycle of Binding
			[195] = 5.45, -- Secrets of the Deep
			[461] = 1.83, -- Earthlink
			[483] = 5.82, -- Archive of the Titans
			[157] = 9.76, -- Rezan's Fury
			[502] = 0.01, -- Personal Absorb-o-Tron
			[459] = 2.66, -- Unstable Flames
			[526] = 6.23, -- Endless Hunger
			[561] = 4.38, -- Seductive Power
			[493] = 2.55, -- Last Gift
			[478] = 10, -- Tidal Surge
			[30] = 3.2, -- Overwhelming Power
			[505] = 4.71, -- Tradewinds
			[560] = 1.57, -- Bonded Souls
			[498] = 6.13, -- Barrage Of Many Bombs
			[18] = 1.81, -- Blood Siphon
			[14] = 0.01, -- Longstrider
			[481] = 4.36, -- Incite the Pack
			[156] = 5.92, -- Ruinous Bolt
			[523] = 6.92, -- Apothecary's Concoctions
			[521] = 3.53, -- Shadow of Elune
			[541] = 1.92, -- Fight or Flight
			[15] = 0.03, -- Resounding Protection
			[462] = 2.83, -- Azerite Globules
			[83] = 0.04, -- Impassive Visage
			[479] = 7.02, -- Dagger in the Back
			[87] = 0.01, -- Self Reliance
			[495] = 5.27, -- Anduin's Dedication
		}, {}, 1557133200)

		insertDefaultScalesData(offensiveName, 6, 1, { -- Blood Death Knight
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 6999 - 10299 (avg 7598), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[465] = 0.05, -- March of the Damned
			[349] = 0.49, -- Bones of the Damned
			[479] = 7.34, -- Dagger in the Back
			[196] = 6.7, -- Swirling Sands
			[504] = 5.46, -- Unstable Catalyst
			[501] = 5.69, -- Relational Normalization Gizmo
			[85] = 0.11, -- Gemhide
			[348] = 5.38, -- Eternal Rune Weapon
			[521] = 4.43, -- Shadow of Elune
			[86] = 0.05, -- Azerite Fortification
			[499] = 3.93, -- Ricocheting Inflatable Pyrosaw
			[523] = 8.13, -- Apothecary's Concoctions
			[30] = 4.17, -- Overwhelming Power
			[485] = 8.86, -- Laser Matrix
			[541] = 1.84, -- Fight or Flight
			[98] = 0.1, -- Crystalline Carapace
			[101] = 0.07, -- Shimmering Haven
			[483] = 5.39, -- Archive of the Titans
			[14] = 0.04, -- Longstrider
			[243] = 5.06, -- Bloody Runeblade
			[201] = 0.02, -- Runic Barrier
			[461] = 1.69, -- Earthlink
			[156] = 5.77, -- Ruinous Bolt
			[493] = 2.42, -- Last Gift
			[21] = 2.34, -- Elemental Whirl
			[82] = 6.12, -- Champion of Azeroth
			[481] = 4.28, -- Incite the Pack
			[83] = 0.06, -- Impassive Visage
			[43] = 0.06, -- Winds of War
			[20] = 1.47, -- Lifespeed
			[505] = 4.51, -- Tradewinds
			[497] = 1.32, -- Stand As One
			[193] = 7.61, -- Blightborne Infusion
			[480] = 4.37, -- Blood Rite
			[140] = 1.18, -- Bone Spike Graveyard
			[106] = 2.89, -- Deep Cuts
			[526] = 6.61, -- Endless Hunger
			[462] = 2.92, -- Azerite Globules
			[22] = 4.48, -- Heed My Call
			[494] = 9.97, -- Battlefield Precision
			[500] = 5.33, -- Synaptic Spark Capacitor
			[562] = 7.63, -- Treacherous Covenant
			[478] = 9.72, -- Tidal Surge
			[192] = 5.42, -- Meticulous Scheming
			[99] = 0.12, -- Ablative Shielding
			[195] = 5.19, -- Secrets of the Deep
			[492] = 4.24, -- Liberator's Might
			[31] = 4.69, -- Gutripper
			[18] = 1.8, -- Blood Siphon
			[84] = 0.04, -- Bulwark of the Masses
			[459] = 2.69, -- Unstable Flames
			[560] = 2.33, -- Bonded Souls
			[482] = 8.7, -- Thunderous Blast
			[496] = 1.26, -- Stronger Together
			[498] = 6.51, -- Barrage Of Many Bombs
			[561] = 4.34, -- Seductive Power
			[495] = 4.82, -- Anduin's Dedication
			[522] = 6.63, -- Ancients' Bulwark
			[157] = 10, -- Rezan's Fury
			[194] = 9.21, -- Filthy Transfusion
		}, {}, 1557133200)

		insertDefaultScalesData(defaultName, 6, 2, { -- Frost Death Knight
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 15576 - 19535 (avg 16568), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[492] = 5.01, -- Liberator's Might
			[503] = 0.18, -- Auto-Self-Cauterizer
			[157] = 7.31, -- Rezan's Fury
			[101] = 0.23, -- Shimmering Haven
			[89] = 0.12, -- Azerite Veins
			[14] = 0.01, -- Longstrider
			[196] = 7.93, -- Swirling Sands
			[31] = 3.61, -- Gutripper
			[198] = 5.33, -- Frostwhelp's Indignation
			[482] = 6.24, -- Thunderous Blast
			[18] = 2.5, -- Blood Siphon
			[201] = 0.13, -- Runic Barrier
			[346] = 4.72, -- Killer Frost
			[156] = 4.59, -- Ruinous Bolt
			[493] = 3.61, -- Last Gift
			[108] = 5.43, -- Icy Citadel
			[242] = 4.8, -- Echoing Howl
			[141] = 5.62, -- Latent Chill
			[505] = 6.77, -- Tradewinds
			[85] = 0.1, -- Gemhide
			[13] = 0.02, -- Azerite Empowered
			[84] = 0.21, -- Bulwark of the Masses
			[504] = 7.68, -- Unstable Catalyst
			[549] = 0.14, -- Cold Hearted
			[44] = 0.15, -- Vampiric Speed
			[98] = 0.05, -- Crystalline Carapace
			[30] = 3.76, -- Overwhelming Power
			[347] = 6.07, -- Frozen Tempest
			[478] = 7.67, -- Tidal Surge
			[15] = 0.11, -- Resounding Protection
			[83] = 0.07, -- Impassive Visage
			[497] = 1.85, -- Stand As One
			[192] = 4.43, -- Meticulous Scheming
			[523] = 5.82, -- Apothecary's Concoctions
			[495] = 6.58, -- Anduin's Dedication
			[494] = 7.27, -- Battlefield Precision
			[561] = 5.34, -- Seductive Power
			[86] = 0.18, -- Azerite Fortification
			[502] = 0.06, -- Personal Absorb-o-Tron
			[43] = 0.21, -- Winds of War
			[193] = 8.86, -- Blightborne Infusion
			[526] = 8.27, -- Endless Hunger
			[479] = 7.61, -- Dagger in the Back
			[501] = 6.77, -- Relational Normalization Gizmo
			[481] = 6.36, -- Incite the Pack
			[480] = 4.58, -- Blood Rite
			[461] = 2.31, -- Earthlink
			[22] = 3.23, -- Heed My Call
			[82] = 7.88, -- Champion of Azeroth
			[21] = 2.86, -- Elemental Whirl
			[100] = 0.22, -- Strength in Numbers
			[496] = 1.73, -- Stronger Together
			[485] = 6.35, -- Laser Matrix
			[483] = 6.99, -- Archive of the Titans
			[500] = 4.27, -- Synaptic Spark Capacitor
			[87] = 0.08, -- Self Reliance
			[522] = 8.45, -- Ancients' Bulwark
			[459] = 3.28, -- Unstable Flames
			[521] = 4.73, -- Shadow of Elune
			[560] = 2.11, -- Bonded Souls
			[99] = 0.12, -- Ablative Shielding
			[195] = 6.57, -- Secrets of the Deep
			[499] = 2.92, -- Ricocheting Inflatable Pyrosaw
			[541] = 2.44, -- Fight or Flight
			[498] = 4.71, -- Barrage Of Many Bombs
			[462] = 2.08, -- Azerite Globules
			[20] = 2.31, -- Lifespeed
			[194] = 6.62, -- Filthy Transfusion
			[562] = 10, -- Treacherous Covenant
		}, {}, 1557133200)

		insertDefaultScalesData(defaultName, 6, 3, { -- Unholy Death Knight
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 8597 - 11754 (avg 9214), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[192] = 4.85, -- Meticulous Scheming
			[20] = 2.19, -- Lifespeed
			[504] = 6.39, -- Unstable Catalyst
			[461] = 2, -- Earthlink
			[194] = 6.54, -- Filthy Transfusion
			[485] = 6.31, -- Laser Matrix
			[560] = 2.06, -- Bonded Souls
			[496] = 1.24, -- Stronger Together
			[18] = 1.92, -- Blood Siphon
			[478] = 7.17, -- Tidal Surge
			[195] = 5.64, -- Secrets of the Deep
			[480] = 4.11, -- Blood Rite
			[22] = 3.25, -- Heed My Call
			[31] = 3.36, -- Gutripper
			[462] = 2.14, -- Azerite Globules
			[526] = 7.47, -- Endless Hunger
			[521] = 4.19, -- Shadow of Elune
			[479] = 7.39, -- Dagger in the Back
			[481] = 4.49, -- Incite the Pack
			[499] = 2.82, -- Ricocheting Inflatable Pyrosaw
			[21] = 2.3, -- Elemental Whirl
			[350] = 4.36, -- Cankerous Wounds
			[30] = 3.82, -- Overwhelming Power
			[498] = 4.64, -- Barrage Of Many Bombs
			[495] = 5.6, -- Anduin's Dedication
			[500] = 3.81, -- Synaptic Spark Capacitor
			[157] = 7.14, -- Rezan's Fury
			[244] = 6.41, -- Harrowing Decay
			[549] = 0.13, -- Cold Hearted
			[523] = 5.63, -- Apothecary's Concoctions
			[82] = 6.63, -- Champion of Azeroth
			[561] = 4.69, -- Seductive Power
			[483] = 5.71, -- Archive of the Titans
			[562] = 8.88, -- Treacherous Covenant
			[199] = 10, -- Festermight
			[83] = 0.01, -- Impassive Visage
			[522] = 7.36, -- Ancients' Bulwark
			[193] = 7.46, -- Blightborne Infusion
			[156] = 4.27, -- Ruinous Bolt
			[505] = 4.83, -- Tradewinds
			[541] = 2.07, -- Fight or Flight
			[351] = 3.81, -- Last Surprise
			[501] = 5.82, -- Relational Normalization Gizmo
			[14] = 0.04, -- Longstrider
			[459] = 2.65, -- Unstable Flames
			[492] = 4.48, -- Liberator's Might
			[87] = 0.07, -- Self Reliance
			[196] = 6.72, -- Swirling Sands
			[503] = 0.04, -- Auto-Self-Cauterizer
			[494] = 7.15, -- Battlefield Precision
			[497] = 1.42, -- Stand As One
			[493] = 2.57, -- Last Gift
			[142] = 6.41, -- Helchains
			[84] = 0.05, -- Bulwark of the Masses
			[109] = 7.82, -- Magus of the Dead
			[482] = 6.13, -- Thunderous Blast
		}, {}, 1557133200)

		insertDefaultScalesData(defaultName, 11, 1, { -- Balance Druid
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 10608 - 13679 (avg 11388), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[500] = 1.92, -- Synaptic Spark Capacitor
			[541] = 1.29, -- Fight or Flight
			[105] = 0.02, -- Ephemeral Recovery
			[497] = 0.89, -- Stand As One
			[492] = 2.65, -- Liberator's Might
			[560] = 1.42, -- Bonded Souls
			[156] = 2.14, -- Ruinous Bolt
			[196] = 3.75, -- Swirling Sands
			[562] = 5.36, -- Treacherous Covenant
			[173] = 2.45, -- Power of the Moon
			[38] = 1.22, -- On My Way
			[31] = 1.8, -- Gutripper
			[193] = 4.28, -- Blightborne Infusion
			[495] = 3.34, -- Anduin's Dedication
			[496] = 0.78, -- Stronger Together
			[122] = 3.64, -- Streaking Stars
			[483] = 3.72, -- Archive of the Titans
			[485] = 3.32, -- Laser Matrix
			[87] = 0.01, -- Self Reliance
			[459] = 1.51, -- Unstable Flames
			[364] = 2.7, -- Lively Spirit
			[479] = 3.92, -- Dagger in the Back
			[30] = 2.65, -- Overwhelming Power
			[561] = 3.12, -- Seductive Power
			[480] = 2.8, -- Blood Rite
			[505] = 3.98, -- Tradewinds
			[498] = 2.46, -- Barrage Of Many Bombs
			[157] = 3.72, -- Rezan's Fury
			[493] = 2.11, -- Last Gift
			[194] = 3.41, -- Filthy Transfusion
			[482] = 3.16, -- Thunderous Blast
			[521] = 2.76, -- Shadow of Elune
			[522] = 4.27, -- Ancients' Bulwark
			[22] = 1.69, -- Heed My Call
			[20] = 1.3, -- Lifespeed
			[250] = 3.55, -- Dawning Sun
			[18] = 1.49, -- Blood Siphon
			[526] = 4.28, -- Endless Hunger
			[195] = 3.44, -- Secrets of the Deep
			[501] = 3.81, -- Relational Normalization Gizmo
			[504] = 3.87, -- Unstable Catalyst
			[21] = 1.47, -- Elemental Whirl
			[82] = 4.36, -- Champion of Azeroth
			[481] = 3.62, -- Incite the Pack
			[192] = 3.6, -- Meticulous Scheming
			[200] = 10, -- Arcanic Pulsar
			[478] = 3.59, -- Tidal Surge
			[462] = 1.14, -- Azerite Globules
			[42] = 0.02, -- Savior
			[523] = 3.11, -- Apothecary's Concoctions
			[499] = 1.51, -- Ricocheting Inflatable Pyrosaw
			[356] = 1.66, -- High Noon
			[461] = 1.15, -- Earthlink
			[494] = 3.78, -- Battlefield Precision
		}, {}, 1557133200)

		insertDefaultScalesData(defaultName, 11, 2, { -- Feral Druid
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 15162 - 18822 (avg 15966), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[499] = 2.41, -- Ricocheting Inflatable Pyrosaw
			[42] = 0.17, -- Savior
			[192] = 4.98, -- Meticulous Scheming
			[105] = 0.08, -- Ephemeral Recovery
			[495] = 5.14, -- Anduin's Dedication
			[31] = 2.89, -- Gutripper
			[497] = 1.49, -- Stand As One
			[22] = 2.62, -- Heed My Call
			[194] = 5.12, -- Filthy Transfusion
			[44] = 0.11, -- Vampiric Speed
			[498] = 3.92, -- Barrage Of Many Bombs
			[523] = 5.03, -- Apothecary's Concoctions
			[19] = 0.17, -- Woundbinder
			[462] = 1.86, -- Azerite Globules
			[562] = 7.99, -- Treacherous Covenant
			[241] = 0.11, -- Twisted Claws
			[459] = 2.9, -- Unstable Flames
			[494] = 6.16, -- Battlefield Precision
			[89] = 0.16, -- Azerite Veins
			[195] = 5.26, -- Secrets of the Deep
			[480] = 4.24, -- Blood Rite
			[503] = 0.23, -- Auto-Self-Cauterizer
			[173] = 0.14, -- Power of the Moon
			[359] = 6.71, -- Wild Fleshrending
			[30] = 3.45, -- Overwhelming Power
			[526] = 6.58, -- Endless Hunger
			[467] = 0.23, -- Ursoc's Endurance
			[502] = 0.16, -- Personal Absorb-o-Tron
			[15] = 0.12, -- Resounding Protection
			[492] = 4.72, -- Liberator's Might
			[500] = 3.59, -- Synaptic Spark Capacitor
			[111] = 6.05, -- Blood Mist
			[18] = 2.27, -- Blood Siphon
			[483] = 5.78, -- Archive of the Titans
			[83] = 0.2, -- Impassive Visage
			[561] = 4.17, -- Seductive Power
			[99] = 0.04, -- Ablative Shielding
			[156] = 3.98, -- Ruinous Bolt
			[38] = 2.11, -- On My Way
			[100] = 0.15, -- Strength in Numbers
			[14] = 0.12, -- Longstrider
			[171] = 0.31, -- Masterful Instincts
			[98] = 0.22, -- Crystalline Carapace
			[196] = 7.23, -- Swirling Sands
			[493] = 2.97, -- Last Gift
			[21] = 2.47, -- Elemental Whirl
			[482] = 4.97, -- Thunderous Blast
			[157] = 6.09, -- Rezan's Fury
			[20] = 2.15, -- Lifespeed
			[540] = 0.31, -- Switch Hitter
			[104] = 0.12, -- Bracing Chill
			[247] = 1.47, -- Iron Jaws
			[560] = 2.1, -- Bonded Souls
			[193] = 8.01, -- Blightborne Infusion
			[478] = 6.62, -- Tidal Surge
			[87] = 0.08, -- Self Reliance
			[479] = 6.31, -- Dagger in the Back
			[481] = 5.27, -- Incite the Pack
			[13] = 0.13, -- Azerite Empowered
			[219] = 0.13, -- Reawakening
			[522] = 6.55, -- Ancients' Bulwark
			[84] = 0.17, -- Bulwark of the Masses
			[103] = 0.14, -- Concentrated Mending
			[101] = 0.27, -- Shimmering Haven
			[485] = 5.26, -- Laser Matrix
			[85] = 0.24, -- Gemhide
			[358] = 6.2, -- Gushing Lacerations
			[504] = 5.8, -- Unstable Catalyst
			[169] = 3.35, -- Untamed Ferocity
			[86] = 0.16, -- Azerite Fortification
			[501] = 5.66, -- Relational Normalization Gizmo
			[463] = 0.21, -- Blessed Portents
			[209] = 10, -- Jungle Fury
			[505] = 5.81, -- Tradewinds
			[521] = 4.25, -- Shadow of Elune
			[461] = 1.92, -- Earthlink
			[43] = 0.15, -- Winds of War
			[496] = 1.45, -- Stronger Together
			[541] = 1.95, -- Fight or Flight
			[82] = 6.98, -- Champion of Azeroth
		}, {}, 1557133200)

		insertDefaultScalesData(offensiveName, 11, 3, { -- Guardian Druid
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 4945 - 7501 (avg 5428), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[359] = 3.01, -- Wild Fleshrending
			[85] = 0.03, -- Gemhide
			[493] = 2.82, -- Last Gift
			[195] = 5.6, -- Secrets of the Deep
			[496] = 1.38, -- Stronger Together
			[492] = 4.37, -- Liberator's Might
			[526] = 7.37, -- Endless Hunger
			[540] = 0.1, -- Switch Hitter
			[501] = 6.06, -- Relational Normalization Gizmo
			[219] = 0.01, -- Reawakening
			[193] = 7.09, -- Blightborne Infusion
			[482] = 8.31, -- Thunderous Blast
			[497] = 1.4, -- Stand As One
			[241] = 6.45, -- Twisted Claws
			[505] = 5.36, -- Tradewinds
			[38] = 2.17, -- On My Way
			[459] = 2.42, -- Unstable Flames
			[561] = 4.75, -- Seductive Power
			[495] = 5.54, -- Anduin's Dedication
			[467] = 0.04, -- Ursoc's Endurance
			[196] = 6.22, -- Swirling Sands
			[22] = 4.2, -- Heed My Call
			[494] = 9.94, -- Battlefield Precision
			[192] = 6.15, -- Meticulous Scheming
			[18] = 1.97, -- Blood Siphon
			[541] = 2.07, -- Fight or Flight
			[479] = 7.05, -- Dagger in the Back
			[82] = 7.18, -- Champion of Azeroth
			[157] = 9.9, -- Rezan's Fury
			[461] = 1.96, -- Earthlink
			[84] = 0.03, -- Bulwark of the Masses
			[483] = 6.14, -- Archive of the Titans
			[521] = 4.78, -- Shadow of Elune
			[503] = 0.02, -- Auto-Self-Cauterizer
			[502] = 0.05, -- Personal Absorb-o-Tron
			[103] = 0.06, -- Concentrated Mending
			[21] = 2.43, -- Elemental Whirl
			[485] = 8.65, -- Laser Matrix
			[15] = 0.16, -- Resounding Protection
			[499] = 3.83, -- Ricocheting Inflatable Pyrosaw
			[462] = 2.86, -- Azerite Globules
			[30] = 4.11, -- Overwhelming Power
			[504] = 6.27, -- Unstable Catalyst
			[522] = 7.38, -- Ancients' Bulwark
			[171] = 0.07, -- Masterful Instincts
			[361] = 5.33, -- Guardian's Wrath
			[480] = 4.79, -- Blood Rite
			[99] = 0.05, -- Ablative Shielding
			[194] = 8.5, -- Filthy Transfusion
			[560] = 2.26, -- Bonded Souls
			[156] = 6, -- Ruinous Bolt
			[20] = 2.37, -- Lifespeed
			[478] = 10, -- Tidal Surge
			[481] = 4.89, -- Incite the Pack
			[523] = 7.79, -- Apothecary's Concoctions
			[251] = 6.27, -- Burst of Savagery
			[498] = 6.2, -- Barrage Of Many Bombs
			[31] = 4.6, -- Gutripper
			[500] = 5.39, -- Synaptic Spark Capacitor
			[562] = 8.61, -- Treacherous Covenant
			[104] = 0.01, -- Bracing Chill
		}, {}, 1557133200)

		insertDefaultScalesData(defaultName, 3, 1, { -- Beast Mastery Hunter
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 9042 - 11329 (avg 9634), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[462] = 1.64, -- Azerite Globules
			[459] = 2.24, -- Unstable Flames
			[21] = 2.22, -- Elemental Whirl
			[521] = 4.44, -- Shadow of Elune
			[485] = 5.17, -- Laser Matrix
			[505] = 5.04, -- Tradewinds
			[526] = 6.27, -- Endless Hunger
			[18] = 1.75, -- Blood Siphon
			[501] = 5.95, -- Relational Normalization Gizmo
			[562] = 8.09, -- Treacherous Covenant
			[495] = 5.17, -- Anduin's Dedication
			[494] = 5.96, -- Battlefield Precision
			[523] = 4.7, -- Apothecary's Concoctions
			[504] = 5.89, -- Unstable Catalyst
			[161] = 6.2, -- Haze of Rage
			[195] = 5.39, -- Secrets of the Deep
			[85] = 0.03, -- Gemhide
			[194] = 4.9, -- Filthy Transfusion
			[522] = 6.24, -- Ancients' Bulwark
			[31] = 2.86, -- Gutripper
			[365] = 6.59, -- Dire Consequences
			[541] = 2.03, -- Fight or Flight
			[22] = 2.6, -- Heed My Call
			[483] = 5.68, -- Archive of the Titans
			[499] = 2.23, -- Ricocheting Inflatable Pyrosaw
			[461] = 1.66, -- Earthlink
			[192] = 5.84, -- Meticulous Scheming
			[366] = 10, -- Primal Instincts
			[496] = 1.25, -- Stronger Together
			[500] = 3.51, -- Synaptic Spark Capacitor
			[156] = 3.93, -- Ruinous Bolt
			[480] = 4.42, -- Blood Rite
			[498] = 3.7, -- Barrage Of Many Bombs
			[492] = 4.12, -- Liberator's Might
			[493] = 2.78, -- Last Gift
			[560] = 2.05, -- Bonded Souls
			[196] = 5.44, -- Swirling Sands
			[107] = 4.09, -- Serrated Jaws
			[157] = 6.04, -- Rezan's Fury
			[479] = 6.22, -- Dagger in the Back
			[30] = 3.74, -- Overwhelming Power
			[82] = 6.37, -- Champion of Azeroth
			[211] = 5.68, -- Dance of Death
			[478] = 6.37, -- Tidal Surge
			[497] = 1.47, -- Stand As One
			[193] = 6.44, -- Blightborne Infusion
			[561] = 4.37, -- Seductive Power
			[367] = 7.95, -- Feeding Frenzy
			[369] = 0.11, -- Rapid Reload
			[481] = 4.59, -- Incite the Pack
			[482] = 4.97, -- Thunderous Blast
		}, {}, 1557133200)

		insertDefaultScalesData(defaultName, 3, 2, { -- Marksmanship Hunter
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 11014 - 13975 (avg 11995), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[162] = 7.51, -- Surging Shots
			[500] = 3.48, -- Synaptic Spark Capacitor
			[193] = 6.88, -- Blightborne Infusion
			[497] = 1.18, -- Stand As One
			[368] = 3.53, -- Steady Aim
			[196] = 6.04, -- Swirling Sands
			[562] = 7.72, -- Treacherous Covenant
			[501] = 5.82, -- Relational Normalization Gizmo
			[526] = 7.02, -- Endless Hunger
			[523] = 4.88, -- Apothecary's Concoctions
			[541] = 1.75, -- Fight or Flight
			[82] = 6.54, -- Champion of Azeroth
			[30] = 3.97, -- Overwhelming Power
			[370] = 9.64, -- Focused Fire
			[212] = 7.65, -- Unerring Vision
			[498] = 3.82, -- Barrage Of Many Bombs
			[156] = 3.81, -- Ruinous Bolt
			[195] = 5.03, -- Secrets of the Deep
			[481] = 5.02, -- Incite the Pack
			[462] = 1.63, -- Azerite Globules
			[493] = 2.95, -- Last Gift
			[461] = 1.81, -- Earthlink
			[21] = 2.39, -- Elemental Whirl
			[18] = 2.02, -- Blood Siphon
			[480] = 4.8, -- Blood Rite
			[485] = 5.36, -- Laser Matrix
			[22] = 2.7, -- Heed My Call
			[504] = 5.42, -- Unstable Catalyst
			[521] = 4.83, -- Shadow of Elune
			[36] = 10, -- In The Rhythm
			[496] = 1.39, -- Stronger Together
			[192] = 6.03, -- Meticulous Scheming
			[31] = 2.81, -- Gutripper
			[483] = 5.32, -- Archive of the Titans
			[492] = 4.26, -- Liberator's Might
			[157] = 6.09, -- Rezan's Fury
			[479] = 6.43, -- Dagger in the Back
			[482] = 5.18, -- Thunderous Blast
			[560] = 1.9, -- Bonded Souls
			[499] = 2.36, -- Ricocheting Inflatable Pyrosaw
			[469] = 0.03, -- Duck and Cover
			[502] = 0.06, -- Personal Absorb-o-Tron
			[194] = 5.52, -- Filthy Transfusion
			[495] = 4.74, -- Anduin's Dedication
			[505] = 5.37, -- Tradewinds
			[478] = 6.36, -- Tidal Surge
			[522] = 6.93, -- Ancients' Bulwark
			[494] = 5.93, -- Battlefield Precision
			[561] = 4.08, -- Seductive Power
			[459] = 2.36, -- Unstable Flames
		}, {}, 1557133200)

		insertDefaultScalesData(defaultName, 3, 3, { -- Survival Hunter
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 7059 - 10419 (avg 8453), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[372] = 10, -- Wilderness Survival
			[500] = 3.23, -- Synaptic Spark Capacitor
			[157] = 6.13, -- Rezan's Fury
			[560] = 2.32, -- Bonded Souls
			[501] = 6.01, -- Relational Normalization Gizmo
			[483] = 5.4, -- Archive of the Titans
			[505] = 3.92, -- Tradewinds
			[110] = 2.54, -- Wildfire Cluster
			[373] = 6.83, -- Primeval Intuition
			[495] = 4.91, -- Anduin's Dedication
			[526] = 6.31, -- Endless Hunger
			[196] = 5.53, -- Swirling Sands
			[494] = 5.94, -- Battlefield Precision
			[498] = 3.93, -- Barrage Of Many Bombs
			[462] = 1.74, -- Azerite Globules
			[561] = 4.34, -- Seductive Power
			[193] = 6.23, -- Blightborne Infusion
			[523] = 4.92, -- Apothecary's Concoctions
			[371] = 8.56, -- Blur of Talons
			[22] = 2.67, -- Heed My Call
			[541] = 1.76, -- Fight or Flight
			[107] = 3.94, -- Serrated Jaws
			[31] = 2.93, -- Gutripper
			[30] = 4.38, -- Overwhelming Power
			[504] = 5.66, -- Unstable Catalyst
			[481] = 3.54, -- Incite the Pack
			[482] = 5.14, -- Thunderous Blast
			[365] = 7.55, -- Dire Consequences
			[195] = 5, -- Secrets of the Deep
			[163] = 7.9, -- Latent Poison
			[82] = 5.87, -- Champion of Azeroth
			[83] = 0.06, -- Impassive Visage
			[213] = 4.8, -- Venomous Fangs
			[493] = 1.98, -- Last Gift
			[485] = 5.35, -- Laser Matrix
			[522] = 6.26, -- Ancients' Bulwark
			[21] = 2.04, -- Elemental Whirl
			[192] = 5.26, -- Meticulous Scheming
			[478] = 5.75, -- Tidal Surge
			[461] = 1.73, -- Earthlink
			[194] = 5.29, -- Filthy Transfusion
			[496] = 1.18, -- Stronger Together
			[492] = 3.95, -- Liberator's Might
			[156] = 3.55, -- Ruinous Bolt
			[18] = 1.41, -- Blood Siphon
			[499] = 2.45, -- Ricocheting Inflatable Pyrosaw
			[521] = 4.72, -- Shadow of Elune
			[479] = 6.35, -- Dagger in the Back
			[497] = 1.26, -- Stand As One
			[459] = 2.08, -- Unstable Flames
			[480] = 4.8, -- Blood Rite
			[562] = 7.9, -- Treacherous Covenant
		}, {}, 1557133200)

		insertDefaultScalesData(defaultName, 8, 1, { -- Arcane Mage
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 19850 - 23767 (avg 20929), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[192] = 2.28, -- Meticulous Scheming
			[82] = 5.24, -- Champion of Azeroth
			[526] = 6.32, -- Endless Hunger
			[561] = 4.01, -- Seductive Power
			[505] = 4.45, -- Tradewinds
			[485] = 5.01, -- Laser Matrix
			[21] = 1.87, -- Elemental Whirl
			[493] = 2.37, -- Last Gift
			[214] = 2.59, -- Arcane Pressure
			[462] = 1.56, -- Azerite Globules
			[541] = 1.65, -- Fight or Flight
			[194] = 5.01, -- Filthy Transfusion
			[22] = 2.39, -- Heed My Call
			[459] = 2.16, -- Unstable Flames
			[156] = 3.73, -- Ruinous Bolt
			[497] = 1.16, -- Stand As One
			[157] = 5.7, -- Rezan's Fury
			[30] = 2.34, -- Overwhelming Power
			[523] = 4.67, -- Apothecary's Concoctions
			[195] = 5.04, -- Secrets of the Deep
			[18] = 1.57, -- Blood Siphon
			[193] = 6.36, -- Blightborne Infusion
			[521] = 3.33, -- Shadow of Elune
			[167] = 3.27, -- Brain Storm
			[480] = 3.4, -- Blood Rite
			[479] = 5.94, -- Dagger in the Back
			[501] = 5.01, -- Relational Normalization Gizmo
			[127] = 10, -- Equipoise
			[482] = 4.64, -- Thunderous Blast
			[494] = 4.86, -- Battlefield Precision
			[478] = 6.21, -- Tidal Surge
			[500] = 3.45, -- Synaptic Spark Capacitor
			[560] = 1.17, -- Bonded Souls
			[495] = 4.95, -- Anduin's Dedication
			[88] = 6.41, -- Arcane Pummeling
			[498] = 3.65, -- Barrage Of Many Bombs
			[499] = 2.18, -- Ricocheting Inflatable Pyrosaw
			[461] = 1.79, -- Earthlink
			[562] = 7.99, -- Treacherous Covenant
			[496] = 0.98, -- Stronger Together
			[483] = 5.43, -- Archive of the Titans
			[504] = 5.55, -- Unstable Catalyst
			[196] = 4.88, -- Swirling Sands
			[481] = 4.11, -- Incite the Pack
			[492] = 3.48, -- Liberator's Might
			[31] = 2.58, -- Gutripper
			[522] = 6.3, -- Ancients' Bulwark
			[374] = 6.8, -- Galvanizing Spark
		}, {}, 1557133200)

		insertDefaultScalesData(defaultName, 8, 2, { -- Fire Mage
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 27334 - 31964 (avg 29768), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[376] = 4.33, -- Trailing Embers
			[499] = 2.67, -- Ricocheting Inflatable Pyrosaw
			[560] = 1.45, -- Bonded Souls
			[156] = 4.49, -- Ruinous Bolt
			[501] = 4.67, -- Relational Normalization Gizmo
			[562] = 8.17, -- Treacherous Covenant
			[482] = 5.83, -- Thunderous Blast
			[462] = 2.16, -- Azerite Globules
			[18] = 1.91, -- Blood Siphon
			[15] = 0.04, -- Resounding Protection
			[497] = 1.3, -- Stand As One
			[561] = 4.54, -- Seductive Power
			[494] = 6.79, -- Battlefield Precision
			[479] = 7.12, -- Dagger in the Back
			[526] = 6.62, -- Endless Hunger
			[157] = 6.92, -- Rezan's Fury
			[480] = 3, -- Blood Rite
			[168] = 10, -- Wildfire
			[485] = 6.19, -- Laser Matrix
			[478] = 7.21, -- Tidal Surge
			[377] = 6.56, -- Duplicative Incineration
			[500] = 4, -- Synaptic Spark Capacitor
			[502] = 0.13, -- Personal Absorb-o-Tron
			[84] = 0.06, -- Bulwark of the Masses
			[192] = 3.04, -- Meticulous Scheming
			[128] = 2.68, -- Flames of Alacrity
			[196] = 5.96, -- Swirling Sands
			[195] = 5.22, -- Secrets of the Deep
			[82] = 5.77, -- Champion of Azeroth
			[193] = 6.84, -- Blightborne Infusion
			[496] = 1.19, -- Stronger Together
			[459] = 2.14, -- Unstable Flames
			[492] = 3.52, -- Liberator's Might
			[493] = 2.73, -- Last Gift
			[504] = 5.89, -- Unstable Catalyst
			[378] = 6.84, -- Firemind
			[481] = 4.51, -- Incite the Pack
			[495] = 5.12, -- Anduin's Dedication
			[86] = 0.01, -- Azerite Fortification
			[461] = 1.83, -- Earthlink
			[194] = 5.7, -- Filthy Transfusion
			[30] = 2.41, -- Overwhelming Power
			[205] = 0.08, -- Eldritch Warding
			[22] = 3.07, -- Heed My Call
			[541] = 2.01, -- Fight or Flight
			[521] = 3.06, -- Shadow of Elune
			[498] = 4.4, -- Barrage Of Many Bombs
			[215] = 1.48, -- Blaster Master
			[31] = 3.39, -- Gutripper
			[21] = 1.93, -- Elemental Whirl
			[483] = 5.59, -- Archive of the Titans
			[523] = 5.73, -- Apothecary's Concoctions
			[505] = 4.98, -- Tradewinds
			[522] = 6.55, -- Ancients' Bulwark
		}, {}, 1557133200)

		insertDefaultScalesData(defaultName, 8, 3, { -- Frost Mage
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 17476 - 21088 (avg 19262), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[225] = 5.07, -- Glacial Assault
			[381] = 4.68, -- Frigid Grasp
			[193] = 5.7, -- Blightborne Infusion
			[501] = 4.8, -- Relational Normalization Gizmo
			[496] = 1.12, -- Stronger Together
			[22] = 2.44, -- Heed My Call
			[468] = 0.03, -- Cauterizing Blink
			[170] = 10, -- Flash Freeze
			[380] = 4.84, -- Whiteout
			[541] = 1.69, -- Fight or Flight
			[82] = 5.33, -- Champion of Azeroth
			[196] = 5.38, -- Swirling Sands
			[494] = 5.15, -- Battlefield Precision
			[481] = 3.81, -- Incite the Pack
			[132] = 4.64, -- Packed Ice
			[560] = 1.61, -- Bonded Souls
			[479] = 5.71, -- Dagger in the Back
			[156] = 3.3, -- Ruinous Bolt
			[30] = 3, -- Overwhelming Power
			[379] = 5.18, -- Tunnel of Ice
			[157] = 5.38, -- Rezan's Fury
			[492] = 3.59, -- Liberator's Might
			[485] = 4.92, -- Laser Matrix
			[499] = 2.09, -- Ricocheting Inflatable Pyrosaw
			[21] = 1.89, -- Elemental Whirl
			[195] = 4.88, -- Secrets of the Deep
			[194] = 5.1, -- Filthy Transfusion
			[461] = 1.55, -- Earthlink
			[562] = 7.38, -- Treacherous Covenant
			[192] = 3.45, -- Meticulous Scheming
			[561] = 4.09, -- Seductive Power
			[493] = 2.16, -- Last Gift
			[500] = 3.05, -- Synaptic Spark Capacitor
			[504] = 5.62, -- Unstable Catalyst
			[495] = 4.86, -- Anduin's Dedication
			[482] = 4.65, -- Thunderous Blast
			[522] = 5.48, -- Ancients' Bulwark
			[498] = 3.51, -- Barrage Of Many Bombs
			[526] = 5.56, -- Endless Hunger
			[31] = 2.57, -- Gutripper
			[480] = 3.41, -- Blood Rite
			[523] = 4.55, -- Apothecary's Concoctions
			[483] = 5.21, -- Archive of the Titans
			[521] = 3.36, -- Shadow of Elune
			[478] = 5.5, -- Tidal Surge
			[15] = 0.02, -- Resounding Protection
			[459] = 2.17, -- Unstable Flames
			[505] = 4.05, -- Tradewinds
			[497] = 1.29, -- Stand As One
			[18] = 1.33, -- Blood Siphon
			[462] = 1.51, -- Azerite Globules
		}, {}, 1557133200)

		insertDefaultScalesData(offensiveName, 10, 1, { -- Brewmaster Monk
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 5551 - 11810 (avg 8807), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[482] = 8.2, -- Thunderous Blast
			[84] = 0.07, -- Bulwark of the Masses
			[382] = 0.07, -- Straight, No Chaser
			[499] = 4, -- Ricocheting Inflatable Pyrosaw
			[521] = 3.18, -- Shadow of Elune
			[82] = 5.35, -- Champion of Azeroth
			[21] = 1.8, -- Elemental Whirl
			[192] = 4.18, -- Meticulous Scheming
			[43] = 0.1, -- Winds of War
			[495] = 4.19, -- Anduin's Dedication
			[522] = 5.68, -- Ancients' Bulwark
			[479] = 7.13, -- Dagger in the Back
			[492] = 3.45, -- Liberator's Might
			[30] = 2.71, -- Overwhelming Power
			[503] = 0.02, -- Auto-Self-Cauterizer
			[560] = 1.72, -- Bonded Souls
			[505] = 4.19, -- Tradewinds
			[86] = 0.11, -- Azerite Fortification
			[22] = 4.32, -- Heed My Call
			[193] = 5.62, -- Blightborne Infusion
			[15] = 0.07, -- Resounding Protection
			[156] = 5.96, -- Ruinous Bolt
			[20] = 1.67, -- Lifespeed
			[105] = 0.03, -- Ephemeral Recovery
			[383] = 2.29, -- Training of Niuzao
			[526] = 5.67, -- Endless Hunger
			[496] = 1.07, -- Stronger Together
			[561] = 3.78, -- Seductive Power
			[470] = 0.07, -- Sweep the Leg
			[483] = 4.75, -- Archive of the Titans
			[99] = 0.13, -- Ablative Shielding
			[218] = 0.16, -- Strength of Spirit
			[480] = 3.27, -- Blood Rite
			[493] = 2.26, -- Last Gift
			[566] = 0.09, -- Exit Strategy
			[461] = 1.46, -- Earthlink
			[157] = 9.86, -- Rezan's Fury
			[462] = 2.91, -- Azerite Globules
			[523] = 8.04, -- Apothecary's Concoctions
			[497] = 1.09, -- Stand As One
			[89] = 0.07, -- Azerite Veins
			[116] = 1.8, -- Boiling Brew
			[195] = 4.37, -- Secrets of the Deep
			[463] = 0.03, -- Blessed Portents
			[384] = 4.84, -- Elusive Footwork
			[498] = 6.35, -- Barrage Of Many Bombs
			[104] = 0.09, -- Bracing Chill
			[14] = 0.11, -- Longstrider
			[18] = 1.57, -- Blood Siphon
			[459] = 2.08, -- Unstable Flames
			[98] = 0.05, -- Crystalline Carapace
			[501] = 4.42, -- Relational Normalization Gizmo
			[194] = 8.28, -- Filthy Transfusion
			[100] = 0.06, -- Strength in Numbers
			[103] = 0.02, -- Concentrated Mending
			[478] = 9.91, -- Tidal Surge
			[500] = 5.44, -- Synaptic Spark Capacitor
			[31] = 4.91, -- Gutripper
			[485] = 8.74, -- Laser Matrix
			[504] = 4.8, -- Unstable Catalyst
			[562] = 6.51, -- Treacherous Covenant
			[494] = 10, -- Battlefield Precision
			[19] = 0.15, -- Woundbinder
			[13] = 0.11, -- Azerite Empowered
			[502] = 0.08, -- Personal Absorb-o-Tron
			[541] = 1.55, -- Fight or Flight
			[481] = 3.86, -- Incite the Pack
			[101] = 0.04, -- Shimmering Haven
			[238] = 0.1, -- Fit to Burst
			[85] = 0.02, -- Gemhide
			[38] = 1.65, -- On My Way
			[196] = 5.16, -- Swirling Sands
			[42] = 0.04, -- Savior
		}, {}, 1557133200)

		insertDefaultScalesData(defaultName, 10, 3, { -- Windwalker Monk
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 9923 - 14039 (avg 10541), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[497] = 1.28, -- Stand As One
			[526] = 6.12, -- Endless Hunger
			[480] = 3.37, -- Blood Rite
			[391] = 6.49, -- Dance of Chi-Ji
			[157] = 6.1, -- Rezan's Fury
			[117] = 10, -- Fury of Xuen
			[485] = 5.29, -- Laser Matrix
			[85] = 0.02, -- Gemhide
			[478] = 6.66, -- Tidal Surge
			[493] = 2.28, -- Last Gift
			[103] = 0.02, -- Concentrated Mending
			[522] = 6.09, -- Ancients' Bulwark
			[482] = 4.99, -- Thunderous Blast
			[389] = 8.46, -- Open Palm Strikes
			[195] = 4.48, -- Secrets of the Deep
			[101] = 0.06, -- Shimmering Haven
			[42] = 0.03, -- Savior
			[504] = 5.24, -- Unstable Catalyst
			[390] = 6.58, -- Pressure Point
			[562] = 7.05, -- Treacherous Covenant
			[19] = 0.04, -- Woundbinder
			[82] = 5.43, -- Champion of Azeroth
			[43] = 0.09, -- Winds of War
			[459] = 2.07, -- Unstable Flames
			[22] = 2.75, -- Heed My Call
			[21] = 1.83, -- Elemental Whirl
			[500] = 0.58, -- Synaptic Spark Capacitor
			[156] = 3.97, -- Ruinous Bolt
			[30] = 2.74, -- Overwhelming Power
			[461] = 1.57, -- Earthlink
			[20] = 1.47, -- Lifespeed
			[462] = 1.68, -- Azerite Globules
			[561] = 3.86, -- Seductive Power
			[84] = 0.1, -- Bulwark of the Masses
			[196] = 4.85, -- Swirling Sands
			[15] = 0.03, -- Resounding Protection
			[499] = 2.21, -- Ricocheting Inflatable Pyrosaw
			[38] = 1.73, -- On My Way
			[87] = 0.2, -- Self Reliance
			[194] = 5.05, -- Filthy Transfusion
			[560] = 1.53, -- Bonded Souls
			[501] = 4.88, -- Relational Normalization Gizmo
			[479] = 6.19, -- Dagger in the Back
			[495] = 4.38, -- Anduin's Dedication
			[494] = 5.88, -- Battlefield Precision
			[18] = 1.56, -- Blood Siphon
			[218] = 0.08, -- Strength of Spirit
			[193] = 5.62, -- Blightborne Infusion
			[83] = 0.02, -- Impassive Visage
			[31] = 2.85, -- Gutripper
			[13] = 0.03, -- Azerite Empowered
			[104] = 0.08, -- Bracing Chill
			[521] = 3.46, -- Shadow of Elune
			[192] = 3.88, -- Meticulous Scheming
			[388] = 8.75, -- Glory of the Dawn
			[44] = 0.03, -- Vampiric Speed
			[492] = 3.4, -- Liberator's Might
			[523] = 1.23, -- Apothecary's Concoctions
			[481] = 3.87, -- Incite the Pack
			[541] = 1.59, -- Fight or Flight
			[184] = 5.41, -- Sunrise Technique
			[496] = 1.04, -- Stronger Together
			[483] = 4.73, -- Archive of the Titans
			[505] = 4.2, -- Tradewinds
			[498] = 3.79, -- Barrage Of Many Bombs
		}, {}, 1557133200)

		insertDefaultScalesData(offensiveName, 2, 2, { -- Protection Paladin
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 11738 - 14419 (avg 12379), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[31] = 4.03, -- Gutripper
			[482] = 7.33, -- Thunderous Blast
			[21] = 1.98, -- Elemental Whirl
			[561] = 4.03, -- Seductive Power
			[22] = 3.83, -- Heed My Call
			[523] = 6.97, -- Apothecary's Concoctions
			[461] = 1.53, -- Earthlink
			[478] = 8.28, -- Tidal Surge
			[234] = 2.18, -- Inner Light
			[150] = 1.46, -- Soaring Shield
			[194] = 7.36, -- Filthy Transfusion
			[395] = 10, -- Inspiring Vanguard
			[38] = 1.57, -- On My Way
			[493] = 2.13, -- Last Gift
			[82] = 5.82, -- Champion of Azeroth
			[521] = 3.95, -- Shadow of Elune
			[30] = 3.75, -- Overwhelming Power
			[20] = 2.11, -- Lifespeed
			[504] = 5.35, -- Unstable Catalyst
			[497] = 1.17, -- Stand As One
			[560] = 1.95, -- Bonded Souls
			[495] = 4.65, -- Anduin's Dedication
			[526] = 6.23, -- Endless Hunger
			[494] = 8.87, -- Battlefield Precision
			[462] = 2.64, -- Azerite Globules
			[235] = 4.14, -- Indomitable Justice
			[505] = 4.08, -- Tradewinds
			[483] = 5.14, -- Archive of the Titans
			[562] = 7.47, -- Treacherous Covenant
			[496] = 1.02, -- Stronger Together
			[498] = 5.52, -- Barrage Of Many Bombs
			[485] = 7.72, -- Laser Matrix
			[492] = 4.02, -- Liberator's Might
			[195] = 4.8, -- Secrets of the Deep
			[125] = 3.55, -- Avenger's Might
			[541] = 1.52, -- Fight or Flight
			[157] = 8.61, -- Rezan's Fury
			[193] = 6.92, -- Blightborne Infusion
			[501] = 5.4, -- Relational Normalization Gizmo
			[459] = 2.41, -- Unstable Flames
			[500] = 4.53, -- Synaptic Spark Capacitor
			[522] = 6.27, -- Ancients' Bulwark
			[481] = 3.74, -- Incite the Pack
			[18] = 1.44, -- Blood Siphon
			[479] = 6.08, -- Dagger in the Back
			[196] = 6.12, -- Swirling Sands
			[499] = 3.29, -- Ricocheting Inflatable Pyrosaw
			[156] = 4.93, -- Ruinous Bolt
			[480] = 3.94, -- Blood Rite
			[192] = 5.1, -- Meticulous Scheming
		}, {}, 1557133200)

		insertDefaultScalesData(defaultName, 2, 3, { -- Retribution Paladin
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 10844 - 13392 (avg 11529), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[561] = 4.62, -- Seductive Power
			[522] = 6.83, -- Ancients' Bulwark
			[479] = 6.46, -- Dagger in the Back
			[495] = 4.83, -- Anduin's Dedication
			[500] = 3.22, -- Synaptic Spark Capacitor
			[156] = 3.52, -- Ruinous Bolt
			[396] = 10, -- Light's Decree
			[541] = 1.75, -- Fight or Flight
			[104] = 0.05, -- Bracing Chill
			[18] = 1.82, -- Blood Siphon
			[526] = 6.72, -- Endless Hunger
			[195] = 5.05, -- Secrets of the Deep
			[523] = 5.11, -- Apothecary's Concoctions
			[505] = 4.81, -- Tradewinds
			[192] = 5.66, -- Meticulous Scheming
			[482] = 5.41, -- Thunderous Blast
			[481] = 4.48, -- Incite the Pack
			[21] = 2.24, -- Elemental Whirl
			[462] = 1.85, -- Azerite Globules
			[82] = 6.37, -- Champion of Azeroth
			[43] = 0.03, -- Winds of War
			[497] = 1.26, -- Stand As One
			[483] = 5.51, -- Archive of the Titans
			[538] = 0.01, -- Empyreal Ward
			[193] = 6.44, -- Blightborne Infusion
			[521] = 4.32, -- Shadow of Elune
			[31] = 2.93, -- Gutripper
			[154] = 7.17, -- Relentless Inquisitor
			[103] = 0.04, -- Concentrated Mending
			[453] = 7.4, -- Empyrean Power
			[562] = 8.04, -- Treacherous Covenant
			[22] = 2.76, -- Heed My Call
			[498] = 3.9, -- Barrage Of Many Bombs
			[157] = 6.31, -- Rezan's Fury
			[503] = 0.08, -- Auto-Self-Cauterizer
			[496] = 1.27, -- Stronger Together
			[194] = 5.89, -- Filthy Transfusion
			[492] = 3.87, -- Liberator's Might
			[125] = 5.58, -- Avenger's Might
			[560] = 2.1, -- Bonded Souls
			[86] = 0.03, -- Azerite Fortification
			[478] = 5.86, -- Tidal Surge
			[499] = 2.44, -- Ricocheting Inflatable Pyrosaw
			[504] = 5.41, -- Unstable Catalyst
			[235] = 5.12, -- Indomitable Justice
			[187] = 4.72, -- Expurgation
			[38] = 2.02, -- On My Way
			[30] = 4.06, -- Overwhelming Power
			[494] = 5.82, -- Battlefield Precision
			[20] = 2.14, -- Lifespeed
			[196] = 5.24, -- Swirling Sands
			[480] = 4.28, -- Blood Rite
			[485] = 5.5, -- Laser Matrix
			[14] = 0.07, -- Longstrider
			[461] = 1.76, -- Earthlink
			[454] = 0.03, -- Judicious Defense
			[501] = 5.57, -- Relational Normalization Gizmo
			[493] = 2.59, -- Last Gift
			[502] = 0.08, -- Personal Absorb-o-Tron
			[459] = 2.45, -- Unstable Flames
		}, {}, 1557133200)

		insertDefaultScalesData(defaultName, 4, 1, { -- Assassination Rogue
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 10445 - 13719 (avg 11260), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[181] = 5.91, -- Twist the Knife
			[13] = 0.18, -- Azerite Empowered
			[217] = 0.11, -- Footpad
			[521] = 4.27, -- Shadow of Elune
			[495] = 4.85, -- Anduin's Dedication
			[494] = 6.03, -- Battlefield Precision
			[499] = 2.24, -- Ricocheting Inflatable Pyrosaw
			[480] = 4.28, -- Blood Rite
			[21] = 2.2, -- Elemental Whirl
			[498] = 3.69, -- Barrage Of Many Bombs
			[408] = 1.08, -- Shrouded Suffocation
			[196] = 5.98, -- Swirling Sands
			[497] = 1.33, -- Stand As One
			[482] = 4.94, -- Thunderous Blast
			[504] = 5.75, -- Unstable Catalyst
			[22] = 2.67, -- Heed My Call
			[462] = 1.63, -- Azerite Globules
			[478] = 5.92, -- Tidal Surge
			[18] = 1.93, -- Blood Siphon
			[501] = 5.6, -- Relational Normalization Gizmo
			[156] = 3.55, -- Ruinous Bolt
			[485] = 5.15, -- Laser Matrix
			[86] = 0.07, -- Azerite Fortification
			[195] = 5.04, -- Secrets of the Deep
			[15] = 0.07, -- Resounding Protection
			[87] = 0.09, -- Self Reliance
			[523] = 4.68, -- Apothecary's Concoctions
			[192] = 4.01, -- Meticulous Scheming
			[407] = 0.05, -- Echoing Blades
			[14] = 0.08, -- Longstrider
			[249] = 10, -- Nothing Personal
			[503] = 0.06, -- Auto-Self-Cauterizer
			[502] = 0.07, -- Personal Absorb-o-Tron
			[492] = 4.22, -- Liberator's Might
			[157] = 5.64, -- Rezan's Fury
			[541] = 1.93, -- Fight or Flight
			[82] = 6.28, -- Champion of Azeroth
			[31] = 2.89, -- Gutripper
			[526] = 6.03, -- Endless Hunger
			[459] = 2.47, -- Unstable Flames
			[561] = 4.11, -- Seductive Power
			[562] = 7.61, -- Treacherous Covenant
			[479] = 6.02, -- Dagger in the Back
			[193] = 6.89, -- Blightborne Infusion
			[461] = 1.89, -- Earthlink
			[481] = 4.43, -- Incite the Pack
			[83] = 0.02, -- Impassive Visage
			[473] = 0.07, -- Shrouded Mantle
			[136] = 7.93, -- Double Dose
			[30] = 3.79, -- Overwhelming Power
			[522] = 6, -- Ancients' Bulwark
			[406] = 3.44, -- Scent of Blood
			[500] = 3.13, -- Synaptic Spark Capacitor
			[548] = 0.05, -- Lying In Wait
			[493] = 2.73, -- Last Gift
			[194] = 5.06, -- Filthy Transfusion
			[496] = 1.27, -- Stronger Together
			[483] = 5.23, -- Archive of the Titans
			[505] = 4.87, -- Tradewinds
			[560] = 2.07, -- Bonded Souls
		}, {}, 1557133200)

		insertDefaultScalesData(defaultName, 4, 2, { -- Outlaw Rogue
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 30440 - 44839 (avg 33757), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[31] = 4.21, -- Gutripper
			[480] = 5.56, -- Blood Rite
			[30] = 4.91, -- Overwhelming Power
			[83] = 0.02, -- Impassive Visage
			[462] = 2.58, -- Azerite Globules
			[493] = 2.78, -- Last Gift
			[500] = 4.73, -- Synaptic Spark Capacitor
			[499] = 3.44, -- Ricocheting Inflatable Pyrosaw
			[21] = 2.59, -- Elemental Whirl
			[15] = 0.01, -- Resounding Protection
			[239] = 5.18, -- Snake Eyes
			[446] = 9.41, -- Brigand's Blitz
			[194] = 7.29, -- Filthy Transfusion
			[87] = 0.06, -- Self Reliance
			[562] = 10, -- Treacherous Covenant
			[495] = 6.31, -- Anduin's Dedication
			[485] = 7.8, -- Laser Matrix
			[461] = 2.24, -- Earthlink
			[13] = 0.08, -- Azerite Empowered
			[44] = 0.13, -- Vampiric Speed
			[195] = 6.42, -- Secrets of the Deep
			[483] = 7.12, -- Archive of the Titans
			[548] = 0.04, -- Lying In Wait
			[479] = 9.43, -- Dagger in the Back
			[156] = 5.21, -- Ruinous Bolt
			[501] = 7.15, -- Relational Normalization Gizmo
			[14] = 0.17, -- Longstrider
			[521] = 5.62, -- Shadow of Elune
			[85] = 0.23, -- Gemhide
			[492] = 5.12, -- Liberator's Might
			[496] = 1.41, -- Stronger Together
			[478] = 8.74, -- Tidal Surge
			[526] = 8.18, -- Endless Hunger
			[561] = 5.65, -- Seductive Power
			[494] = 8.89, -- Battlefield Precision
			[459] = 2.75, -- Unstable Flames
			[86] = 0.08, -- Azerite Fortification
			[504] = 7.15, -- Unstable Catalyst
			[482] = 7.37, -- Thunderous Blast
			[129] = 8.49, -- Deadshot
			[481] = 4.65, -- Incite the Pack
			[193] = 7.86, -- Blightborne Infusion
			[411] = 7.68, -- Ace Up Your Sleeve
			[82] = 7.6, -- Champion of Azeroth
			[523] = 7.29, -- Apothecary's Concoctions
			[180] = 6.16, -- Keep Your Wits About You
			[522] = 8.07, -- Ancients' Bulwark
			[497] = 1.72, -- Stand As One
			[22] = 4.02, -- Heed My Call
			[192] = 6.74, -- Meticulous Scheming
			[541] = 2.51, -- Fight or Flight
			[502] = 0.16, -- Personal Absorb-o-Tron
			[18] = 1.93, -- Blood Siphon
			[505] = 5.14, -- Tradewinds
			[410] = 5.5, -- Paradise Lost
			[196] = 7.15, -- Swirling Sands
			[498] = 5.75, -- Barrage Of Many Bombs
			[157] = 8.99, -- Rezan's Fury
			[560] = 2.61, -- Bonded Souls
			[503] = 0.1, -- Auto-Self-Cauterizer
		}, {}, 1557133200)

		insertDefaultScalesData(defaultName, 4, 3, { -- Subtlety Rogue
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 10987 - 15859 (avg 13867), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[496] = 0.61, -- Stronger Together
			[414] = 5.33, -- Inevitability
			[561] = 2.18, -- Seductive Power
			[481] = 2.21, -- Incite the Pack
			[495] = 2.62, -- Anduin's Dedication
			[156] = 2.2, -- Ruinous Bolt
			[445] = 1.77, -- Perforate
			[82] = 3.25, -- Champion of Azeroth
			[18] = 0.91, -- Blood Siphon
			[548] = 0.01, -- Lying In Wait
			[497] = 0.6, -- Stand As One
			[196] = 3.09, -- Swirling Sands
			[560] = 0.97, -- Bonded Souls
			[492] = 2.03, -- Liberator's Might
			[501] = 2.99, -- Relational Normalization Gizmo
			[193] = 3.36, -- Blightborne Infusion
			[562] = 4.32, -- Treacherous Covenant
			[522] = 3.23, -- Ancients' Bulwark
			[521] = 2.21, -- Shadow of Elune
			[194] = 2.97, -- Filthy Transfusion
			[485] = 2.95, -- Laser Matrix
			[480] = 2.18, -- Blood Rite
			[498] = 2.16, -- Barrage Of Many Bombs
			[500] = 2.01, -- Synaptic Spark Capacitor
			[505] = 2.36, -- Tradewinds
			[240] = 4.3, -- Blade In The Shadows
			[482] = 2.86, -- Thunderous Blast
			[478] = 3.8, -- Tidal Surge
			[31] = 1.54, -- Gutripper
			[195] = 2.77, -- Secrets of the Deep
			[494] = 3.54, -- Battlefield Precision
			[413] = 10, -- The First Dance
			[124] = 1.67, -- Replicating Shadows
			[21] = 1.06, -- Elemental Whirl
			[22] = 1.47, -- Heed My Call
			[523] = 2.83, -- Apothecary's Concoctions
			[526] = 3.28, -- Endless Hunger
			[175] = 3.49, -- Night's Vengeance
			[499] = 1.22, -- Ricocheting Inflatable Pyrosaw
			[459] = 1.13, -- Unstable Flames
			[157] = 3.54, -- Rezan's Fury
			[504] = 2.98, -- Unstable Catalyst
			[192] = 2.08, -- Meticulous Scheming
			[461] = 0.97, -- Earthlink
			[462] = 0.96, -- Azerite Globules
			[479] = 3.66, -- Dagger in the Back
			[483] = 2.92, -- Archive of the Titans
			[493] = 1.27, -- Last Gift
			[541] = 0.94, -- Fight or Flight
			[30] = 1.77, -- Overwhelming Power
		}, {}, 1557133200)

		insertDefaultScalesData(defaultName, 7, 1, { -- Elemental Shaman
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 15558 - 18501 (avg 16494), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[85] = 0.01, -- Gemhide
			[13] = 0.07, -- Azerite Empowered
			[83] = 0.08, -- Impassive Visage
			[479] = 4.26, -- Dagger in the Back
			[562] = 5.75, -- Treacherous Covenant
			[499] = 1.62, -- Ricocheting Inflatable Pyrosaw
			[196] = 4.22, -- Swirling Sands
			[18] = 0.81, -- Blood Siphon
			[522] = 4.41, -- Ancients' Bulwark
			[193] = 4.73, -- Blightborne Infusion
			[192] = 3.15, -- Meticulous Scheming
			[521] = 2.51, -- Shadow of Elune
			[502] = 0.03, -- Personal Absorb-o-Tron
			[104] = 0.11, -- Bracing Chill
			[482] = 3.44, -- Thunderous Blast
			[178] = 3.65, -- Lava Shock
			[156] = 2.59, -- Ruinous Bolt
			[496] = 0.83, -- Stronger Together
			[30] = 2.1, -- Overwhelming Power
			[31] = 1.93, -- Gutripper
			[194] = 3.63, -- Filthy Transfusion
			[105] = 0.03, -- Ephemeral Recovery
			[14] = 0.04, -- Longstrider
			[539] = 0.13, -- Ancient Ankh Talisman
			[504] = 4.19, -- Unstable Catalyst
			[42] = 0.02, -- Savior
			[481] = 1.98, -- Incite the Pack
			[500] = 2.33, -- Synaptic Spark Capacitor
			[87] = 0.17, -- Self Reliance
			[416] = 4.79, -- Natural Harmony
			[492] = 2.74, -- Liberator's Might
			[38] = 1.28, -- On My Way
			[103] = 0.08, -- Concentrated Mending
			[495] = 3.59, -- Anduin's Dedication
			[44] = 0.05, -- Vampiric Speed
			[561] = 3.11, -- Seductive Power
			[483] = 3.88, -- Archive of the Titans
			[82] = 3.71, -- Champion of Azeroth
			[157] = 4.04, -- Rezan's Fury
			[447] = 3.33, -- Ancestral Resonance
			[526] = 4.45, -- Endless Hunger
			[417] = 0.13, -- Tectonic Thunder
			[457] = 10, -- Igneous Potential
			[21] = 1.4, -- Elemental Whirl
			[485] = 3.68, -- Laser Matrix
			[19] = 0.07, -- Woundbinder
			[448] = 3.32, -- Synapse Shock
			[494] = 3.83, -- Battlefield Precision
			[480] = 2.53, -- Blood Rite
			[222] = 2.71, -- Echo of the Elementals
			[15] = 0.08, -- Resounding Protection
			[195] = 3.75, -- Secrets of the Deep
			[86] = 0.03, -- Azerite Fortification
			[541] = 1.38, -- Fight or Flight
			[560] = 1.29, -- Bonded Souls
			[523] = 3.45, -- Apothecary's Concoctions
			[497] = 0.95, -- Stand As One
			[461] = 1.39, -- Earthlink
			[474] = 0.04, -- Pack Spirit
			[478] = 4.23, -- Tidal Surge
			[503] = 0.1, -- Auto-Self-Cauterizer
			[493] = 1.15, -- Last Gift
			[463] = 0.05, -- Blessed Portents
			[207] = 0.09, -- Serene Spirit
			[459] = 1.77, -- Unstable Flames
			[501] = 3.63, -- Relational Normalization Gizmo
			[462] = 1.34, -- Azerite Globules
			[505] = 2, -- Tradewinds
			[22] = 1.87, -- Heed My Call
			[84] = 0.07, -- Bulwark of the Masses
			[498] = 2.66, -- Barrage Of Many Bombs
		}, {}, 1557133200)

		insertDefaultScalesData(defaultName, 7, 2, { -- Enhancement Shaman
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 15241 - 19749 (avg 17620), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[18] = 1.44, -- Blood Siphon
			[21] = 1.72, -- Elemental Whirl
			[501] = 4.42, -- Relational Normalization Gizmo
			[560] = 1.62, -- Bonded Souls
			[526] = 4.92, -- Endless Hunger
			[478] = 4.63, -- Tidal Surge
			[193] = 5.17, -- Blightborne Infusion
			[505] = 3.67, -- Tradewinds
			[502] = 0.05, -- Personal Absorb-o-Tron
			[493] = 1.92, -- Last Gift
			[482] = 3.97, -- Thunderous Blast
			[459] = 1.81, -- Unstable Flames
			[44] = 0.02, -- Vampiric Speed
			[561] = 3.56, -- Seductive Power
			[485] = 4.14, -- Laser Matrix
			[463] = 0.01, -- Blessed Portents
			[479] = 4.76, -- Dagger in the Back
			[416] = 6.51, -- Natural Harmony
			[22] = 2.09, -- Heed My Call
			[498] = 3.06, -- Barrage Of Many Bombs
			[223] = 2.6, -- Lightning Conduit
			[494] = 4.56, -- Battlefield Precision
			[104] = 0.05, -- Bracing Chill
			[495] = 4.05, -- Anduin's Dedication
			[480] = 3.28, -- Blood Rite
			[420] = 10, -- Roiling Storm
			[500] = 2.54, -- Synaptic Spark Capacitor
			[196] = 4.64, -- Swirling Sands
			[448] = 0.02, -- Synapse Shock
			[504] = 4.65, -- Unstable Catalyst
			[19] = 0.07, -- Woundbinder
			[31] = 2.24, -- Gutripper
			[82] = 4.92, -- Champion of Azeroth
			[192] = 3.85, -- Meticulous Scheming
			[483] = 4.43, -- Archive of the Titans
			[195] = 4.11, -- Secrets of the Deep
			[85] = 0.06, -- Gemhide
			[496] = 1.06, -- Stronger Together
			[522] = 4.92, -- Ancients' Bulwark
			[530] = 4.16, -- Thunderaan's Fury
			[481] = 3.46, -- Incite the Pack
			[156] = 2.79, -- Ruinous Bolt
			[207] = 0.07, -- Serene Spirit
			[179] = 4.31, -- Strength of Earth
			[541] = 1.59, -- Fight or Flight
			[497] = 1.13, -- Stand As One
			[103] = 0.02, -- Concentrated Mending
			[492] = 3.28, -- Liberator's Might
			[447] = 5.66, -- Ancestral Resonance
			[157] = 4.66, -- Rezan's Fury
			[503] = 0.03, -- Auto-Self-Cauterizer
			[461] = 1.5, -- Earthlink
			[499] = 1.83, -- Ricocheting Inflatable Pyrosaw
			[521] = 3.23, -- Shadow of Elune
			[30] = 2.89, -- Overwhelming Power
			[194] = 4.11, -- Filthy Transfusion
			[137] = 7.03, -- Primal Primer
			[562] = 6.38, -- Treacherous Covenant
			[38] = 1.57, -- On My Way
			[462] = 1.4, -- Azerite Globules
			[14] = 0.09, -- Longstrider
			[539] = 0.01, -- Ancient Ankh Talisman
			[523] = 3.86, -- Apothecary's Concoctions
		}, {}, 1557133200)

		insertDefaultScalesData(defaultName, 9, 1, { -- Affliction Warlock
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 10712 - 13832 (avg 11612), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[494] = 8.95, -- Battlefield Precision
			[496] = 1.67, -- Stronger Together
			[195] = 6.36, -- Secrets of the Deep
			[481] = 6.45, -- Incite the Pack
			[505] = 7.12, -- Tradewinds
			[500] = 4.45, -- Synaptic Spark Capacitor
			[461] = 2.09, -- Earthlink
			[492] = 4.82, -- Liberator's Might
			[480] = 5.34, -- Blood Rite
			[156] = 5.09, -- Ruinous Bolt
			[497] = 1.55, -- Stand As One
			[196] = 6.9, -- Swirling Sands
			[230] = 7.09, -- Cascading Calamity
			[22] = 3.72, -- Heed My Call
			[495] = 6.16, -- Anduin's Dedication
			[523] = 6.77, -- Apothecary's Concoctions
			[493] = 3.9, -- Last Gift
			[194] = 7.9, -- Filthy Transfusion
			[442] = 8.32, -- Pandemic Invocation
			[526] = 8.2, -- Endless Hunger
			[483] = 6.79, -- Archive of the Titans
			[193] = 7.88, -- Blightborne Infusion
			[183] = 8.33, -- Inevitable Demise
			[485] = 7.6, -- Laser Matrix
			[498] = 5.46, -- Barrage Of Many Bombs
			[18] = 2.49, -- Blood Siphon
			[482] = 7.32, -- Thunderous Blast
			[562] = 10, -- Treacherous Covenant
			[425] = 7.38, -- Sudden Onset
			[30] = 4.97, -- Overwhelming Power
			[462] = 2.34, -- Azerite Globules
			[560] = 2.72, -- Bonded Souls
			[31] = 3.95, -- Gutripper
			[522] = 8.24, -- Ancients' Bulwark
			[123] = 8.76, -- Wracking Brilliance
			[561] = 5.38, -- Seductive Power
			[426] = 5.36, -- Dreadful Calling
			[459] = 2.5, -- Unstable Flames
			[504] = 7.23, -- Unstable Catalyst
			[479] = 8.8, -- Dagger in the Back
			[521] = 5.32, -- Shadow of Elune
			[478] = 8.12, -- Tidal Surge
			[157] = 8.35, -- Rezan's Fury
			[501] = 7.05, -- Relational Normalization Gizmo
			[499] = 3.14, -- Ricocheting Inflatable Pyrosaw
			[192] = 6.27, -- Meticulous Scheming
			[541] = 2.19, -- Fight or Flight
			[21] = 2.89, -- Elemental Whirl
			[82] = 7.73, -- Champion of Azeroth
		}, {}, 1557133200)

		insertDefaultScalesData(defaultName, 9, 2, { -- Demonology Warlock
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 10138 - 13356 (avg 10987), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[429] = 10, -- Baleful Invocation
			[462] = 1.12, -- Azerite Globules
			[503] = 0.13, -- Auto-Self-Cauterizer
			[21] = 1.6, -- Elemental Whirl
			[526] = 4.77, -- Endless Hunger
			[560] = 1.57, -- Bonded Souls
			[485] = 3.3, -- Laser Matrix
			[498] = 2.45, -- Barrage Of Many Bombs
			[493] = 1.93, -- Last Gift
			[495] = 3.57, -- Anduin's Dedication
			[483] = 4.01, -- Archive of the Titans
			[531] = 0.06, -- Terror of the Mind
			[492] = 2.94, -- Liberator's Might
			[502] = 0.02, -- Personal Absorb-o-Tron
			[459] = 1.68, -- Unstable Flames
			[13] = 0.05, -- Azerite Empowered
			[521] = 2.86, -- Shadow of Elune
			[479] = 4.03, -- Dagger in the Back
			[562] = 5.72, -- Treacherous Covenant
			[195] = 3.73, -- Secrets of the Deep
			[85] = 0.09, -- Gemhide
			[22] = 1.71, -- Heed My Call
			[458] = 3.5, -- Supreme Commander
			[494] = 2.54, -- Battlefield Precision
			[196] = 3.35, -- Swirling Sands
			[194] = 3.38, -- Filthy Transfusion
			[481] = 3.34, -- Incite the Pack
			[497] = 0.95, -- Stand As One
			[428] = 4.12, -- Demonic Meteor
			[86] = 0.02, -- Azerite Fortification
			[523] = 3.14, -- Apothecary's Concoctions
			[482] = 3.15, -- Thunderous Blast
			[561] = 3.05, -- Seductive Power
			[192] = 3.06, -- Meticulous Scheming
			[500] = 2.16, -- Synaptic Spark Capacitor
			[18] = 1.36, -- Blood Siphon
			[541] = 1.21, -- Fight or Flight
			[478] = 3.75, -- Tidal Surge
			[30] = 2.7, -- Overwhelming Power
			[501] = 3.9, -- Relational Normalization Gizmo
			[190] = 3.42, -- Umbral Blaze
			[504] = 4.13, -- Unstable Catalyst
			[461] = 1.18, -- Earthlink
			[193] = 4.55, -- Blightborne Infusion
			[82] = 4.61, -- Champion of Azeroth
			[505] = 3.67, -- Tradewinds
			[130] = 2.43, -- Shadow's Bite
			[480] = 2.97, -- Blood Rite
			[522] = 4.7, -- Ancients' Bulwark
			[31] = 1.81, -- Gutripper
			[157] = 3.9, -- Rezan's Fury
			[84] = 0.02, -- Bulwark of the Masses
			[496] = 0.93, -- Stronger Together
			[499] = 1.5, -- Ricocheting Inflatable Pyrosaw
			[156] = 2.33, -- Ruinous Bolt
		}, {}, 1557133200)

		insertDefaultScalesData(defaultName, 9, 3, { -- Destruction Warlock
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 12648 - 16137 (avg 13661), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[499] = 2.64, -- Ricocheting Inflatable Pyrosaw
			[560] = 2.56, -- Bonded Souls
			[462] = 1.91, -- Azerite Globules
			[18] = 2.67, -- Blood Siphon
			[459] = 2.87, -- Unstable Flames
			[444] = 9.11, -- Crashing Chaos
			[523] = 5.82, -- Apothecary's Concoctions
			[522] = 8.63, -- Ancients' Bulwark
			[31] = 3.54, -- Gutripper
			[482] = 5.93, -- Thunderous Blast
			[494] = 6.47, -- Battlefield Precision
			[541] = 2.22, -- Fight or Flight
			[22] = 3.12, -- Heed My Call
			[504] = 7.01, -- Unstable Catalyst
			[481] = 5.82, -- Incite the Pack
			[498] = 4.44, -- Barrage Of Many Bombs
			[131] = 7.71, -- Chaos Shards
			[30] = 4.61, -- Overwhelming Power
			[521] = 5.09, -- Shadow of Elune
			[495] = 6.06, -- Anduin's Dedication
			[505] = 6.25, -- Tradewinds
			[461] = 2.15, -- Earthlink
			[497] = 1.6, -- Stand As One
			[232] = 4.88, -- Flashpoint
			[496] = 1.5, -- Stronger Together
			[193] = 8.12, -- Blightborne Infusion
			[485] = 6.11, -- Laser Matrix
			[531] = 0.02, -- Terror of the Mind
			[196] = 6.94, -- Swirling Sands
			[21] = 2.78, -- Elemental Whirl
			[478] = 7.41, -- Tidal Surge
			[156] = 4.3, -- Ruinous Bolt
			[492] = 5.11, -- Liberator's Might
			[493] = 3.42, -- Last Gift
			[561] = 4.92, -- Seductive Power
			[562] = 10, -- Treacherous Covenant
			[526] = 8.75, -- Endless Hunger
			[483] = 6.45, -- Archive of the Titans
			[480] = 5.04, -- Blood Rite
			[479] = 7.48, -- Dagger in the Back
			[157] = 7.22, -- Rezan's Fury
			[194] = 6.28, -- Filthy Transfusion
			[501] = 6.92, -- Relational Normalization Gizmo
			[82] = 7.82, -- Champion of Azeroth
			[432] = 7.36, -- Chaotic Inferno
			[460] = 6.25, -- Bursting Flare
			[195] = 6.15, -- Secrets of the Deep
			[500] = 3.76, -- Synaptic Spark Capacitor
			[44] = 0.1, -- Vampiric Speed
			[192] = 5.33, -- Meticulous Scheming
		}, {}, 1557133200)

		insertDefaultScalesData(defaultName, 1, 1, { -- Arms Warrior
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 7330 - 10506 (avg 7970), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[195] = 5.42, -- Secrets of the Deep
			[434] = 9.54, -- Crushing Assault
			[194] = 6.43, -- Filthy Transfusion
			[101] = 0.16, -- Shimmering Haven
			[98] = 0.04, -- Crystalline Carapace
			[523] = 5.52, -- Apothecary's Concoctions
			[30] = 4.29, -- Overwhelming Power
			[476] = 0.15, -- Moment of Glory
			[44] = 0.02, -- Vampiric Speed
			[18] = 2.09, -- Blood Siphon
			[83] = 0.09, -- Impassive Visage
			[505] = 5.35, -- Tradewinds
			[477] = 0.05, -- Bury the Hatchet
			[193] = 8.16, -- Blightborne Infusion
			[462] = 2.08, -- Azerite Globules
			[522] = 6.95, -- Ancients' Bulwark
			[480] = 4.73, -- Blood Rite
			[89] = 0.05, -- Azerite Veins
			[495] = 5.2, -- Anduin's Dedication
			[483] = 5.84, -- Archive of the Titans
			[485] = 6.23, -- Laser Matrix
			[157] = 7.03, -- Rezan's Fury
			[192] = 5.81, -- Meticulous Scheming
			[481] = 5.21, -- Incite the Pack
			[14] = 0.08, -- Longstrider
			[87] = 0.09, -- Self Reliance
			[504] = 6.11, -- Unstable Catalyst
			[435] = 5.56, -- Lord of War
			[561] = 4.73, -- Seductive Power
			[461] = 1.9, -- Earthlink
			[174] = 6.9, -- Gathering Storm
			[43] = 0.15, -- Winds of War
			[196] = 7.38, -- Swirling Sands
			[501] = 6.12, -- Relational Normalization Gizmo
			[492] = 4.83, -- Liberator's Might
			[499] = 2.69, -- Ricocheting Inflatable Pyrosaw
			[496] = 1.43, -- Stronger Together
			[478] = 6.9, -- Tidal Surge
			[521] = 4.69, -- Shadow of Elune
			[494] = 7.04, -- Battlefield Precision
			[459] = 2.85, -- Unstable Flames
			[526] = 6.88, -- Endless Hunger
			[482] = 6.02, -- Thunderous Blast
			[100] = 0.13, -- Strength in Numbers
			[497] = 1.46, -- Stand As One
			[99] = 0.18, -- Ablative Shielding
			[562] = 8.23, -- Treacherous Covenant
			[493] = 3.05, -- Last Gift
			[554] = 0.07, -- Intimidating Presence
			[15] = 0.19, -- Resounding Protection
			[498] = 4.56, -- Barrage Of Many Bombs
			[500] = 3.76, -- Synaptic Spark Capacitor
			[502] = 0.1, -- Personal Absorb-o-Tron
			[541] = 2.11, -- Fight or Flight
			[156] = 4.15, -- Ruinous Bolt
			[84] = 0.23, -- Bulwark of the Masses
			[22] = 3.16, -- Heed My Call
			[20] = 2.33, -- Lifespeed
			[479] = 7.01, -- Dagger in the Back
			[433] = 4.44, -- Seismic Wave
			[13] = 0.16, -- Azerite Empowered
			[86] = 0.02, -- Azerite Fortification
			[85] = 0.1, -- Gemhide
			[560] = 2.46, -- Bonded Souls
			[226] = 10, -- Test of Might
			[21] = 2.55, -- Elemental Whirl
			[31] = 3.44, -- Gutripper
			[121] = 6.42, -- Striking the Anvil
			[503] = 0.09, -- Auto-Self-Cauterizer
			[82] = 7.19, -- Champion of Azeroth
		}, {}, 1557133200)

		insertDefaultScalesData(defaultName, 1, 2, { -- Fury Warrior
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 9991 - 13971 (avg 10881), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[492] = 4.26, -- Liberator's Might
			[562] = 7.03, -- Treacherous Covenant
			[21] = 2.2, -- Elemental Whirl
			[479] = 5.93, -- Dagger in the Back
			[501] = 5.52, -- Relational Normalization Gizmo
			[541] = 1.76, -- Fight or Flight
			[157] = 6.68, -- Rezan's Fury
			[522] = 6.3, -- Ancients' Bulwark
			[482] = 5.83, -- Thunderous Blast
			[497] = 1.2, -- Stand As One
			[495] = 4.42, -- Anduin's Dedication
			[87] = 0.11, -- Self Reliance
			[494] = 6.82, -- Battlefield Precision
			[18] = 2.06, -- Blood Siphon
			[462] = 1.87, -- Azerite Globules
			[451] = 5.19, -- Infinite Fury
			[554] = 0.02, -- Intimidating Presence
			[478] = 5.59, -- Tidal Surge
			[461] = 1.56, -- Earthlink
			[480] = 4.59, -- Blood Rite
			[561] = 4.35, -- Seductive Power
			[229] = 5.54, -- Pulverizing Blows
			[498] = 4.38, -- Barrage Of Many Bombs
			[496] = 1.22, -- Stronger Together
			[481] = 4.84, -- Incite the Pack
			[176] = 6.04, -- Cold Steel, Hot Blood
			[22] = 2.93, -- Heed My Call
			[493] = 2.8, -- Last Gift
			[505] = 5.28, -- Tradewinds
			[156] = 3.31, -- Ruinous Bolt
			[193] = 6.46, -- Blightborne Infusion
			[30] = 4.73, -- Overwhelming Power
			[196] = 5.77, -- Swirling Sands
			[523] = 4.63, -- Apothecary's Concoctions
			[31] = 3.22, -- Gutripper
			[438] = 7.61, -- Reckless Flurry
			[192] = 5.94, -- Meticulous Scheming
			[194] = 6.02, -- Filthy Transfusion
			[483] = 4.8, -- Archive of the Titans
			[499] = 2.55, -- Ricocheting Inflatable Pyrosaw
			[500] = 2.92, -- Synaptic Spark Capacitor
			[195] = 4.44, -- Secrets of the Deep
			[20] = 2.54, -- Lifespeed
			[119] = 10, -- Unbridled Ferocity
			[560] = 2.62, -- Bonded Souls
			[526] = 6.21, -- Endless Hunger
			[82] = 6.94, -- Champion of Azeroth
			[521] = 4.5, -- Shadow of Elune
			[504] = 5.23, -- Unstable Catalyst
			[89] = 0.05, -- Azerite Veins
			[459] = 2.22, -- Unstable Flames
			[437] = 7.69, -- Simmering Rage
			[485] = 5.94, -- Laser Matrix
		}, {}, 1557133200)

		insertDefaultScalesData(offensiveName, 1, 3, { -- Protection Warrior
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 5543 - 8456 (avg 6204), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[478] = 6.79, -- Tidal Surge
			[483] = 4.96, -- Archive of the Titans
			[87] = 0.02, -- Self Reliance
			[476] = 0.06, -- Moment of Glory
			[485] = 7.07, -- Laser Matrix
			[44] = 0.05, -- Vampiric Speed
			[497] = 1.14, -- Stand As One
			[84] = 0.04, -- Bulwark of the Masses
			[157] = 7.8, -- Rezan's Fury
			[541] = 2.64, -- Fight or Flight
			[562] = 7, -- Treacherous Covenant
			[82] = 5.5, -- Champion of Azeroth
			[459] = 2.13, -- Unstable Flames
			[440] = 1.8, -- Callous Reprisal
			[482] = 6.8, -- Thunderous Blast
			[21] = 1.79, -- Elemental Whirl
			[561] = 4.2, -- Seductive Power
			[560] = 2.08, -- Bonded Souls
			[196] = 5.3, -- Swirling Sands
			[20] = 1.94, -- Lifespeed
			[522] = 5.7, -- Ancients' Bulwark
			[83] = 0.05, -- Impassive Visage
			[504] = 5.06, -- Unstable Catalyst
			[523] = 5.63, -- Apothecary's Concoctions
			[479] = 4.8, -- Dagger in the Back
			[505] = 4.11, -- Tradewinds
			[195] = 4.52, -- Secrets of the Deep
			[18] = 1.63, -- Blood Siphon
			[495] = 4.46, -- Anduin's Dedication
			[494] = 5.01, -- Battlefield Precision
			[462] = 2.39, -- Azerite Globules
			[480] = 3.78, -- Blood Rite
			[503] = 0.07, -- Auto-Self-Cauterizer
			[450] = 3.42, -- Brace for Impact
			[30] = 3.8, -- Overwhelming Power
			[194] = 7.16, -- Filthy Transfusion
			[192] = 4.9, -- Meticulous Scheming
			[237] = 6.08, -- Bastion of Might
			[193] = 5.96, -- Blightborne Infusion
			[89] = 0.03, -- Azerite Veins
			[521] = 3.76, -- Shadow of Elune
			[500] = 3.99, -- Synaptic Spark Capacitor
			[499] = 3.32, -- Ricocheting Inflatable Pyrosaw
			[441] = 3.02, -- Iron Fortress
			[501] = 4.84, -- Relational Normalization Gizmo
			[526] = 5.7, -- Endless Hunger
			[118] = 10, -- Deafening Crash
			[101] = 0.1, -- Shimmering Haven
			[554] = 0.05, -- Intimidating Presence
			[492] = 3.6, -- Liberator's Might
			[177] = 0.01, -- Bloodsport
			[156] = 4.15, -- Ruinous Bolt
			[493] = 2.3, -- Last Gift
			[498] = 5.42, -- Barrage Of Many Bombs
			[100] = 0.01, -- Strength in Numbers
			[31] = 3.75, -- Gutripper
			[99] = 0.07, -- Ablative Shielding
			[496] = 1.06, -- Stronger Together
			[98] = 0.01, -- Crystalline Carapace
			[481] = 3.71, -- Incite the Pack
			[461] = 1.59, -- Earthlink
			[22] = 3.55, -- Heed My Call
		}, {}, 1557133200)

		insertDefaultScalesData(defensiveName, 12, 2, { -- Vengeance Demon Hunter (TMI)
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 4789 - 8034 (avg 5419), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[22] = 0.04, -- Heed My Call
			[502] = 0.13, -- Personal Absorb-o-Tron
			[560] = 0.76, -- Bonded Souls
			[497] = 1.02, -- Stand As One
			[522] = 4.82, -- Ancients' Bulwark
			[479] = 0.13, -- Dagger in the Back
			[43] = 0.19, -- Winds of War
			[196] = 4.87, -- Swirling Sands
			[503] = 0.04, -- Auto-Self-Cauterizer
			[482] = 0.23, -- Thunderous Blast
			[505] = 2.14, -- Tradewinds
			[466] = 0.08, -- Burning Soul
			[354] = 0.08, -- Cycle of Binding
			[101] = 0.06, -- Shimmering Haven
			[562] = 3.97, -- Treacherous Covenant
			[82] = 4.13, -- Champion of Azeroth
			[98] = 0.04, -- Crystalline Carapace
			[15] = 10, -- Resounding Protection
			[541] = 1.11, -- Fight or Flight
			[498] = 0.09, -- Barrage Of Many Bombs
			[202] = 0.16, -- Soulmonger
			[483] = 2.78, -- Archive of the Titans
			[504] = 2.95, -- Unstable Catalyst
			[480] = 0.6, -- Blood Rite
			[84] = 0.11, -- Bulwark of the Masses
			[157] = 0.1, -- Rezan's Fury
			[99] = 0.13, -- Ablative Shielding
			[478] = 0.02, -- Tidal Surge
			[495] = 2.55, -- Anduin's Dedication
			[501] = 2.35, -- Relational Normalization Gizmo
			[21] = 1.64, -- Elemental Whirl
			[459] = 2.25, -- Unstable Flames
			[20] = 0.93, -- Lifespeed
			[18] = 3.38, -- Blood Siphon
			[134] = 0.09, -- Revel in Pain
			[521] = 0.62, -- Shadow of Elune
			[193] = 5.17, -- Blightborne Infusion
			[496] = 0.86, -- Stronger Together
			[461] = 0.77, -- Earthlink
			[493] = 1.25, -- Last Gift
			[87] = 0.03, -- Self Reliance
			[195] = 2.93, -- Secrets of the Deep
			[561] = 3.87, -- Seductive Power
			[481] = 2.05, -- Incite the Pack
			[492] = 2.74, -- Liberator's Might
			[246] = 0.07, -- Hour of Reaping
			[30] = 0.29, -- Overwhelming Power
			[526] = 4.69, -- Endless Hunger
			[156] = 0.15, -- Ruinous Bolt
			[192] = 1.49, -- Meticulous Scheming
			[494] = 0.1, -- Battlefield Precision
			[89] = 0.08, -- Azerite Veins
		}, {}, 1557133200)

		insertDefaultScalesData(defensiveName, 6, 1, { -- Blood Death Knight (TMI)
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 6821 - 10121 (avg 7614), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[505] = 6.11, -- Tradewinds
			[82] = 5.85, -- Champion of Azeroth
			[461] = 0.78, -- Earthlink
			[526] = 4.2, -- Endless Hunger
			[492] = 3.89, -- Liberator's Might
			[100] = 0.04, -- Strength in Numbers
			[30] = 3.54, -- Overwhelming Power
			[501] = 5.13, -- Relational Normalization Gizmo
			[482] = 0.03, -- Thunderous Blast
			[562] = 3.97, -- Treacherous Covenant
			[522] = 4.36, -- Ancients' Bulwark
			[192] = 4.68, -- Meticulous Scheming
			[541] = 1.09, -- Fight or Flight
			[197] = 6.86, -- Marrowblood
			[497] = 1.21, -- Stand As One
			[495] = 2.44, -- Anduin's Dedication
			[349] = 5.35, -- Bones of the Damned
			[521] = 3.7, -- Shadow of Elune
			[140] = 2.68, -- Bone Spike Graveyard
			[20] = 2.54, -- Lifespeed
			[21] = 2.18, -- Elemental Whirl
			[459] = 1.86, -- Unstable Flames
			[481] = 5.63, -- Incite the Pack
			[195] = 2.79, -- Secrets of the Deep
			[504] = 3.15, -- Unstable Catalyst
			[348] = 4.53, -- Eternal Rune Weapon
			[43] = 0.21, -- Winds of War
			[106] = 4.21, -- Deep Cuts
			[18] = 4.93, -- Blood Siphon
			[496] = 1.21, -- Stronger Together
			[193] = 4.68, -- Blightborne Infusion
			[483] = 2.95, -- Archive of the Titans
			[499] = 0.09, -- Ricocheting Inflatable Pyrosaw
			[243] = 9.18, -- Bloody Runeblade
			[560] = 2.25, -- Bonded Souls
			[196] = 4.14, -- Swirling Sands
			[561] = 5.54, -- Seductive Power
			[15] = 10, -- Resounding Protection
			[480] = 3.89, -- Blood Rite
			[493] = 3.44, -- Last Gift
		}, {}, 1557133200)

		insertDefaultScalesData(defensiveName, 11, 3, { -- Guardian Druid (TMI)
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 5001 - 7028 (avg 5404), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[196] = 1.24, -- Swirling Sands
			[241] = 0.45, -- Twisted Claws
			[496] = 0.2, -- Stronger Together
			[561] = 1.65, -- Seductive Power
			[15] = 4.95, -- Resounding Protection
			[195] = 0.37, -- Secrets of the Deep
			[18] = 2.18, -- Blood Siphon
			[462] = 0.01, -- Azerite Globules
			[504] = 0.4, -- Unstable Catalyst
			[361] = 10, -- Guardian's Wrath
			[157] = 0.01, -- Rezan's Fury
			[193] = 1.33, -- Blightborne Infusion
			[541] = 0.11, -- Fight or Flight
			[21] = 0.37, -- Elemental Whirl
			[492] = 0.57, -- Liberator's Might
			[479] = 0.03, -- Dagger in the Back
			[562] = 0.52, -- Treacherous Covenant
			[526] = 1.32, -- Endless Hunger
			[461] = 0.15, -- Earthlink
			[83] = 0.01, -- Impassive Visage
			[497] = 0.35, -- Stand As One
			[498] = 0.01, -- Barrage Of Many Bombs
			[251] = 1.02, -- Burst of Savagery
			[101] = 0.01, -- Shimmering Haven
			[503] = 0.04, -- Auto-Self-Cauterizer
			[192] = 0.01, -- Meticulous Scheming
			[463] = 0.01, -- Blessed Portents
			[44] = 0.01, -- Vampiric Speed
			[522] = 1.26, -- Ancients' Bulwark
			[459] = 0.53, -- Unstable Flames
			[85] = 0.09, -- Gemhide
			[82] = 1.05, -- Champion of Azeroth
			[86] = 0.03, -- Azerite Fortification
			[523] = 0.04, -- Apothecary's Concoctions
			[481] = 0.92, -- Incite the Pack
			[171] = 0.04, -- Masterful Instincts
			[467] = 0.02, -- Ursoc's Endurance
			[483] = 0.3, -- Archive of the Titans
			[480] = 0.01, -- Blood Rite
			[493] = 0.53, -- Last Gift
			[505] = 1.04, -- Tradewinds
			[100] = 0.02, -- Strength in Numbers
			[495] = 0.32, -- Anduin's Dedication
			[501] = 0.75, -- Relational Normalization Gizmo
			[38] = 0.37, -- On My Way
		}, {}, 1557133200)

		insertDefaultScalesData(defensiveName, 10, 1, { -- Brewmaster Monk (TMI)
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 5746 - 12498 (avg 8852), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[195] = 0.25, -- Secrets of the Deep
			[496] = 0.08, -- Stronger Together
			[31] = 0.01, -- Gutripper
			[82] = 0.57, -- Champion of Azeroth
			[384] = 0.49, -- Elusive Footwork
			[502] = 0.02, -- Personal Absorb-o-Tron
			[521] = 0.12, -- Shadow of Elune
			[499] = 0.01, -- Ricocheting Inflatable Pyrosaw
			[18] = 1.12, -- Blood Siphon
			[116] = 2.09, -- Boiling Brew
			[85] = 0.03, -- Gemhide
			[500] = 0.01, -- Synaptic Spark Capacitor
			[562] = 0.37, -- Treacherous Covenant
			[566] = 0.01, -- Exit Strategy
			[38] = 0.17, -- On My Way
			[103] = 0.01, -- Concentrated Mending
			[459] = 0.08, -- Unstable Flames
			[21] = 0.19, -- Elemental Whirl
			[238] = 0.01, -- Fit to Burst
			[193] = 0.23, -- Blightborne Infusion
			[494] = 0.01, -- Battlefield Precision
			[19] = 0.01, -- Woundbinder
			[42] = 0.01, -- Savior
			[98] = 0.01, -- Crystalline Carapace
			[84] = 0.01, -- Bulwark of the Masses
			[83] = 0.02, -- Impassive Visage
			[497] = 0.15, -- Stand As One
			[495] = 0.25, -- Anduin's Dedication
			[218] = 0.02, -- Strength of Spirit
			[504] = 0.28, -- Unstable Catalyst
			[560] = 0.01, -- Bonded Souls
			[522] = 0.56, -- Ancients' Bulwark
			[481] = 0.92, -- Incite the Pack
			[461] = 0.1, -- Earthlink
			[479] = 0.01, -- Dagger in the Back
			[561] = 0.62, -- Seductive Power
			[192] = 0.14, -- Meticulous Scheming
			[493] = 0.58, -- Last Gift
			[480] = 0.13, -- Blood Rite
			[463] = 0.02, -- Blessed Portents
			[526] = 0.56, -- Endless Hunger
			[156] = 0.02, -- Ruinous Bolt
			[470] = 0.01, -- Sweep the Leg
			[501] = 0.37, -- Relational Normalization Gizmo
			[478] = 0.02, -- Tidal Surge
			[15] = 2.51, -- Resounding Protection
			[22] = 0.01, -- Heed My Call
			[30] = 0.09, -- Overwhelming Power
			[492] = 0.06, -- Liberator's Might
			[505] = 0.92, -- Tradewinds
			[101] = 0.01, -- Shimmering Haven
			[498] = 0.01, -- Barrage Of Many Bombs
			[89] = 0.02, -- Azerite Veins
			[186] = 10, -- Staggering Strikes
			[383] = 0.64, -- Training of Niuzao
			[483] = 0.29, -- Archive of the Titans
			[100] = 0.02, -- Strength in Numbers
			[541] = 0.11, -- Fight or Flight
			[196] = 0.21, -- Swirling Sands
		}, {}, 1557133200)

		insertDefaultScalesData(defensiveName, 2, 2, { -- Protection Paladin (TMI)
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 11640 - 14531 (avg 12348), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[18] = 3.91, -- Blood Siphon
			[480] = 0.8, -- Blood Rite
			[87] = 0.05, -- Self Reliance
			[562] = 0.77, -- Treacherous Covenant
			[85] = 0.01, -- Gemhide
			[84] = 0.06, -- Bulwark of the Masses
			[15] = 10, -- Resounding Protection
			[21] = 0.68, -- Elemental Whirl
			[393] = 0.04, -- Grace of the Justicar
			[492] = 1.12, -- Liberator's Might
			[150] = 0.86, -- Soaring Shield
			[505] = 1.96, -- Tradewinds
			[38] = 0.33, -- On My Way
			[483] = 0.65, -- Archive of the Titans
			[82] = 2, -- Champion of Azeroth
			[20] = 0.41, -- Lifespeed
			[497] = 0.42, -- Stand As One
			[521] = 0.85, -- Shadow of Elune
			[481] = 1.87, -- Incite the Pack
			[538] = 0.06, -- Empyreal Ward
			[459] = 0.87, -- Unstable Flames
			[493] = 1.13, -- Last Gift
			[504] = 0.54, -- Unstable Catalyst
			[496] = 0.33, -- Stronger Together
			[560] = 0.34, -- Bonded Souls
			[561] = 2.44, -- Seductive Power
			[501] = 1.55, -- Relational Normalization Gizmo
			[125] = 0.72, -- Avenger's Might
			[234] = 0.56, -- Inner Light
			[526] = 1.58, -- Endless Hunger
			[463] = 0.01, -- Blessed Portents
			[502] = 0.02, -- Personal Absorb-o-Tron
			[461] = 0.16, -- Earthlink
			[522] = 1.55, -- Ancients' Bulwark
			[541] = 0.12, -- Fight or Flight
			[31] = 0.02, -- Gutripper
			[193] = 2.09, -- Blightborne Infusion
			[495] = 0.53, -- Anduin's Dedication
			[192] = 1.05, -- Meticulous Scheming
			[89] = 0.07, -- Azerite Veins
			[195] = 0.57, -- Secrets of the Deep
			[482] = 0.07, -- Thunderous Blast
			[22] = 0.01, -- Heed My Call
			[196] = 1.98, -- Swirling Sands
			[104] = 0.03, -- Bracing Chill
			[86] = 0.01, -- Azerite Fortification
			[30] = 0.65, -- Overwhelming Power
			[395] = 0.98, -- Inspiring Vanguard
		}, {}, 1557133200)

		insertDefaultScalesData(defensiveName, 1, 3, { -- Protection Warrior (TMI)
			-- SimulationCraft 815-02 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 5626 - 8563 (avg 6216), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 06.05.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[20] = 0.01, -- Lifespeed
			[526] = 0.12, -- Endless Hunger
			[560] = 0.02, -- Bonded Souls
			[541] = 0.03, -- Fight or Flight
			[505] = 0.13, -- Tradewinds
			[476] = 0.01, -- Moment of Glory
			[496] = 0.01, -- Stronger Together
			[98] = 0.01, -- Crystalline Carapace
			[501] = 0.11, -- Relational Normalization Gizmo
			[521] = 0.03, -- Shadow of Elune
			[523] = 0.02, -- Apothecary's Concoctions
			[483] = 0.1, -- Archive of the Titans
			[15] = 1.54, -- Resounding Protection
			[450] = 0.33, -- Brace for Impact
			[194] = 0.06, -- Filthy Transfusion
			[495] = 0.08, -- Anduin's Dedication
			[192] = 0.04, -- Meticulous Scheming
			[522] = 0.1, -- Ancients' Bulwark
			[459] = 0.07, -- Unstable Flames
			[237] = 0.52, -- Bastion of Might
			[479] = 0.03, -- Dagger in the Back
			[493] = 0.06, -- Last Gift
			[18] = 0.44, -- Blood Siphon
			[561] = 0.23, -- Seductive Power
			[30] = 0.01, -- Overwhelming Power
			[492] = 0.11, -- Liberator's Might
			[480] = 0.03, -- Blood Rite
			[441] = 0.05, -- Iron Fortress
			[118] = 0.29, -- Deafening Crash
			[82] = 0.15, -- Champion of Azeroth
			[440] = 10, -- Callous Reprisal
			[196] = 0.18, -- Swirling Sands
			[195] = 0.08, -- Secrets of the Deep
			[157] = 0.04, -- Rezan's Fury
			[177] = 0.41, -- Bloodsport
			[504] = 0.09, -- Unstable Catalyst
			[21] = 0.04, -- Elemental Whirl
			[497] = 0.04, -- Stand As One
			[461] = 0.04, -- Earthlink
			[481] = 0.12, -- Incite the Pack
			[562] = 0.13, -- Treacherous Covenant
			[193] = 0.21, -- Blightborne Infusion
		}, {}, 1557133200)

		insertDefaultScalesData(defaultName, 5, 3, { -- Shadow Priest
			-- Shadow Priest by WarcraftPriests (https://warcraftpriests.com/)
			-- https://github.com/WarcraftPriests/bfa-shadow-priest/blob/master/azerite-traits/AzeritePowerWeights_AS.md
			-- First Imported: 03.09.2018, Updated: 06.05.2019
			[236] = 4.65,
			[193] = 4.38,
			[562] = 4.32,
			[405] = 4.16,
			[196] = 3.95,
			[82] = 3.93,
			[479] = 3.67,
			[488] = 3.59,
			[526] = 3.55,
			[501] = 3.54,
			[522] = 3.52,
			[157] = 3.51,
			[192] = 3.5,
			[504] = 3.23,
			[483] = 3.14,
			[478] = 3.13,
			[485] = 3.13,
			[194] = 3.12,
			[482] = 3.05,
			[404] = 2.95,
			[523] = 2.9,
			[195] = 2.86,
			[521] = 2.81,
			[30] = 2.79,
			[480] = 2.78,
			[505] = 2.78,
			[489] = 2.74,
			[486] = 2.69,
			[561] = 2.61,
			[403] = 2.61,
			[481] = 2.55,
			[498] = 2.27,
			[156] = 1.87,
			[31] = 1.7,
			[500] = 1.68,
			[22] = 1.56,
			[560] = 1.53,
			[459] = 1.5,
			[487] = 1.48,
			[499] = 1.35,
			[21] = 1.32,
			[166] = 1.23,
			[541] = 1.07,
			[491] = 1.06,
			[18] = 1.04,
			[462] = 1.03,
			[38] = 1,
			[461] = 0.93,
			[490] = 0.76,
			[13] = 0.39,
			[115] = 0.03,
		}, {}, 1557133200)


		insertDefaultScalesData(offensiveName, 5, 1, { -- Discipline Priest

		}, {})

		insertDefaultScalesData(defaultName, 11, 4, { -- Restoration Druid

		}, {})

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