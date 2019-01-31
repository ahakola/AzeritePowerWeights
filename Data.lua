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
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 7497 - 10823 (avg 8002), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = 0.08, -- Resounding Protection
			[18] = 2.1, -- Blood Siphon
			[20] = 2.28, -- Lifespeed
			[21] = 2.42, -- Elemental Whirl
			[22] = 3.12, -- Heed My Call
			[30] = 4.26, -- Overwhelming Power
			[31] = 3.34, -- Gutripper
			[43] = 0.06, -- Winds of War
			[82] = 7.29, -- Champion of Azeroth
			[83] = 0.03, -- Impassive Visage
			[85] = 0.12, -- Gemhide
			[87] = 0.05, -- Self Reliance
			[89] = 0.04, -- Azerite Veins
			[98] = 0.15, -- Crystalline Carapace
			[121] = 6.13, -- Striking the Anvil
			[156] = 4.18, -- Ruinous Bolt
			[157] = 7.11, -- Rezan's Fury
			[174] = 7.02, -- Gathering Storm
			[192] = 6.08, -- Meticulous Scheming
			[193] = 8.2, -- Blightborne Infusion
			[194] = 6.53, -- Filthy Transfusion
			[195] = 5.42, -- Secrets of the Deep
			[196] = 7.31, -- Swirling Sands
			[226] = 10, -- Test of Might
			[433] = 4.42, -- Seismic Wave
			[434] = 9.62, -- Crushing Assault
			[435] = 5.44, -- Lord of War
			[459] = 2.86, -- Unstable Flames
			[461] = 1.88, -- Earthlink
			[462] = 1.94, -- Azerite Globules
			[478] = 7.12, -- Tidal Surge
			[479] = 7.05, -- Dagger in the Back
			[480] = 4.81, -- Blood Rite
			[481] = 5.12, -- Incite the Pack
			[482] = 6.16, -- Thunderous Blast
			[483] = 5.87, -- Archive of the Titans
			[485] = 6.25, -- Laser Matrix
			[492] = 4.85, -- Liberator's Might
			[493] = 2.93, -- Last Gift
			[494] = 7.09, -- Battlefield Precision
			[495] = 5.21, -- Anduin's Dedication
			[496] = 1.42, -- Stronger Together
			[497] = 1.44, -- Stand As One
			[498] = 4.66, -- Barrage Of Many Bombs
			[499] = 2.77, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.6, -- Synaptic Spark Capacitor
			[501] = 5.99, -- Relational Normalization Gizmo
			[502] = 0.05, -- Personal Absorb-o-Tron
			[503] = 0.02, -- Auto-Self-Cauterizer
			[504] = 5.97, -- Unstable Catalyst
			[505] = 5.63, -- Tradewinds
			[521] = 4.74, -- Shadow of Elune
			[522] = 7.09, -- Ancients' Bulwark
			[523] = 5.53, -- Apothecary's Concoctions
			[526] = 6.95, -- Endless Hunger
			[541] = 0.02, -- Fight or Flight
			[554] = 0.17, -- Intimidating Presence
			[560] = 2.28, -- Bonded Souls
			[561] = 4.78, -- Seductive Power
			[562] = 8.47, -- Treacherous Covenant
		})

		-- Fury
		insertDefaultScalesData(defaultName, 1, 2, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 10660 - 14546 (avg 11345), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[18] = 2, -- Blood Siphon
			[20] = 2.56, -- Lifespeed
			[21] = 2.3, -- Elemental Whirl
			[22] = 2.93, -- Heed My Call
			[30] = 4.72, -- Overwhelming Power
			[31] = 3.2, -- Gutripper
			[82] = 6.97, -- Champion of Azeroth
			[119] = 10, -- Unbridled Ferocity
			[156] = 3.36, -- Ruinous Bolt
			[157] = 6.58, -- Rezan's Fury
			[176] = 6.14, -- Cold Steel, Hot Blood
			[192] = 5.89, -- Meticulous Scheming
			[193] = 6.28, -- Blightborne Infusion
			[194] = 6.02, -- Filthy Transfusion
			[195] = 4.48, -- Secrets of the Deep
			[196] = 5.66, -- Swirling Sands
			[229] = 5.47, -- Pulverizing Blows
			[437] = 7.79, -- Simmering Rage
			[438] = 7.57, -- Reckless Flurry
			[451] = 5, -- Infinite Fury
			[459] = 2.14, -- Unstable Flames
			[461] = 1.51, -- Earthlink
			[462] = 1.97, -- Azerite Globules
			[476] = 0.04, -- Moment of Glory
			[478] = 5.54, -- Tidal Surge
			[479] = 5.92, -- Dagger in the Back
			[480] = 4.41, -- Blood Rite
			[481] = 4.97, -- Incite the Pack
			[482] = 5.83, -- Thunderous Blast
			[483] = 4.81, -- Archive of the Titans
			[485] = 6, -- Laser Matrix
			[492] = 4.07, -- Liberator's Might
			[493] = 2.72, -- Last Gift
			[494] = 6.75, -- Battlefield Precision
			[495] = 4.4, -- Anduin's Dedication
			[496] = 1.17, -- Stronger Together
			[497] = 1.12, -- Stand As One
			[498] = 4.38, -- Barrage Of Many Bombs
			[499] = 2.51, -- Ricocheting Inflatable Pyrosaw
			[500] = 2.96, -- Synaptic Spark Capacitor
			[501] = 5.46, -- Relational Normalization Gizmo
			[502] = 0.06, -- Personal Absorb-o-Tron
			[504] = 5.09, -- Unstable Catalyst
			[505] = 5.14, -- Tradewinds
			[521] = 4.52, -- Shadow of Elune
			[522] = 6.2, -- Ancients' Bulwark
			[523] = 4.52, -- Apothecary's Concoctions
			[526] = 6.16, -- Endless Hunger
			[560] = 2.73, -- Bonded Souls
			[561] = 4.22, -- Seductive Power
			[562] = 6.92, -- Treacherous Covenant
		})

		-- Protection
		insertDefaultScalesData(offensiveName, 1, 3, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 5795 - 8698 (avg 6350), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.03, -- Azerite Empowered
			[14] = 0.03, -- Longstrider
			[18] = 1.77, -- Blood Siphon
			[20] = 1.97, -- Lifespeed
			[21] = 2.27, -- Elemental Whirl
			[22] = 4.44, -- Heed My Call
			[30] = 4.21, -- Overwhelming Power
			[31] = 4.74, -- Gutripper
			[44] = 0.02, -- Vampiric Speed
			[82] = 6.47, -- Champion of Azeroth
			[84] = 0.1, -- Bulwark of the Masses
			[87] = 0.13, -- Self Reliance
			[89] = 0.04, -- Azerite Veins
			[98] = 0.02, -- Crystalline Carapace
			[118] = 7.97, -- Deafening Crash
			[156] = 5.23, -- Ruinous Bolt
			[157] = 10, -- Rezan's Fury
			[192] = 5.46, -- Meticulous Scheming
			[193] = 7.15, -- Blightborne Infusion
			[194] = 9.1, -- Filthy Transfusion
			[195] = 5.45, -- Secrets of the Deep
			[196] = 6.3, -- Swirling Sands
			[237] = 7.46, -- Bastion of Might
			[440] = 2.06, -- Callous Reprisal
			[441] = 4.24, -- Iron Fortress
			[450] = 4.22, -- Brace for Impact
			[459] = 2.58, -- Unstable Flames
			[461] = 1.86, -- Earthlink
			[462] = 3.02, -- Azerite Globules
			[478] = 8.82, -- Tidal Surge
			[479] = 6.42, -- Dagger in the Back
			[480] = 4.17, -- Blood Rite
			[481] = 4.5, -- Incite the Pack
			[482] = 8.72, -- Thunderous Blast
			[483] = 5.84, -- Archive of the Titans
			[485] = 8.94, -- Laser Matrix
			[492] = 4.24, -- Liberator's Might
			[493] = 2.56, -- Last Gift
			[494] = 9.04, -- Battlefield Precision
			[495] = 5.14, -- Anduin's Dedication
			[496] = 1.29, -- Stronger Together
			[497] = 1.23, -- Stand As One
			[498] = 6.48, -- Barrage Of Many Bombs
			[499] = 4, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.78, -- Synaptic Spark Capacitor
			[501] = 5.68, -- Relational Normalization Gizmo
			[504] = 6.07, -- Unstable Catalyst
			[505] = 4.76, -- Tradewinds
			[521] = 4.19, -- Shadow of Elune
			[522] = 6.81, -- Ancients' Bulwark
			[523] = 7.06, -- Apothecary's Concoctions
			[526] = 6.81, -- Endless Hunger
			[560] = 2.19, -- Bonded Souls
			[561] = 4.99, -- Seductive Power
			[562] = 8.35, -- Treacherous Covenant
		})
		insertDefaultScalesData(defensiveName, 1, 3, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 5800 - 8547 (avg 6307), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[15] = 10, -- Resounding Protection
			[18] = 3.93, -- Blood Siphon
			[30] = 0.04, -- Overwhelming Power
			[157] = 0.02, -- Rezan's Fury
			[177] = 4.1, -- Bloodsport
			[192] = 0.03, -- Meticulous Scheming
			[193] = 0.06, -- Blightborne Infusion
			[194] = 0.05, -- Filthy Transfusion
			[195] = 0.01, -- Secrets of the Deep
			[196] = 0.06, -- Swirling Sands
			[237] = 0.96, -- Bastion of Might
			[459] = 0.04, -- Unstable Flames
			[479] = 0.03, -- Dagger in the Back
			[480] = 0.02, -- Blood Rite
			[483] = 0.03, -- Archive of the Titans
			[492] = 0.03, -- Liberator's Might
			[521] = 0.02, -- Shadow of Elune
			[523] = 0.03, -- Apothecary's Concoctions
		})

	-- Paladin
		-- Holy
		insertDefaultScalesData(defaultName, 2, 1, {

		})

		-- Protection
		insertDefaultScalesData(offensiveName, 2, 2, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 13317 - 17389 (avg 14111), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.09, -- Azerite Empowered
			[15] = 0.04, -- Resounding Protection
			[18] = 1.44, -- Blood Siphon
			[19] = 0.04, -- Woundbinder
			[20] = 1.6, -- Lifespeed
			[21] = 1.73, -- Elemental Whirl
			[22] = 3.44, -- Heed My Call
			[30] = 3.07, -- Overwhelming Power
			[31] = 3.74, -- Gutripper
			[38] = 1.41, -- On My Way
			[44] = 0.04, -- Vampiric Speed
			[82] = 5.03, -- Champion of Azeroth
			[84] = 0.01, -- Bulwark of the Masses
			[85] = 0.02, -- Gemhide
			[87] = 0.04, -- Self Reliance
			[89] = 0.14, -- Azerite Veins
			[99] = 0.05, -- Ablative Shielding
			[100] = 0.01, -- Strength in Numbers
			[125] = 3.42, -- Avenger's Might
			[143] = 0.02, -- Inspiring Beacon
			[145] = 0.03, -- Fortifying Auras
			[148] = 0.01, -- Righteous Flames
			[150] = 1.53, -- Soaring Shield
			[156] = 4.31, -- Ruinous Bolt
			[157] = 7.72, -- Rezan's Fury
			[192] = 4.28, -- Meticulous Scheming
			[193] = 5.64, -- Blightborne Infusion
			[194] = 6.69, -- Filthy Transfusion
			[195] = 4.37, -- Secrets of the Deep
			[196] = 5.13, -- Swirling Sands
			[206] = 0.02, -- Stalwart Protector
			[234] = 1.55, -- Inner Light
			[235] = 3.75, -- Indomitable Justice
			[393] = 0.08, -- Grace of the Justicar
			[395] = 10, -- Inspiring Vanguard
			[459] = 1.99, -- Unstable Flames
			[461] = 1.46, -- Earthlink
			[462] = 2.21, -- Azerite Globules
			[478] = 7.42, -- Tidal Surge
			[479] = 5.57, -- Dagger in the Back
			[480] = 3.31, -- Blood Rite
			[481] = 3.39, -- Incite the Pack
			[482] = 6.56, -- Thunderous Blast
			[483] = 4.64, -- Archive of the Titans
			[485] = 6.95, -- Laser Matrix
			[492] = 3.34, -- Liberator's Might
			[493] = 1.98, -- Last Gift
			[494] = 7.94, -- Battlefield Precision
			[495] = 4.21, -- Anduin's Dedication
			[496] = 0.98, -- Stronger Together
			[497] = 1.19, -- Stand As One
			[498] = 5.02, -- Barrage Of Many Bombs
			[499] = 3.03, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.03, -- Synaptic Spark Capacitor
			[501] = 4.58, -- Relational Normalization Gizmo
			[504] = 4.89, -- Unstable Catalyst
			[505] = 3.62, -- Tradewinds
			[521] = 3.31, -- Shadow of Elune
			[522] = 5.15, -- Ancients' Bulwark
			[523] = 6.31, -- Apothecary's Concoctions
			[526] = 5.22, -- Endless Hunger
			[538] = 0.02, -- Empyreal Ward
			[560] = 1.69, -- Bonded Souls
			[561] = 3.8, -- Seductive Power
			[562] = 6.8, -- Treacherous Covenant
		})
		insertDefaultScalesData(defensiveName, 2, 2, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 13517 - 17173 (avg 14117), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[15] = 10, -- Resounding Protection
			[18] = 2.96, -- Blood Siphon
			[21] = 0.01, -- Elemental Whirl
			[38] = 0.01, -- On My Way
			[82] = 0.02, -- Champion of Azeroth
			[125] = 0.02, -- Avenger's Might
			[150] = 0.02, -- Soaring Shield
			[192] = 0.01, -- Meticulous Scheming
			[193] = 0.01, -- Blightborne Infusion
			[196] = 0.01, -- Swirling Sands
			[478] = 0.01, -- Tidal Surge
			[480] = 0.01, -- Blood Rite
			[481] = 0.03, -- Incite the Pack
			[493] = 0.02, -- Last Gift
			[496] = 0.01, -- Stronger Together
			[497] = 0.01, -- Stand As One
			[501] = 0.02, -- Relational Normalization Gizmo
			[505] = 0.03, -- Tradewinds
			[522] = 0.04, -- Ancients' Bulwark
			[526] = 0.04, -- Endless Hunger
			[561] = 0.05, -- Seductive Power
			[562] = 0.01, -- Treacherous Covenant
		})

		-- Retribution
		insertDefaultScalesData(defaultName, 2, 3, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 11816 - 14221 (avg 12344), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.17, -- Azerite Empowered
			[14] = 0.17, -- Longstrider
			[15] = 0.14, -- Resounding Protection
			[18] = 1.98, -- Blood Siphon
			[19] = 0.27, -- Woundbinder
			[20] = 2.67, -- Lifespeed
			[21] = 2.22, -- Elemental Whirl
			[22] = 2.8, -- Heed My Call
			[30] = 3.93, -- Overwhelming Power
			[31] = 3, -- Gutripper
			[38] = 2.01, -- On My Way
			[42] = 0.27, -- Savior
			[43] = 0.18, -- Winds of War
			[44] = 0.08, -- Vampiric Speed
			[82] = 6.56, -- Champion of Azeroth
			[83] = 0.21, -- Impassive Visage
			[84] = 0.07, -- Bulwark of the Masses
			[85] = 0.27, -- Gemhide
			[86] = 0.29, -- Azerite Fortification
			[87] = 0.3, -- Self Reliance
			[89] = 0.21, -- Azerite Veins
			[98] = 0.13, -- Crystalline Carapace
			[99] = 0.34, -- Ablative Shielding
			[100] = 0.15, -- Strength in Numbers
			[101] = 0.13, -- Shimmering Haven
			[103] = 0.04, -- Concentrated Mending
			[104] = 0.11, -- Bracing Chill
			[105] = 0.1, -- Ephemeral Recovery
			[125] = 5.18, -- Avenger's Might
			[143] = 0.08, -- Inspiring Beacon
			[144] = 0.31, -- Rejuvenating Grace
			[145] = 0.08, -- Fortifying Auras
			[148] = 0.06, -- Righteous Flames
			[149] = 0.12, -- Healing Hammer
			[154] = 6.5, -- Relentless Inquisitor
			[156] = 3.58, -- Ruinous Bolt
			[157] = 6.24, -- Rezan's Fury
			[187] = 5.01, -- Expurgation
			[192] = 5.38, -- Meticulous Scheming
			[193] = 6.4, -- Blightborne Infusion
			[194] = 5.73, -- Filthy Transfusion
			[195] = 5, -- Secrets of the Deep
			[196] = 5.4, -- Swirling Sands
			[206] = 0.26, -- Stalwart Protector
			[235] = 5.17, -- Indomitable Justice
			[393] = 0.14, -- Grace of the Justicar
			[396] = 10, -- Light's Decree
			[453] = 7.17, -- Empyrean Power
			[454] = 0.1, -- Judicious Defense
			[459] = 2.35, -- Unstable Flames
			[461] = 1.86, -- Earthlink
			[462] = 1.97, -- Azerite Globules
			[463] = 0.08, -- Blessed Portents
			[471] = 0.18, -- Gallant Steed
			[478] = 5.8, -- Tidal Surge
			[479] = 6.47, -- Dagger in the Back
			[480] = 4.17, -- Blood Rite
			[481] = 4.4, -- Incite the Pack
			[482] = 5.34, -- Thunderous Blast
			[483] = 5.55, -- Archive of the Titans
			[485] = 5.37, -- Laser Matrix
			[492] = 4.2, -- Liberator's Might
			[493] = 2.74, -- Last Gift
			[494] = 5.71, -- Battlefield Precision
			[495] = 4.9, -- Anduin's Dedication
			[496] = 1.44, -- Stronger Together
			[497] = 1.39, -- Stand As One
			[498] = 3.94, -- Barrage Of Many Bombs
			[499] = 2.41, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.39, -- Synaptic Spark Capacitor
			[501] = 5.43, -- Relational Normalization Gizmo
			[502] = 0.11, -- Personal Absorb-o-Tron
			[503] = 0.1, -- Auto-Self-Cauterizer
			[504] = 5.23, -- Unstable Catalyst
			[505] = 4.77, -- Tradewinds
			[521] = 4.16, -- Shadow of Elune
			[522] = 6.5, -- Ancients' Bulwark
			[523] = 4.9, -- Apothecary's Concoctions
			[526] = 6.59, -- Endless Hunger
			[538] = 0.15, -- Empyreal Ward
			[541] = 0.21, -- Fight or Flight
			[560] = 2.29, -- Bonded Souls
			[561] = 4.6, -- Seductive Power
			[562] = 7.72, -- Treacherous Covenant
		})

	-- Hunter
		-- Beast Mastery
		insertDefaultScalesData(defaultName, 3, 1, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 7001 - 10040 (avg 7977), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[18] = 2.27, -- Blood Siphon
			[21] = 2.62, -- Elemental Whirl
			[22] = 3.11, -- Heed My Call
			[30] = 3.97, -- Overwhelming Power
			[31] = 3.41, -- Gutripper
			[82] = 7.38, -- Champion of Azeroth
			[86] = 0.01, -- Azerite Fortification
			[87] = 0.04, -- Self Reliance
			[107] = 5.09, -- Serrated Jaws
			[156] = 4.34, -- Ruinous Bolt
			[157] = 7.2, -- Rezan's Fury
			[161] = 7.18, -- Haze of Rage
			[192] = 5.59, -- Meticulous Scheming
			[193] = 7.77, -- Blightborne Infusion
			[194] = 6.25, -- Filthy Transfusion
			[195] = 6.13, -- Secrets of the Deep
			[196] = 6.47, -- Swirling Sands
			[211] = 5.38, -- Dance of Death
			[365] = 6.64, -- Dire Consequences
			[366] = 10, -- Primal Instincts
			[367] = 8.01, -- Feeding Frenzy
			[459] = 2.82, -- Unstable Flames
			[461] = 2.04, -- Earthlink
			[462] = 1.89, -- Azerite Globules
			[478] = 7.14, -- Tidal Surge
			[479] = 7.43, -- Dagger in the Back
			[480] = 4.2, -- Blood Rite
			[481] = 5.56, -- Incite the Pack
			[482] = 5.97, -- Thunderous Blast
			[483] = 6.69, -- Archive of the Titans
			[485] = 6.29, -- Laser Matrix
			[492] = 4.72, -- Liberator's Might
			[493] = 3.3, -- Last Gift
			[494] = 7.03, -- Battlefield Precision
			[495] = 5.94, -- Anduin's Dedication
			[496] = 1.45, -- Stronger Together
			[497] = 1.55, -- Stand As One
			[498] = 4.45, -- Barrage Of Many Bombs
			[499] = 2.76, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.81, -- Synaptic Spark Capacitor
			[501] = 6.28, -- Relational Normalization Gizmo
			[504] = 7.04, -- Unstable Catalyst
			[505] = 6.18, -- Tradewinds
			[521] = 4.26, -- Shadow of Elune
			[522] = 7.32, -- Ancients' Bulwark
			[523] = 5.62, -- Apothecary's Concoctions
			[526] = 7.38, -- Endless Hunger
			[560] = 2.16, -- Bonded Souls
			[561] = 5.32, -- Seductive Power
			[562] = 9.61, -- Treacherous Covenant
		})

		-- Marksmanship
		insertDefaultScalesData(defaultName, 3, 2, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 11020 - 13955 (avg 11947), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.21, -- Azerite Empowered
			[14] = 0.11, -- Longstrider
			[15] = 0.15, -- Resounding Protection
			[18] = 2.27, -- Blood Siphon
			[21] = 2.4, -- Elemental Whirl
			[22] = 2.79, -- Heed My Call
			[30] = 4.02, -- Overwhelming Power
			[31] = 2.97, -- Gutripper
			[36] = 10, -- In The Rhythm
			[44] = 0.13, -- Vampiric Speed
			[82] = 6.34, -- Champion of Azeroth
			[83] = 0.08, -- Impassive Visage
			[84] = 0.2, -- Bulwark of the Masses
			[85] = 0.17, -- Gemhide
			[86] = 0.04, -- Azerite Fortification
			[87] = 0.21, -- Self Reliance
			[156] = 4.02, -- Ruinous Bolt
			[157] = 6.49, -- Rezan's Fury
			[162] = 6.95, -- Surging Shots
			[192] = 6.02, -- Meticulous Scheming
			[193] = 7.16, -- Blightborne Infusion
			[194] = 5.89, -- Filthy Transfusion
			[195] = 5.18, -- Secrets of the Deep
			[196] = 6.27, -- Swirling Sands
			[203] = 0.14, -- Shellshock
			[212] = 8.36, -- Unerring Vision
			[368] = 3.91, -- Steady Aim
			[369] = 0.11, -- Rapid Reload
			[370] = 9, -- Focused Fire
			[459] = 2.41, -- Unstable Flames
			[461] = 1.96, -- Earthlink
			[462] = 1.82, -- Azerite Globules
			[469] = 0.05, -- Duck and Cover
			[478] = 6.57, -- Tidal Surge
			[479] = 6.56, -- Dagger in the Back
			[480] = 4.82, -- Blood Rite
			[481] = 5.22, -- Incite the Pack
			[482] = 5.39, -- Thunderous Blast
			[483] = 5.52, -- Archive of the Titans
			[485] = 5.55, -- Laser Matrix
			[492] = 4.06, -- Liberator's Might
			[493] = 3.27, -- Last Gift
			[494] = 6.2, -- Battlefield Precision
			[495] = 5.15, -- Anduin's Dedication
			[496] = 1.3, -- Stronger Together
			[497] = 1.52, -- Stand As One
			[498] = 4.12, -- Barrage Of Many Bombs
			[499] = 2.5, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.69, -- Synaptic Spark Capacitor
			[501] = 6.12, -- Relational Normalization Gizmo
			[502] = 0.04, -- Personal Absorb-o-Tron
			[503] = 0.1, -- Auto-Self-Cauterizer
			[504] = 5.73, -- Unstable Catalyst
			[505] = 5.77, -- Tradewinds
			[521] = 4.76, -- Shadow of Elune
			[522] = 7.16, -- Ancients' Bulwark
			[523] = 5.27, -- Apothecary's Concoctions
			[526] = 7.06, -- Endless Hunger
			[541] = 0.12, -- Fight or Flight
			[543] = 0.15, -- Nature's Salve
			[560] = 1.87, -- Bonded Souls
			[561] = 4.45, -- Seductive Power
			[562] = 8.16, -- Treacherous Covenant
		})

		-- Survival
		insertDefaultScalesData(defaultName, 3, 3, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 6903 - 10100 (avg 8399), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = 0.03, -- Resounding Protection
			[18] = 1.5, -- Blood Siphon
			[21] = 2.09, -- Elemental Whirl
			[22] = 2.6, -- Heed My Call
			[30] = 4.31, -- Overwhelming Power
			[31] = 2.91, -- Gutripper
			[82] = 5.91, -- Champion of Azeroth
			[83] = 0.04, -- Impassive Visage
			[86] = 0.01, -- Azerite Fortification
			[107] = 3.89, -- Serrated Jaws
			[110] = 2.58, -- Wildfire Cluster
			[156] = 3.52, -- Ruinous Bolt
			[157] = 6.01, -- Rezan's Fury
			[163] = 7.78, -- Latent Poison
			[192] = 5.16, -- Meticulous Scheming
			[193] = 6.04, -- Blightborne Infusion
			[194] = 5.27, -- Filthy Transfusion
			[195] = 4.95, -- Secrets of the Deep
			[196] = 5.39, -- Swirling Sands
			[203] = 0.03, -- Shellshock
			[213] = 4.8, -- Venomous Fangs
			[365] = 2.58, -- Dire Consequences
			[371] = 8.39, -- Blur of Talons
			[372] = 10, -- Wilderness Survival
			[373] = 7.16, -- Primeval Intuition
			[459] = 2.15, -- Unstable Flames
			[461] = 1.69, -- Earthlink
			[462] = 1.78, -- Azerite Globules
			[478] = 5.77, -- Tidal Surge
			[479] = 6.23, -- Dagger in the Back
			[480] = 4.61, -- Blood Rite
			[481] = 3.55, -- Incite the Pack
			[482] = 4.97, -- Thunderous Blast
			[483] = 5.33, -- Archive of the Titans
			[485] = 5.23, -- Laser Matrix
			[492] = 3.99, -- Liberator's Might
			[493] = 2.04, -- Last Gift
			[494] = 5.87, -- Battlefield Precision
			[495] = 4.79, -- Anduin's Dedication
			[496] = 1.18, -- Stronger Together
			[497] = 1.27, -- Stand As One
			[498] = 3.93, -- Barrage Of Many Bombs
			[499] = 2.36, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.07, -- Synaptic Spark Capacitor
			[501] = 5.78, -- Relational Normalization Gizmo
			[502] = 0.04, -- Personal Absorb-o-Tron
			[504] = 5.64, -- Unstable Catalyst
			[505] = 3.82, -- Tradewinds
			[521] = 4.64, -- Shadow of Elune
			[522] = 6.24, -- Ancients' Bulwark
			[523] = 4.83, -- Apothecary's Concoctions
			[526] = 6.21, -- Endless Hunger
			[541] = 0.09, -- Fight or Flight
			[543] = 0.03, -- Nature's Salve
			[560] = 2.26, -- Bonded Souls
			[561] = 4.24, -- Seductive Power
			[562] = 7.8, -- Treacherous Covenant
		})

	-- Rogue
		-- Assassination
		insertDefaultScalesData(defaultName, 4, 1, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 8649 - 11850 (avg 9407), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.03, -- Azerite Empowered
			[14] = 0.01, -- Longstrider
			[18] = 2.22, -- Blood Siphon
			[21] = 2.7, -- Elemental Whirl
			[22] = 3.09, -- Heed My Call
			[30] = 5, -- Overwhelming Power
			[31] = 3.61, -- Gutripper
			[82] = 8.1, -- Champion of Azeroth
			[84] = 0.04, -- Bulwark of the Masses
			[136] = 10, -- Double Dose
			[156] = 4.47, -- Ruinous Bolt
			[157] = 7.39, -- Rezan's Fury
			[181] = 7.52, -- Twist the Knife
			[192] = 5.08, -- Meticulous Scheming
			[193] = 8.84, -- Blightborne Infusion
			[194] = 6.22, -- Filthy Transfusion
			[195] = 6.14, -- Secrets of the Deep
			[196] = 7.97, -- Swirling Sands
			[249] = 9.52, -- Nothing Personal
			[406] = 4.35, -- Scent of Blood
			[408] = 1.46, -- Shrouded Suffocation
			[459] = 3.11, -- Unstable Flames
			[461] = 2.07, -- Earthlink
			[462] = 2.1, -- Azerite Globules
			[478] = 7.39, -- Tidal Surge
			[479] = 7.7, -- Dagger in the Back
			[480] = 5.69, -- Blood Rite
			[481] = 5.42, -- Incite the Pack
			[482] = 6.22, -- Thunderous Blast
			[483] = 6.55, -- Archive of the Titans
			[485] = 6.57, -- Laser Matrix
			[492] = 5.35, -- Liberator's Might
			[493] = 3.29, -- Last Gift
			[494] = 7.57, -- Battlefield Precision
			[495] = 6.17, -- Anduin's Dedication
			[496] = 1.47, -- Stronger Together
			[497] = 1.51, -- Stand As One
			[498] = 4.66, -- Barrage Of Many Bombs
			[499] = 2.64, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.9, -- Synaptic Spark Capacitor
			[501] = 7.1, -- Relational Normalization Gizmo
			[502] = 0.01, -- Personal Absorb-o-Tron
			[504] = 7.02, -- Unstable Catalyst
			[505] = 5.96, -- Tradewinds
			[521] = 5.66, -- Shadow of Elune
			[522] = 7.92, -- Ancients' Bulwark
			[523] = 6.13, -- Apothecary's Concoctions
			[526] = 8.14, -- Endless Hunger
			[548] = 0.02, -- Lying In Wait
			[560] = 2.77, -- Bonded Souls
			[561] = 5.09, -- Seductive Power
			[562] = 9.7, -- Treacherous Covenant
		})

		-- Outlaw
		insertDefaultScalesData(defaultName, 4, 2, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 32162 - 47753 (avg 36159), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[14] = 0.02, -- Longstrider
			[18] = 1.64, -- Blood Siphon
			[21] = 2.53, -- Elemental Whirl
			[22] = 3.57, -- Heed My Call
			[30] = 4.87, -- Overwhelming Power
			[31] = 4.02, -- Gutripper
			[44] = 0.07, -- Vampiric Speed
			[82] = 7.35, -- Champion of Azeroth
			[86] = 0.06, -- Azerite Fortification
			[129] = 8.37, -- Deadshot
			[156] = 5.2, -- Ruinous Bolt
			[157] = 8.47, -- Rezan's Fury
			[180] = 5.87, -- Keep Your Wits About You
			[192] = 6.79, -- Meticulous Scheming
			[193] = 7.26, -- Blightborne Infusion
			[194] = 6.84, -- Filthy Transfusion
			[195] = 6.08, -- Secrets of the Deep
			[196] = 6.67, -- Swirling Sands
			[239] = 5.23, -- Snake Eyes
			[410] = 5.34, -- Paradise Lost
			[411] = 7.79, -- Ace Up Your Sleeve
			[446] = 10, -- Brigand's Blitz
			[459] = 2.49, -- Unstable Flames
			[461] = 2.14, -- Earthlink
			[462] = 2.31, -- Azerite Globules
			[478] = 8.58, -- Tidal Surge
			[479] = 8.97, -- Dagger in the Back
			[480] = 5.59, -- Blood Rite
			[481] = 4.41, -- Incite the Pack
			[482] = 6.82, -- Thunderous Blast
			[483] = 6.77, -- Archive of the Titans
			[485] = 7.55, -- Laser Matrix
			[492] = 4.79, -- Liberator's Might
			[493] = 2.4, -- Last Gift
			[494] = 8.43, -- Battlefield Precision
			[495] = 5.96, -- Anduin's Dedication
			[496] = 1.41, -- Stronger Together
			[497] = 1.68, -- Stand As One
			[498] = 5.36, -- Barrage Of Many Bombs
			[499] = 3.24, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.69, -- Synaptic Spark Capacitor
			[501] = 7, -- Relational Normalization Gizmo
			[502] = 0.04, -- Personal Absorb-o-Tron
			[504] = 6.8, -- Unstable Catalyst
			[505] = 4.71, -- Tradewinds
			[521] = 5.5, -- Shadow of Elune
			[522] = 7.51, -- Ancients' Bulwark
			[523] = 6.99, -- Apothecary's Concoctions
			[526] = 7.49, -- Endless Hunger
			[560] = 2.58, -- Bonded Souls
			[561] = 5.14, -- Seductive Power
			[562] = 9.54, -- Treacherous Covenant
		})

		-- Subtley
		insertDefaultScalesData(defaultName, 4, 3, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 12457 - 17109 (avg 15131), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.02, -- Azerite Empowered
			[18] = 0.85, -- Blood Siphon
			[21] = 1.03, -- Elemental Whirl
			[22] = 1.42, -- Heed My Call
			[30] = 1.83, -- Overwhelming Power
			[31] = 1.49, -- Gutripper
			[82] = 3.17, -- Champion of Azeroth
			[86] = 0.02, -- Azerite Fortification
			[124] = 1.56, -- Replicating Shadows
			[156] = 2.16, -- Ruinous Bolt
			[157] = 3.29, -- Rezan's Fury
			[175] = 2.94, -- Night's Vengeance
			[192] = 2.03, -- Meticulous Scheming
			[193] = 3.24, -- Blightborne Infusion
			[194] = 2.71, -- Filthy Transfusion
			[195] = 2.6, -- Secrets of the Deep
			[196] = 2.94, -- Swirling Sands
			[240] = 4.29, -- Blade In The Shadows
			[413] = 10, -- The First Dance
			[414] = 5.03, -- Inevitability
			[445] = 1.49, -- Perforate
			[459] = 1.08, -- Unstable Flames
			[461] = 0.91, -- Earthlink
			[462] = 0.9, -- Azerite Globules
			[478] = 3.56, -- Tidal Surge
			[479] = 3.38, -- Dagger in the Back
			[480] = 2.13, -- Blood Rite
			[481] = 2.1, -- Incite the Pack
			[482] = 2.68, -- Thunderous Blast
			[483] = 2.82, -- Archive of the Titans
			[485] = 2.85, -- Laser Matrix
			[492] = 2.07, -- Liberator's Might
			[493] = 1.18, -- Last Gift
			[494] = 3.26, -- Battlefield Precision
			[495] = 2.59, -- Anduin's Dedication
			[496] = 0.63, -- Stronger Together
			[497] = 0.69, -- Stand As One
			[498] = 2.02, -- Barrage Of Many Bombs
			[499] = 1.23, -- Ricocheting Inflatable Pyrosaw
			[500] = 1.89, -- Synaptic Spark Capacitor
			[501] = 2.86, -- Relational Normalization Gizmo
			[504] = 2.9, -- Unstable Catalyst
			[505] = 2.22, -- Tradewinds
			[521] = 2.26, -- Shadow of Elune
			[522] = 3.15, -- Ancients' Bulwark
			[523] = 2.66, -- Apothecary's Concoctions
			[526] = 3.16, -- Endless Hunger
			[560] = 0.98, -- Bonded Souls
			[561] = 2.02, -- Seductive Power
			[562] = 4.13, -- Treacherous Covenant
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
			--[[
			[13] = 0.04, -- Azerite Empowered
			[18] = 0.15, -- Blood Siphon
			[19] = 0.09, -- Woundbinder
			[21] = 2.03, -- Elemental Whirl
			[22] = 3.86, -- Heed My Call
			[30] = 4.88, -- Overwhelming Power
			[31] = 4.11, -- Gutripper
			[38] = 1.84, -- On My Way
			[42] = 0.06, -- Savior
			[82] = 6.76, -- Champion of Azeroth
			[84] = 0.05, -- Bulwark of the Masses
			[86] = 0.04, -- Azerite Fortification
			[102] = 0.11, -- Synergistic Growth
			[104] = 0.01, -- Bracing Chill
			[105] = 0.01, -- Ephemeral Recovery
			[156] = 5.63, -- Ruinous Bolt
			[157] = 8.68, -- Rezan's Fury
			[192] = 4.15, -- Meticulous Scheming
			[193] = 6.48, -- Blightborne Infusion
			[194] = 7.71, -- Filthy Transfusion
			[195] = 5.67, -- Secrets of the Deep
			[196] = 5.99, -- Swirling Sands
			[401] = 0.01, -- Word of Mending
			[459] = 2.06, -- Unstable Flames
			[461] = 1.79, -- Earthlink
			[462] = 2.59, -- Azerite Globules
			[463] = 0.04, -- Blessed Portents
			[478] = 9.28, -- Tidal Surge
			[479] = 10.00, -- Dagger in the Back
			[480] = 5.41, -- Blood Rite
			[482] = 7.27, -- Thunderous Blast
			[483] = 6.08, -- Archive of the Titans
			[485] = 7.93, -- Laser Matrix
			[492] = 5.04, -- Liberator's Might
			[494] = 8.69, -- Battlefield Precision
			[495] = 5.55, -- Anduin's Dedication
			[496] = 1.15, -- Stronger Together
			[497] = 1.48, -- Stand As One
			[498] = 5.67, -- Barrage Of Many Bombs
			[499] = 3.34, -- Ricocheting Inflatable Pyrosaw
			[500] = 5.08, -- Synaptic Spark Capacitor
			[501] = 6.78, -- Relational Normalization Gizmo
			[502] = 0.04, -- Personal Absorb-o-Tron
			[504] = 6.43, -- Unstable Catalyst
			[505] = 0.14, -- Tradewinds
			[534] = 0.18, -- Promise of Deliverance
			[541] = 0.05, -- Fight or Flight
			[560] = 0.09, -- Bonded Souls
			[561] = 0.03, -- Seductive Power
			]]--
		})

		-- Shadow
		insertDefaultScalesData(defaultName, 5, 3, {
			-- Shadow Priest by WarcraftPriests (https://warcraftpriests.com/)
			-- https://github.com/WarcraftPriests/bfa-shadow-priest/blob/master/azerite-traits/AzeritePowerWeights_DA.md
			-- First Imported: 03.09.2018, Updated: 31.01.2019
			[405] = 4.67,
			[193] = 4.39,
			[562] = 4.33,
			[196] = 3.92,
			[82] = 3.91,
			[479] = 3.7,
			[488] = 3.61,
			[522] = 3.57,
			[157] = 3.53,
			[526] = 3.51,
			[501] = 3.44,
			[192] = 3.35,
			[236] = 3.17,
			[485] = 3.17,
			[504] = 3.16,
			[478] = 3.15,
			[194] = 3.14,
			[483] = 3.13,
			[403] = 3.03,
			[482] = 3.02,
			[523] = 2.9,
			[195] = 2.88,
			[404] = 2.85,
			[505] = 2.76,
			[489] = 2.73,
			[30] = 2.69,
			[521] = 2.66,
			[480] = 2.64,
			[561] = 2.61,
			[486] = 2.6,
			[481] = 2.59,
			[498] = 2.29,
			[156] = 1.89,
			[31] = 1.71,
			[500] = 1.7,
			[22] = 1.58,
			[459] = 1.53,
			[487] = 1.47,
			[560] = 1.38,
			[499] = 1.37,
			[21] = 1.31,
			[166] = 1.24,
			[491] = 1.08,
			[18] = 1.02,
			[462] = 1.02,
			[38] = 1.01,
			[461] = 0.94,
			[490] = 0.8,
			[13] = 0.44,
			[541] = 0.01,
		})

	-- Death Knight
		-- Blood
		insertDefaultScalesData(offensiveName, 6, 1, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 7168 - 10368 (avg 7834), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[18] = 1.68, -- Blood Siphon
			[20] = 1.5, -- Lifespeed
			[21] = 2.02, -- Elemental Whirl
			[22] = 4.43, -- Heed My Call
			[30] = 3.36, -- Overwhelming Power
			[31] = 4.82, -- Gutripper
			[82] = 6.1, -- Champion of Azeroth
			[84] = 0.03, -- Bulwark of the Masses
			[87] = 0.01, -- Self Reliance
			[98] = 0.1, -- Crystalline Carapace
			[100] = 0.11, -- Strength in Numbers
			[101] = 0.07, -- Shimmering Haven
			[106] = 2.79, -- Deep Cuts
			[140] = 1.13, -- Bone Spike Graveyard
			[156] = 5.44, -- Ruinous Bolt
			[157] = 9.99, -- Rezan's Fury
			[192] = 4.46, -- Meticulous Scheming
			[193] = 7.26, -- Blightborne Infusion
			[194] = 9.22, -- Filthy Transfusion
			[195] = 5.12, -- Secrets of the Deep
			[196] = 6.35, -- Swirling Sands
			[197] = 0.05, -- Marrowblood
			[243] = 4.14, -- Bloody Runeblade
			[348] = 4.94, -- Eternal Rune Weapon
			[349] = 0.26, -- Bones of the Damned
			[459] = 2.56, -- Unstable Flames
			[461] = 1.73, -- Earthlink
			[462] = 2.97, -- Azerite Globules
			[465] = 0.01, -- March of the Damned
			[478] = 9.24, -- Tidal Surge
			[479] = 7.25, -- Dagger in the Back
			[480] = 3.64, -- Blood Rite
			[481] = 4.26, -- Incite the Pack
			[482] = 8.69, -- Thunderous Blast
			[483] = 5.52, -- Archive of the Titans
			[485] = 8.85, -- Laser Matrix
			[492] = 3.89, -- Liberator's Might
			[493] = 2.52, -- Last Gift
			[494] = 10, -- Battlefield Precision
			[495] = 4.99, -- Anduin's Dedication
			[496] = 1.16, -- Stronger Together
			[497] = 1.34, -- Stand As One
			[498] = 6.47, -- Barrage Of Many Bombs
			[499] = 3.85, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.93, -- Synaptic Spark Capacitor
			[501] = 5.1, -- Relational Normalization Gizmo
			[502] = 0.02, -- Personal Absorb-o-Tron
			[503] = 0.06, -- Auto-Self-Cauterizer
			[504] = 5.69, -- Unstable Catalyst
			[505] = 4.51, -- Tradewinds
			[521] = 3.53, -- Shadow of Elune
			[522] = 6.66, -- Ancients' Bulwark
			[523] = 8.2, -- Apothecary's Concoctions
			[526] = 6.7, -- Endless Hunger
			[560] = 1.63, -- Bonded Souls
			[561] = 4.73, -- Seductive Power
			[562] = 7.95, -- Treacherous Covenant
		})
		insertDefaultScalesData(defensiveName, 6, 1, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 7301 - 10209 (avg 7857), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[15] = 10, -- Resounding Protection
			[18] = 1.87, -- Blood Siphon
			[20] = 1.42, -- Lifespeed
			[21] = 0.52, -- Elemental Whirl
			[30] = 2.26, -- Overwhelming Power
			[31] = 0.01, -- Gutripper
			[43] = 0.03, -- Winds of War
			[82] = 1.35, -- Champion of Azeroth
			[106] = 2.8, -- Deep Cuts
			[140] = 2, -- Bone Spike Graveyard
			[156] = 0.01, -- Ruinous Bolt
			[192] = 3.05, -- Meticulous Scheming
			[193] = 0.86, -- Blightborne Infusion
			[194] = 0.01, -- Filthy Transfusion
			[195] = 0.53, -- Secrets of the Deep
			[196] = 0.7, -- Swirling Sands
			[197] = 4.17, -- Marrowblood
			[243] = 5.46, -- Bloody Runeblade
			[348] = 0.68, -- Eternal Rune Weapon
			[349] = 0.59, -- Bones of the Damned
			[459] = 0.25, -- Unstable Flames
			[461] = 0.12, -- Earthlink
			[478] = 0.02, -- Tidal Surge
			[480] = 2.56, -- Blood Rite
			[481] = 0.38, -- Incite the Pack
			[482] = 0.02, -- Thunderous Blast
			[483] = 0.61, -- Archive of the Titans
			[485] = 0.01, -- Laser Matrix
			[492] = 1.18, -- Liberator's Might
			[493] = 0.26, -- Last Gift
			[495] = 0.38, -- Anduin's Dedication
			[496] = 0.18, -- Stronger Together
			[499] = 0.06, -- Ricocheting Inflatable Pyrosaw
			[501] = 2.05, -- Relational Normalization Gizmo
			[503] = 0.05, -- Auto-Self-Cauterizer
			[504] = 0.66, -- Unstable Catalyst
			[505] = 0.49, -- Tradewinds
			[521] = 2.36, -- Shadow of Elune
			[522] = 0.68, -- Ancients' Bulwark
			[526] = 0.62, -- Endless Hunger
			[560] = 1.2, -- Bonded Souls
			[561] = 0.02, -- Seductive Power
			[562] = 0.85, -- Treacherous Covenant
		})

		-- Frost
		insertDefaultScalesData(defaultName, 6, 2, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 15501 - 19432 (avg 16331), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = 0.06, -- Resounding Protection
			[18] = 2.34, -- Blood Siphon
			[20] = 2.13, -- Lifespeed
			[21] = 2.63, -- Elemental Whirl
			[22] = 3.12, -- Heed My Call
			[30] = 3.75, -- Overwhelming Power
			[31] = 3.4, -- Gutripper
			[44] = 0.01, -- Vampiric Speed
			[82] = 7.49, -- Champion of Azeroth
			[83] = 0.04, -- Impassive Visage
			[84] = 0.02, -- Bulwark of the Masses
			[89] = 0.12, -- Azerite Veins
			[98] = 0.07, -- Crystalline Carapace
			[101] = 0.05, -- Shimmering Haven
			[108] = 5.64, -- Icy Citadel
			[141] = 5.05, -- Latent Chill
			[156] = 4.34, -- Ruinous Bolt
			[157] = 7.02, -- Rezan's Fury
			[192] = 4.19, -- Meticulous Scheming
			[193] = 8.69, -- Blightborne Infusion
			[194] = 6.44, -- Filthy Transfusion
			[195] = 6.39, -- Secrets of the Deep
			[196] = 7.77, -- Swirling Sands
			[198] = 3.61, -- Frostwhelp's Indignation
			[242] = 4.55, -- Echoing Howl
			[346] = 4.17, -- Killer Frost
			[347] = 5.65, -- Frozen Tempest
			[459] = 3.14, -- Unstable Flames
			[461] = 2.22, -- Earthlink
			[462] = 2.03, -- Azerite Globules
			[478] = 8.46, -- Tidal Surge
			[479] = 7.38, -- Dagger in the Back
			[480] = 4.4, -- Blood Rite
			[481] = 6.07, -- Incite the Pack
			[482] = 6.09, -- Thunderous Blast
			[483] = 6.71, -- Archive of the Titans
			[485] = 6.1, -- Laser Matrix
			[492] = 4.89, -- Liberator's Might
			[493] = 3.56, -- Last Gift
			[494] = 6.98, -- Battlefield Precision
			[495] = 6.38, -- Anduin's Dedication
			[496] = 1.46, -- Stronger Together
			[497] = 1.76, -- Stand As One
			[498] = 4.46, -- Barrage Of Many Bombs
			[499] = 2.69, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.01, -- Synaptic Spark Capacitor
			[501] = 6.3, -- Relational Normalization Gizmo
			[502] = 0.1, -- Personal Absorb-o-Tron
			[504] = 7.4, -- Unstable Catalyst
			[505] = 6.85, -- Tradewinds
			[521] = 4.4, -- Shadow of Elune
			[522] = 8.17, -- Ancients' Bulwark
			[523] = 5.82, -- Apothecary's Concoctions
			[526] = 8.27, -- Endless Hunger
			[541] = 0.03, -- Fight or Flight
			[560] = 1.96, -- Bonded Souls
			[561] = 5.24, -- Seductive Power
			[562] = 10, -- Treacherous Covenant
		})

		-- Unholy
		insertDefaultScalesData(defaultName, 6, 3, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 8508 - 11722 (avg 9087), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = 0.02, -- Resounding Protection
			[18] = 1.86, -- Blood Siphon
			[20] = 1.9, -- Lifespeed
			[21] = 2.18, -- Elemental Whirl
			[22] = 3.23, -- Heed My Call
			[30] = 3.77, -- Overwhelming Power
			[31] = 3.42, -- Gutripper
			[43] = 0.2, -- Winds of War
			[82] = 6.51, -- Champion of Azeroth
			[83] = 0.12, -- Impassive Visage
			[87] = 0.08, -- Self Reliance
			[109] = 5.46, -- Magus of the Dead
			[140] = 0.06, -- Bone Spike Graveyard
			[142] = 6.52, -- Helchains
			[156] = 4.34, -- Ruinous Bolt
			[157] = 7.39, -- Rezan's Fury
			[192] = 4.98, -- Meticulous Scheming
			[193] = 7.85, -- Blightborne Infusion
			[194] = 6.84, -- Filthy Transfusion
			[195] = 5.67, -- Secrets of the Deep
			[196] = 6.84, -- Swirling Sands
			[199] = 10, -- Festermight
			[201] = 0.01, -- Runic Barrier
			[244] = 6.09, -- Harrowing Decay
			[350] = 4.24, -- Cankerous Wounds
			[351] = 3.75, -- Last Surprise
			[459] = 2.84, -- Unstable Flames
			[461] = 2.03, -- Earthlink
			[462] = 2.09, -- Azerite Globules
			[478] = 7.3, -- Tidal Surge
			[479] = 7.47, -- Dagger in the Back
			[480] = 4.45, -- Blood Rite
			[481] = 4.58, -- Incite the Pack
			[482] = 6.11, -- Thunderous Blast
			[483] = 5.95, -- Archive of the Titans
			[485] = 6.44, -- Laser Matrix
			[492] = 4.52, -- Liberator's Might
			[493] = 2.6, -- Last Gift
			[494] = 7.39, -- Battlefield Precision
			[495] = 5.64, -- Anduin's Dedication
			[496] = 1.32, -- Stronger Together
			[497] = 1.45, -- Stand As One
			[498] = 4.66, -- Barrage Of Many Bombs
			[499] = 2.87, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.88, -- Synaptic Spark Capacitor
			[501] = 6.08, -- Relational Normalization Gizmo
			[503] = 0.06, -- Auto-Self-Cauterizer
			[504] = 6.47, -- Unstable Catalyst
			[505] = 5.13, -- Tradewinds
			[521] = 4.44, -- Shadow of Elune
			[522] = 7.45, -- Ancients' Bulwark
			[523] = 5.84, -- Apothecary's Concoctions
			[526] = 7.6, -- Endless Hunger
			[541] = 0.04, -- Fight or Flight
			[560] = 1.86, -- Bonded Souls
			[561] = 4.62, -- Seductive Power
			[562] = 9.11, -- Treacherous Covenant
		})

	-- Shaman
		-- Elemental
		insertDefaultScalesData(defaultName, 7, 1, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 14962 - 17962 (avg 15639), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = 0.01, -- Resounding Protection
			[18] = 0.77, -- Blood Siphon
			[21] = 1.31, -- Elemental Whirl
			[22] = 1.91, -- Heed My Call
			[30] = 2.26, -- Overwhelming Power
			[31] = 1.91, -- Gutripper
			[38] = 1.24, -- On My Way
			[82] = 3.65, -- Champion of Azeroth
			[156] = 2.51, -- Ruinous Bolt
			[157] = 4.19, -- Rezan's Fury
			[178] = 3.58, -- Lava Shock
			[192] = 3.11, -- Meticulous Scheming
			[193] = 4.72, -- Blightborne Infusion
			[194] = 3.63, -- Filthy Transfusion
			[195] = 3.7, -- Secrets of the Deep
			[196] = 4.17, -- Swirling Sands
			[222] = 2.48, -- Echo of the Elementals
			[416] = 4.57, -- Natural Harmony
			[447] = 3.37, -- Ancestral Resonance
			[448] = 3.36, -- Synapse Shock
			[457] = 10, -- Igneous Potential
			[459] = 1.63, -- Unstable Flames
			[461] = 1.27, -- Earthlink
			[462] = 1.21, -- Azerite Globules
			[478] = 4.31, -- Tidal Surge
			[479] = 4.34, -- Dagger in the Back
			[480] = 2.5, -- Blood Rite
			[481] = 1.97, -- Incite the Pack
			[482] = 3.45, -- Thunderous Blast
			[483] = 3.96, -- Archive of the Titans
			[485] = 3.65, -- Laser Matrix
			[492] = 2.55, -- Liberator's Might
			[493] = 1.06, -- Last Gift
			[494] = 3.93, -- Battlefield Precision
			[495] = 3.68, -- Anduin's Dedication
			[496] = 0.73, -- Stronger Together
			[497] = 0.95, -- Stand As One
			[498] = 2.66, -- Barrage Of Many Bombs
			[499] = 1.57, -- Ricocheting Inflatable Pyrosaw
			[500] = 2.34, -- Synaptic Spark Capacitor
			[501] = 3.58, -- Relational Normalization Gizmo
			[502] = 0.06, -- Personal Absorb-o-Tron
			[504] = 4.25, -- Unstable Catalyst
			[505] = 2.09, -- Tradewinds
			[521] = 2.56, -- Shadow of Elune
			[522] = 4.32, -- Ancients' Bulwark
			[523] = 3.4, -- Apothecary's Concoctions
			[526] = 4.42, -- Endless Hunger
			[560] = 1.17, -- Bonded Souls
			[561] = 3.08, -- Seductive Power
			[562] = 5.85, -- Treacherous Covenant
		})

		-- Enhancement
		insertDefaultScalesData(defaultName, 7, 2, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 15095 - 20210 (avg 17653), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.03, -- Azerite Empowered
			[14] = 0.02, -- Longstrider
			[15] = 0.04, -- Resounding Protection
			[18] = 1.96, -- Blood Siphon
			[21] = 2.35, -- Elemental Whirl
			[22] = 2.96, -- Heed My Call
			[30] = 3.87, -- Overwhelming Power
			[31] = 3.15, -- Gutripper
			[38] = 1.96, -- On My Way
			[44] = 0.02, -- Vampiric Speed
			[82] = 6.9, -- Champion of Azeroth
			[84] = 0.07, -- Bulwark of the Masses
			[85] = 0.05, -- Gemhide
			[103] = 0.12, -- Concentrated Mending
			[105] = 0.05, -- Ephemeral Recovery
			[137] = 10, -- Primal Primer
			[156] = 3.8, -- Ruinous Bolt
			[157] = 6.65, -- Rezan's Fury
			[179] = 6.33, -- Strength of Earth
			[192] = 5.44, -- Meticulous Scheming
			[193] = 7.33, -- Blightborne Infusion
			[194] = 5.85, -- Filthy Transfusion
			[195] = 5.82, -- Secrets of the Deep
			[196] = 6.46, -- Swirling Sands
			[223] = 3.62, -- Lightning Conduit
			[416] = 9.39, -- Natural Harmony
			[420] = 8.37, -- Roiling Storm
			[447] = 8.12, -- Ancestral Resonance
			[459] = 2.5, -- Unstable Flames
			[461] = 2.07, -- Earthlink
			[462] = 1.94, -- Azerite Globules
			[463] = 0.09, -- Blessed Portents
			[474] = 0.06, -- Pack Spirit
			[478] = 6.43, -- Tidal Surge
			[479] = 6.85, -- Dagger in the Back
			[480] = 4.49, -- Blood Rite
			[481] = 4.9, -- Incite the Pack
			[482] = 5.58, -- Thunderous Blast
			[483] = 6.45, -- Archive of the Titans
			[485] = 5.77, -- Laser Matrix
			[492] = 4.64, -- Liberator's Might
			[493] = 2.87, -- Last Gift
			[494] = 6.39, -- Battlefield Precision
			[495] = 5.81, -- Anduin's Dedication
			[496] = 1.34, -- Stronger Together
			[497] = 1.48, -- Stand As One
			[498] = 4.46, -- Barrage Of Many Bombs
			[499] = 2.74, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.54, -- Synaptic Spark Capacitor
			[501] = 6.16, -- Relational Normalization Gizmo
			[502] = 0.04, -- Personal Absorb-o-Tron
			[503] = 0.1, -- Auto-Self-Cauterizer
			[504] = 6.78, -- Unstable Catalyst
			[505] = 5.35, -- Tradewinds
			[521] = 4.63, -- Shadow of Elune
			[522] = 7.12, -- Ancients' Bulwark
			[523] = 5.33, -- Apothecary's Concoctions
			[526] = 7.15, -- Endless Hunger
			[530] = 5.83, -- Thunderaan's Fury
			[539] = 0.01, -- Ancient Ankh Talisman
			[560] = 2.31, -- Bonded Souls
			[561] = 4.91, -- Seductive Power
			[562] = 9.09, -- Treacherous Covenant
		})

		-- Restoration
		insertDefaultScalesData(defaultName, 7, 3, {

		})

	-- Mage
		-- Arcane
		insertDefaultScalesData(defaultName, 8, 1, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 19714 - 23805 (avg 20927), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[18] = 1.6, -- Blood Siphon
			[21] = 1.79, -- Elemental Whirl
			[22] = 2.41, -- Heed My Call
			[30] = 2.47, -- Overwhelming Power
			[31] = 2.6, -- Gutripper
			[82] = 5.19, -- Champion of Azeroth
			[87] = 0.01, -- Self Reliance
			[88] = 6.18, -- Arcane Pummeling
			[127] = 10, -- Equipoise
			[156] = 3.69, -- Ruinous Bolt
			[157] = 5.6, -- Rezan's Fury
			[167] = 3.3, -- Brain Storm
			[192] = 2.11, -- Meticulous Scheming
			[193] = 6.25, -- Blightborne Infusion
			[194] = 4.9, -- Filthy Transfusion
			[195] = 4.89, -- Secrets of the Deep
			[196] = 4.79, -- Swirling Sands
			[214] = 2.54, -- Arcane Pressure
			[374] = 6.72, -- Galvanizing Spark
			[459] = 2.06, -- Unstable Flames
			[461] = 1.64, -- Earthlink
			[462] = 1.5, -- Azerite Globules
			[468] = 0.01, -- Cauterizing Blink
			[478] = 6.07, -- Tidal Surge
			[479] = 5.77, -- Dagger in the Back
			[480] = 3.46, -- Blood Rite
			[481] = 4.16, -- Incite the Pack
			[482] = 4.66, -- Thunderous Blast
			[483] = 5.43, -- Archive of the Titans
			[485] = 4.92, -- Laser Matrix
			[492] = 3.52, -- Liberator's Might
			[493] = 2.39, -- Last Gift
			[494] = 4.92, -- Battlefield Precision
			[495] = 4.9, -- Anduin's Dedication
			[496] = 1.14, -- Stronger Together
			[497] = 1.15, -- Stand As One
			[498] = 3.61, -- Barrage Of Many Bombs
			[499] = 2.17, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.43, -- Synaptic Spark Capacitor
			[501] = 4.98, -- Relational Normalization Gizmo
			[504] = 5.39, -- Unstable Catalyst
			[505] = 4.41, -- Tradewinds
			[521] = 3.38, -- Shadow of Elune
			[522] = 6.27, -- Ancients' Bulwark
			[523] = 4.53, -- Apothecary's Concoctions
			[526] = 6.14, -- Endless Hunger
			[560] = 1.21, -- Bonded Souls
			[561] = 4.05, -- Seductive Power
			[562] = 7.82, -- Treacherous Covenant
		})

		-- Fire
		insertDefaultScalesData(defaultName, 8, 2, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 27756 - 32373 (avg 29898), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.03, -- Azerite Empowered
			[15] = 0.05, -- Resounding Protection
			[18] = 2.03, -- Blood Siphon
			[21] = 1.93, -- Elemental Whirl
			[22] = 3.17, -- Heed My Call
			[30] = 2.46, -- Overwhelming Power
			[31] = 3.4, -- Gutripper
			[82] = 5.76, -- Champion of Azeroth
			[84] = 0.09, -- Bulwark of the Masses
			[87] = 0.03, -- Self Reliance
			[128] = 2.66, -- Flames of Alacrity
			[156] = 4.35, -- Ruinous Bolt
			[157] = 7.02, -- Rezan's Fury
			[168] = 10, -- Wildfire
			[192] = 3.09, -- Meticulous Scheming
			[193] = 6.93, -- Blightborne Infusion
			[194] = 5.54, -- Filthy Transfusion
			[195] = 5.29, -- Secrets of the Deep
			[196] = 5.8, -- Swirling Sands
			[215] = 1.43, -- Blaster Master
			[376] = 4.3, -- Trailing Embers
			[377] = 6.51, -- Duplicative Incineration
			[378] = 6.79, -- Firemind
			[459] = 2.3, -- Unstable Flames
			[461] = 1.95, -- Earthlink
			[462] = 2.02, -- Azerite Globules
			[478] = 7.24, -- Tidal Surge
			[479] = 7.12, -- Dagger in the Back
			[480] = 3.15, -- Blood Rite
			[481] = 4.57, -- Incite the Pack
			[482] = 5.82, -- Thunderous Blast
			[483] = 5.56, -- Archive of the Titans
			[485] = 6.23, -- Laser Matrix
			[492] = 3.42, -- Liberator's Might
			[493] = 2.66, -- Last Gift
			[494] = 7.03, -- Battlefield Precision
			[495] = 5.19, -- Anduin's Dedication
			[496] = 1.3, -- Stronger Together
			[497] = 1.42, -- Stand As One
			[498] = 4.43, -- Barrage Of Many Bombs
			[499] = 2.74, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.95, -- Synaptic Spark Capacitor
			[501] = 4.85, -- Relational Normalization Gizmo
			[504] = 5.9, -- Unstable Catalyst
			[505] = 4.93, -- Tradewinds
			[521] = 3.07, -- Shadow of Elune
			[522] = 6.65, -- Ancients' Bulwark
			[523] = 5.81, -- Apothecary's Concoctions
			[526] = 6.65, -- Endless Hunger
			[541] = 0.1, -- Fight or Flight
			[546] = 0.03, -- Quick Thinking
			[560] = 1.4, -- Bonded Souls
			[561] = 4.43, -- Seductive Power
			[562] = 8.31, -- Treacherous Covenant
		})

		-- Frost
		insertDefaultScalesData(defaultName, 8, 3, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 17711 - 21149 (avg 19388), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[18] = 1.38, -- Blood Siphon
			[21] = 1.92, -- Elemental Whirl
			[22] = 2.4, -- Heed My Call
			[30] = 3.13, -- Overwhelming Power
			[31] = 2.59, -- Gutripper
			[82] = 5.37, -- Champion of Azeroth
			[132] = 4.63, -- Packed Ice
			[156] = 3.37, -- Ruinous Bolt
			[157] = 5.6, -- Rezan's Fury
			[170] = 10, -- Flash Freeze
			[192] = 3.45, -- Meticulous Scheming
			[193] = 5.79, -- Blightborne Infusion
			[194] = 5.04, -- Filthy Transfusion
			[195] = 4.92, -- Secrets of the Deep
			[196] = 5.42, -- Swirling Sands
			[225] = 5.03, -- Glacial Assault
			[379] = 5.27, -- Tunnel of Ice
			[380] = 4.9, -- Whiteout
			[381] = 4.7, -- Frigid Grasp
			[459] = 2.21, -- Unstable Flames
			[461] = 1.67, -- Earthlink
			[462] = 1.51, -- Azerite Globules
			[478] = 5.5, -- Tidal Surge
			[479] = 5.72, -- Dagger in the Back
			[480] = 3.48, -- Blood Rite
			[481] = 3.71, -- Incite the Pack
			[482] = 4.76, -- Thunderous Blast
			[483] = 5.21, -- Archive of the Titans
			[485] = 4.93, -- Laser Matrix
			[492] = 3.66, -- Liberator's Might
			[493] = 2.12, -- Last Gift
			[494] = 5.18, -- Battlefield Precision
			[495] = 4.84, -- Anduin's Dedication
			[496] = 1.03, -- Stronger Together
			[497] = 1.11, -- Stand As One
			[498] = 3.51, -- Barrage Of Many Bombs
			[499] = 2.14, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.09, -- Synaptic Spark Capacitor
			[501] = 4.95, -- Relational Normalization Gizmo
			[504] = 5.71, -- Unstable Catalyst
			[505] = 3.9, -- Tradewinds
			[521] = 3.43, -- Shadow of Elune
			[522] = 5.55, -- Ancients' Bulwark
			[523] = 4.58, -- Apothecary's Concoctions
			[526] = 5.82, -- Endless Hunger
			[560] = 1.64, -- Bonded Souls
			[561] = 4.08, -- Seductive Power
			[562] = 7.44, -- Treacherous Covenant
		})

	-- Warlock
		-- Affliction
		insertDefaultScalesData(defaultName, 9, 1, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 10762 - 14194 (avg 11824), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.13, -- Azerite Empowered
			[14] = 0.04, -- Longstrider
			[15] = 0.12, -- Resounding Protection
			[18] = 2.74, -- Blood Siphon
			[21] = 2.97, -- Elemental Whirl
			[22] = 3.85, -- Heed My Call
			[30] = 5.14, -- Overwhelming Power
			[31] = 4.24, -- Gutripper
			[44] = 0.06, -- Vampiric Speed
			[82] = 7.83, -- Champion of Azeroth
			[83] = 0.13, -- Impassive Visage
			[84] = 0.27, -- Bulwark of the Masses
			[85] = 0.1, -- Gemhide
			[86] = 0.06, -- Azerite Fortification
			[87] = 0.09, -- Self Reliance
			[123] = 8.92, -- Wracking Brilliance
			[156] = 5.11, -- Ruinous Bolt
			[157] = 8.73, -- Rezan's Fury
			[183] = 8.51, -- Inevitable Demise
			[192] = 6.24, -- Meticulous Scheming
			[193] = 7.9, -- Blightborne Infusion
			[194] = 7.82, -- Filthy Transfusion
			[195] = 6.51, -- Secrets of the Deep
			[196] = 7.08, -- Swirling Sands
			[208] = 0.05, -- Lifeblood
			[230] = 7.29, -- Cascading Calamity
			[425] = 7.33, -- Sudden Onset
			[426] = 5.54, -- Dreadful Calling
			[442] = 8.36, -- Pandemic Invocation
			[459] = 2.71, -- Unstable Flames
			[461] = 2.48, -- Earthlink
			[462] = 2.82, -- Azerite Globules
			[475] = 0.16, -- Desperate Power
			[478] = 8.53, -- Tidal Surge
			[479] = 8.81, -- Dagger in the Back
			[480] = 5.41, -- Blood Rite
			[481] = 6.52, -- Incite the Pack
			[482] = 7.43, -- Thunderous Blast
			[483] = 6.77, -- Archive of the Titans
			[485] = 7.67, -- Laser Matrix
			[492] = 5.11, -- Liberator's Might
			[493] = 3.82, -- Last Gift
			[494] = 8.83, -- Battlefield Precision
			[495] = 6.34, -- Anduin's Dedication
			[496] = 1.68, -- Stronger Together
			[497] = 1.78, -- Stand As One
			[498] = 5.73, -- Barrage Of Many Bombs
			[499] = 3.25, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.64, -- Synaptic Spark Capacitor
			[501] = 7.22, -- Relational Normalization Gizmo
			[502] = 0.11, -- Personal Absorb-o-Tron
			[503] = 0.07, -- Auto-Self-Cauterizer
			[504] = 7.33, -- Unstable Catalyst
			[505] = 7.38, -- Tradewinds
			[521] = 5.37, -- Shadow of Elune
			[522] = 8.23, -- Ancients' Bulwark
			[523] = 6.78, -- Apothecary's Concoctions
			[526] = 8.35, -- Endless Hunger
			[531] = 0.06, -- Terror of the Mind
			[541] = 0.03, -- Fight or Flight
			[560] = 2.83, -- Bonded Souls
			[561] = 5.46, -- Seductive Power
			[562] = 10, -- Treacherous Covenant
		})

		-- Demonology
		insertDefaultScalesData(defaultName, 9, 2, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 11720 - 14834 (avg 12548), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[14] = 0.03, -- Longstrider
			[15] = 0.08, -- Resounding Protection
			[18] = 2.08, -- Blood Siphon
			[21] = 2.33, -- Elemental Whirl
			[22] = 2.57, -- Heed My Call
			[30] = 3.8, -- Overwhelming Power
			[31] = 2.86, -- Gutripper
			[44] = 0.08, -- Vampiric Speed
			[82] = 6.36, -- Champion of Azeroth
			[83] = 0.09, -- Impassive Visage
			[84] = 0.08, -- Bulwark of the Masses
			[85] = 0.09, -- Gemhide
			[86] = 0.22, -- Azerite Fortification
			[130] = 3.79, -- Shadow's Bite
			[156] = 3.37, -- Ruinous Bolt
			[157] = 6.06, -- Rezan's Fury
			[190] = 4.43, -- Umbral Blaze
			[192] = 4.79, -- Meticulous Scheming
			[193] = 7.26, -- Blightborne Infusion
			[194] = 5.42, -- Filthy Transfusion
			[195] = 5.83, -- Secrets of the Deep
			[196] = 5.18, -- Swirling Sands
			[208] = 0.01, -- Lifeblood
			[231] = 0.1, -- Explosive Potential
			[428] = 4.65, -- Demonic Meteor
			[429] = 10, -- Baleful Invocation
			[458] = 6.07, -- Supreme Commander
			[459] = 2.7, -- Unstable Flames
			[461] = 2.06, -- Earthlink
			[462] = 1.73, -- Azerite Globules
			[475] = 0.15, -- Desperate Power
			[478] = 5.72, -- Tidal Surge
			[479] = 6.22, -- Dagger in the Back
			[480] = 4.31, -- Blood Rite
			[481] = 5.2, -- Incite the Pack
			[482] = 5.02, -- Thunderous Blast
			[483] = 6.14, -- Archive of the Titans
			[485] = 5.22, -- Laser Matrix
			[492] = 4.41, -- Liberator's Might
			[493] = 3.12, -- Last Gift
			[494] = 4.41, -- Battlefield Precision
			[495] = 5.73, -- Anduin's Dedication
			[496] = 1.26, -- Stronger Together
			[497] = 1.54, -- Stand As One
			[498] = 3.69, -- Barrage Of Many Bombs
			[499] = 2.28, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.18, -- Synaptic Spark Capacitor
			[501] = 6.05, -- Relational Normalization Gizmo
			[502] = 0.03, -- Personal Absorb-o-Tron
			[503] = 0.15, -- Auto-Self-Cauterizer
			[504] = 6.52, -- Unstable Catalyst
			[505] = 5.67, -- Tradewinds
			[521] = 4.44, -- Shadow of Elune
			[522] = 7.12, -- Ancients' Bulwark
			[523] = 4.74, -- Apothecary's Concoctions
			[526] = 7.26, -- Endless Hunger
			[531] = 0.12, -- Terror of the Mind
			[541] = 0.09, -- Fight or Flight
			[560] = 2.16, -- Bonded Souls
			[561] = 4.78, -- Seductive Power
			[562] = 8.86, -- Treacherous Covenant
		})

		-- Destruction
		insertDefaultScalesData(defaultName, 9, 3, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 10567 - 13711 (avg 11888), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.15, -- Azerite Empowered
			[15] = 0.02, -- Resounding Protection
			[18] = 2.55, -- Blood Siphon
			[21] = 3.06, -- Elemental Whirl
			[22] = 3.06, -- Heed My Call
			[30] = 4.78, -- Overwhelming Power
			[31] = 3.47, -- Gutripper
			[44] = 0.1, -- Vampiric Speed
			[82] = 7.86, -- Champion of Azeroth
			[84] = 0.08, -- Bulwark of the Masses
			[85] = 0.14, -- Gemhide
			[86] = 0.08, -- Azerite Fortification
			[131] = 7.73, -- Chaos Shards
			[156] = 4.43, -- Ruinous Bolt
			[157] = 7.21, -- Rezan's Fury
			[192] = 5.64, -- Meticulous Scheming
			[193] = 8.03, -- Blightborne Infusion
			[194] = 6.29, -- Filthy Transfusion
			[195] = 6.35, -- Secrets of the Deep
			[196] = 6.93, -- Swirling Sands
			[232] = 5.89, -- Flashpoint
			[431] = 0.18, -- Rolling Havoc
			[432] = 7.71, -- Chaotic Inferno
			[444] = 9.16, -- Crashing Chaos
			[459] = 3.12, -- Unstable Flames
			[460] = 6.73, -- Bursting Flare
			[461] = 2.37, -- Earthlink
			[462] = 2.17, -- Azerite Globules
			[478] = 7.14, -- Tidal Surge
			[479] = 7.53, -- Dagger in the Back
			[480] = 5.42, -- Blood Rite
			[481] = 5.81, -- Incite the Pack
			[482] = 6.09, -- Thunderous Blast
			[483] = 6.64, -- Archive of the Titans
			[485] = 6.11, -- Laser Matrix
			[492] = 5.29, -- Liberator's Might
			[493] = 3.49, -- Last Gift
			[494] = 6.8, -- Battlefield Precision
			[495] = 6.23, -- Anduin's Dedication
			[496] = 1.79, -- Stronger Together
			[497] = 1.63, -- Stand As One
			[498] = 4.65, -- Barrage Of Many Bombs
			[499] = 2.53, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.82, -- Synaptic Spark Capacitor
			[501] = 7.05, -- Relational Normalization Gizmo
			[503] = 0.05, -- Auto-Self-Cauterizer
			[504] = 7.06, -- Unstable Catalyst
			[505] = 6.35, -- Tradewinds
			[521] = 5.44, -- Shadow of Elune
			[522] = 8.76, -- Ancients' Bulwark
			[523] = 6.1, -- Apothecary's Concoctions
			[526] = 8.88, -- Endless Hunger
			[531] = 0.08, -- Terror of the Mind
			[541] = 0.05, -- Fight or Flight
			[560] = 2.76, -- Bonded Souls
			[561] = 5.13, -- Seductive Power
			[562] = 10, -- Treacherous Covenant
		})

	-- Monk
		-- Brewmaster
		insertDefaultScalesData(offensiveName, 10, 1, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 5053 - 8963 (avg 5602), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[18] = 1.57, -- Blood Siphon
			[19] = 0.11, -- Woundbinder
			[20] = 1.17, -- Lifespeed
			[21] = 1.67, -- Elemental Whirl
			[22] = 4.31, -- Heed My Call
			[30] = 2.03, -- Overwhelming Power
			[31] = 4.71, -- Gutripper
			[38] = 1.7, -- On My Way
			[42] = 0.06, -- Savior
			[43] = 0.05, -- Winds of War
			[44] = 0.05, -- Vampiric Speed
			[82] = 5.21, -- Champion of Azeroth
			[89] = 0.05, -- Azerite Veins
			[98] = 0.03, -- Crystalline Carapace
			[99] = 0.09, -- Ablative Shielding
			[100] = 0.12, -- Strength in Numbers
			[103] = 0.06, -- Concentrated Mending
			[105] = 0.02, -- Ephemeral Recovery
			[116] = 1.61, -- Boiling Brew
			[156] = 5.32, -- Ruinous Bolt
			[157] = 9.63, -- Rezan's Fury
			[192] = 2.76, -- Meticulous Scheming
			[193] = 5.63, -- Blightborne Infusion
			[194] = 8.46, -- Filthy Transfusion
			[195] = 4.27, -- Secrets of the Deep
			[196] = 5.09, -- Swirling Sands
			[238] = 0.04, -- Fit to Burst
			[383] = 2.11, -- Training of Niuzao
			[384] = 4.59, -- Elusive Footwork
			[459] = 2.09, -- Unstable Flames
			[461] = 1.55, -- Earthlink
			[462] = 2.84, -- Azerite Globules
			[478] = 9.11, -- Tidal Surge
			[479] = 6.97, -- Dagger in the Back
			[480] = 2.05, -- Blood Rite
			[481] = 3.83, -- Incite the Pack
			[482] = 8.18, -- Thunderous Blast
			[483] = 4.66, -- Archive of the Titans
			[485] = 8.58, -- Laser Matrix
			[492] = 2.91, -- Liberator's Might
			[493] = 2.17, -- Last Gift
			[494] = 10, -- Battlefield Precision
			[495] = 4.08, -- Anduin's Dedication
			[496] = 0.99, -- Stronger Together
			[497] = 1.15, -- Stand As One
			[498] = 6.33, -- Barrage Of Many Bombs
			[499] = 3.79, -- Ricocheting Inflatable Pyrosaw
			[500] = 5, -- Synaptic Spark Capacitor
			[501] = 3.54, -- Relational Normalization Gizmo
			[503] = 0.03, -- Auto-Self-Cauterizer
			[504] = 4.64, -- Unstable Catalyst
			[505] = 4.04, -- Tradewinds
			[521] = 2.04, -- Shadow of Elune
			[522] = 5.74, -- Ancients' Bulwark
			[523] = 7.85, -- Apothecary's Concoctions
			[526] = 5.7, -- Endless Hunger
			[560] = 1.24, -- Bonded Souls
			[561] = 3.91, -- Seductive Power
			[562] = 6.42, -- Treacherous Covenant
			[566] = 0.01, -- Exit Strategy
		})
		insertDefaultScalesData(defensiveName, 10, 1, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 5033 - 8757 (avg 5605), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[15] = 6.49, -- Resounding Protection
			[18] = 1.78, -- Blood Siphon
			[21] = 0.07, -- Elemental Whirl
			[38] = 0.08, -- On My Way
			[82] = 0.23, -- Champion of Azeroth
			[86] = 0.01, -- Azerite Fortification
			[116] = 10, -- Boiling Brew
			[186] = 0.29, -- Staggering Strikes
			[193] = 0.37, -- Blightborne Infusion
			[195] = 0.21, -- Secrets of the Deep
			[196] = 0.32, -- Swirling Sands
			[383] = 0.11, -- Training of Niuzao
			[459] = 0.13, -- Unstable Flames
			[461] = 0.07, -- Earthlink
			[481] = 0.2, -- Incite the Pack
			[483] = 0.23, -- Archive of the Titans
			[492] = 0.14, -- Liberator's Might
			[493] = 0.12, -- Last Gift
			[495] = 0.2, -- Anduin's Dedication
			[496] = 0.05, -- Stronger Together
			[504] = 0.23, -- Unstable Catalyst
			[505] = 0.22, -- Tradewinds
			[522] = 0.28, -- Ancients' Bulwark
			[526] = 0.28, -- Endless Hunger
			[561] = 0.11, -- Seductive Power
			[562] = 0.32, -- Treacherous Covenant
		})

		-- Mistweaver
		insertDefaultScalesData(defaultName, 10, 2, {

		})

		-- Windwalker
		insertDefaultScalesData(defaultName, 10, 3, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 10010 - 14077 (avg 10780), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.18, -- Azerite Empowered
			[15] = 0.04, -- Resounding Protection
			[18] = 1.4, -- Blood Siphon
			[20] = 1.4, -- Lifespeed
			[21] = 1.67, -- Elemental Whirl
			[22] = 2.27, -- Heed My Call
			[30] = 2.61, -- Overwhelming Power
			[31] = 2.52, -- Gutripper
			[38] = 1.51, -- On My Way
			[43] = 0.02, -- Winds of War
			[44] = 0.03, -- Vampiric Speed
			[82] = 4.85, -- Champion of Azeroth
			[83] = 0.01, -- Impassive Visage
			[85] = 0.05, -- Gemhide
			[98] = 0.08, -- Crystalline Carapace
			[101] = 0.04, -- Shimmering Haven
			[103] = 0.08, -- Concentrated Mending
			[104] = 0.1, -- Bracing Chill
			[105] = 0.1, -- Ephemeral Recovery
			[117] = 10, -- Fury of Xuen
			[156] = 3.56, -- Ruinous Bolt
			[157] = 5.37, -- Rezan's Fury
			[184] = 4.79, -- Sunrise Technique
			[192] = 3.59, -- Meticulous Scheming
			[193] = 4.95, -- Blightborne Infusion
			[194] = 4.41, -- Filthy Transfusion
			[195] = 3.94, -- Secrets of the Deep
			[196] = 4.51, -- Swirling Sands
			[388] = 7.7, -- Glory of the Dawn
			[389] = 7.37, -- Open Palm Strikes
			[390] = 5.78, -- Pressure Point
			[391] = 5.85, -- Dance of Chi-Ji
			[459] = 1.77, -- Unstable Flames
			[461] = 1.37, -- Earthlink
			[462] = 1.55, -- Azerite Globules
			[470] = 0.05, -- Sweep the Leg
			[478] = 5.9, -- Tidal Surge
			[479] = 5.53, -- Dagger in the Back
			[480] = 3.21, -- Blood Rite
			[481] = 3.48, -- Incite the Pack
			[482] = 4.36, -- Thunderous Blast
			[483] = 4.2, -- Archive of the Titans
			[485] = 4.58, -- Laser Matrix
			[492] = 3.04, -- Liberator's Might
			[493] = 1.99, -- Last Gift
			[494] = 5.3, -- Battlefield Precision
			[495] = 4.01, -- Anduin's Dedication
			[496] = 1.01, -- Stronger Together
			[497] = 1.17, -- Stand As One
			[498] = 3.39, -- Barrage Of Many Bombs
			[499] = 2.08, -- Ricocheting Inflatable Pyrosaw
			[500] = 0.48, -- Synaptic Spark Capacitor
			[501] = 4.43, -- Relational Normalization Gizmo
			[502] = 0.11, -- Personal Absorb-o-Tron
			[503] = 0.11, -- Auto-Self-Cauterizer
			[504] = 4.55, -- Unstable Catalyst
			[505] = 3.62, -- Tradewinds
			[521] = 3.21, -- Shadow of Elune
			[522] = 5.5, -- Ancients' Bulwark
			[523] = 1, -- Apothecary's Concoctions
			[526] = 5.46, -- Endless Hunger
			[541] = 0.04, -- Fight or Flight
			[560] = 1.53, -- Bonded Souls
			[561] = 3.44, -- Seductive Power
			[562] = 6.36, -- Treacherous Covenant
		})

	-- Druid
		-- Balance
		insertDefaultScalesData(defaultName, 11, 1, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 9967 - 12617 (avg 10717), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[18] = 1.7, -- Blood Siphon
			[20] = 1.65, -- Lifespeed
			[21] = 1.97, -- Elemental Whirl
			[22] = 2.1, -- Heed My Call
			[30] = 3.19, -- Overwhelming Power
			[31] = 2.29, -- Gutripper
			[38] = 1.55, -- On My Way
			[82] = 5.45, -- Champion of Azeroth
			[99] = 0.03, -- Ablative Shielding
			[101] = 0.03, -- Shimmering Haven
			[122] = 4.38, -- Streaking Stars
			[156] = 2.74, -- Ruinous Bolt
			[157] = 4.77, -- Rezan's Fury
			[173] = 3.18, -- Power of the Moon
			[192] = 4.45, -- Meticulous Scheming
			[193] = 5.5, -- Blightborne Infusion
			[194] = 4.47, -- Filthy Transfusion
			[195] = 4.35, -- Secrets of the Deep
			[196] = 4.76, -- Swirling Sands
			[200] = 10, -- Arcanic Pulsar
			[250] = 4.61, -- Dawning Sun
			[356] = 2.13, -- High Noon
			[364] = 3.08, -- Lively Spirit
			[459] = 1.82, -- Unstable Flames
			[461] = 1.48, -- Earthlink
			[462] = 1.42, -- Azerite Globules
			[478] = 4.51, -- Tidal Surge
			[479] = 4.98, -- Dagger in the Back
			[480] = 3.55, -- Blood Rite
			[481] = 4.62, -- Incite the Pack
			[482] = 4.19, -- Thunderous Blast
			[483] = 4.59, -- Archive of the Titans
			[485] = 4.38, -- Laser Matrix
			[492] = 3.36, -- Liberator's Might
			[493] = 2.71, -- Last Gift
			[494] = 4.97, -- Battlefield Precision
			[495] = 4.25, -- Anduin's Dedication
			[496] = 1.08, -- Stronger Together
			[497] = 1.08, -- Stand As One
			[498] = 3.16, -- Barrage Of Many Bombs
			[499] = 1.87, -- Ricocheting Inflatable Pyrosaw
			[500] = 2.44, -- Synaptic Spark Capacitor
			[501] = 4.71, -- Relational Normalization Gizmo
			[502] = 0.05, -- Personal Absorb-o-Tron
			[504] = 4.87, -- Unstable Catalyst
			[505] = 4.94, -- Tradewinds
			[521] = 3.43, -- Shadow of Elune
			[522] = 5.41, -- Ancients' Bulwark
			[523] = 3.93, -- Apothecary's Concoctions
			[526] = 5.32, -- Endless Hunger
			[560] = 1.82, -- Bonded Souls
			[561] = 3.83, -- Seductive Power
			[562] = 6.7, -- Treacherous Covenant
		})

		-- Feral
		insertDefaultScalesData(defaultName, 11, 2, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 14815 - 18601 (avg 15962), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = 0.04, -- Resounding Protection
			[18] = 2.13, -- Blood Siphon
			[20] = 1.93, -- Lifespeed
			[21] = 2.25, -- Elemental Whirl
			[22] = 2.48, -- Heed My Call
			[30] = 3.31, -- Overwhelming Power
			[31] = 2.76, -- Gutripper
			[38] = 1.87, -- On My Way
			[43] = 0.07, -- Winds of War
			[82] = 7.14, -- Champion of Azeroth
			[111] = 6.06, -- Blood Mist
			[156] = 3.97, -- Ruinous Bolt
			[157] = 6.11, -- Rezan's Fury
			[169] = 3.28, -- Untamed Ferocity
			[171] = 0.01, -- Masterful Instincts
			[192] = 5.04, -- Meticulous Scheming
			[193] = 8.29, -- Blightborne Infusion
			[194] = 5.1, -- Filthy Transfusion
			[195] = 5.27, -- Secrets of the Deep
			[196] = 7.28, -- Swirling Sands
			[209] = 10, -- Jungle Fury
			[241] = 0.01, -- Twisted Claws
			[247] = 1.35, -- Iron Jaws
			[358] = 6.2, -- Gushing Lacerations
			[359] = 6.82, -- Wild Fleshrending
			[459] = 2.68, -- Unstable Flames
			[461] = 1.68, -- Earthlink
			[462] = 1.6, -- Azerite Globules
			[478] = 6.6, -- Tidal Surge
			[479] = 6.32, -- Dagger in the Back
			[480] = 4.19, -- Blood Rite
			[481] = 5.29, -- Incite the Pack
			[482] = 5.04, -- Thunderous Blast
			[483] = 5.67, -- Archive of the Titans
			[485] = 5.33, -- Laser Matrix
			[492] = 4.65, -- Liberator's Might
			[493] = 3.08, -- Last Gift
			[494] = 6.17, -- Battlefield Precision
			[495] = 5.14, -- Anduin's Dedication
			[496] = 1.32, -- Stronger Together
			[497] = 1.33, -- Stand As One
			[498] = 3.85, -- Barrage Of Many Bombs
			[499] = 2.23, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.52, -- Synaptic Spark Capacitor
			[501] = 5.6, -- Relational Normalization Gizmo
			[504] = 5.81, -- Unstable Catalyst
			[505] = 5.84, -- Tradewinds
			[521] = 4.25, -- Shadow of Elune
			[522] = 6.67, -- Ancients' Bulwark
			[523] = 4.85, -- Apothecary's Concoctions
			[526] = 6.65, -- Endless Hunger
			[560] = 1.86, -- Bonded Souls
			[561] = 4.18, -- Seductive Power
			[562] = 8.23, -- Treacherous Covenant
		})

		-- Guardian
		insertDefaultScalesData(offensiveName, 11, 3, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 5677 - 10400 (avg 6250), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = 0.01, -- Resounding Protection
			[18] = 1.75, -- Blood Siphon
			[20] = 2.14, -- Lifespeed
			[21] = 2.11, -- Elemental Whirl
			[22] = 4.22, -- Heed My Call
			[30] = 3.85, -- Overwhelming Power
			[31] = 4.54, -- Gutripper
			[38] = 1.96, -- On My Way
			[42] = 0.05, -- Savior
			[82] = 6.62, -- Champion of Azeroth
			[86] = 0.05, -- Azerite Fortification
			[101] = 0.06, -- Shimmering Haven
			[112] = 0.02, -- Layered Mane
			[156] = 6.08, -- Ruinous Bolt
			[157] = 9.9, -- Rezan's Fury
			[171] = 0.02, -- Masterful Instincts
			[192] = 5.88, -- Meticulous Scheming
			[193] = 7.08, -- Blightborne Infusion
			[194] = 8.61, -- Filthy Transfusion
			[195] = 5.18, -- Secrets of the Deep
			[196] = 6.03, -- Swirling Sands
			[241] = 6.18, -- Twisted Claws
			[251] = 5.53, -- Burst of Savagery
			[359] = 1.96, -- Wild Fleshrending
			[361] = 4.88, -- Guardian's Wrath
			[459] = 2.32, -- Unstable Flames
			[461] = 1.72, -- Earthlink
			[462] = 2.75, -- Azerite Globules
			[478] = 10, -- Tidal Surge
			[479] = 6.97, -- Dagger in the Back
			[480] = 4.55, -- Blood Rite
			[481] = 4.46, -- Incite the Pack
			[482] = 8.32, -- Thunderous Blast
			[483] = 5.64, -- Archive of the Titans
			[485] = 8.62, -- Laser Matrix
			[492] = 4.27, -- Liberator's Might
			[493] = 2.4, -- Last Gift
			[494] = 9.87, -- Battlefield Precision
			[495] = 5.02, -- Anduin's Dedication
			[496] = 1.26, -- Stronger Together
			[497] = 1.2, -- Stand As One
			[498] = 6.15, -- Barrage Of Many Bombs
			[499] = 3.68, -- Ricocheting Inflatable Pyrosaw
			[500] = 5.44, -- Synaptic Spark Capacitor
			[501] = 5.8, -- Relational Normalization Gizmo
			[504] = 5.83, -- Unstable Catalyst
			[505] = 4.7, -- Tradewinds
			[521] = 4.55, -- Shadow of Elune
			[522] = 6.78, -- Ancients' Bulwark
			[523] = 7.88, -- Apothecary's Concoctions
			[526] = 6.9, -- Endless Hunger
			[560] = 2.13, -- Bonded Souls
			[561] = 4.33, -- Seductive Power
			[562] = 7.9, -- Treacherous Covenant
		})
		-- Guardian
		insertDefaultScalesData(defensiveName, 11, 3, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 5682 - 8163 (avg 6177), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.04, -- Azerite Empowered
			[15] = 0.02, -- Resounding Protection
			[18] = 10, -- Blood Siphon
			[42] = 0.03, -- Savior
			[85] = 0.02, -- Gemhide
			[99] = 0.01, -- Ablative Shielding
			[105] = 0.03, -- Ephemeral Recovery
			[157] = 0.02, -- Rezan's Fury
			[171] = 0.02, -- Masterful Instincts
			[219] = 0.03, -- Reawakening
			[361] = 0.01, -- Guardian's Wrath
			[459] = 0.02, -- Unstable Flames
			[462] = 0.01, -- Azerite Globules
			[480] = 0.02, -- Blood Rite
			[482] = 0.02, -- Thunderous Blast
			[495] = 0.01, -- Anduin's Dedication
			[503] = 0.01, -- Auto-Self-Cauterizer
			[521] = 0.01, -- Shadow of Elune
			[560] = 0.01, -- Bonded Souls
		})

		-- Restoration
		insertDefaultScalesData(defaultName, 11, 4, {

		})

	-- Demon Hunter
		-- Havoc
		insertDefaultScalesData(defaultName, 12, 1, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 3129 - 6942 (avg 4088), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.28, -- Azerite Empowered
			[14] = 0.19, -- Longstrider
			[15] = 0.18, -- Resounding Protection
			[18] = 1.66, -- Blood Siphon
			[20] = 2.21, -- Lifespeed
			[21] = 2.42, -- Elemental Whirl
			[22] = 4.01, -- Heed My Call
			[30] = 4.46, -- Overwhelming Power
			[31] = 4.15, -- Gutripper
			[43] = 0.21, -- Winds of War
			[44] = 0.22, -- Vampiric Speed
			[82] = 6.64, -- Champion of Azeroth
			[83] = 0.13, -- Impassive Visage
			[84] = 0.18, -- Bulwark of the Masses
			[85] = 0.04, -- Gemhide
			[86] = 0.11, -- Azerite Fortification
			[87] = 0.26, -- Self Reliance
			[89] = 0.2, -- Azerite Veins
			[98] = 0.19, -- Crystalline Carapace
			[99] = 0.35, -- Ablative Shielding
			[100] = 0.31, -- Strength in Numbers
			[101] = 0.23, -- Shimmering Haven
			[126] = 8.32, -- Revolving Blades
			[156] = 4.84, -- Ruinous Bolt
			[157] = 8.54, -- Rezan's Fury
			[159] = 9.99, -- Furious Gaze
			[160] = 0.28, -- Infernal Armor
			[192] = 3.68, -- Meticulous Scheming
			[193] = 7.25, -- Blightborne Infusion
			[194] = 7.27, -- Filthy Transfusion
			[195] = 6.56, -- Secrets of the Deep
			[196] = 6.56, -- Swirling Sands
			[220] = 7.47, -- Chaotic Transformation
			[245] = 6.93, -- Seething Power
			[352] = 9.4, -- Thirsting Blades
			[353] = 5.08, -- Eyes of Rage
			[459] = 2.68, -- Unstable Flames
			[461] = 2.29, -- Earthlink
			[462] = 2.75, -- Azerite Globules
			[466] = 0.13, -- Burning Soul
			[478] = 7.93, -- Tidal Surge
			[479] = 8.84, -- Dagger in the Back
			[480] = 4.65, -- Blood Rite
			[481] = 4.12, -- Incite the Pack
			[482] = 7.38, -- Thunderous Blast
			[483] = 6.97, -- Archive of the Titans
			[485] = 7.6, -- Laser Matrix
			[492] = 4.5, -- Liberator's Might
			[493] = 2.49, -- Last Gift
			[494] = 8.89, -- Battlefield Precision
			[495] = 6.27, -- Anduin's Dedication
			[496] = 1.53, -- Stronger Together
			[497] = 1.7, -- Stand As One
			[498] = 5.38, -- Barrage Of Many Bombs
			[499] = 3.37, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.33, -- Synaptic Spark Capacitor
			[501] = 6.3, -- Relational Normalization Gizmo
			[502] = 0.26, -- Personal Absorb-o-Tron
			[503] = 0.22, -- Auto-Self-Cauterizer
			[504] = 7.39, -- Unstable Catalyst
			[505] = 4.36, -- Tradewinds
			[521] = 4.6, -- Shadow of Elune
			[522] = 7.9, -- Ancients' Bulwark
			[523] = 6.97, -- Apothecary's Concoctions
			[526] = 7.96, -- Endless Hunger
			[541] = 0.18, -- Fight or Flight
			[560] = 2.88, -- Bonded Souls
			[561] = 5.83, -- Seductive Power
			[562] = 10, -- Treacherous Covenant
			[564] = 0.18, -- Thrive in Chaos
		})

		-- Vengeance
		insertDefaultScalesData(offensiveName, 12, 2, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 4802 - 7881 (avg 5406), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[14] = 0.09, -- Longstrider
			[18] = 1.65, -- Blood Siphon
			[20] = 1.4, -- Lifespeed
			[21] = 1.88, -- Elemental Whirl
			[22] = 4.22, -- Heed My Call
			[30] = 3.01, -- Overwhelming Power
			[31] = 4.66, -- Gutripper
			[44] = 0.04, -- Vampiric Speed
			[82] = 6.12, -- Champion of Azeroth
			[83] = 0.02, -- Impassive Visage
			[86] = 0.03, -- Azerite Fortification
			[87] = 0.03, -- Self Reliance
			[89] = 0.01, -- Azerite Veins
			[156] = 5.91, -- Ruinous Bolt
			[157] = 9.78, -- Rezan's Fury
			[192] = 4.69, -- Meticulous Scheming
			[193] = 7.32, -- Blightborne Infusion
			[194] = 8.9, -- Filthy Transfusion
			[195] = 5.48, -- Secrets of the Deep
			[196] = 6.49, -- Swirling Sands
			[221] = 0.02, -- Rigid Carapace
			[354] = 0.01, -- Cycle of Binding
			[355] = 0.01, -- Essence Sever
			[459] = 2.56, -- Unstable Flames
			[461] = 1.73, -- Earthlink
			[462] = 2.87, -- Azerite Globules
			[478] = 10, -- Tidal Surge
			[479] = 6.95, -- Dagger in the Back
			[480] = 3.6, -- Blood Rite
			[481] = 4.41, -- Incite the Pack
			[482] = 8.27, -- Thunderous Blast
			[483] = 5.76, -- Archive of the Titans
			[485] = 8.51, -- Laser Matrix
			[492] = 3.83, -- Liberator's Might
			[493] = 2.41, -- Last Gift
			[494] = 9.69, -- Battlefield Precision
			[495] = 5.17, -- Anduin's Dedication
			[496] = 1.15, -- Stronger Together
			[497] = 1.35, -- Stand As One
			[498] = 6.04, -- Barrage Of Many Bombs
			[499] = 3.65, -- Ricocheting Inflatable Pyrosaw
			[500] = 7.6, -- Synaptic Spark Capacitor
			[501] = 5.16, -- Relational Normalization Gizmo
			[504] = 5.94, -- Unstable Catalyst
			[505] = 4.63, -- Tradewinds
			[521] = 3.54, -- Shadow of Elune
			[522] = 6.12, -- Ancients' Bulwark
			[523] = 6.47, -- Apothecary's Concoctions
			[526] = 6.14, -- Endless Hunger
			[560] = 1.42, -- Bonded Souls
			[561] = 4.47, -- Seductive Power
			[562] = 8.31, -- Treacherous Covenant
		})
		insertDefaultScalesData(defensiveName, 12, 2, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 4828 - 8092 (avg 5417), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 31.01.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[14] = 0.01, -- Longstrider
			[15] = 10, -- Resounding Protection
			[18] = 3.01, -- Blood Siphon
			[20] = 1.3, -- Lifespeed
			[21] = 0.76, -- Elemental Whirl
			[30] = 2.11, -- Overwhelming Power
			[31] = 0.03, -- Gutripper
			[82] = 2.58, -- Champion of Azeroth
			[157] = 0.03, -- Rezan's Fury
			[192] = 3.46, -- Meticulous Scheming
			[193] = 2.01, -- Blightborne Infusion
			[195] = 1.61, -- Secrets of the Deep
			[196] = 1.78, -- Swirling Sands
			[246] = 0.06, -- Hour of Reaping
			[354] = 0.04, -- Cycle of Binding
			[355] = 0.02, -- Essence Sever
			[459] = 0.68, -- Unstable Flames
			[461] = 0.57, -- Earthlink
			[480] = 2.6, -- Blood Rite
			[481] = 1.4, -- Incite the Pack
			[483] = 1.85, -- Archive of the Titans
			[492] = 1.64, -- Liberator's Might
			[493] = 0.8, -- Last Gift
			[494] = 0.07, -- Battlefield Precision
			[495] = 1.58, -- Anduin's Dedication
			[496] = 0.43, -- Stronger Together
			[497] = 0.17, -- Stand As One
			[499] = 0.05, -- Ricocheting Inflatable Pyrosaw
			[501] = 2.26, -- Relational Normalization Gizmo
			[504] = 1.96, -- Unstable Catalyst
			[505] = 1.46, -- Tradewinds
			[521] = 2.64, -- Shadow of Elune
			[522] = 1.9, -- Ancients' Bulwark
			[526] = 1.94, -- Endless Hunger
			[560] = 1.21, -- Bonded Souls
			[561] = 0.16, -- Seductive Power
			[562] = 2.63, -- Treacherous Covenant
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
