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
		}
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

local function insertDefaultScalesData(scaleName, classIndex, specNum, powerScales, timestamp)
	defaultScalesData[#defaultScalesData + 1] = {
		scaleName,
		classIndex,
		specNum,
		powerScales,
		timestamp
	}
end

do
		insertDefaultScalesData(defaultName, 12, 1, { -- Havoc Demon Hunter
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 3302 - 5864 (avg 4252), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = 0.04, -- Resounding Protection
			[482] = 5.17, -- Thunderous Blast
			[493] = 2.06, -- Last Gift
			[14] = 0.03, -- Longstrider
			[499] = 2.42, -- Ricocheting Inflatable Pyrosaw
			[461] = 1.54, -- Earthlink
			[485] = 5.56, -- Laser Matrix
			[82] = 5.4, -- Champion of Azeroth
			[22] = 2.81, -- Heed My Call
			[196] = 4.73, -- Swirling Sands
			[492] = 3.53, -- Liberator's Might
			[504] = 5.51, -- Unstable Catalyst
			[462] = 1.69, -- Azerite Globules
			[523] = 5.01, -- Apothecary's Concoctions
			[526] = 6.13, -- Endless Hunger
			[21] = 1.84, -- Elemental Whirl
			[478] = 5.75, -- Tidal Surge
			[576] = 2.64, -- Loyal to the End
			[104] = 0.01, -- Bracing Chill
			[522] = 6.13, -- Ancients' Bulwark
			[569] = 4.83, -- Clockwork Heart
			[577] = 1.97, -- Arcane Heart
			[38] = 1.74, -- On My Way
			[500] = 3.08, -- Synaptic Spark Capacitor
			[192] = 2.7, -- Meticulous Scheming
			[13] = 0.02, -- Azerite Empowered
			[505] = 3.63, -- Tradewinds
			[157] = 6.08, -- Rezan's Fury
			[220] = 5.39, -- Chaotic Transformation
			[497] = 1.25, -- Stand As One
			[101] = 0.12, -- Shimmering Haven
			[245] = 5.14, -- Seething Power
			[496] = 1, -- Stronger Together
			[481] = 3.36, -- Incite the Pack
			[494] = 6.5, -- Battlefield Precision
			[495] = 4.67, -- Anduin's Dedication
			[561] = 4.26, -- Seductive Power
			[20] = 1.77, -- Lifespeed
			[562] = 7.45, -- Treacherous Covenant
			[564] = 0.03, -- Thrive in Chaos
			[479] = 6.39, -- Dagger in the Back
			[483] = 5.31, -- Archive of the Titans
			[193] = 5.41, -- Blightborne Infusion
			[568] = 0.04, -- Person-Computer Interface
			[501] = 4.79, -- Relational Normalization Gizmo
			[86] = 0.02, -- Azerite Fortification
			[352] = 7.37, -- Thirsting Blades
			[126] = 6.26, -- Revolving Blades
			[156] = 3.38, -- Ruinous Bolt
			[18] = 1.29, -- Blood Siphon
			[459] = 1.93, -- Unstable Flames
			[466] = 0.06, -- Burning Soul
			[194] = 5.05, -- Filthy Transfusion
			[31] = 3.06, -- Gutripper
			[353] = 3.77, -- Eyes of Rage
			[159] = 7.99, -- Furious Gaze
			[521] = 3.39, -- Shadow of Elune
			[498] = 4.13, -- Barrage Of Many Bombs
			[30] = 3.51, -- Overwhelming Power
			[195] = 4.78, -- Secrets of the Deep
			[560] = 1.95, -- Bonded Souls
			[541] = 1.69, -- Fight or Flight
			[575] = 10, -- Undulating Tides
			[480] = 3.4, -- Blood Rite
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 3846 - 10126 (avg 4811), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = { 4.16, 0 }, -- Ripple in Space
			[5] = { 10, 2.44 }, -- Essence of the Focusing Iris
			[6] = { 6.38, 3.02 }, -- Purification Protocol
			[28] = { 2.45, 1.11 }, -- The Unbound Force
			[4] = { 1.37, 1.22 }, -- Worldvein Resonance
			[12] = { 8.24, 3.54 }, -- The Crucible of Flame
			[22] = { 4.67, 0.69 }, -- Vision of Perfection
			[27] = { 2.13, 1.29 }, -- Memory of Lucid Dreams
			[23] = { 4.72, 1.67 }, -- Blood of the Enemy
			[14] = { 9.76, 3.49 }, -- Condensed Life-Force
		}, 1562749200)

		insertDefaultScalesData(offensiveName, 12, 2, { -- Vengeance Demon Hunter
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 5060 - 8117 (avg 5597), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[494] = 6.38, -- Battlefield Precision
			[499] = 2.47, -- Ricocheting Inflatable Pyrosaw
			[13] = 0.01, -- Azerite Empowered
			[576] = 2.27, -- Loyal to the End
			[521] = 2.56, -- Shadow of Elune
			[493] = 1.69, -- Last Gift
			[85] = 0.04, -- Gemhide
			[568] = 0.03, -- Person-Computer Interface
			[44] = 0.03, -- Vampiric Speed
			[561] = 3.15, -- Seductive Power
			[526] = 4.28, -- Endless Hunger
			[466] = 0.09, -- Burning Soul
			[19] = 0.02, -- Woundbinder
			[562] = 5.67, -- Treacherous Covenant
			[98] = 0.04, -- Crystalline Carapace
			[485] = 5.49, -- Laser Matrix
			[193] = 5.15, -- Blightborne Infusion
			[478] = 6.38, -- Tidal Surge
			[105] = 0.04, -- Ephemeral Recovery
			[495] = 3.51, -- Anduin's Dedication
			[156] = 3.81, -- Ruinous Bolt
			[87] = 0.04, -- Self Reliance
			[504] = 4.12, -- Unstable Catalyst
			[355] = 0.01, -- Essence Sever
			[157] = 6.33, -- Rezan's Fury
			[483] = 4.07, -- Archive of the Titans
			[192] = 3.33, -- Meticulous Scheming
			[30] = 2.33, -- Overwhelming Power
			[221] = 0.02, -- Rigid Carapace
			[541] = 1.3, -- Fight or Flight
			[99] = 0.07, -- Ablative Shielding
			[195] = 3.63, -- Secrets of the Deep
			[82] = 4.2, -- Champion of Azeroth
			[21] = 1.51, -- Elemental Whirl
			[160] = 0.07, -- Infernal Armor
			[479] = 4.55, -- Dagger in the Back
			[492] = 2.85, -- Liberator's Might
			[523] = 4.36, -- Apothecary's Concoctions
			[500] = 4.55, -- Synaptic Spark Capacitor
			[496] = 0.84, -- Stronger Together
			[480] = 2.56, -- Blood Rite
			[38] = 1.23, -- On My Way
			[481] = 3.08, -- Incite the Pack
			[501] = 3.68, -- Relational Normalization Gizmo
			[43] = 0.04, -- Winds of War
			[354] = 0.14, -- Cycle of Binding
			[42] = 0.05, -- Savior
			[522] = 4.36, -- Ancients' Bulwark
			[18] = 1.26, -- Blood Siphon
			[505] = 3.34, -- Tradewinds
			[31] = 3.03, -- Gutripper
			[577] = 0.59, -- Arcane Heart
			[482] = 5.38, -- Thunderous Blast
			[84] = 0.09, -- Bulwark of the Masses
			[497] = 0.97, -- Stand As One
			[498] = 4.03, -- Barrage Of Many Bombs
			[575] = 10, -- Undulating Tides
			[22] = 2.73, -- Heed My Call
			[459] = 1.8, -- Unstable Flames
			[560] = 1.13, -- Bonded Souls
			[461] = 1.25, -- Earthlink
			[194] = 5.66, -- Filthy Transfusion
			[134] = 0.04, -- Revel in Pain
			[20] = 1.11, -- Lifespeed
			[462] = 1.77, -- Azerite Globules
			[564] = 0.02, -- Thrive in Chaos
			[196] = 4.59, -- Swirling Sands
			[569] = 3.79, -- Clockwork Heart
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 4946 - 5570 (avg 5263), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[25] = { 1.41, 1.53 }, -- Aegis of the Deep
			[7] = { 0, 0.01 }, -- Anima of Life and Death
			[12] = { 9.91, 10 }, -- The Crucible of Flame
			[4] = { 2.64, 2.52 }, -- Worldvein Resonance
			[27] = { 2.6, 2.58 }, -- Memory of Lucid Dreams
			[32] = { 3.01, 2.98 }, -- Conflict and Strife
			[13] = { 0.04, 0.07 }, -- Nullification Dynamo
			[22] = { 2.37, 0.32 }, -- Vision of Perfection
			[2] = { 0.02, 0 }, -- Azeroth's Undying Gift
			[3] = { 6.64, 6.76 }, -- Sphere of Suppression
		}, 1562749200)

		insertDefaultScalesData(offensiveName, 6, 1, { -- Blood Death Knight
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 7132 - 10246 (avg 7674), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[100] = 0.01, -- Strength in Numbers
			[499] = 2.44, -- Ricocheting Inflatable Pyrosaw
			[14] = 0.02, -- Longstrider
			[99] = 0.04, -- Ablative Shielding
			[481] = 2.77, -- Incite the Pack
			[494] = 6.28, -- Battlefield Precision
			[196] = 4.63, -- Swirling Sands
			[83] = 0.04, -- Impassive Visage
			[560] = 1.78, -- Bonded Souls
			[243] = 3.48, -- Bloody Runeblade
			[485] = 5.6, -- Laser Matrix
			[523] = 5.26, -- Apothecary's Concoctions
			[493] = 1.57, -- Last Gift
			[197] = 0.06, -- Marrowblood
			[577] = 1.03, -- Arcane Heart
			[526] = 4.58, -- Endless Hunger
			[459] = 1.82, -- Unstable Flames
			[18] = 1.15, -- Blood Siphon
			[575] = 10, -- Undulating Tides
			[156] = 3.6, -- Ruinous Bolt
			[480] = 3.17, -- Blood Rite
			[496] = 0.97, -- Stronger Together
			[503] = 0.06, -- Auto-Self-Cauterizer
			[42] = 0.04, -- Savior
			[462] = 1.86, -- Azerite Globules
			[82] = 4.15, -- Champion of Azeroth
			[502] = 0.05, -- Personal Absorb-o-Tron
			[541] = 1.13, -- Fight or Flight
			[479] = 4.54, -- Dagger in the Back
			[19] = 0.01, -- Woundbinder
			[495] = 3.07, -- Anduin's Dedication
			[463] = 0.07, -- Blessed Portents
			[20] = 1.09, -- Lifespeed
			[192] = 3.84, -- Meticulous Scheming
			[497] = 0.86, -- Stand As One
			[13] = 0.01, -- Azerite Empowered
			[478] = 6.05, -- Tidal Surge
			[349] = 0.19, -- Bones of the Damned
			[30] = 3.1, -- Overwhelming Power
			[89] = 0.09, -- Azerite Veins
			[562] = 4.89, -- Treacherous Covenant
			[98] = 0.02, -- Crystalline Carapace
			[348] = 3.22, -- Eternal Rune Weapon
			[87] = 0.02, -- Self Reliance
			[500] = 3.23, -- Synaptic Spark Capacitor
			[38] = 1.3, -- On My Way
			[461] = 1, -- Earthlink
			[504] = 3.62, -- Unstable Catalyst
			[505] = 2.89, -- Tradewinds
			[483] = 3.64, -- Archive of the Titans
			[521] = 3.1, -- Shadow of Elune
			[561] = 2.83, -- Seductive Power
			[31] = 3.12, -- Gutripper
			[22] = 2.84, -- Heed My Call
			[498] = 4.01, -- Barrage Of Many Bombs
			[105] = 0.05, -- Ephemeral Recovery
			[568] = 0.04, -- Person-Computer Interface
			[569] = 4.22, -- Clockwork Heart
			[194] = 5.64, -- Filthy Transfusion
			[21] = 1.57, -- Elemental Whirl
			[193] = 5.25, -- Blightborne Infusion
			[576] = 1.96, -- Loyal to the End
			[482] = 5.38, -- Thunderous Blast
			[195] = 3.14, -- Secrets of the Deep
			[492] = 3.16, -- Liberator's Might
			[501] = 3.83, -- Relational Normalization Gizmo
			[103] = 0.06, -- Concentrated Mending
			[157] = 6.33, -- Rezan's Fury
			[140] = 0.73, -- Bone Spike Graveyard
			[106] = 1.77, -- Deep Cuts
			[522] = 4.5, -- Ancients' Bulwark
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 6948 - 7584 (avg 7370), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[4] = { 1.28, 0.8 }, -- Worldvein Resonance
			[22] = { 0.02, 0 }, -- Vision of Perfection
			[3] = { 3.04, 3.02 }, -- Sphere of Suppression
			[7] = { 1.98, 0 }, -- Anima of Life and Death
			[13] = { 0.02, 0 }, -- Nullification Dynamo
			[25] = { 0.57, 0.59 }, -- Aegis of the Deep
			[12] = { 10, 3.54 }, -- The Crucible of Flame
			[15] = { 3.77, 0 }, -- Ripple in Space
			[2] = { 0, 0.01 }, -- Azeroth's Undying Gift
			[32] = { 1.25, 1.22 }, -- Conflict and Strife
			[27] = { 0, 1.35 }, -- Memory of Lucid Dreams
		}, 1562749200)

		insertDefaultScalesData(defaultName, 6, 2, { -- Frost Death Knight
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 13535 - 17514 (avg 14659), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[504] = 6.82, -- Unstable Catalyst
			[192] = 4.71, -- Meticulous Scheming
			[346] = 4.88, -- Killer Frost
			[462] = 1.81, -- Azerite Globules
			[347] = 5.83, -- Frozen Tempest
			[561] = 5.02, -- Seductive Power
			[20] = 1.76, -- Lifespeed
			[478] = 6.53, -- Tidal Surge
			[481] = 5.63, -- Incite the Pack
			[500] = 3.48, -- Synaptic Spark Capacitor
			[576] = 4.16, -- Loyal to the End
			[242] = 4.73, -- Echoing Howl
			[44] = 0.11, -- Vampiric Speed
			[483] = 6.6, -- Archive of the Titans
			[541] = 2.03, -- Fight or Flight
			[157] = 6.23, -- Rezan's Fury
			[526] = 8, -- Endless Hunger
			[480] = 4.72, -- Blood Rite
			[493] = 3.29, -- Last Gift
			[569] = 5.59, -- Clockwork Heart
			[575] = 10, -- Undulating Tides
			[485] = 5.5, -- Laser Matrix
			[577] = 3, -- Arcane Heart
			[568] = 0.02, -- Person-Computer Interface
			[521] = 4.7, -- Shadow of Elune
			[505] = 6.1, -- Tradewinds
			[103] = 0.05, -- Concentrated Mending
			[22] = 2.81, -- Heed My Call
			[21] = 2.63, -- Elemental Whirl
			[560] = 2.01, -- Bonded Souls
			[194] = 5.74, -- Filthy Transfusion
			[108] = 5.38, -- Icy Citadel
			[198] = 4.63, -- Frostwhelp's Indignation
			[83] = 0.02, -- Impassive Visage
			[461] = 2, -- Earthlink
			[497] = 1.62, -- Stand As One
			[492] = 4.7, -- Liberator's Might
			[494] = 6.23, -- Battlefield Precision
			[193] = 8.32, -- Blightborne Infusion
			[30] = 3.96, -- Overwhelming Power
			[459] = 2.94, -- Unstable Flames
			[496] = 1.51, -- Stronger Together
			[495] = 5.9, -- Anduin's Dedication
			[156] = 3.84, -- Ruinous Bolt
			[82] = 7.22, -- Champion of Azeroth
			[499] = 2.49, -- Ricocheting Inflatable Pyrosaw
			[31] = 3.08, -- Gutripper
			[501] = 6.44, -- Relational Normalization Gizmo
			[98] = 0.07, -- Crystalline Carapace
			[141] = 5.81, -- Latent Chill
			[42] = 0.06, -- Savior
			[562] = 9.22, -- Treacherous Covenant
			[482] = 5.42, -- Thunderous Blast
			[479] = 6.52, -- Dagger in the Back
			[15] = 0.16, -- Resounding Protection
			[18] = 2.38, -- Blood Siphon
			[38] = 2.18, -- On My Way
			[465] = 0.06, -- March of the Damned
			[498] = 3.95, -- Barrage Of Many Bombs
			[14] = 0.12, -- Longstrider
			[196] = 7.34, -- Swirling Sands
			[195] = 6.16, -- Secrets of the Deep
			[523] = 5.05, -- Apothecary's Concoctions
			[522] = 7.96, -- Ancients' Bulwark
			[43] = 0.02, -- Winds of War
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 11904 - 15517 (avg 13987), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[12] = { 7.54, 3.08 }, -- The Crucible of Flame
			[22] = { 3.81, 0.31 }, -- Vision of Perfection
			[32] = { 1.82, 1.77 }, -- Conflict and Strife
			[6] = { 5.93, 2.48 }, -- Purification Protocol
			[28] = { 1.64, 1.59 }, -- The Unbound Force
			[4] = { 1.55, 1.3 }, -- Worldvein Resonance
			[15] = { 3.85, 0.02 }, -- Ripple in Space
			[5] = { 10, 2.67 }, -- Essence of the Focusing Iris
			[27] = { 6.23, 3.76 }, -- Memory of Lucid Dreams
			[14] = { 7.99, 2.95 }, -- Condensed Life-Force
			[23] = { 6.03, 0.63 }, -- Blood of the Enemy
		}, 1562749200)

		insertDefaultScalesData(defaultName, 6, 3, { -- Unholy Death Knight
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 8557 - 11782 (avg 9197), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[104] = 0.14, -- Bracing Chill
			[561] = 4.4, -- Seductive Power
			[21] = 2.34, -- Elemental Whirl
			[549] = 0.02, -- Cold Hearted
			[541] = 2, -- Fight or Flight
			[194] = 5.98, -- Filthy Transfusion
			[505] = 4.68, -- Tradewinds
			[478] = 6.2, -- Tidal Surge
			[481] = 4.33, -- Incite the Pack
			[199] = 9.48, -- Festermight
			[98] = 0.08, -- Crystalline Carapace
			[497] = 1.55, -- Stand As One
			[350] = 4.03, -- Cankerous Wounds
			[576] = 3.43, -- Loyal to the End
			[42] = 0.03, -- Savior
			[465] = 0.06, -- March of the Damned
			[569] = 4.88, -- Clockwork Heart
			[244] = 5.69, -- Harrowing Decay
			[501] = 5.83, -- Relational Normalization Gizmo
			[482] = 5.42, -- Thunderous Blast
			[483] = 5.74, -- Archive of the Titans
			[44] = 0.13, -- Vampiric Speed
			[498] = 4.2, -- Barrage Of Many Bombs
			[43] = 0.12, -- Winds of War
			[31] = 3.04, -- Gutripper
			[351] = 3.22, -- Last Surprise
			[84] = 0.01, -- Bulwark of the Masses
			[495] = 5.16, -- Anduin's Dedication
			[462] = 1.79, -- Azerite Globules
			[504] = 6.03, -- Unstable Catalyst
			[492] = 4.37, -- Liberator's Might
			[30] = 4.15, -- Overwhelming Power
			[560] = 2.2, -- Bonded Souls
			[192] = 4.92, -- Meticulous Scheming
			[140] = 0.01, -- Bone Spike Graveyard
			[196] = 6.54, -- Swirling Sands
			[142] = 5.64, -- Helchains
			[109] = 7.26, -- Magus of the Dead
			[19] = 0.18, -- Woundbinder
			[523] = 5.17, -- Apothecary's Concoctions
			[485] = 5.61, -- Laser Matrix
			[499] = 2.49, -- Ricocheting Inflatable Pyrosaw
			[494] = 6.4, -- Battlefield Precision
			[201] = 0.05, -- Runic Barrier
			[500] = 3.47, -- Synaptic Spark Capacitor
			[193] = 7.35, -- Blightborne Infusion
			[526] = 7.18, -- Endless Hunger
			[562] = 8.34, -- Treacherous Covenant
			[15] = 0.07, -- Resounding Protection
			[157] = 6.28, -- Rezan's Fury
			[496] = 1.31, -- Stronger Together
			[480] = 4.33, -- Blood Rite
			[479] = 6.53, -- Dagger in the Back
			[156] = 3.66, -- Ruinous Bolt
			[522] = 7, -- Ancients' Bulwark
			[86] = 0.12, -- Azerite Fortification
			[18] = 1.87, -- Blood Siphon
			[461] = 1.91, -- Earthlink
			[568] = 0.02, -- Person-Computer Interface
			[577] = 1.69, -- Arcane Heart
			[521] = 4.3, -- Shadow of Elune
			[38] = 2.06, -- On My Way
			[83] = 0.18, -- Impassive Visage
			[463] = 0.07, -- Blessed Portents
			[493] = 2.59, -- Last Gift
			[85] = 0.1, -- Gemhide
			[87] = 0.08, -- Self Reliance
			[575] = 10, -- Undulating Tides
			[459] = 2.75, -- Unstable Flames
			[82] = 6.29, -- Champion of Azeroth
			[22] = 2.8, -- Heed My Call
			[20] = 2.01, -- Lifespeed
			[195] = 5.3, -- Secrets of the Deep
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 7752 - 11588 (avg 9109), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[12] = { 7.73, 2.75 }, -- The Crucible of Flame
			[22] = { 1.87, 0 }, -- Vision of Perfection
			[32] = { 1.44, 1.5 }, -- Conflict and Strife
			[28] = { 1.33, 1.4 }, -- The Unbound Force
			[15] = { 4.16, 0.03 }, -- Ripple in Space
			[4] = { 1.64, 1.05 }, -- Worldvein Resonance
			[27] = { 2.86, 2.04 }, -- Memory of Lucid Dreams
			[6] = { 5.53, 2.19 }, -- Purification Protocol
			[14] = { 7.32, 2.67 }, -- Condensed Life-Force
			[23] = { 3.22, 0.38 }, -- Blood of the Enemy
			[5] = { 10, 2.29 }, -- Essence of the Focusing Iris
		}, 1562749200)

		insertDefaultScalesData(defaultName, 11, 1, { -- Balance Druid
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 11248 - 14002 (avg 12186), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[480] = 2.75, -- Blood Rite
			[568] = 0.03, -- Person-Computer Interface
			[364] = 2.88, -- Lively Spirit
			[485] = 3.39, -- Laser Matrix
			[193] = 4.27, -- Blightborne Infusion
			[498] = 2.52, -- Barrage Of Many Bombs
			[577] = 1.56, -- Arcane Heart
			[194] = 3.27, -- Filthy Transfusion
			[192] = 3.49, -- Meticulous Scheming
			[501] = 3.69, -- Relational Normalization Gizmo
			[22] = 1.73, -- Heed My Call
			[495] = 3.41, -- Anduin's Dedication
			[523] = 3.16, -- Apothecary's Concoctions
			[459] = 1.44, -- Unstable Flames
			[497] = 0.98, -- Stand As One
			[483] = 3.95, -- Archive of the Titans
			[569] = 3.64, -- Clockwork Heart
			[30] = 2.68, -- Overwhelming Power
			[503] = 0.02, -- Auto-Self-Cauterizer
			[505] = 4.09, -- Tradewinds
			[540] = 0.01, -- Switch Hitter
			[575] = 6.19, -- Undulating Tides
			[86] = 0.01, -- Azerite Fortification
			[38] = 1.24, -- On My Way
			[20] = 1.33, -- Lifespeed
			[478] = 3.44, -- Tidal Surge
			[250] = 3.73, -- Dawning Sun
			[526] = 4.46, -- Endless Hunger
			[99] = 0.04, -- Ablative Shielding
			[462] = 1.14, -- Azerite Globules
			[31] = 1.76, -- Gutripper
			[482] = 3.26, -- Thunderous Blast
			[173] = 2.58, -- Power of the Moon
			[83] = 0.02, -- Impassive Visage
			[104] = 0.02, -- Bracing Chill
			[499] = 1.52, -- Ricocheting Inflatable Pyrosaw
			[541] = 1.24, -- Fight or Flight
			[561] = 3.15, -- Seductive Power
			[200] = 10, -- Arcanic Pulsar
			[504] = 4.05, -- Unstable Catalyst
			[493] = 2.26, -- Last Gift
			[19] = 0.05, -- Woundbinder
			[576] = 2.66, -- Loyal to the End
			[85] = 0.01, -- Gemhide
			[461] = 1.18, -- Earthlink
			[195] = 3.54, -- Secrets of the Deep
			[494] = 3.88, -- Battlefield Precision
			[122] = 4.02, -- Streaking Stars
			[84] = 0.04, -- Bulwark of the Masses
			[156] = 2.11, -- Ruinous Bolt
			[356] = 1.78, -- High Noon
			[21] = 1.52, -- Elemental Whirl
			[522] = 4.34, -- Ancients' Bulwark
			[42] = 0.01, -- Savior
			[500] = 1.87, -- Synaptic Spark Capacitor
			[560] = 1.48, -- Bonded Souls
			[481] = 3.77, -- Incite the Pack
			[479] = 3.93, -- Dagger in the Back
			[82] = 4.43, -- Champion of Azeroth
			[496] = 1.01, -- Stronger Together
			[492] = 2.63, -- Liberator's Might
			[14] = 0.03, -- Longstrider
			[157] = 3.73, -- Rezan's Fury
			[502] = 0.04, -- Personal Absorb-o-Tron
			[521] = 2.81, -- Shadow of Elune
			[43] = 0.02, -- Winds of War
			[18] = 1.56, -- Blood Siphon
			[562] = 5.48, -- Treacherous Covenant
			[196] = 3.74, -- Swirling Sands
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 9964 - 13776 (avg 11910), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[12] = { 5.13, 2.74 }, -- The Crucible of Flame
			[14] = { 7.29, 2.67 }, -- Condensed Life-Force
			[15] = { 2.78, 0 }, -- Ripple in Space
			[28] = { 2.2, 1.28 }, -- The Unbound Force
			[6] = { 4.21, 2.27 }, -- Purification Protocol
			[23] = { 3.42, 0.78 }, -- Blood of the Enemy
			[32] = { 10, 1.46 }, -- Conflict and Strife
			[5] = { 7.14, 2.43 }, -- Essence of the Focusing Iris
			[4] = { 0.64, 1.13 }, -- Worldvein Resonance
			[22] = { 3.4, 0.79 }, -- Vision of Perfection
			[27] = { 3.86, 2.19 }, -- Memory of Lucid Dreams
		}, 1562749200)

		insertDefaultScalesData(defaultName, 11, 2, { -- Feral Druid
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 16588 - 19934 (avg 17688), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[169] = 3.44, -- Untamed Ferocity
			[87] = 0.03, -- Self Reliance
			[467] = 0.05, -- Ursoc's Endurance
			[562] = 8.46, -- Treacherous Covenant
			[485] = 5.46, -- Laser Matrix
			[247] = 2.11, -- Iron Jaws
			[481] = 5.75, -- Incite the Pack
			[83] = 0.06, -- Impassive Visage
			[192] = 5.09, -- Meticulous Scheming
			[569] = 6.44, -- Clockwork Heart
			[111] = 6.19, -- Blood Mist
			[22] = 2.81, -- Heed My Call
			[193] = 8.1, -- Blightborne Infusion
			[173] = 0.13, -- Power of the Moon
			[503] = 0.04, -- Auto-Self-Cauterizer
			[38] = 2.1, -- On My Way
			[500] = 3.69, -- Synaptic Spark Capacitor
			[479] = 6.61, -- Dagger in the Back
			[575] = 10, -- Undulating Tides
			[496] = 1.52, -- Stronger Together
			[14] = 0.05, -- Longstrider
			[577] = 2.52, -- Arcane Heart
			[492] = 4.66, -- Liberator's Might
			[196] = 7.31, -- Swirling Sands
			[483] = 5.94, -- Archive of the Titans
			[101] = 0.01, -- Shimmering Haven
			[82] = 7.18, -- Champion of Azeroth
			[526] = 6.89, -- Endless Hunger
			[541] = 1.96, -- Fight or Flight
			[480] = 4.24, -- Blood Rite
			[194] = 4.98, -- Filthy Transfusion
			[502] = 0.09, -- Personal Absorb-o-Tron
			[522] = 6.85, -- Ancients' Bulwark
			[505] = 6.1, -- Tradewinds
			[576] = 4.18, -- Loyal to the End
			[219] = 0.13, -- Reawakening
			[209] = 9.71, -- Jungle Fury
			[523] = 5.07, -- Apothecary's Concoctions
			[494] = 6.26, -- Battlefield Precision
			[482] = 5.15, -- Thunderous Blast
			[241] = 0.11, -- Twisted Claws
			[358] = 6.5, -- Gushing Lacerations
			[461] = 1.97, -- Earthlink
			[561] = 4.28, -- Seductive Power
			[156] = 3.96, -- Ruinous Bolt
			[19] = 0.05, -- Woundbinder
			[85] = 0.02, -- Gemhide
			[462] = 1.91, -- Azerite Globules
			[493] = 3.28, -- Last Gift
			[86] = 0.04, -- Azerite Fortification
			[499] = 2.45, -- Ricocheting Inflatable Pyrosaw
			[498] = 3.96, -- Barrage Of Many Bombs
			[31] = 3.05, -- Gutripper
			[42] = 0.01, -- Savior
			[568] = 0.05, -- Person-Computer Interface
			[560] = 1.92, -- Bonded Souls
			[20] = 1.99, -- Lifespeed
			[157] = 6.33, -- Rezan's Fury
			[18] = 2.33, -- Blood Siphon
			[459] = 2.85, -- Unstable Flames
			[463] = 0.01, -- Blessed Portents
			[501] = 5.63, -- Relational Normalization Gizmo
			[30] = 3.59, -- Overwhelming Power
			[497] = 1.43, -- Stand As One
			[540] = 0.1, -- Switch Hitter
			[105] = 0.12, -- Ephemeral Recovery
			[504] = 5.89, -- Unstable Catalyst
			[13] = 0.07, -- Azerite Empowered
			[21] = 2.46, -- Elemental Whirl
			[495] = 5.23, -- Anduin's Dedication
			[195] = 5.48, -- Secrets of the Deep
			[359] = 7.13, -- Wild Fleshrending
			[478] = 6.79, -- Tidal Surge
			[84] = 0.18, -- Bulwark of the Masses
			[100] = 0.14, -- Strength in Numbers
			[521] = 4.21, -- Shadow of Elune
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 14624 - 18337 (avg 16782), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[27] = { 2.31, 1.78 }, -- Memory of Lucid Dreams
			[12] = { 5.84, 2.22 }, -- The Crucible of Flame
			[32] = { 10, 1.13 }, -- Conflict and Strife
			[28] = { 2, 0.91 }, -- The Unbound Force
			[4] = { 0.96, 0.82 }, -- Worldvein Resonance
			[22] = { 1.84, 0.52 }, -- Vision of Perfection
			[6] = { 4.25, 1.75 }, -- Purification Protocol
			[23] = { 3.46, 0.52 }, -- Blood of the Enemy
			[15] = { 2.74, 0 }, -- Ripple in Space
			[5] = { 7.14, 1.81 }, -- Essence of the Focusing Iris
			[14] = { 5.21, 2.06 }, -- Condensed Life-Force
		}, 1562749200)

		insertDefaultScalesData(offensiveName, 11, 3, { -- Guardian Druid
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 4591 - 6826 (avg 5106), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[44] = 0.07, -- Vampiric Speed
			[241] = 4.6, -- Twisted Claws
			[82] = 4.98, -- Champion of Azeroth
			[196] = 4.39, -- Swirling Sands
			[38] = 1.5, -- On My Way
			[480] = 3.43, -- Blood Rite
			[478] = 6.36, -- Tidal Surge
			[495] = 3.76, -- Anduin's Dedication
			[461] = 1.28, -- Earthlink
			[523] = 5.11, -- Apothecary's Concoctions
			[483] = 4.29, -- Archive of the Titans
			[505] = 3.61, -- Tradewinds
			[194] = 5.39, -- Filthy Transfusion
			[504] = 4.39, -- Unstable Catalyst
			[492] = 3.03, -- Liberator's Might
			[485] = 5.48, -- Laser Matrix
			[251] = 4.53, -- Burst of Savagery
			[360] = 0.03, -- Gory Regeneration
			[500] = 3.35, -- Synaptic Spark Capacitor
			[560] = 1.64, -- Bonded Souls
			[497] = 0.96, -- Stand As One
			[493] = 1.96, -- Last Gift
			[541] = 1.29, -- Fight or Flight
			[526] = 5.2, -- Endless Hunger
			[361] = 4.02, -- Guardian's Wrath
			[521] = 3.28, -- Shadow of Elune
			[482] = 5.32, -- Thunderous Blast
			[577] = 1.14, -- Arcane Heart
			[569] = 4.04, -- Clockwork Heart
			[479] = 4.49, -- Dagger in the Back
			[85] = 0.03, -- Gemhide
			[156] = 3.69, -- Ruinous Bolt
			[496] = 1.07, -- Stronger Together
			[31] = 2.89, -- Gutripper
			[499] = 2.38, -- Ricocheting Inflatable Pyrosaw
			[22] = 2.76, -- Heed My Call
			[359] = 1.62, -- Wild Fleshrending
			[561] = 3.21, -- Seductive Power
			[498] = 4.07, -- Barrage Of Many Bombs
			[101] = 0.01, -- Shimmering Haven
			[481] = 3.48, -- Incite the Pack
			[193] = 4.93, -- Blightborne Infusion
			[14] = 0.03, -- Longstrider
			[576] = 2.54, -- Loyal to the End
			[522] = 5.3, -- Ancients' Bulwark
			[575] = 10, -- Undulating Tides
			[192] = 4.39, -- Meticulous Scheming
			[562] = 6.05, -- Treacherous Covenant
			[21] = 1.69, -- Elemental Whirl
			[157] = 6.33, -- Rezan's Fury
			[84] = 0.04, -- Bulwark of the Masses
			[494] = 6.31, -- Battlefield Precision
			[459] = 1.69, -- Unstable Flames
			[18] = 1.33, -- Blood Siphon
			[20] = 1.63, -- Lifespeed
			[462] = 1.84, -- Azerite Globules
			[30] = 2.94, -- Overwhelming Power
			[99] = 0.09, -- Ablative Shielding
			[195] = 3.89, -- Secrets of the Deep
			[501] = 4.35, -- Relational Normalization Gizmo
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 4476 - 5590 (avg 4890), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[22] = { 1.56, 0 }, -- Vision of Perfection
			[3] = { 3.57, 3.47 }, -- Sphere of Suppression
			[12] = { 10, 3.94 }, -- The Crucible of Flame
			[32] = { 6.58, 1.57 }, -- Conflict and Strife
			[4] = { 0.93, 1.08 }, -- Worldvein Resonance
			[7] = { 1.86, 0 }, -- Anima of Life and Death
			[25] = { 0.72, 0.68 }, -- Aegis of the Deep
			[15] = { 4.1, 0.01 }, -- Ripple in Space
			[27] = { 1.34, 0.69 }, -- Memory of Lucid Dreams
		}, 1562749200)

		insertDefaultScalesData(defaultName, 3, 1, { -- Beast Mastery Hunter
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 8332 - 11090 (avg 9022), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[480] = 4.51, -- Blood Rite
			[485] = 5.41, -- Laser Matrix
			[20] = 2.45, -- Lifespeed
			[38] = 1.96, -- On My Way
			[193] = 6.64, -- Blightborne Infusion
			[521] = 4.43, -- Shadow of Elune
			[481] = 4.9, -- Incite the Pack
			[161] = 6.8, -- Haze of Rage
			[523] = 4.92, -- Apothecary's Concoctions
			[157] = 6.29, -- Rezan's Fury
			[505] = 5.35, -- Tradewinds
			[87] = 0.13, -- Self Reliance
			[560] = 2.24, -- Bonded Souls
			[107] = 4.57, -- Serrated Jaws
			[562] = 8.79, -- Treacherous Covenant
			[42] = 0.13, -- Savior
			[367] = 8.18, -- Feeding Frenzy
			[100] = 0.01, -- Strength in Numbers
			[22] = 2.8, -- Heed My Call
			[31] = 2.9, -- Gutripper
			[192] = 5.73, -- Meticulous Scheming
			[194] = 5.02, -- Filthy Transfusion
			[569] = 6.54, -- Clockwork Heart
			[82] = 6.73, -- Champion of Azeroth
			[14] = 0.07, -- Longstrider
			[18] = 2.18, -- Blood Siphon
			[105] = 0.16, -- Ephemeral Recovery
			[211] = 7.63, -- Dance of Death
			[494] = 5.99, -- Battlefield Precision
			[99] = 0.13, -- Ablative Shielding
			[495] = 5.58, -- Anduin's Dedication
			[98] = 0.04, -- Crystalline Carapace
			[479] = 6.4, -- Dagger in the Back
			[463] = 0.04, -- Blessed Portents
			[44] = 0.06, -- Vampiric Speed
			[504] = 6.34, -- Unstable Catalyst
			[195] = 5.63, -- Secrets of the Deep
			[576] = 3.66, -- Loyal to the End
			[492] = 4.21, -- Liberator's Might
			[104] = 0.15, -- Bracing Chill
			[461] = 1.93, -- Earthlink
			[459] = 2.36, -- Unstable Flames
			[84] = 0.01, -- Bulwark of the Masses
			[89] = 0.1, -- Azerite Veins
			[462] = 1.97, -- Azerite Globules
			[496] = 1.4, -- Stronger Together
			[577] = 0.66, -- Arcane Heart
			[85] = 0.12, -- Gemhide
			[469] = 0.11, -- Duck and Cover
			[502] = 0.05, -- Personal Absorb-o-Tron
			[30] = 4.01, -- Overwhelming Power
			[499] = 2.49, -- Ricocheting Inflatable Pyrosaw
			[156] = 3.78, -- Ruinous Bolt
			[369] = 0.17, -- Rapid Reload
			[483] = 6.22, -- Archive of the Titans
			[526] = 7.01, -- Endless Hunger
			[21] = 2.4, -- Elemental Whirl
			[19] = 0.09, -- Woundbinder
			[561] = 4.76, -- Seductive Power
			[575] = 9.58, -- Undulating Tides
			[478] = 6.25, -- Tidal Surge
			[86] = 0.03, -- Azerite Fortification
			[203] = 0.09, -- Shellshock
			[500] = 3.41, -- Synaptic Spark Capacitor
			[101] = 0.14, -- Shimmering Haven
			[503] = 0.09, -- Auto-Self-Cauterizer
			[501] = 6.1, -- Relational Normalization Gizmo
			[43] = 0.08, -- Winds of War
			[541] = 2.11, -- Fight or Flight
			[15] = 0.02, -- Resounding Protection
			[493] = 3.04, -- Last Gift
			[365] = 6.73, -- Dire Consequences
			[543] = 0.05, -- Nature's Salve
			[366] = 10, -- Primal Instincts
			[522] = 6.98, -- Ancients' Bulwark
			[498] = 3.93, -- Barrage Of Many Bombs
			[196] = 5.63, -- Swirling Sands
			[497] = 1.54, -- Stand As One
			[83] = 0.06, -- Impassive Visage
			[482] = 5.11, -- Thunderous Blast
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 7413 - 10636 (avg 8746), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[5] = { 10, 2.27 }, -- Essence of the Focusing Iris
			[28] = { 3.15, 1.19 }, -- The Unbound Force
			[12] = { 7.66, 2.7 }, -- The Crucible of Flame
			[4] = { 1.9, 1.14 }, -- Worldvein Resonance
			[22] = { 1.17, 0.26 }, -- Vision of Perfection
			[27] = { 0.82, 0.81 }, -- Memory of Lucid Dreams
			[32] = { 1.45, 1.44 }, -- Conflict and Strife
			[23] = { 2.62, 0.26 }, -- Blood of the Enemy
			[6] = { 5.43, 2.16 }, -- Purification Protocol
			[14] = { 7.12, 2.56 }, -- Condensed Life-Force
			[15] = { 4.26, 0.05 }, -- Ripple in Space
		}, 1562749200)

		insertDefaultScalesData(defaultName, 3, 2, { -- Marksmanship Hunter
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 11599 - 14686 (avg 12414), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[104] = 0.02, -- Bracing Chill
			[31] = 2.58, -- Gutripper
			[193] = 6.59, -- Blightborne Infusion
			[495] = 4.46, -- Anduin's Dedication
			[562] = 7.02, -- Treacherous Covenant
			[103] = 0.07, -- Concentrated Mending
			[156] = 3.51, -- Ruinous Bolt
			[196] = 5.95, -- Swirling Sands
			[522] = 6.69, -- Ancients' Bulwark
			[505] = 5.1, -- Tradewinds
			[543] = 0.06, -- Nature's Salve
			[212] = 7.94, -- Unerring Vision
			[521] = 4.5, -- Shadow of Elune
			[492] = 4.02, -- Liberator's Might
			[560] = 1.95, -- Bonded Souls
			[485] = 4.73, -- Laser Matrix
			[89] = 0.06, -- Azerite Veins
			[496] = 1.26, -- Stronger Together
			[203] = 0.1, -- Shellshock
			[99] = 0.1, -- Ablative Shielding
			[569] = 4.85, -- Clockwork Heart
			[84] = 0.1, -- Bulwark of the Masses
			[13] = 0.01, -- Azerite Empowered
			[36] = 10, -- In The Rhythm
			[19] = 0.08, -- Woundbinder
			[18] = 2.02, -- Blood Siphon
			[192] = 5.65, -- Meticulous Scheming
			[502] = 0.01, -- Personal Absorb-o-Tron
			[42] = 0.09, -- Savior
			[503] = 0.09, -- Auto-Self-Cauterizer
			[43] = 0.1, -- Winds of War
			[577] = 1.67, -- Arcane Heart
			[494] = 5.45, -- Battlefield Precision
			[478] = 5.66, -- Tidal Surge
			[30] = 3.93, -- Overwhelming Power
			[576] = 3.46, -- Loyal to the End
			[194] = 4.9, -- Filthy Transfusion
			[482] = 4.61, -- Thunderous Blast
			[541] = 1.7, -- Fight or Flight
			[504] = 5.07, -- Unstable Catalyst
			[21] = 2.19, -- Elemental Whirl
			[20] = 1.69, -- Lifespeed
			[100] = 0.1, -- Strength in Numbers
			[101] = 0.08, -- Shimmering Haven
			[493] = 2.75, -- Last Gift
			[368] = 3.34, -- Steady Aim
			[481] = 4.65, -- Incite the Pack
			[22] = 2.39, -- Heed My Call
			[501] = 5.44, -- Relational Normalization Gizmo
			[195] = 4.57, -- Secrets of the Deep
			[105] = 0.02, -- Ephemeral Recovery
			[162] = 6.81, -- Surging Shots
			[480] = 4.54, -- Blood Rite
			[561] = 3.8, -- Seductive Power
			[461] = 1.61, -- Earthlink
			[85] = 0.13, -- Gemhide
			[499] = 2.17, -- Ricocheting Inflatable Pyrosaw
			[459] = 2.42, -- Unstable Flames
			[500] = 3.21, -- Synaptic Spark Capacitor
			[82] = 6.08, -- Champion of Azeroth
			[483] = 5.12, -- Archive of the Titans
			[370] = 8.74, -- Focused Fire
			[38] = 2, -- On My Way
			[98] = 0.01, -- Crystalline Carapace
			[526] = 6.74, -- Endless Hunger
			[498] = 3.49, -- Barrage Of Many Bombs
			[87] = 0.01, -- Self Reliance
			[479] = 5.69, -- Dagger in the Back
			[523] = 4.4, -- Apothecary's Concoctions
			[157] = 5.58, -- Rezan's Fury
			[575] = 8.69, -- Undulating Tides
			[83] = 0.02, -- Impassive Visage
			[497] = 1.19, -- Stand As One
			[462] = 1.59, -- Azerite Globules
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 9968 - 13547 (avg 12101), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = { 3.5, 0.08 }, -- Ripple in Space
			[6] = { 5.45, 2.57 }, -- Purification Protocol
			[4] = { 1.02, 1.19 }, -- Worldvein Resonance
			[12] = { 7.05, 3.28 }, -- The Crucible of Flame
			[32] = { 1.83, 1.87 }, -- Conflict and Strife
			[5] = { 10, 2.94 }, -- Essence of the Focusing Iris
			[14] = { 8.11, 3.05 }, -- Condensed Life-Force
			[23] = { 3.64, 0.39 }, -- Blood of the Enemy
			[22] = { 3.73, 1.06 }, -- Vision of Perfection
			[27] = { 1.18, 0.67 }, -- Memory of Lucid Dreams
			[28] = { 2.64, 1.59 }, -- The Unbound Force
		}, 1562749200)

		insertDefaultScalesData(defaultName, 3, 3, { -- Survival Hunter
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 7049 - 9974 (avg 8201), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[462] = 1.77, -- Azerite Globules
			[365] = 5.78, -- Dire Consequences
			[501] = 6.27, -- Relational Normalization Gizmo
			[44] = 0.04, -- Vampiric Speed
			[483] = 5.68, -- Archive of the Titans
			[38] = 1.89, -- On My Way
			[194] = 5.27, -- Filthy Transfusion
			[195] = 5.32, -- Secrets of the Deep
			[213] = 5.05, -- Venomous Fangs
			[459] = 2.39, -- Unstable Flames
			[482] = 5.14, -- Thunderous Blast
			[21] = 2.25, -- Elemental Whirl
			[541] = 1.85, -- Fight or Flight
			[561] = 4.52, -- Seductive Power
			[371] = 8.95, -- Blur of Talons
			[480] = 5.14, -- Blood Rite
			[22] = 2.59, -- Heed My Call
			[18] = 1.9, -- Blood Siphon
			[575] = 9.87, -- Undulating Tides
			[31] = 2.98, -- Gutripper
			[481] = 4.59, -- Incite the Pack
			[463] = 0.02, -- Blessed Portents
			[576] = 3.33, -- Loyal to the End
			[193] = 6.6, -- Blightborne Infusion
			[560] = 2.57, -- Bonded Souls
			[577] = 1.4, -- Arcane Heart
			[479] = 6.31, -- Dagger in the Back
			[493] = 2.66, -- Last Gift
			[196] = 5.84, -- Swirling Sands
			[494] = 6.14, -- Battlefield Precision
			[497] = 1.37, -- Stand As One
			[496] = 1.24, -- Stronger Together
			[30] = 4.86, -- Overwhelming Power
			[20] = 2.59, -- Lifespeed
			[82] = 6.78, -- Champion of Azeroth
			[110] = 2.55, -- Wildfire Cluster
			[157] = 6.27, -- Rezan's Fury
			[523] = 5, -- Apothecary's Concoctions
			[526] = 6.82, -- Endless Hunger
			[192] = 5.79, -- Meticulous Scheming
			[373] = 7.31, -- Primeval Intuition
			[372] = 10, -- Wilderness Survival
			[562] = 8.11, -- Treacherous Covenant
			[521] = 5.13, -- Shadow of Elune
			[569] = 5.8, -- Clockwork Heart
			[99] = 0.01, -- Ablative Shielding
			[499] = 2.29, -- Ricocheting Inflatable Pyrosaw
			[495] = 5.13, -- Anduin's Dedication
			[500] = 3.2, -- Synaptic Spark Capacitor
			[498] = 3.92, -- Barrage Of Many Bombs
			[156] = 3.32, -- Ruinous Bolt
			[478] = 5.99, -- Tidal Surge
			[504] = 5.98, -- Unstable Catalyst
			[107] = 4.03, -- Serrated Jaws
			[163] = 7.33, -- Latent Poison
			[461] = 1.79, -- Earthlink
			[522] = 6.92, -- Ancients' Bulwark
			[492] = 4.4, -- Liberator's Might
			[485] = 5.38, -- Laser Matrix
			[505] = 4.82, -- Tradewinds
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 6903 - 10082 (avg 8101), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[22] = { 3.75, 1.25 }, -- Vision of Perfection
			[5] = { 10, 2.9 }, -- Essence of the Focusing Iris
			[27] = { 5.42, 2.01 }, -- Memory of Lucid Dreams
			[14] = { 7.58, 2.83 }, -- Condensed Life-Force
			[4] = { 1.44, 1.13 }, -- Worldvein Resonance
			[15] = { 3.84, 0 }, -- Ripple in Space
			[23] = { 3.09, 0.42 }, -- Blood of the Enemy
			[12] = { 7.34, 2.93 }, -- The Crucible of Flame
			[32] = { 1.5, 1.48 }, -- Conflict and Strife
			[6] = { 5.45, 2.37 }, -- Purification Protocol
			[28] = { 2.94, 1.19 }, -- The Unbound Force
		}, 1562749200)

		insertDefaultScalesData(defaultName, 8, 1, { -- Arcane Mage
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 20612 - 24156 (avg 21961), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[569] = 3.28, -- Clockwork Heart
			[214] = 2.43, -- Arcane Pressure
			[195] = 4.91, -- Secrets of the Deep
			[541] = 1.6, -- Fight or Flight
			[495] = 4.84, -- Anduin's Dedication
			[127] = 10, -- Equipoise
			[30] = 2.55, -- Overwhelming Power
			[21] = 1.82, -- Elemental Whirl
			[98] = 0.02, -- Crystalline Carapace
			[461] = 1.69, -- Earthlink
			[482] = 4.45, -- Thunderous Blast
			[561] = 3.71, -- Seductive Power
			[485] = 4.93, -- Laser Matrix
			[499] = 1.99, -- Ricocheting Inflatable Pyrosaw
			[44] = 0.05, -- Vampiric Speed
			[22] = 2.4, -- Heed My Call
			[18] = 1.84, -- Blood Siphon
			[479] = 5.84, -- Dagger in the Back
			[493] = 2.37, -- Last Gift
			[576] = 3.23, -- Loyal to the End
			[496] = 1.15, -- Stronger Together
			[502] = 0.05, -- Personal Absorb-o-Tron
			[500] = 3.2, -- Synaptic Spark Capacitor
			[577] = 3.4, -- Arcane Heart
			[374] = 6.66, -- Galvanizing Spark
			[196] = 4.65, -- Swirling Sands
			[522] = 5.93, -- Ancients' Bulwark
			[492] = 3.27, -- Liberator's Might
			[575] = 8.5, -- Undulating Tides
			[560] = 1.18, -- Bonded Souls
			[505] = 4.4, -- Tradewinds
			[478] = 5.74, -- Tidal Surge
			[101] = 0.01, -- Shimmering Haven
			[167] = 3.12, -- Brain Storm
			[526] = 6.06, -- Endless Hunger
			[494] = 4.73, -- Battlefield Precision
			[480] = 3.45, -- Blood Rite
			[192] = 2.42, -- Meticulous Scheming
			[88] = 6.12, -- Arcane Pummeling
			[156] = 3.65, -- Ruinous Bolt
			[82] = 5.25, -- Champion of Azeroth
			[504] = 5.45, -- Unstable Catalyst
			[38] = 1.74, -- On My Way
			[521] = 3.37, -- Shadow of Elune
			[31] = 2.48, -- Gutripper
			[194] = 4.71, -- Filthy Transfusion
			[193] = 5.91, -- Blightborne Infusion
			[459] = 1.92, -- Unstable Flames
			[157] = 5.6, -- Rezan's Fury
			[501] = 5.03, -- Relational Normalization Gizmo
			[568] = 0.03, -- Person-Computer Interface
			[483] = 5.56, -- Archive of the Titans
			[562] = 7.88, -- Treacherous Covenant
			[497] = 1.31, -- Stand As One
			[481] = 4.2, -- Incite the Pack
			[498] = 3.42, -- Barrage Of Many Bombs
			[462] = 1.54, -- Azerite Globules
			[523] = 4.42, -- Apothecary's Concoctions
			[20] = 1.25, -- Lifespeed
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 18707 - 25026 (avg 22139), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[23] = { 3.35, 0.17 }, -- Blood of the Enemy
			[32] = { 1.72, 1.66 }, -- Conflict and Strife
			[5] = { 10, 1.71 }, -- Essence of the Focusing Iris
			[6] = { 5.68, 2.64 }, -- Purification Protocol
			[14] = { 8.13, 3.09 }, -- Condensed Life-Force
			[27] = { 3.18, 2.31 }, -- Memory of Lucid Dreams
			[28] = { 1.81, 0.9 }, -- The Unbound Force
			[4] = { 1.49, 1.26 }, -- Worldvein Resonance
			[15] = { 3.97, 0 }, -- Ripple in Space
			[12] = { 7.49, 3.5 }, -- The Crucible of Flame
			[22] = { 0.16, 0 }, -- Vision of Perfection
		}, 1562749200)

		insertDefaultScalesData(defaultName, 8, 2, { -- Fire Mage
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 26037 - 31105 (avg 28077), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[21] = 1.93, -- Elemental Whirl
			[504] = 5.18, -- Unstable Catalyst
			[31] = 3, -- Gutripper
			[479] = 6.29, -- Dagger in the Back
			[83] = 0.08, -- Impassive Visage
			[521] = 3.31, -- Shadow of Elune
			[378] = 6.17, -- Firemind
			[15] = 0.18, -- Resounding Protection
			[501] = 4.63, -- Relational Normalization Gizmo
			[215] = 2.96, -- Blaster Master
			[523] = 5.14, -- Apothecary's Concoctions
			[503] = 0.05, -- Auto-Self-Cauterizer
			[157] = 6.16, -- Rezan's Fury
			[492] = 3.25, -- Liberator's Might
			[546] = 0.05, -- Quick Thinking
			[562] = 7.27, -- Treacherous Covenant
			[20] = 1.03, -- Lifespeed
			[22] = 2.78, -- Heed My Call
			[481] = 3.93, -- Incite the Pack
			[128] = 3.42, -- Flames of Alacrity
			[499] = 2.52, -- Ricocheting Inflatable Pyrosaw
			[89] = 0.06, -- Azerite Veins
			[168] = 8.74, -- Wildfire
			[577] = 1.29, -- Arcane Heart
			[104] = 0.09, -- Bracing Chill
			[502] = 0.11, -- Personal Absorb-o-Tron
			[196] = 5.76, -- Swirling Sands
			[560] = 1.19, -- Bonded Souls
			[194] = 4.95, -- Filthy Transfusion
			[493] = 2.31, -- Last Gift
			[526] = 6.2, -- Endless Hunger
			[105] = 0.09, -- Ephemeral Recovery
			[498] = 4.02, -- Barrage Of Many Bombs
			[500] = 3.37, -- Synaptic Spark Capacitor
			[494] = 6.16, -- Battlefield Precision
			[485] = 5.45, -- Laser Matrix
			[103] = 0.01, -- Concentrated Mending
			[522] = 6.07, -- Ancients' Bulwark
			[82] = 4.93, -- Champion of Azeroth
			[30] = 2.83, -- Overwhelming Power
			[483] = 4.94, -- Archive of the Titans
			[561] = 4.05, -- Seductive Power
			[569] = 5.72, -- Clockwork Heart
			[462] = 1.83, -- Azerite Globules
			[100] = 0.07, -- Strength in Numbers
			[42] = 0.07, -- Savior
			[38] = 1.74, -- On My Way
			[461] = 1.77, -- Earthlink
			[497] = 1.27, -- Stand As One
			[156] = 3.84, -- Ruinous Bolt
			[480] = 3.29, -- Blood Rite
			[43] = 0.09, -- Winds of War
			[496] = 1.22, -- Stronger Together
			[495] = 4.47, -- Anduin's Dedication
			[18] = 1.8, -- Blood Siphon
			[193] = 6.54, -- Blightborne Infusion
			[19] = 0.06, -- Woundbinder
			[541] = 1.91, -- Fight or Flight
			[505] = 4.42, -- Tradewinds
			[195] = 4.72, -- Secrets of the Deep
			[576] = 3.08, -- Loyal to the End
			[376] = 3.95, -- Trailing Embers
			[482] = 5.09, -- Thunderous Blast
			[478] = 6.26, -- Tidal Surge
			[377] = 5.79, -- Duplicative Incineration
			[205] = 0.04, -- Eldritch Warding
			[192] = 3.21, -- Meticulous Scheming
			[459] = 2.09, -- Unstable Flames
			[575] = 10, -- Undulating Tides
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 23599 - 28930 (avg 27300), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[23] = { 1.54, 0.4 }, -- Blood of the Enemy
			[22] = { 3.71, 1.42 }, -- Vision of Perfection
			[27] = { 9.49, 6.41 }, -- Memory of Lucid Dreams
			[32] = { 1.32, 1.41 }, -- Conflict and Strife
			[6] = { 5.64, 2.65 }, -- Purification Protocol
			[4] = { 1.16, 1.04 }, -- Worldvein Resonance
			[12] = { 6.94, 3.26 }, -- The Crucible of Flame
			[28] = { 2.41, 1.09 }, -- The Unbound Force
			[15] = { 3.84, 0 }, -- Ripple in Space
			[14] = { 8.6, 3.05 }, -- Condensed Life-Force
			[5] = { 10, 2.04 }, -- Essence of the Focusing Iris
		}, 1562749200)

		insertDefaultScalesData(defaultName, 8, 3, { -- Frost Mage
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 16163 - 19483 (avg 17731), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[568] = 0.11, -- Person-Computer Interface
			[83] = 0.05, -- Impassive Visage
			[482] = 4.43, -- Thunderous Blast
			[480] = 3.37, -- Blood Rite
			[504] = 5.29, -- Unstable Catalyst
			[157] = 5.37, -- Rezan's Fury
			[576] = 2.91, -- Loyal to the End
			[546] = 0.13, -- Quick Thinking
			[43] = 0.01, -- Winds of War
			[20] = 1.74, -- Lifespeed
			[84] = 0.09, -- Bulwark of the Masses
			[380] = 4.75, -- Whiteout
			[87] = 0.13, -- Self Reliance
			[522] = 5.54, -- Ancients' Bulwark
			[86] = 0.1, -- Azerite Fortification
			[462] = 1.67, -- Azerite Globules
			[483] = 5.14, -- Archive of the Titans
			[193] = 5.25, -- Blightborne Infusion
			[18] = 1.62, -- Blood Siphon
			[560] = 1.71, -- Bonded Souls
			[523] = 4.42, -- Apothecary's Concoctions
			[105] = 0.09, -- Ephemeral Recovery
			[503] = 0.02, -- Auto-Self-Cauterizer
			[89] = 0.03, -- Azerite Veins
			[196] = 5.37, -- Swirling Sands
			[485] = 4.71, -- Laser Matrix
			[195] = 4.64, -- Secrets of the Deep
			[13] = 0.11, -- Azerite Empowered
			[459] = 2.26, -- Unstable Flames
			[156] = 3.18, -- Ruinous Bolt
			[31] = 2.47, -- Gutripper
			[22] = 2.41, -- Heed My Call
			[478] = 5.09, -- Tidal Surge
			[99] = 0.05, -- Ablative Shielding
			[569] = 4.65, -- Clockwork Heart
			[495] = 4.71, -- Anduin's Dedication
			[479] = 5.67, -- Dagger in the Back
			[497] = 1.32, -- Stand As One
			[225] = 4.87, -- Glacial Assault
			[500] = 2.85, -- Synaptic Spark Capacitor
			[104] = 0.1, -- Bracing Chill
			[379] = 4.91, -- Tunnel of Ice
			[468] = 0.12, -- Cauterizing Blink
			[38] = 1.57, -- On My Way
			[561] = 3.92, -- Seductive Power
			[21] = 1.95, -- Elemental Whirl
			[42] = 0.06, -- Savior
			[463] = 0.03, -- Blessed Portents
			[192] = 3.56, -- Meticulous Scheming
			[541] = 1.81, -- Fight or Flight
			[381] = 4.43, -- Frigid Grasp
			[85] = 0.07, -- Gemhide
			[170] = 10, -- Flash Freeze
			[44] = 0.04, -- Vampiric Speed
			[505] = 4.46, -- Tradewinds
			[501] = 4.85, -- Relational Normalization Gizmo
			[575] = 8.11, -- Undulating Tides
			[498] = 3.34, -- Barrage Of Many Bombs
			[194] = 4.89, -- Filthy Transfusion
			[526] = 5.56, -- Endless Hunger
			[100] = 0.06, -- Strength in Numbers
			[461] = 1.69, -- Earthlink
			[562] = 7.03, -- Treacherous Covenant
			[493] = 2.46, -- Last Gift
			[577] = 1.49, -- Arcane Heart
			[19] = 0.02, -- Woundbinder
			[82] = 5.33, -- Champion of Azeroth
			[205] = 0.07, -- Eldritch Warding
			[521] = 3.32, -- Shadow of Elune
			[15] = 0.01, -- Resounding Protection
			[499] = 2.02, -- Ricocheting Inflatable Pyrosaw
			[492] = 3.67, -- Liberator's Might
			[132] = 4.41, -- Packed Ice
			[494] = 4.92, -- Battlefield Precision
			[496] = 1.17, -- Stronger Together
			[98] = 0.04, -- Crystalline Carapace
			[14] = 0.12, -- Longstrider
			[481] = 4.05, -- Incite the Pack
			[30] = 3.15, -- Overwhelming Power
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 15593 - 18436 (avg 17397), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[4] = { 0.78, 1.36 }, -- Worldvein Resonance
			[14] = { 9.9, 3.49 }, -- Condensed Life-Force
			[5] = { 10, 2.91 }, -- Essence of the Focusing Iris
			[23] = { 3.11, 0.74 }, -- Blood of the Enemy
			[32] = { 1.95, 1.93 }, -- Conflict and Strife
			[12] = { 7.54, 3.87 }, -- The Crucible of Flame
			[15] = { 4.01, 0 }, -- Ripple in Space
			[6] = { 5.85, 2.99 }, -- Purification Protocol
			[28] = { 2.81, 1.27 }, -- The Unbound Force
			[22] = { 2.78, 0.54 }, -- Vision of Perfection
			[27] = { 2.54, 2.19 }, -- Memory of Lucid Dreams
		}, 1562749200)

		insertDefaultScalesData(offensiveName, 10, 1, { -- Brewmaster Monk
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 6578 - 10724 (avg 7536), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[195] = 2.81, -- Secrets of the Deep
			[569] = 2.86, -- Clockwork Heart
			[100] = 0.03, -- Strength in Numbers
			[89] = 0.04, -- Azerite Veins
			[87] = 0.06, -- Self Reliance
			[470] = 0.08, -- Sweep the Leg
			[526] = 3.88, -- Endless Hunger
			[44] = 0.04, -- Vampiric Speed
			[116] = 1.19, -- Boiling Brew
			[85] = 0.07, -- Gemhide
			[218] = 0.06, -- Strength of Spirit
			[43] = 0.08, -- Winds of War
			[576] = 1.83, -- Loyal to the End
			[99] = 0.04, -- Ablative Shielding
			[192] = 2.62, -- Meticulous Scheming
			[493] = 1.46, -- Last Gift
			[15] = 0.01, -- Resounding Protection
			[521] = 2.12, -- Shadow of Elune
			[478] = 6.23, -- Tidal Surge
			[14] = 0.06, -- Longstrider
			[462] = 1.85, -- Azerite Globules
			[18] = 0.99, -- Blood Siphon
			[485] = 5.49, -- Laser Matrix
			[482] = 5.32, -- Thunderous Blast
			[86] = 0.04, -- Azerite Fortification
			[38] = 1.16, -- On My Way
			[157] = 6.22, -- Rezan's Fury
			[196] = 3.41, -- Swirling Sands
			[522] = 3.84, -- Ancients' Bulwark
			[499] = 2.43, -- Ricocheting Inflatable Pyrosaw
			[384] = 3.05, -- Elusive Footwork
			[523] = 5.14, -- Apothecary's Concoctions
			[562] = 4.19, -- Treacherous Covenant
			[492] = 2.21, -- Liberator's Might
			[156] = 3.64, -- Ruinous Bolt
			[480] = 2.05, -- Blood Rite
			[98] = 0.13, -- Crystalline Carapace
			[31] = 3.09, -- Gutripper
			[82] = 3.56, -- Champion of Azeroth
			[83] = 0.06, -- Impassive Visage
			[30] = 1.86, -- Overwhelming Power
			[479] = 4.49, -- Dagger in the Back
			[577] = 0.82, -- Arcane Heart
			[104] = 0.06, -- Bracing Chill
			[193] = 3.78, -- Blightborne Infusion
			[495] = 2.64, -- Anduin's Dedication
			[541] = 1.06, -- Fight or Flight
			[103] = 0.09, -- Concentrated Mending
			[505] = 2.7, -- Tradewinds
			[502] = 0.11, -- Personal Absorb-o-Tron
			[498] = 4.1, -- Barrage Of Many Bombs
			[568] = 0.09, -- Person-Computer Interface
			[463] = 0.07, -- Blessed Portents
			[105] = 0.03, -- Ephemeral Recovery
			[497] = 0.79, -- Stand As One
			[13] = 0.08, -- Azerite Empowered
			[560] = 1.09, -- Bonded Souls
			[496] = 0.75, -- Stronger Together
			[561] = 2.39, -- Seductive Power
			[483] = 3.18, -- Archive of the Titans
			[84] = 0.06, -- Bulwark of the Masses
			[500] = 3.35, -- Synaptic Spark Capacitor
			[481] = 2.56, -- Incite the Pack
			[42] = 0.07, -- Savior
			[22] = 2.82, -- Heed My Call
			[494] = 6.42, -- Battlefield Precision
			[461] = 0.96, -- Earthlink
			[459] = 1.33, -- Unstable Flames
			[566] = 0.05, -- Exit Strategy
			[382] = 0.07, -- Straight, No Chaser
			[20] = 1.02, -- Lifespeed
			[238] = 0.09, -- Fit to Burst
			[194] = 5.23, -- Filthy Transfusion
			[383] = 1.43, -- Training of Niuzao
			[575] = 10, -- Undulating Tides
			[504] = 3.01, -- Unstable Catalyst
			[101] = 0.06, -- Shimmering Haven
			[21] = 1.25, -- Elemental Whirl
			[19] = 0.14, -- Woundbinder
			[501] = 2.86, -- Relational Normalization Gizmo
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 6467 - 7686 (avg 7238), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[7] = { 0.22, 0.09 }, -- Anima of Life and Death
			[15] = { 0.25, 0.1 }, -- Ripple in Space
			[32] = { 2.97, 2.83 }, -- Conflict and Strife
			[4] = { 2.04, 1.94 }, -- Worldvein Resonance
			[27] = { 0.17, 0.07 }, -- Memory of Lucid Dreams
			[12] = { 9.99, 10 }, -- The Crucible of Flame
			[2] = { 0.06, 0.15 }, -- Azeroth's Undying Gift
			[3] = { 5.27, 5.31 }, -- Sphere of Suppression
			[13] = { 0, 0.17 }, -- Nullification Dynamo
			[25] = { 1.39, 1.42 }, -- Aegis of the Deep
			[22] = { 0.18, 0.15 }, -- Vision of Perfection
		}, 1562749200)

		insertDefaultScalesData(defaultName, 10, 3, { -- Windwalker Monk
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 9708 - 13484 (avg 10395), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[461] = 1.57, -- Earthlink
			[44] = 0.05, -- Vampiric Speed
			[117] = 10, -- Fury of Xuen
			[526] = 6.45, -- Endless Hunger
			[388] = 8.71, -- Glory of the Dawn
			[103] = 0.01, -- Concentrated Mending
			[523] = 1.6, -- Apothecary's Concoctions
			[30] = 2.87, -- Overwhelming Power
			[495] = 4.38, -- Anduin's Dedication
			[98] = 0.12, -- Crystalline Carapace
			[505] = 4.34, -- Tradewinds
			[576] = 3.04, -- Loyal to the End
			[496] = 1.27, -- Stronger Together
			[86] = 0.05, -- Azerite Fortification
			[478] = 6.62, -- Tidal Surge
			[566] = 0.06, -- Exit Strategy
			[156] = 3.91, -- Ruinous Bolt
			[100] = 0.16, -- Strength in Numbers
			[480] = 3.66, -- Blood Rite
			[498] = 3.92, -- Barrage Of Many Bombs
			[82] = 5.52, -- Champion of Azeroth
			[390] = 6.8, -- Pressure Point
			[569] = 5.11, -- Clockwork Heart
			[481] = 4.01, -- Incite the Pack
			[575] = 9.68, -- Undulating Tides
			[194] = 4.92, -- Filthy Transfusion
			[493] = 2.43, -- Last Gift
			[22] = 2.64, -- Heed My Call
			[500] = 1.29, -- Synaptic Spark Capacitor
			[497] = 1.26, -- Stand As One
			[184] = 5.4, -- Sunrise Technique
			[560] = 1.76, -- Bonded Souls
			[482] = 5.04, -- Thunderous Blast
			[38] = 1.82, -- On My Way
			[562] = 7.18, -- Treacherous Covenant
			[31] = 2.76, -- Gutripper
			[105] = 0.02, -- Ephemeral Recovery
			[492] = 3.54, -- Liberator's Might
			[89] = 0.02, -- Azerite Veins
			[485] = 5.21, -- Laser Matrix
			[541] = 1.63, -- Fight or Flight
			[196] = 5.13, -- Swirling Sands
			[157] = 6.03, -- Rezan's Fury
			[561] = 3.84, -- Seductive Power
			[504] = 5.16, -- Unstable Catalyst
			[483] = 5.11, -- Archive of the Titans
			[501] = 5.07, -- Relational Normalization Gizmo
			[195] = 4.47, -- Secrets of the Deep
			[193] = 5.82, -- Blightborne Infusion
			[99] = 0.02, -- Ablative Shielding
			[18] = 1.64, -- Blood Siphon
			[462] = 1.7, -- Azerite Globules
			[20] = 1.64, -- Lifespeed
			[522] = 6.3, -- Ancients' Bulwark
			[192] = 4.18, -- Meticulous Scheming
			[521] = 3.68, -- Shadow of Elune
			[494] = 5.99, -- Battlefield Precision
			[21] = 1.93, -- Elemental Whirl
			[577] = 1.27, -- Arcane Heart
			[389] = 8.65, -- Open Palm Strikes
			[391] = 6.66, -- Dance of Chi-Ji
			[19] = 0.05, -- Woundbinder
			[503] = 0.01, -- Auto-Self-Cauterizer
			[87] = 0.02, -- Self Reliance
			[499] = 2.36, -- Ricocheting Inflatable Pyrosaw
			[104] = 0.06, -- Bracing Chill
			[459] = 1.96, -- Unstable Flames
			[479] = 6.44, -- Dagger in the Back
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 9821 - 10450 (avg 10111), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[6] = { 7.68, 7.75 }, -- Purification Protocol
			[23] = { 1.61, 1.73 }, -- Blood of the Enemy
			[4] = { 3.38, 3.19 }, -- Worldvein Resonance
			[27] = { 0, 0.02 }, -- Memory of Lucid Dreams
			[32] = { 4.74, 4.6 }, -- Conflict and Strife
			[28] = { 3.26, 3.29 }, -- The Unbound Force
			[14] = { 8.98, 8.91 }, -- Condensed Life-Force
			[12] = { 10, 9.91 }, -- The Crucible of Flame
			[5] = { 7.26, 7.17 }, -- Essence of the Focusing Iris
		}, 1562749200)

		insertDefaultScalesData(offensiveName, 2, 2, { -- Protection Paladin
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 11718 - 14993 (avg 12438), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[521] = 3.1, -- Shadow of Elune
			[485] = 5.5, -- Laser Matrix
			[500] = 3.25, -- Synaptic Spark Capacitor
			[561] = 3.11, -- Seductive Power
			[502] = 0.06, -- Personal Absorb-o-Tron
			[89] = 0.03, -- Azerite Veins
			[499] = 2.32, -- Ricocheting Inflatable Pyrosaw
			[196] = 4.7, -- Swirling Sands
			[234] = 1.64, -- Inner Light
			[526] = 4.93, -- Endless Hunger
			[481] = 2.85, -- Incite the Pack
			[493] = 1.73, -- Last Gift
			[82] = 4.63, -- Champion of Azeroth
			[496] = 0.96, -- Stronger Together
			[480] = 3.14, -- Blood Rite
			[21] = 1.58, -- Elemental Whirl
			[522] = 4.92, -- Ancients' Bulwark
			[100] = 0.03, -- Strength in Numbers
			[576] = 2.01, -- Loyal to the End
			[43] = 0.09, -- Winds of War
			[560] = 1.61, -- Bonded Souls
			[483] = 3.95, -- Archive of the Titans
			[523] = 5.06, -- Apothecary's Concoctions
			[157] = 6.19, -- Rezan's Fury
			[87] = 0.02, -- Self Reliance
			[86] = 0.02, -- Azerite Fortification
			[569] = 3.47, -- Clockwork Heart
			[492] = 3.19, -- Liberator's Might
			[577] = 1.59, -- Arcane Heart
			[503] = 0.01, -- Auto-Self-Cauterizer
			[195] = 3.46, -- Secrets of the Deep
			[504] = 3.91, -- Unstable Catalyst
			[538] = 0.1, -- Empyreal Ward
			[505] = 2.95, -- Tradewinds
			[479] = 4.46, -- Dagger in the Back
			[495] = 3.46, -- Anduin's Dedication
			[20] = 1.79, -- Lifespeed
			[562] = 5.38, -- Treacherous Covenant
			[150] = 1.19, -- Soaring Shield
			[206] = 0.03, -- Stalwart Protector
			[14] = 0.01, -- Longstrider
			[31] = 3.11, -- Gutripper
			[393] = 0.05, -- Grace of the Justicar
			[84] = 0.08, -- Bulwark of the Masses
			[99] = 0.03, -- Ablative Shielding
			[30] = 2.97, -- Overwhelming Power
			[38] = 1.35, -- On My Way
			[156] = 3.49, -- Ruinous Bolt
			[501] = 4.09, -- Relational Normalization Gizmo
			[193] = 5.23, -- Blightborne Infusion
			[482] = 5.2, -- Thunderous Blast
			[575] = 10, -- Undulating Tides
			[395] = 7.36, -- Inspiring Vanguard
			[541] = 1.24, -- Fight or Flight
			[22] = 2.78, -- Heed My Call
			[471] = 0.02, -- Gallant Steed
			[192] = 3.93, -- Meticulous Scheming
			[461] = 1.24, -- Earthlink
			[194] = 5.22, -- Filthy Transfusion
			[18] = 1.19, -- Blood Siphon
			[235] = 3.01, -- Indomitable Justice
			[125] = 2.57, -- Avenger's Might
			[568] = 0.08, -- Person-Computer Interface
			[494] = 6.35, -- Battlefield Precision
			[478] = 5.89, -- Tidal Surge
			[462] = 1.84, -- Azerite Globules
			[497] = 0.92, -- Stand As One
			[189] = 0.05, -- Righteous Conviction
			[459] = 1.96, -- Unstable Flames
			[463] = 0.01, -- Blessed Portents
			[498] = 4.07, -- Barrage Of Many Bombs
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 11451 - 12529 (avg 12137), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[12] = { 10, 9.93 }, -- The Crucible of Flame
			[27] = { 0.07, 0.06 }, -- Memory of Lucid Dreams
			[3] = { 8.67, 8.74 }, -- Sphere of Suppression
			[22] = { 0.71, 0.61 }, -- Vision of Perfection
			[25] = { 1.65, 1.79 }, -- Aegis of the Deep
			[2] = { 0.09, 0 }, -- Azeroth's Undying Gift
			[13] = { 0.18, 0.21 }, -- Nullification Dynamo
			[4] = { 2.42, 2.63 }, -- Worldvein Resonance
			[15] = { 0.15, 0 }, -- Ripple in Space
			[32] = { 3.6, 3.53 }, -- Conflict and Strife
			[7] = { 0.01, 0 }, -- Anima of Life and Death
		}, 1562749200)

		insertDefaultScalesData(defaultName, 2, 3, { -- Retribution Paladin
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 11356 - 14009 (avg 11944), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[193] = 6.61, -- Blightborne Infusion
			[496] = 1.41, -- Stronger Together
			[480] = 4.38, -- Blood Rite
			[461] = 1.73, -- Earthlink
			[38] = 1.91, -- On My Way
			[20] = 1.94, -- Lifespeed
			[396] = 9.81, -- Light's Decree
			[481] = 4.56, -- Incite the Pack
			[493] = 2.61, -- Last Gift
			[196] = 5.83, -- Swirling Sands
			[501] = 5.86, -- Relational Normalization Gizmo
			[22] = 2.74, -- Heed My Call
			[561] = 4.81, -- Seductive Power
			[541] = 1.63, -- Fight or Flight
			[577] = 2.53, -- Arcane Heart
			[575] = 10, -- Undulating Tides
			[18] = 1.83, -- Blood Siphon
			[30] = 4.3, -- Overwhelming Power
			[459] = 2.25, -- Unstable Flames
			[500] = 3.08, -- Synaptic Spark Capacitor
			[192] = 5.75, -- Meticulous Scheming
			[479] = 6.61, -- Dagger in the Back
			[21] = 2.22, -- Elemental Whirl
			[453] = 7.48, -- Empyrean Power
			[85] = 0.01, -- Gemhide
			[156] = 3.47, -- Ruinous Bolt
			[522] = 7.05, -- Ancients' Bulwark
			[103] = 0.05, -- Concentrated Mending
			[485] = 5.45, -- Laser Matrix
			[194] = 5.64, -- Filthy Transfusion
			[478] = 5.86, -- Tidal Surge
			[562] = 8.09, -- Treacherous Covenant
			[195] = 5.19, -- Secrets of the Deep
			[157] = 6.31, -- Rezan's Fury
			[125] = 5.74, -- Avenger's Might
			[482] = 5.29, -- Thunderous Blast
			[569] = 5.53, -- Clockwork Heart
			[502] = 0.02, -- Personal Absorb-o-Tron
			[560] = 2.35, -- Bonded Souls
			[576] = 3.32, -- Loyal to the End
			[521] = 4.43, -- Shadow of Elune
			[505] = 4.94, -- Tradewinds
			[42] = 0.02, -- Savior
			[568] = 0.04, -- Person-Computer Interface
			[82] = 6.44, -- Champion of Azeroth
			[187] = 6.31, -- Expurgation
			[154] = 6.87, -- Relentless Inquisitor
			[497] = 1.38, -- Stand As One
			[31] = 2.82, -- Gutripper
			[498] = 3.96, -- Barrage Of Many Bombs
			[499] = 2.29, -- Ricocheting Inflatable Pyrosaw
			[523] = 5.08, -- Apothecary's Concoctions
			[504] = 5.63, -- Unstable Catalyst
			[494] = 6.1, -- Battlefield Precision
			[483] = 5.68, -- Archive of the Titans
			[235] = 5.14, -- Indomitable Justice
			[495] = 4.96, -- Anduin's Dedication
			[526] = 7.05, -- Endless Hunger
			[462] = 1.84, -- Azerite Globules
			[492] = 4.14, -- Liberator's Might
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 10037 - 13731 (avg 11830), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[5] = { 10, 2.83 }, -- Essence of the Focusing Iris
			[4] = { 1.33, 1.08 }, -- Worldvein Resonance
			[27] = { 5.82, 3.07 }, -- Memory of Lucid Dreams
			[23] = { 3.11, 0.4 }, -- Blood of the Enemy
			[22] = { 7.16, 2.7 }, -- Vision of Perfection
			[12] = { 7.33, 3.11 }, -- The Crucible of Flame
			[32] = { 1.62, 1.62 }, -- Conflict and Strife
			[6] = { 5.82, 2.52 }, -- Purification Protocol
			[14] = { 8.56, 2.98 }, -- Condensed Life-Force
			[28] = { 2.62, 1.18 }, -- The Unbound Force
		}, 1562749200)

		insertDefaultScalesData(defaultName, 4, 1, { -- Assassination Rogue
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 9526 - 16999 (avg 13783), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[577] = 3.58, -- Arcane Heart
			[521] = 4.78, -- Shadow of Elune
			[459] = 2.7, -- Unstable Flames
			[493] = 2.96, -- Last Gift
			[497] = 1.3, -- Stand As One
			[526] = 7.24, -- Endless Hunger
			[504] = 5.83, -- Unstable Catalyst
			[196] = 6.84, -- Swirling Sands
			[87] = 0.06, -- Self Reliance
			[192] = 4.64, -- Meticulous Scheming
			[561] = 4.14, -- Seductive Power
			[569] = 6.27, -- Clockwork Heart
			[495] = 4.88, -- Anduin's Dedication
			[21] = 2.47, -- Elemental Whirl
			[38] = 2.12, -- On My Way
			[18] = 2.05, -- Blood Siphon
			[99] = 0.03, -- Ablative Shielding
			[136] = 8.07, -- Double Dose
			[541] = 1.8, -- Fight or Flight
			[499] = 2.2, -- Ricocheting Inflatable Pyrosaw
			[461] = 1.75, -- Earthlink
			[481] = 5.01, -- Incite the Pack
			[195] = 5.08, -- Secrets of the Deep
			[483] = 5.38, -- Archive of the Titans
			[89] = 0.01, -- Azerite Veins
			[480] = 4.7, -- Blood Rite
			[104] = 0.05, -- Bracing Chill
			[194] = 4.83, -- Filthy Transfusion
			[575] = 9.28, -- Undulating Tides
			[560] = 2.31, -- Bonded Souls
			[249] = 10, -- Nothing Personal
			[523] = 4.66, -- Apothecary's Concoctions
			[84] = 0.01, -- Bulwark of the Masses
			[82] = 7.32, -- Champion of Azeroth
			[479] = 5.91, -- Dagger in the Back
			[31] = 2.69, -- Gutripper
			[568] = 0.05, -- Person-Computer Interface
			[562] = 8.01, -- Treacherous Covenant
			[30] = 4.6, -- Overwhelming Power
			[505] = 5.61, -- Tradewinds
			[473] = 0.01, -- Shrouded Mantle
			[498] = 3.8, -- Barrage Of Many Bombs
			[408] = 4.5, -- Shrouded Suffocation
			[494] = 6.04, -- Battlefield Precision
			[157] = 5.75, -- Rezan's Fury
			[576] = 3.78, -- Loyal to the End
			[406] = 3.52, -- Scent of Blood
			[492] = 4.65, -- Liberator's Might
			[156] = 3.27, -- Ruinous Bolt
			[22] = 2.5, -- Heed My Call
			[482] = 4.85, -- Thunderous Blast
			[496] = 1.66, -- Stronger Together
			[20] = 2.28, -- Lifespeed
			[485] = 5.15, -- Laser Matrix
			[181] = 6.08, -- Twist the Knife
			[500] = 2.94, -- Synaptic Spark Capacitor
			[103] = 0.19, -- Concentrated Mending
			[478] = 5.53, -- Tidal Surge
			[501] = 5.9, -- Relational Normalization Gizmo
			[522] = 7.24, -- Ancients' Bulwark
			[193] = 7.76, -- Blightborne Infusion
			[462] = 1.75, -- Azerite Globules
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 9466 - 15774 (avg 13261), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[22] = { 3.15, 0 }, -- Vision of Perfection
			[23] = { 6.29, 1.17 }, -- Blood of the Enemy
			[28] = { 2.98, 1.77 }, -- The Unbound Force
			[15] = { 3.62, 0.01 }, -- Ripple in Space
			[32] = { 1.79, 1.72 }, -- Conflict and Strife
			[5] = { 9.51, 3.03 }, -- Essence of the Focusing Iris
			[6] = { 4.83, 2.06 }, -- Purification Protocol
			[4] = { 1.42, 0.95 }, -- Worldvein Resonance
			[12] = { 6.69, 2.57 }, -- The Crucible of Flame
			[14] = { 6.79, 2.5 }, -- Condensed Life-Force
			[27] = { 10, 4.07 }, -- Memory of Lucid Dreams
		}, 1562749200)

		insertDefaultScalesData(defaultName, 4, 2, { -- Outlaw Rogue
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 40186 - 59234 (avg 45475), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[485] = 5.52, -- Laser Matrix
			[38] = 1.45, -- On My Way
			[459] = 1.65, -- Unstable Flames
			[196] = 4.18, -- Swirling Sands
			[129] = 5.79, -- Deadshot
			[577] = 1.71, -- Arcane Heart
			[180] = 4.04, -- Keep Your Wits About You
			[495] = 4.1, -- Anduin's Dedication
			[411] = 7.18, -- Ace Up Your Sleeve
			[195] = 4.19, -- Secrets of the Deep
			[480] = 3.58, -- Blood Rite
			[103] = 0.05, -- Concentrated Mending
			[561] = 3.68, -- Seductive Power
			[576] = 2.36, -- Loyal to the End
			[82] = 5.22, -- Champion of Azeroth
			[239] = 3.86, -- Snake Eyes
			[521] = 3.67, -- Shadow of Elune
			[501] = 4.62, -- Relational Normalization Gizmo
			[493] = 1.97, -- Last Gift
			[194] = 4.55, -- Filthy Transfusion
			[568] = 0.06, -- Person-Computer Interface
			[526] = 5.35, -- Endless Hunger
			[560] = 1.81, -- Bonded Souls
			[22] = 2.73, -- Heed My Call
			[482] = 5.06, -- Thunderous Blast
			[505] = 3.66, -- Tradewinds
			[523] = 5.21, -- Apothecary's Concoctions
			[446] = 6, -- Brigand's Blitz
			[494] = 6.2, -- Battlefield Precision
			[478] = 5.99, -- Tidal Surge
			[18] = 1.31, -- Blood Siphon
			[562] = 6.5, -- Treacherous Covenant
			[575] = 10, -- Undulating Tides
			[522] = 5.33, -- Ancients' Bulwark
			[192] = 4.25, -- Meticulous Scheming
			[541] = 1.52, -- Fight or Flight
			[410] = 3.56, -- Paradise Lost
			[99] = 0.01, -- Ablative Shielding
			[498] = 3.98, -- Barrage Of Many Bombs
			[479] = 6.65, -- Dagger in the Back
			[483] = 4.73, -- Archive of the Titans
			[193] = 4.68, -- Blightborne Infusion
			[462] = 1.73, -- Azerite Globules
			[569] = 3.87, -- Clockwork Heart
			[504] = 4.61, -- Unstable Catalyst
			[481] = 3.36, -- Incite the Pack
			[21] = 1.7, -- Elemental Whirl
			[31] = 2.99, -- Gutripper
			[496] = 1.12, -- Stronger Together
			[30] = 3.44, -- Overwhelming Power
			[497] = 1.09, -- Stand As One
			[492] = 3.14, -- Liberator's Might
			[43] = 0.01, -- Winds of War
			[86] = 0.01, -- Azerite Fortification
			[156] = 3.57, -- Ruinous Bolt
			[499] = 2.36, -- Ricocheting Inflatable Pyrosaw
			[461] = 1.55, -- Earthlink
			[20] = 1.73, -- Lifespeed
			[500] = 3.27, -- Synaptic Spark Capacitor
			[157] = 6.34, -- Rezan's Fury
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 37221 - 45933 (avg 43255), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[32] = { 1.76, 1.78 }, -- Conflict and Strife
			[5] = { 10, 2.77 }, -- Essence of the Focusing Iris
			[14] = { 9.13, 3.28 }, -- Condensed Life-Force
			[28] = { 2.55, 0.58 }, -- The Unbound Force
			[23] = { 3.22, 0.61 }, -- Blood of the Enemy
			[4] = { 0.97, 1.09 }, -- Worldvein Resonance
			[12] = { 9.05, 3.54 }, -- The Crucible of Flame
			[15] = { 3.75, 0 }, -- Ripple in Space
			[6] = { 6.34, 2.82 }, -- Purification Protocol
			[27] = { 7.52, 5.46 }, -- Memory of Lucid Dreams
			[22] = { 5.46, 2.53 }, -- Vision of Perfection
		}, 1562749200)

		insertDefaultScalesData(defaultName, 4, 3, { -- Subtlety Rogue
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 16293 - 22809 (avg 20929), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = 0.07, -- Resounding Protection
			[479] = 3.58, -- Dagger in the Back
			[501] = 3.06, -- Relational Normalization Gizmo
			[463] = 0.01, -- Blessed Portents
			[192] = 2.29, -- Meticulous Scheming
			[193] = 3.3, -- Blightborne Infusion
			[459] = 1.24, -- Unstable Flames
			[496] = 0.74, -- Stronger Together
			[504] = 2.97, -- Unstable Catalyst
			[195] = 2.6, -- Secrets of the Deep
			[86] = 0.01, -- Azerite Fortification
			[523] = 2.68, -- Apothecary's Concoctions
			[414] = 4.17, -- Inevitability
			[83] = 0.06, -- Impassive Visage
			[85] = 0.02, -- Gemhide
			[175] = 3.79, -- Night's Vengeance
			[493] = 1.34, -- Last Gift
			[576] = 1.55, -- Loyal to the End
			[30] = 2.24, -- Overwhelming Power
			[480] = 2.46, -- Blood Rite
			[240] = 4.18, -- Blade In The Shadows
			[503] = 0.02, -- Auto-Self-Cauterizer
			[575] = 5.14, -- Undulating Tides
			[103] = 0.04, -- Concentrated Mending
			[461] = 1.2, -- Earthlink
			[505] = 2.3, -- Tradewinds
			[82] = 3.31, -- Champion of Azeroth
			[462] = 0.88, -- Azerite Globules
			[445] = 1.25, -- Perforate
			[561] = 2.1, -- Seductive Power
			[577] = 1.31, -- Arcane Heart
			[156] = 2.15, -- Ruinous Bolt
			[20] = 1.09, -- Lifespeed
			[478] = 3.52, -- Tidal Surge
			[499] = 1.25, -- Ricocheting Inflatable Pyrosaw
			[569] = 3.48, -- Clockwork Heart
			[495] = 2.51, -- Anduin's Dedication
			[14] = 0.01, -- Longstrider
			[18] = 0.88, -- Blood Siphon
			[13] = 0.03, -- Azerite Empowered
			[31] = 1.53, -- Gutripper
			[124] = 1.53, -- Replicating Shadows
			[19] = 0.04, -- Woundbinder
			[481] = 2.12, -- Incite the Pack
			[526] = 3.5, -- Endless Hunger
			[413] = 10, -- The First Dance
			[483] = 2.96, -- Archive of the Titans
			[84] = 0.01, -- Bulwark of the Masses
			[194] = 2.62, -- Filthy Transfusion
			[196] = 2.98, -- Swirling Sands
			[89] = 0.01, -- Azerite Veins
			[98] = 0.04, -- Crystalline Carapace
			[38] = 0.96, -- On My Way
			[522] = 3.48, -- Ancients' Bulwark
			[22] = 1.34, -- Heed My Call
			[500] = 1.99, -- Synaptic Spark Capacitor
			[541] = 0.93, -- Fight or Flight
			[21] = 1.14, -- Elemental Whirl
			[157] = 3.4, -- Rezan's Fury
			[521] = 2.52, -- Shadow of Elune
			[44] = 0.03, -- Vampiric Speed
			[497] = 0.68, -- Stand As One
			[560] = 1.16, -- Bonded Souls
			[492] = 2.15, -- Liberator's Might
			[562] = 3.97, -- Treacherous Covenant
			[485] = 2.81, -- Laser Matrix
			[482] = 2.75, -- Thunderous Blast
			[498] = 2.05, -- Barrage Of Many Bombs
			[494] = 3.31, -- Battlefield Precision
			[100] = 0.02, -- Strength in Numbers
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 14725 - 22431 (avg 19878), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[32] = { 1.92, 1.91 }, -- Conflict and Strife
			[5] = { 9.06, 3.42 }, -- Essence of the Focusing Iris
			[4] = { 1.18, 1.15 }, -- Worldvein Resonance
			[12] = { 8.16, 3.06 }, -- The Crucible of Flame
			[6] = { 5.27, 2.3 }, -- Purification Protocol
			[15] = { 4.07, 0 }, -- Ripple in Space
			[27] = { 10, 6.51 }, -- Memory of Lucid Dreams
			[14] = { 6.98, 2.73 }, -- Condensed Life-Force
			[28] = { 2.34, 1.03 }, -- The Unbound Force
			[23] = { 4, 0.52 }, -- Blood of the Enemy
			[22] = { 3.8, 1.15 }, -- Vision of Perfection
		}, 1562749200)

		insertDefaultScalesData(defaultName, 7, 1, { -- Elemental Shaman
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 15485 - 18559 (avg 16357), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[562] = 5.84, -- Treacherous Covenant
			[18] = 0.77, -- Blood Siphon
			[494] = 3.79, -- Battlefield Precision
			[157] = 4.06, -- Rezan's Fury
			[505] = 2.07, -- Tradewinds
			[497] = 0.98, -- Stand As One
			[101] = 0.01, -- Shimmering Haven
			[457] = 10, -- Igneous Potential
			[541] = 1.26, -- Fight or Flight
			[38] = 1.24, -- On My Way
			[192] = 3.09, -- Meticulous Scheming
			[22] = 1.78, -- Heed My Call
			[521] = 2.45, -- Shadow of Elune
			[461] = 1.25, -- Earthlink
			[483] = 4.13, -- Archive of the Titans
			[569] = 3.3, -- Clockwork Heart
			[20] = 1.09, -- Lifespeed
			[84] = 0.07, -- Bulwark of the Masses
			[577] = 1.29, -- Arcane Heart
			[480] = 2.5, -- Blood Rite
			[105] = 0.03, -- Ephemeral Recovery
			[498] = 2.57, -- Barrage Of Many Bombs
			[194] = 3.63, -- Filthy Transfusion
			[196] = 4.22, -- Swirling Sands
			[500] = 2.27, -- Synaptic Spark Capacitor
			[207] = 0.06, -- Serene Spirit
			[100] = 0.03, -- Strength in Numbers
			[481] = 1.96, -- Incite the Pack
			[522] = 4.51, -- Ancients' Bulwark
			[576] = 1.49, -- Loyal to the End
			[195] = 3.74, -- Secrets of the Deep
			[561] = 3.16, -- Seductive Power
			[14] = 0.01, -- Longstrider
			[493] = 1.01, -- Last Gift
			[492] = 2.74, -- Liberator's Might
			[478] = 4.22, -- Tidal Surge
			[485] = 3.63, -- Laser Matrix
			[462] = 1.13, -- Azerite Globules
			[503] = 0.04, -- Auto-Self-Cauterizer
			[502] = 0.07, -- Personal Absorb-o-Tron
			[479] = 4.25, -- Dagger in the Back
			[504] = 4.18, -- Unstable Catalyst
			[104] = 0.03, -- Bracing Chill
			[103] = 0.05, -- Concentrated Mending
			[416] = 4.86, -- Natural Harmony
			[30] = 2.21, -- Overwhelming Power
			[495] = 3.62, -- Anduin's Dedication
			[496] = 0.83, -- Stronger Together
			[99] = 0.03, -- Ablative Shielding
			[501] = 3.64, -- Relational Normalization Gizmo
			[156] = 2.51, -- Ruinous Bolt
			[222] = 2.69, -- Echo of the Elementals
			[499] = 1.61, -- Ricocheting Inflatable Pyrosaw
			[448] = 3.35, -- Synapse Shock
			[178] = 3.65, -- Lava Shock
			[447] = 3.34, -- Ancestral Resonance
			[575] = 6.53, -- Undulating Tides
			[459] = 1.72, -- Unstable Flames
			[482] = 3.53, -- Thunderous Blast
			[526] = 4.42, -- Endless Hunger
			[82] = 3.76, -- Champion of Azeroth
			[523] = 3.37, -- Apothecary's Concoctions
			[21] = 1.35, -- Elemental Whirl
			[193] = 4.84, -- Blightborne Infusion
			[560] = 1.19, -- Bonded Souls
			[87] = 0.02, -- Self Reliance
			[31] = 1.89, -- Gutripper
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 13774 - 17416 (avg 16134), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[27] = { 1.4, 1.09 }, -- Memory of Lucid Dreams
			[28] = { 2.4, 1.73 }, -- The Unbound Force
			[4] = { 0.88, 1.38 }, -- Worldvein Resonance
			[15] = { 3.97, 0 }, -- Ripple in Space
			[14] = { 8.43, 3.29 }, -- Condensed Life-Force
			[12] = { 7.55, 3.62 }, -- The Crucible of Flame
			[5] = { 10, 2.5 }, -- Essence of the Focusing Iris
			[6] = { 5.73, 2.83 }, -- Purification Protocol
			[23] = { 4.25, 0.45 }, -- Blood of the Enemy
			[32] = { 9.54, 1.71 }, -- Conflict and Strife
			[22] = { 3.5, 0.97 }, -- Vision of Perfection
		}, 1562749200)

		insertDefaultScalesData(defaultName, 7, 2, { -- Enhancement Shaman
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 14784 - 19489 (avg 17078), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[44] = 0.04, -- Vampiric Speed
			[447] = 6.06, -- Ancestral Resonance
			[530] = 4.23, -- Thunderaan's Fury
			[416] = 6.62, -- Natural Harmony
			[522] = 5.28, -- Ancients' Bulwark
			[576] = 2.66, -- Loyal to the End
			[505] = 3.77, -- Tradewinds
			[156] = 2.7, -- Ruinous Bolt
			[526] = 5.23, -- Endless Hunger
			[523] = 3.74, -- Apothecary's Concoctions
			[31] = 2.2, -- Gutripper
			[479] = 4.87, -- Dagger in the Back
			[483] = 4.84, -- Archive of the Titans
			[521] = 3.32, -- Shadow of Elune
			[20] = 1.41, -- Lifespeed
			[562] = 6.62, -- Treacherous Covenant
			[495] = 4.12, -- Anduin's Dedication
			[196] = 4.71, -- Swirling Sands
			[481] = 3.58, -- Incite the Pack
			[541] = 1.52, -- Fight or Flight
			[500] = 2.44, -- Synaptic Spark Capacitor
			[577] = 1.31, -- Arcane Heart
			[21] = 1.68, -- Elemental Whirl
			[480] = 3.28, -- Blood Rite
			[82] = 4.96, -- Champion of Azeroth
			[22] = 2.04, -- Heed My Call
			[461] = 1.45, -- Earthlink
			[569] = 3.97, -- Clockwork Heart
			[43] = 0.01, -- Winds of War
			[192] = 4.05, -- Meticulous Scheming
			[157] = 4.62, -- Rezan's Fury
			[38] = 1.43, -- On My Way
			[194] = 4.11, -- Filthy Transfusion
			[195] = 4.26, -- Secrets of the Deep
			[493] = 2.07, -- Last Gift
			[498] = 3.06, -- Barrage Of Many Bombs
			[560] = 1.57, -- Bonded Souls
			[459] = 1.89, -- Unstable Flames
			[137] = 7.31, -- Primal Primer
			[193] = 5.3, -- Blightborne Infusion
			[485] = 4.09, -- Laser Matrix
			[84] = 0.04, -- Bulwark of the Masses
			[30] = 3.02, -- Overwhelming Power
			[496] = 1.1, -- Stronger Together
			[179] = 4.54, -- Strength of Earth
			[494] = 4.52, -- Battlefield Precision
			[18] = 1.49, -- Blood Siphon
			[420] = 10, -- Roiling Storm
			[482] = 3.98, -- Thunderous Blast
			[103] = 0.01, -- Concentrated Mending
			[85] = 0.01, -- Gemhide
			[501] = 4.42, -- Relational Normalization Gizmo
			[499] = 1.82, -- Ricocheting Inflatable Pyrosaw
			[504] = 4.78, -- Unstable Catalyst
			[497] = 1.19, -- Stand As One
			[561] = 3.67, -- Seductive Power
			[462] = 1.36, -- Azerite Globules
			[575] = 7.56, -- Undulating Tides
			[223] = 2.77, -- Lightning Conduit
			[478] = 4.6, -- Tidal Surge
			[492] = 3.19, -- Liberator's Might
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 14046 - 18410 (avg 16568), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[6] = { 5.91, 2.79 }, -- Purification Protocol
			[23] = { 5.49, 1.27 }, -- Blood of the Enemy
			[4] = { 1.45, 1.35 }, -- Worldvein Resonance
			[22] = { 4.57, 1.6 }, -- Vision of Perfection
			[5] = { 10, 2.82 }, -- Essence of the Focusing Iris
			[27] = { 0.67, 0.81 }, -- Memory of Lucid Dreams
			[28] = { 3.09, 1.55 }, -- The Unbound Force
			[32] = { 1.77, 1.77 }, -- Conflict and Strife
			[14] = { 8.87, 3.23 }, -- Condensed Life-Force
			[12] = { 7.57, 3.41 }, -- The Crucible of Flame
		}, 1562749200)

		insertDefaultScalesData(offensiveName, 7, 3, { -- Restoration Shaman
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 5583 - 7612 (avg 6121), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[18] = 0.09, -- Blood Siphon
			[416] = 2.44, -- Natural Harmony
			[503] = 0.05, -- Auto-Self-Cauterizer
			[448] = 2.56, -- Synapse Shock
			[569] = 1.65, -- Clockwork Heart
			[224] = 0.07, -- Swelling Stream
			[480] = 1.95, -- Blood Rite
			[103] = 0.07, -- Concentrated Mending
			[483] = 2.76, -- Archive of the Titans
			[575] = 5.92, -- Undulating Tides
			[156] = 2.3, -- Ruinous Bolt
			[500] = 2.14, -- Synaptic Spark Capacitor
			[42] = 0.04, -- Savior
			[462] = 1.09, -- Azerite Globules
			[495] = 2.36, -- Anduin's Dedication
			[105] = 0.03, -- Ephemeral Recovery
			[89] = 0.05, -- Azerite Veins
			[498] = 2.42, -- Barrage Of Many Bombs
			[191] = 0.04, -- Turn of the Tide
			[98] = 0.01, -- Crystalline Carapace
			[560] = 1.01, -- Bonded Souls
			[85] = 0.06, -- Gemhide
			[84] = 0.02, -- Bulwark of the Masses
			[478] = 3.81, -- Tidal Surge
			[499] = 1.53, -- Ricocheting Inflatable Pyrosaw
			[38] = 0.86, -- On My Way
			[561] = 2.09, -- Seductive Power
			[100] = 0.05, -- Strength in Numbers
			[459] = 0.85, -- Unstable Flames
			[83] = 0.03, -- Impassive Visage
			[482] = 3.25, -- Thunderous Blast
			[157] = 3.82, -- Rezan's Fury
			[523] = 3.14, -- Apothecary's Concoctions
			[576] = 0.02, -- Loyal to the End
			[82] = 2, -- Champion of Azeroth
			[22] = 1.66, -- Heed My Call
			[497] = 0.72, -- Stand As One
			[196] = 2.05, -- Swirling Sands
			[521] = 1.97, -- Shadow of Elune
			[14] = 0.06, -- Longstrider
			[526] = 3, -- Endless Hunger
			[501] = 2.64, -- Relational Normalization Gizmo
			[31] = 1.82, -- Gutripper
			[502] = 0.03, -- Personal Absorb-o-Tron
			[30] = 1.73, -- Overwhelming Power
			[479] = 4, -- Dagger in the Back
			[457] = 10, -- Igneous Potential
			[422] = 0.04, -- Surging Tides
			[193] = 2.29, -- Blightborne Infusion
			[194] = 3.56, -- Filthy Transfusion
			[138] = 0.02, -- Soothing Waters
			[19] = 0.04, -- Woundbinder
			[461] = 0.83, -- Earthlink
			[15] = 0.06, -- Resounding Protection
			[207] = 0.04, -- Serene Spirit
			[102] = 0.05, -- Synergistic Growth
			[87] = 0.03, -- Self Reliance
			[13] = 0.01, -- Azerite Empowered
			[423] = 0.05, -- Spouting Spirits
			[43] = 0.08, -- Winds of War
			[562] = 3.81, -- Treacherous Covenant
			[99] = 0.07, -- Ablative Shielding
			[21] = 0.75, -- Elemental Whirl
			[504] = 2.75, -- Unstable Catalyst
			[485] = 3.31, -- Laser Matrix
			[577] = 0.66, -- Arcane Heart
			[541] = 0.87, -- Fight or Flight
			[505] = 0.09, -- Tradewinds
			[493] = 0.04, -- Last Gift
			[522] = 2.98, -- Ancients' Bulwark
			[192] = 1.17, -- Meticulous Scheming
			[195] = 2.43, -- Secrets of the Deep
			[101] = 0.07, -- Shimmering Haven
			[104] = 0.1, -- Bracing Chill
			[492] = 1.56, -- Liberator's Might
			[449] = 0.03, -- Overflowing Shores
			[447] = 0.85, -- Ancestral Resonance
			[20] = 0.9, -- Lifespeed
			[494] = 3.4, -- Battlefield Precision
			[86] = 0.03, -- Azerite Fortification
			[496] = 0.45, -- Stronger Together
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 5692 - 6660 (avg 6061), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[14] = { 3.72, 3.65 }, -- Condensed Life-Force
			[28] = { 0.94, 0.98 }, -- The Unbound Force
			[6] = { 3.14, 3.13 }, -- Purification Protocol
			[5] = { 2.3, 2.38 }, -- Essence of the Focusing Iris
			[23] = { 0.32, 0.35 }, -- Blood of the Enemy
			[12] = { 10, 5 }, -- The Crucible of Flame
			[15] = { 3.59, 0.05 }, -- Ripple in Space
			[22] = { 0, 0.03 }, -- Vision of Perfection
			[4] = { 0.44, 1.21 }, -- Worldvein Resonance
			[27] = { 0.05, 0.01 }, -- Memory of Lucid Dreams
			[32] = { 1.48, 1.56 }, -- Conflict and Strife
		}, 1562749200)

		insertDefaultScalesData(defaultName, 9, 1, { -- Affliction Warlock
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 16647 - 21006 (avg 17930), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[38] = 1.99, -- On My Way
			[501] = 5.34, -- Relational Normalization Gizmo
			[157] = 6.32, -- Rezan's Fury
			[462] = 1.95, -- Azerite Globules
			[495] = 4.37, -- Anduin's Dedication
			[194] = 5.53, -- Filthy Transfusion
			[505] = 5.77, -- Tradewinds
			[15] = 0.08, -- Resounding Protection
			[503] = 0.07, -- Auto-Self-Cauterizer
			[44] = 0.05, -- Vampiric Speed
			[492] = 4.2, -- Liberator's Might
			[84] = 0.05, -- Bulwark of the Masses
			[196] = 5.92, -- Swirling Sands
			[183] = 6.2, -- Inevitable Demise
			[461] = 1.68, -- Earthlink
			[156] = 3.71, -- Ruinous Bolt
			[482] = 5.45, -- Thunderous Blast
			[531] = 0.02, -- Terror of the Mind
			[104] = 0.13, -- Bracing Chill
			[463] = 0.12, -- Blessed Portents
			[99] = 0.06, -- Ablative Shielding
			[500] = 3.32, -- Synaptic Spark Capacitor
			[478] = 5.89, -- Tidal Surge
			[480] = 4.36, -- Blood Rite
			[569] = 3.86, -- Clockwork Heart
			[14] = 0.07, -- Longstrider
			[526] = 6.75, -- Endless Hunger
			[20] = 2.12, -- Lifespeed
			[481] = 5.34, -- Incite the Pack
			[504] = 5.05, -- Unstable Catalyst
			[577] = 2.82, -- Arcane Heart
			[89] = 0.09, -- Azerite Veins
			[43] = 0.06, -- Winds of War
			[30] = 4.1, -- Overwhelming Power
			[13] = 0.11, -- Azerite Empowered
			[494] = 6.52, -- Battlefield Precision
			[562] = 6.86, -- Treacherous Covenant
			[522] = 6.69, -- Ancients' Bulwark
			[560] = 2.41, -- Bonded Souls
			[18] = 2.33, -- Blood Siphon
			[426] = 4.96, -- Dreadful Calling
			[459] = 2.48, -- Unstable Flames
			[576] = 3.97, -- Loyal to the End
			[105] = 0.02, -- Ephemeral Recovery
			[208] = 0.06, -- Lifeblood
			[123] = 6.37, -- Wracking Brilliance
			[195] = 4.49, -- Secrets of the Deep
			[193] = 6.56, -- Blightborne Infusion
			[502] = 0.1, -- Personal Absorb-o-Tron
			[230] = 6.17, -- Cascading Calamity
			[561] = 3.91, -- Seductive Power
			[493] = 3.07, -- Last Gift
			[425] = 5.05, -- Sudden Onset
			[485] = 5.55, -- Laser Matrix
			[483] = 4.89, -- Archive of the Titans
			[568] = 0.07, -- Person-Computer Interface
			[101] = 0.19, -- Shimmering Haven
			[575] = 10, -- Undulating Tides
			[523] = 5.07, -- Apothecary's Concoctions
			[496] = 1.5, -- Stronger Together
			[21] = 2.33, -- Elemental Whirl
			[499] = 2.46, -- Ricocheting Inflatable Pyrosaw
			[479] = 6.57, -- Dagger in the Back
			[442] = 5.53, -- Pandemic Invocation
			[541] = 1.67, -- Fight or Flight
			[192] = 5.11, -- Meticulous Scheming
			[475] = 0.13, -- Desperate Power
			[82] = 6.41, -- Champion of Azeroth
			[31] = 3.04, -- Gutripper
			[22] = 2.84, -- Heed My Call
			[498] = 3.97, -- Barrage Of Many Bombs
			[521] = 4.32, -- Shadow of Elune
			[497] = 1.17, -- Stand As One
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 11323 - 20338 (avg 17330), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[5] = { 10, 2.61 }, -- Essence of the Focusing Iris
			[4] = { 0.55, 0.91 }, -- Worldvein Resonance
			[15] = { 3.02, 0.05 }, -- Ripple in Space
			[22] = { 0, 1.86 }, -- Vision of Perfection
			[32] = { 1.59, 1.63 }, -- Conflict and Strife
			[28] = { 2.96, 1.41 }, -- The Unbound Force
			[12] = { 6.51, 2.63 }, -- The Crucible of Flame
			[23] = { 3.14, 0.92 }, -- Blood of the Enemy
			[6] = { 4.99, 2.22 }, -- Purification Protocol
			[14] = { 6.49, 2.61 }, -- Condensed Life-Force
			[27] = { 2.28, 0.97 }, -- Memory of Lucid Dreams
		}, 1562749200)

		insertDefaultScalesData(defaultName, 9, 2, { -- Demonology Warlock
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 11654 - 15335 (avg 12319), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[157] = 4.14, -- Rezan's Fury
			[459] = 2.04, -- Unstable Flames
			[576] = 2.71, -- Loyal to the End
			[569] = 3.69, -- Clockwork Heart
			[481] = 3.74, -- Incite the Pack
			[479] = 4.44, -- Dagger in the Back
			[428] = 4.88, -- Demonic Meteor
			[501] = 3.94, -- Relational Normalization Gizmo
			[130] = 2.76, -- Shadow's Bite
			[568] = 0.04, -- Person-Computer Interface
			[429] = 10, -- Baleful Invocation
			[505] = 4.05, -- Tradewinds
			[531] = 0.05, -- Terror of the Mind
			[522] = 5.44, -- Ancients' Bulwark
			[156] = 2.45, -- Ruinous Bolt
			[20] = 1.3, -- Lifespeed
			[21] = 1.71, -- Elemental Whirl
			[463] = 0.02, -- Blessed Portents
			[190] = 4.2, -- Umbral Blaze
			[208] = 0.06, -- Lifeblood
			[475] = 0.03, -- Desperate Power
			[100] = 0.06, -- Strength in Numbers
			[521] = 3.03, -- Shadow of Elune
			[98] = 0.06, -- Crystalline Carapace
			[43] = 0.05, -- Winds of War
			[500] = 2.17, -- Synaptic Spark Capacitor
			[480] = 2.96, -- Blood Rite
			[526] = 5.41, -- Endless Hunger
			[193] = 5.39, -- Blightborne Infusion
			[458] = 3.85, -- Supreme Commander
			[541] = 1.21, -- Fight or Flight
			[18] = 1.47, -- Blood Siphon
			[101] = 0.02, -- Shimmering Haven
			[85] = 0.05, -- Gemhide
			[485] = 3.61, -- Laser Matrix
			[14] = 0.01, -- Longstrider
			[196] = 4.43, -- Swirling Sands
			[105] = 0.04, -- Ephemeral Recovery
			[195] = 3.66, -- Secrets of the Deep
			[575] = 6.2, -- Undulating Tides
			[492] = 3.05, -- Liberator's Might
			[86] = 0.04, -- Azerite Fortification
			[561] = 2.96, -- Seductive Power
			[22] = 1.73, -- Heed My Call
			[82] = 4.5, -- Champion of Azeroth
			[494] = 2.76, -- Battlefield Precision
			[38] = 1.53, -- On My Way
			[461] = 1.23, -- Earthlink
			[192] = 3.78, -- Meticulous Scheming
			[496] = 1.12, -- Stronger Together
			[523] = 3.4, -- Apothecary's Concoctions
			[99] = 0.03, -- Ablative Shielding
			[562] = 5.47, -- Treacherous Covenant
			[493] = 2.14, -- Last Gift
			[560] = 1.32, -- Bonded Souls
			[194] = 3.6, -- Filthy Transfusion
			[478] = 3.94, -- Tidal Surge
			[231] = 0.39, -- Explosive Potential
			[499] = 1.57, -- Ricocheting Inflatable Pyrosaw
			[84] = 0.03, -- Bulwark of the Masses
			[482] = 3.41, -- Thunderous Blast
			[462] = 1.13, -- Azerite Globules
			[31] = 1.89, -- Gutripper
			[13] = 0.02, -- Azerite Empowered
			[495] = 3.5, -- Anduin's Dedication
			[577] = 0.49, -- Arcane Heart
			[497] = 0.83, -- Stand As One
			[30] = 2.49, -- Overwhelming Power
			[498] = 2.57, -- Barrage Of Many Bombs
			[504] = 3.82, -- Unstable Catalyst
			[483] = 4.04, -- Archive of the Titans
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 11340 - 13181 (avg 12132), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = { 3.03, 0.06 }, -- Ripple in Space
			[28] = { 3.5, 2.05 }, -- The Unbound Force
			[6] = { 5.85, 2.91 }, -- Purification Protocol
			[22] = { 7.5, 4.46 }, -- Vision of Perfection
			[27] = { 5.8, 3.5 }, -- Memory of Lucid Dreams
			[23] = { 2.15, 0.26 }, -- Blood of the Enemy
			[12] = { 7.33, 3.9 }, -- The Crucible of Flame
			[14] = { 9.5, 3.38 }, -- Condensed Life-Force
			[32] = { 2.98, 3.04 }, -- Conflict and Strife
			[5] = { 10, 2.88 }, -- Essence of the Focusing Iris
			[4] = { 1.07, 1.44 }, -- Worldvein Resonance
		}, 1562749200)

		insertDefaultScalesData(defaultName, 9, 3, { -- Destruction Warlock
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 16652 - 20683 (avg 17631), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[156] = 3.73, -- Ruinous Bolt
			[131] = 6.36, -- Chaos Shards
			[482] = 5.1, -- Thunderous Blast
			[478] = 6.11, -- Tidal Surge
			[461] = 1.68, -- Earthlink
			[89] = 0.09, -- Azerite Veins
			[504] = 5.3, -- Unstable Catalyst
			[480] = 5.17, -- Blood Rite
			[98] = 0.02, -- Crystalline Carapace
			[103] = 0.01, -- Concentrated Mending
			[501] = 6.13, -- Relational Normalization Gizmo
			[505] = 6.05, -- Tradewinds
			[432] = 6.12, -- Chaotic Inferno
			[192] = 5.46, -- Meticulous Scheming
			[18] = 2.24, -- Blood Siphon
			[569] = 6.15, -- Clockwork Heart
			[494] = 5.87, -- Battlefield Precision
			[44] = 0.06, -- Vampiric Speed
			[526] = 7.7, -- Endless Hunger
			[38] = 2.19, -- On My Way
			[82] = 7.17, -- Champion of Azeroth
			[541] = 1.64, -- Fight or Flight
			[459] = 2.63, -- Unstable Flames
			[85] = 0.06, -- Gemhide
			[31] = 3.03, -- Gutripper
			[521] = 5.09, -- Shadow of Elune
			[208] = 0.07, -- Lifeblood
			[444] = 4.69, -- Crashing Chaos
			[561] = 3.95, -- Seductive Power
			[194] = 5.29, -- Filthy Transfusion
			[195] = 4.95, -- Secrets of the Deep
			[496] = 1.67, -- Stronger Together
			[495] = 4.76, -- Anduin's Dedication
			[497] = 1.4, -- Stand As One
			[576] = 4.08, -- Loyal to the End
			[523] = 5.18, -- Apothecary's Concoctions
			[499] = 2.41, -- Ricocheting Inflatable Pyrosaw
			[157] = 6.37, -- Rezan's Fury
			[460] = 5.91, -- Bursting Flare
			[485] = 5.64, -- Laser Matrix
			[577] = 2.97, -- Arcane Heart
			[232] = 5.46, -- Flashpoint
			[479] = 6.88, -- Dagger in the Back
			[42] = 0.03, -- Savior
			[500] = 3.32, -- Synaptic Spark Capacitor
			[83] = 0.01, -- Impassive Visage
			[575] = 10, -- Undulating Tides
			[463] = 0.07, -- Blessed Portents
			[560] = 2.69, -- Bonded Souls
			[19] = 0.01, -- Woundbinder
			[193] = 7.6, -- Blightborne Infusion
			[20] = 2.58, -- Lifespeed
			[498] = 3.97, -- Barrage Of Many Bombs
			[483] = 5.09, -- Archive of the Titans
			[481] = 5.48, -- Incite the Pack
			[30] = 4.62, -- Overwhelming Power
			[492] = 4.85, -- Liberator's Might
			[21] = 2.66, -- Elemental Whirl
			[196] = 6.7, -- Swirling Sands
			[22] = 2.81, -- Heed My Call
			[562] = 7.54, -- Treacherous Covenant
			[522] = 7.61, -- Ancients' Bulwark
			[493] = 3.14, -- Last Gift
			[462] = 1.78, -- Azerite Globules
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 12195 - 22093 (avg 17378), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = { 2.65, 0 }, -- Ripple in Space
			[22] = { 10, 5.27 }, -- Vision of Perfection
			[4] = { 0.42, 0.95 }, -- Worldvein Resonance
			[32] = { 1.87, 1.93 }, -- Conflict and Strife
			[12] = { 5.77, 2.71 }, -- The Crucible of Flame
			[27] = { 6.82, 1.96 }, -- Memory of Lucid Dreams
			[5] = { 8.5, 2.91 }, -- Essence of the Focusing Iris
			[14] = { 6.04, 2.6 }, -- Condensed Life-Force
			[23] = { 2.49, 0.57 }, -- Blood of the Enemy
			[6] = { 4.25, 2.21 }, -- Purification Protocol
			[28] = { 1.81, 1.02 }, -- The Unbound Force
		}, 1562749200)

		insertDefaultScalesData(defaultName, 1, 1, { -- Arms Warrior
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 7630 - 11297 (avg 8207), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[521] = 4.4, -- Shadow of Elune
			[44] = 0.02, -- Vampiric Speed
			[461] = 1.79, -- Earthlink
			[196] = 7.1, -- Swirling Sands
			[105] = 0.01, -- Ephemeral Recovery
			[562] = 7.57, -- Treacherous Covenant
			[433] = 4.07, -- Seismic Wave
			[479] = 6.23, -- Dagger in the Back
			[576] = 3.8, -- Loyal to the End
			[31] = 2.93, -- Gutripper
			[19] = 0.09, -- Woundbinder
			[20] = 2.09, -- Lifespeed
			[496] = 1.52, -- Stronger Together
			[478] = 6.04, -- Tidal Surge
			[575] = 9.79, -- Undulating Tides
			[462] = 1.79, -- Azerite Globules
			[480] = 4.49, -- Blood Rite
			[192] = 5.63, -- Meticulous Scheming
			[22] = 2.76, -- Heed My Call
			[82] = 6.99, -- Champion of Azeroth
			[482] = 5.21, -- Thunderous Blast
			[434] = 8.81, -- Crushing Assault
			[481] = 5.25, -- Incite the Pack
			[18] = 2.09, -- Blood Siphon
			[499] = 2.34, -- Ricocheting Inflatable Pyrosaw
			[523] = 4.78, -- Apothecary's Concoctions
			[541] = 1.94, -- Fight or Flight
			[30] = 4.16, -- Overwhelming Power
			[84] = 0.04, -- Bulwark of the Masses
			[501] = 5.71, -- Relational Normalization Gizmo
			[492] = 4.59, -- Liberator's Might
			[435] = 4.81, -- Lord of War
			[504] = 5.56, -- Unstable Catalyst
			[121] = 5.84, -- Striking the Anvil
			[194] = 5.67, -- Filthy Transfusion
			[505] = 5.56, -- Tradewinds
			[42] = 0.13, -- Savior
			[560] = 2.16, -- Bonded Souls
			[577] = 2.13, -- Arcane Heart
			[99] = 0.14, -- Ablative Shielding
			[193] = 7.99, -- Blightborne Infusion
			[561] = 4.5, -- Seductive Power
			[459] = 2.72, -- Unstable Flames
			[498] = 3.95, -- Barrage Of Many Bombs
			[156] = 3.59, -- Ruinous Bolt
			[38] = 1.91, -- On My Way
			[463] = 0.04, -- Blessed Portents
			[483] = 5.63, -- Archive of the Titans
			[500] = 3.25, -- Synaptic Spark Capacitor
			[569] = 5.55, -- Clockwork Heart
			[503] = 0.01, -- Auto-Self-Cauterizer
			[21] = 2.31, -- Elemental Whirl
			[526] = 6.79, -- Endless Hunger
			[89] = 0.04, -- Azerite Veins
			[485] = 5.44, -- Laser Matrix
			[157] = 6.13, -- Rezan's Fury
			[522] = 6.7, -- Ancients' Bulwark
			[497] = 1.27, -- Stand As One
			[43] = 0.01, -- Winds of War
			[494] = 6.23, -- Battlefield Precision
			[174] = 5.2, -- Gathering Storm
			[195] = 5.03, -- Secrets of the Deep
			[493] = 3.07, -- Last Gift
			[502] = 0.03, -- Personal Absorb-o-Tron
			[226] = 10, -- Test of Might
			[495] = 4.67, -- Anduin's Dedication
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 7385 - 10415 (avg 8223), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[6] = { 5.71, 2.37 }, -- Purification Protocol
			[23] = { 4, 0.48 }, -- Blood of the Enemy
			[22] = { 0, 0.02 }, -- Vision of Perfection
			[14] = { 7.89, 2.82 }, -- Condensed Life-Force
			[4] = { 1.49, 1.07 }, -- Worldvein Resonance
			[12] = { 8.17, 2.93 }, -- The Crucible of Flame
			[15] = { 3.76, 0.01 }, -- Ripple in Space
			[27] = { 6.15, 3.28 }, -- Memory of Lucid Dreams
			[32] = { 1.56, 1.5 }, -- Conflict and Strife
			[5] = { 10, 2.46 }, -- Essence of the Focusing Iris
			[28] = { 3.44, 1.61 }, -- The Unbound Force
		}, 1562749200)

		insertDefaultScalesData(defaultName, 1, 2, { -- Fury Warrior
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 10346 - 13739 (avg 10981), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[451] = 4.88, -- Infinite Fury
			[462] = 1.78, -- Azerite Globules
			[196] = 5.53, -- Swirling Sands
			[496] = 1.29, -- Stronger Together
			[500] = 2.81, -- Synaptic Spark Capacitor
			[561] = 4.13, -- Seductive Power
			[497] = 1.24, -- Stand As One
			[195] = 4.16, -- Secrets of the Deep
			[83] = 0.14, -- Impassive Visage
			[502] = 0.01, -- Personal Absorb-o-Tron
			[176] = 6.11, -- Cold Steel, Hot Blood
			[576] = 3.33, -- Loyal to the End
			[505] = 4.93, -- Tradewinds
			[560] = 2.32, -- Bonded Souls
			[43] = 0.05, -- Winds of War
			[504] = 4.77, -- Unstable Catalyst
			[476] = 0.1, -- Moment of Glory
			[156] = 2.95, -- Ruinous Bolt
			[31] = 2.92, -- Gutripper
			[98] = 0.08, -- Crystalline Carapace
			[492] = 3.8, -- Liberator's Might
			[482] = 5.28, -- Thunderous Blast
			[493] = 2.71, -- Last Gift
			[541] = 1.61, -- Fight or Flight
			[498] = 4.03, -- Barrage Of Many Bombs
			[495] = 3.97, -- Anduin's Dedication
			[229] = 5.08, -- Pulverizing Blows
			[82] = 6.22, -- Champion of Azeroth
			[523] = 4.33, -- Apothecary's Concoctions
			[481] = 4.61, -- Incite the Pack
			[119] = 9.02, -- Unbridled Ferocity
			[575] = 10, -- Undulating Tides
			[461] = 1.37, -- Earthlink
			[485] = 5.58, -- Laser Matrix
			[193] = 6.1, -- Blightborne Infusion
			[99] = 0.12, -- Ablative Shielding
			[42] = 0.02, -- Savior
			[15] = 0.04, -- Resounding Protection
			[20] = 1.97, -- Lifespeed
			[21] = 2.14, -- Elemental Whirl
			[194] = 5.53, -- Filthy Transfusion
			[105] = 0.03, -- Ephemeral Recovery
			[480] = 4.18, -- Blood Rite
			[192] = 5.58, -- Meticulous Scheming
			[30] = 4.67, -- Overwhelming Power
			[526] = 6.2, -- Endless Hunger
			[554] = 0.04, -- Intimidating Presence
			[22] = 2.87, -- Heed My Call
			[483] = 4.74, -- Archive of the Titans
			[562] = 6.54, -- Treacherous Covenant
			[100] = 0.11, -- Strength in Numbers
			[568] = 0.08, -- Person-Computer Interface
			[478] = 5.05, -- Tidal Surge
			[84] = 0.17, -- Bulwark of the Masses
			[499] = 2.46, -- Ricocheting Inflatable Pyrosaw
			[479] = 5.37, -- Dagger in the Back
			[86] = 0.02, -- Azerite Fortification
			[569] = 5.44, -- Clockwork Heart
			[104] = 0.11, -- Bracing Chill
			[521] = 4.25, -- Shadow of Elune
			[89] = 0.01, -- Azerite Veins
			[18] = 1.86, -- Blood Siphon
			[438] = 7.06, -- Reckless Flurry
			[501] = 5.04, -- Relational Normalization Gizmo
			[38] = 1.83, -- On My Way
			[44] = 0.03, -- Vampiric Speed
			[459] = 2.24, -- Unstable Flames
			[522] = 6.15, -- Ancients' Bulwark
			[87] = 0.03, -- Self Reliance
			[494] = 6.34, -- Battlefield Precision
			[437] = 7.13, -- Simmering Rage
			[157] = 6.06, -- Rezan's Fury
			[103] = 0.12, -- Concentrated Mending
			[577] = 2.27, -- Arcane Heart
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 10028 - 12484 (avg 10831), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[6] = { 6.17, 3.3 }, -- Purification Protocol
			[12] = { 7.69, 3.78 }, -- The Crucible of Flame
			[15] = { 3.16, 0.03 }, -- Ripple in Space
			[27] = { 6.24, 2.86 }, -- Memory of Lucid Dreams
			[4] = { 0.82, 1.23 }, -- Worldvein Resonance
			[5] = { 10, 3.2 }, -- Essence of the Focusing Iris
			[28] = { 3.07, 1.62 }, -- The Unbound Force
			[22] = { 2.74, 0.92 }, -- Vision of Perfection
			[32] = { 1.91, 1.86 }, -- Conflict and Strife
			[23] = { 3.46, 1.05 }, -- Blood of the Enemy
			[14] = { 9.94, 3.81 }, -- Condensed Life-Force
		}, 1562749200)

		insertDefaultScalesData(offensiveName, 1, 3, { -- Protection Warrior
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 5079 - 7839 (avg 5543), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[441] = 2.42, -- Iron Fortress
			[20] = 1.25, -- Lifespeed
			[194] = 5.58, -- Filthy Transfusion
			[82] = 4.22, -- Champion of Azeroth
			[104] = 0.02, -- Bracing Chill
			[482] = 5.36, -- Thunderous Blast
			[192] = 3.61, -- Meticulous Scheming
			[237] = 4.32, -- Bastion of Might
			[499] = 2.58, -- Ricocheting Inflatable Pyrosaw
			[86] = 0.05, -- Azerite Fortification
			[479] = 3.83, -- Dagger in the Back
			[576] = 2.12, -- Loyal to the End
			[577] = 0.84, -- Arcane Heart
			[44] = 0.07, -- Vampiric Speed
			[498] = 4.28, -- Barrage Of Many Bombs
			[195] = 3.35, -- Secrets of the Deep
			[13] = 0.07, -- Azerite Empowered
			[492] = 2.75, -- Liberator's Might
			[156] = 3.22, -- Ruinous Bolt
			[504] = 3.8, -- Unstable Catalyst
			[105] = 0.03, -- Ephemeral Recovery
			[177] = 0.05, -- Bloodsport
			[562] = 5.16, -- Treacherous Covenant
			[89] = 0.07, -- Azerite Veins
			[501] = 3.68, -- Relational Normalization Gizmo
			[575] = 10, -- Undulating Tides
			[496] = 0.93, -- Stronger Together
			[478] = 5.37, -- Tidal Surge
			[193] = 4.64, -- Blightborne Infusion
			[485] = 5.65, -- Laser Matrix
			[561] = 3.11, -- Seductive Power
			[42] = 0.05, -- Savior
			[30] = 2.83, -- Overwhelming Power
			[497] = 0.95, -- Stand As One
			[15] = 0.08, -- Resounding Protection
			[118] = 6.76, -- Deafening Crash
			[495] = 3.28, -- Anduin's Dedication
			[521] = 2.78, -- Shadow of Elune
			[481] = 2.8, -- Incite the Pack
			[500] = 3.11, -- Synaptic Spark Capacitor
			[196] = 4.14, -- Swirling Sands
			[476] = 0.03, -- Moment of Glory
			[99] = 0.01, -- Ablative Shielding
			[450] = 3.37, -- Brace for Impact
			[459] = 1.67, -- Unstable Flames
			[19] = 0.04, -- Woundbinder
			[43] = 0.04, -- Winds of War
			[569] = 3.34, -- Clockwork Heart
			[101] = 0.06, -- Shimmering Haven
			[560] = 1.5, -- Bonded Souls
			[22] = 2.89, -- Heed My Call
			[541] = 1.59, -- Fight or Flight
			[522] = 4.42, -- Ancients' Bulwark
			[526] = 4.44, -- Endless Hunger
			[463] = 0.07, -- Blessed Portents
			[505] = 3.05, -- Tradewinds
			[493] = 1.71, -- Last Gift
			[38] = 1.32, -- On My Way
			[483] = 3.74, -- Archive of the Titans
			[87] = 0.05, -- Self Reliance
			[461] = 1.19, -- Earthlink
			[84] = 0.04, -- Bulwark of the Masses
			[157] = 6.2, -- Rezan's Fury
			[494] = 4.35, -- Battlefield Precision
			[503] = 0.07, -- Auto-Self-Cauterizer
			[85] = 0.02, -- Gemhide
			[502] = 0.03, -- Personal Absorb-o-Tron
			[568] = 0.09, -- Person-Computer Interface
			[31] = 3.06, -- Gutripper
			[103] = 0.08, -- Concentrated Mending
			[440] = 1.38, -- Callous Reprisal
			[480] = 2.73, -- Blood Rite
			[523] = 4.51, -- Apothecary's Concoctions
			[21] = 1.49, -- Elemental Whirl
			[98] = 0.06, -- Crystalline Carapace
			[462] = 1.83, -- Azerite Globules
			[18] = 1.23, -- Blood Siphon
			[83] = 0.05, -- Impassive Visage
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 5094 - 5928 (avg 5314), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[32] = { 3.33, 3.31 }, -- Conflict and Strife
			[4] = { 2.46, 2.46 }, -- Worldvein Resonance
			[7] = { 0.06, 0.1 }, -- Anima of Life and Death
			[15] = { 0.11, 0.06 }, -- Ripple in Space
			[27] = { 1.78, 0.58 }, -- Memory of Lucid Dreams
			[25] = { 1.65, 1.6 }, -- Aegis of the Deep
			[12] = { 9.99, 10 }, -- The Crucible of Flame
			[13] = { 0.14, 0.07 }, -- Nullification Dynamo
			[2] = { 0.07, 0.08 }, -- Azeroth's Undying Gift
			[3] = { 7.3, 7.16 }, -- Sphere of Suppression
			[22] = { 7.85, 4.58 }, -- Vision of Perfection
		}, 1562749200)

		insertDefaultScalesData(defensiveName, 12, 2, { -- Vengeance Demon Hunter (TMI)
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 5088 - 8108 (avg 5596), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[195] = 2.41, -- Secrets of the Deep
			[562] = 3.74, -- Treacherous Covenant
			[30] = 1.57, -- Overwhelming Power
			[504] = 2.82, -- Unstable Catalyst
			[496] = 0.51, -- Stronger Together
			[21] = 0.87, -- Elemental Whirl
			[44] = 0.01, -- Vampiric Speed
			[38] = 1, -- On My Way
			[13] = 0.01, -- Azerite Empowered
			[84] = 0.04, -- Bulwark of the Masses
			[192] = 4.05, -- Meticulous Scheming
			[495] = 2.25, -- Anduin's Dedication
			[196] = 4.43, -- Swirling Sands
			[160] = 0.01, -- Infernal Armor
			[521] = 2.36, -- Shadow of Elune
			[526] = 4.33, -- Endless Hunger
			[42] = 0.02, -- Savior
			[104] = 0.04, -- Bracing Chill
			[522] = 4.25, -- Ancients' Bulwark
			[193] = 4.78, -- Blightborne Infusion
			[501] = 2.73, -- Relational Normalization Gizmo
			[492] = 1.82, -- Liberator's Might
			[497] = 0.85, -- Stand As One
			[15] = 10, -- Resounding Protection
			[493] = 1.13, -- Last Gift
			[461] = 0.68, -- Earthlink
			[561] = 3.22, -- Seductive Power
			[98] = 0.02, -- Crystalline Carapace
			[569] = 1.36, -- Clockwork Heart
			[480] = 2.24, -- Blood Rite
			[576] = 1.32, -- Loyal to the End
			[459] = 1.82, -- Unstable Flames
			[481] = 1.87, -- Incite the Pack
			[14] = 0.08, -- Longstrider
			[483] = 3.05, -- Archive of the Titans
			[541] = 0.89, -- Fight or Flight
			[560] = 0.15, -- Bonded Souls
			[82] = 3.15, -- Champion of Azeroth
			[18] = 3.73, -- Blood Siphon
			[505] = 2.22, -- Tradewinds
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 4903 - 5572 (avg 5277), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[3] = { 7.08, 7.13 }, -- Sphere of Suppression
			[7] = { 4.99, 5.09 }, -- Anima of Life and Death
			[27] = { 7.78, 7.86 }, -- Memory of Lucid Dreams
			[32] = { 2.34, 2.31 }, -- Conflict and Strife
			[25] = { 1.03, 1.05 }, -- Aegis of the Deep
			[4] = { 1.36, 1.15 }, -- Worldvein Resonance
			[15] = { 0.01, 0 }, -- Ripple in Space
			[22] = { 10, 2.57 }, -- Vision of Perfection
		}, 1562749200)

		insertDefaultScalesData(defensiveName, 6, 1, { -- Blood Death Knight (TMI)
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 7057 - 10132 (avg 7682), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[560] = 1.8, -- Bonded Souls
			[492] = 3.43, -- Liberator's Might
			[243] = 9.1, -- Bloody Runeblade
			[193] = 4.1, -- Blightborne Infusion
			[21] = 1.9, -- Elemental Whirl
			[483] = 2.62, -- Archive of the Titans
			[192] = 4.74, -- Meticulous Scheming
			[521] = 3.7, -- Shadow of Elune
			[496] = 1.05, -- Stronger Together
			[481] = 5.62, -- Incite the Pack
			[497] = 0.67, -- Stand As One
			[459] = 1.71, -- Unstable Flames
			[541] = 0.67, -- Fight or Flight
			[493] = 3.39, -- Last Gift
			[197] = 6.96, -- Marrowblood
			[140] = 2.65, -- Bone Spike Graveyard
			[561] = 4.31, -- Seductive Power
			[569] = 4.14, -- Clockwork Heart
			[38] = 0.78, -- On My Way
			[30] = 3.58, -- Overwhelming Power
			[526] = 3.41, -- Endless Hunger
			[504] = 2.44, -- Unstable Catalyst
			[501] = 4.89, -- Relational Normalization Gizmo
			[196] = 3.76, -- Swirling Sands
			[523] = 0.08, -- Apothecary's Concoctions
			[577] = 0.73, -- Arcane Heart
			[498] = 0.02, -- Barrage Of Many Bombs
			[495] = 2.25, -- Anduin's Dedication
			[195] = 2.41, -- Secrets of the Deep
			[562] = 3.48, -- Treacherous Covenant
			[106] = 4.24, -- Deep Cuts
			[15] = 10, -- Resounding Protection
			[505] = 5.97, -- Tradewinds
			[522] = 3.35, -- Ancients' Bulwark
			[576] = 4.11, -- Loyal to the End
			[20] = 2.19, -- Lifespeed
			[82] = 5.89, -- Champion of Azeroth
			[348] = 4.2, -- Eternal Rune Weapon
			[461] = 0.67, -- Earthlink
			[349] = 4.91, -- Bones of the Damned
			[480] = 3.63, -- Blood Rite
			[18] = 5.38, -- Blood Siphon
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 6988 - 7651 (avg 7369), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[15] = { 0.55, 0 }, -- Ripple in Space
			[7] = { 4.32, 4.34 }, -- Anima of Life and Death
			[32] = { 0.8, 0.71 }, -- Conflict and Strife
			[25] = { 0.36, 0.27 }, -- Aegis of the Deep
			[4] = { 0.82, 0.39 }, -- Worldvein Resonance
			[27] = { 10, 5.52 }, -- Memory of Lucid Dreams
			[22] = { 1.05, 0 }, -- Vision of Perfection
			[3] = { 3.02, 3.05 }, -- Sphere of Suppression
		}, 1562749200)

		insertDefaultScalesData(defensiveName, 11, 3, { -- Guardian Druid (TMI)
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 4630 - 6777 (avg 5087), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[505] = 1.5, -- Tradewinds
			[15] = 10, -- Resounding Protection
			[503] = 0.12, -- Auto-Self-Cauterizer
			[569] = 1.11, -- Clockwork Heart
			[31] = 0.06, -- Gutripper
			[359] = 0.04, -- Wild Fleshrending
			[541] = 0.26, -- Fight or Flight
			[196] = 1.86, -- Swirling Sands
			[461] = 0.2, -- Earthlink
			[459] = 0.75, -- Unstable Flames
			[495] = 0.58, -- Anduin's Dedication
			[493] = 0.84, -- Last Gift
			[219] = 0.05, -- Reawakening
			[482] = 0.02, -- Thunderous Blast
			[82] = 1.48, -- Champion of Azeroth
			[105] = 0.03, -- Ephemeral Recovery
			[483] = 0.75, -- Archive of the Titans
			[561] = 2.34, -- Seductive Power
			[13] = 0.03, -- Azerite Empowered
			[496] = 0.3, -- Stronger Together
			[497] = 0.51, -- Stand As One
			[99] = 0.07, -- Ablative Shielding
			[501] = 1.04, -- Relational Normalization Gizmo
			[85] = 0.09, -- Gemhide
			[575] = 0.02, -- Undulating Tides
			[86] = 0.02, -- Azerite Fortification
			[18] = 4.57, -- Blood Siphon
			[21] = 0.52, -- Elemental Whirl
			[526] = 1.82, -- Endless Hunger
			[38] = 0.6, -- On My Way
			[360] = 0.15, -- Gory Regeneration
			[89] = 0.06, -- Azerite Veins
			[577] = 0.06, -- Arcane Heart
			[112] = 0.05, -- Layered Mane
			[498] = 0.02, -- Barrage Of Many Bombs
			[467] = 0.05, -- Ursoc's Endurance
			[562] = 0.87, -- Treacherous Covenant
			[576] = 0.91, -- Loyal to the End
			[42] = 0.05, -- Savior
			[43] = 0.03, -- Winds of War
			[104] = 0.02, -- Bracing Chill
			[44] = 0.11, -- Vampiric Speed
			[504] = 0.7, -- Unstable Catalyst
			[195] = 0.63, -- Secrets of the Deep
			[499] = 0.07, -- Ricocheting Inflatable Pyrosaw
			[481] = 1.4, -- Incite the Pack
			[522] = 1.88, -- Ancients' Bulwark
			[171] = 0.04, -- Masterful Instincts
			[492] = 0.85, -- Liberator's Might
			[478] = 0.06, -- Tidal Surge
			[83] = 0.02, -- Impassive Visage
			[480] = 0.02, -- Blood Rite
			[22] = 0.01, -- Heed My Call
			[241] = 0.66, -- Twisted Claws
			[192] = 0.02, -- Meticulous Scheming
			[479] = 0.07, -- Dagger in the Back
			[98] = 0.02, -- Crystalline Carapace
			[523] = 0.1, -- Apothecary's Concoctions
			[193] = 2.02, -- Blightborne Infusion
			[251] = 1.47, -- Burst of Savagery
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 4535 - 5692 (avg 4913), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[12] = { 0, 0.11 }, -- The Crucible of Flame
			[13] = { 0.01, 0 }, -- Nullification Dynamo
			[4] = { 0.62, 0.35 }, -- Worldvein Resonance
			[2] = { 0.14, 0.09 }, -- Azeroth's Undying Gift
			[32] = { 1.14, 1.11 }, -- Conflict and Strife
			[7] = { 9.96, 10 }, -- Anima of Life and Death
			[15] = { 0.57, 0.06 }, -- Ripple in Space
			[25] = { 0.58, 0.44 }, -- Aegis of the Deep
			[22] = { 0, 0.02 }, -- Vision of Perfection
			[3] = { 0, 0.01 }, -- Sphere of Suppression
		}, 1562749200)

		insertDefaultScalesData(defensiveName, 10, 1, { -- Brewmaster Monk (TMI)
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 6681 - 11128 (avg 7545), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[492] = 0.11, -- Liberator's Might
			[526] = 0.55, -- Endless Hunger
			[483] = 0.28, -- Archive of the Titans
			[480] = 0.13, -- Blood Rite
			[560] = 0.05, -- Bonded Souls
			[196] = 0.22, -- Swirling Sands
			[497] = 0.1, -- Stand As One
			[30] = 0.11, -- Overwhelming Power
			[577] = 0.05, -- Arcane Heart
			[576] = 0.63, -- Loyal to the End
			[461] = 0.07, -- Earthlink
			[192] = 0.16, -- Meticulous Scheming
			[561] = 0.49, -- Seductive Power
			[38] = 0.15, -- On My Way
			[98] = 0.01, -- Crystalline Carapace
			[562] = 0.35, -- Treacherous Covenant
			[21] = 0.18, -- Elemental Whirl
			[493] = 0.44, -- Last Gift
			[18] = 1.19, -- Blood Siphon
			[504] = 0.26, -- Unstable Catalyst
			[116] = 2.3, -- Boiling Brew
			[195] = 0.24, -- Secrets of the Deep
			[383] = 0.53, -- Training of Niuzao
			[481] = 0.72, -- Incite the Pack
			[15] = 3.16, -- Resounding Protection
			[496] = 0.08, -- Stronger Together
			[384] = 0.4, -- Elusive Footwork
			[459] = 0.08, -- Unstable Flames
			[495] = 0.21, -- Anduin's Dedication
			[541] = 0.09, -- Fight or Flight
			[569] = 0.38, -- Clockwork Heart
			[505] = 0.75, -- Tradewinds
			[521] = 0.11, -- Shadow of Elune
			[501] = 0.3, -- Relational Normalization Gizmo
			[193] = 0.25, -- Blightborne Infusion
			[186] = 10, -- Staggering Strikes
			[82] = 0.53, -- Champion of Azeroth
			[522] = 0.55, -- Ancients' Bulwark
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 6458 - 7668 (avg 7254), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[32] = { 2.13, 1.94 }, -- Conflict and Strife
			[2] = { 0.03, 0 }, -- Azeroth's Undying Gift
			[7] = { 9.99, 10 }, -- Anima of Life and Death
			[13] = { 0, 0.04 }, -- Nullification Dynamo
			[3] = { 1.89, 1.78 }, -- Sphere of Suppression
			[4] = { 0.77, 0.9 }, -- Worldvein Resonance
			[25] = { 0.82, 0.89 }, -- Aegis of the Deep
		}, 1562749200)

		insertDefaultScalesData(defensiveName, 2, 2, { -- Protection Paladin (TMI)
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 11599 - 14662 (avg 12437), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[82] = 1.61, -- Champion of Azeroth
			[21] = 0.5, -- Elemental Whirl
			[538] = 0.04, -- Empyreal Ward
			[150] = 0.68, -- Soaring Shield
			[526] = 1.27, -- Endless Hunger
			[84] = 0.03, -- Bulwark of the Masses
			[483] = 0.49, -- Archive of the Titans
			[193] = 1.68, -- Blightborne Infusion
			[562] = 0.64, -- Treacherous Covenant
			[192] = 0.89, -- Meticulous Scheming
			[561] = 1.85, -- Seductive Power
			[576] = 1.14, -- Loyal to the End
			[18] = 3.93, -- Blood Siphon
			[569] = 1.32, -- Clockwork Heart
			[30] = 0.59, -- Overwhelming Power
			[560] = 0.33, -- Bonded Souls
			[393] = 0.01, -- Grace of the Justicar
			[493] = 0.91, -- Last Gift
			[522] = 1.23, -- Ancients' Bulwark
			[38] = 0.34, -- On My Way
			[495] = 0.4, -- Anduin's Dedication
			[496] = 0.29, -- Stronger Together
			[206] = 0.01, -- Stalwart Protector
			[497] = 0.29, -- Stand As One
			[478] = 0.01, -- Tidal Surge
			[195] = 0.43, -- Secrets of the Deep
			[541] = 0.2, -- Fight or Flight
			[459] = 0.67, -- Unstable Flames
			[125] = 0.5, -- Avenger's Might
			[521] = 0.67, -- Shadow of Elune
			[13] = 0.02, -- Azerite Empowered
			[196] = 1.6, -- Swirling Sands
			[20] = 0.34, -- Lifespeed
			[395] = 0.89, -- Inspiring Vanguard
			[505] = 1.66, -- Tradewinds
			[577] = 0.21, -- Arcane Heart
			[575] = 0.02, -- Undulating Tides
			[15] = 10, -- Resounding Protection
			[492] = 0.91, -- Liberator's Might
			[234] = 0.42, -- Inner Light
			[501] = 1.28, -- Relational Normalization Gizmo
			[504] = 0.49, -- Unstable Catalyst
			[481] = 1.49, -- Incite the Pack
			[461] = 0.14, -- Earthlink
			[480] = 0.68, -- Blood Rite
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 11267 - 12900 (avg 12212), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[25] = { 0.35, 0.39 }, -- Aegis of the Deep
			[2] = { 0, 0.03 }, -- Azeroth's Undying Gift
			[4] = { 0.24, 0.35 }, -- Worldvein Resonance
			[3] = { 1.84, 1.85 }, -- Sphere of Suppression
			[15] = { 0, 0.11 }, -- Ripple in Space
			[32] = { 0.91, 0.99 }, -- Conflict and Strife
			[7] = { 9.88, 10 }, -- Anima of Life and Death
		}, 1562749200)

		insertDefaultScalesData(defensiveName, 1, 3, { -- Protection Warrior (TMI)
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 5037 - 7922 (avg 5533), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[477] = 0.01, -- Bury the Hatchet
			[568] = 0.01, -- Person-Computer Interface
			[21] = 0.04, -- Elemental Whirl
			[177] = 0.6, -- Bloodsport
			[560] = 0.02, -- Bonded Souls
			[480] = 0.03, -- Blood Rite
			[526] = 0.13, -- Endless Hunger
			[157] = 0.05, -- Rezan's Fury
			[20] = 0.01, -- Lifespeed
			[38] = 0.02, -- On My Way
			[195] = 0.08, -- Secrets of the Deep
			[521] = 0.03, -- Shadow of Elune
			[87] = 0.01, -- Self Reliance
			[194] = 0.08, -- Filthy Transfusion
			[501] = 0.1, -- Relational Normalization Gizmo
			[461] = 0.02, -- Earthlink
			[192] = 0.04, -- Meticulous Scheming
			[561] = 0.22, -- Seductive Power
			[98] = 0.01, -- Crystalline Carapace
			[30] = 0.01, -- Overwhelming Power
			[497] = 0.04, -- Stand As One
			[576] = 0.09, -- Loyal to the End
			[450] = 0.32, -- Brace for Impact
			[82] = 0.14, -- Champion of Azeroth
			[89] = 0.01, -- Azerite Veins
			[541] = 0.02, -- Fight or Flight
			[83] = 0.01, -- Impassive Visage
			[196] = 0.17, -- Swirling Sands
			[441] = 0.07, -- Iron Fortress
			[569] = 0.1, -- Clockwork Heart
			[440] = 10, -- Callous Reprisal
			[496] = 0.02, -- Stronger Together
			[479] = 0.04, -- Dagger in the Back
			[493] = 0.06, -- Last Gift
			[118] = 0.29, -- Deafening Crash
			[483] = 0.09, -- Archive of the Titans
			[43] = 0.01, -- Winds of War
			[459] = 0.08, -- Unstable Flames
			[193] = 0.2, -- Blightborne Infusion
			[237] = 0.51, -- Bastion of Might
			[562] = 0.14, -- Treacherous Covenant
			[523] = 0.03, -- Apothecary's Concoctions
			[495] = 0.08, -- Anduin's Dedication
			[504] = 0.12, -- Unstable Catalyst
			[18] = 0.57, -- Blood Siphon
			[522] = 0.12, -- Ancients' Bulwark
			[505] = 0.14, -- Tradewinds
			[481] = 0.12, -- Incite the Pack
			[15] = 2.01, -- Resounding Protection
			[492] = 0.09, -- Liberator's Might
		}, { -- Azerite Essences
			-- SimulationCraft 820-01 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 4950 - 5817 (avg 5289), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 10.07.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[7] = { 9.64, 10 }, -- Anima of Life and Death
			[25] = { 0.38, 0.08 }, -- Aegis of the Deep
			[22] = { 6.94, 5.24 }, -- Vision of Perfection
			[27] = { 7.94, 6.32 }, -- Memory of Lucid Dreams
			[3] = { 1.15, 0.68 }, -- Sphere of Suppression
			[12] = { 1.11, 1.47 }, -- The Crucible of Flame
			[15] = { 0, 0.27 }, -- Ripple in Space
			[32] = { 0.97, 0.94 }, -- Conflict and Strife
			[4] = { 0.66, 0.54 }, -- Worldvein Resonance
		}, 1562749200)

		insertDefaultScalesData(defaultName, 5, 3, { -- Shadow Priest
			-- Shadow Priest by WarcraftPriests (https://warcraftpriests.com/)
			-- https://github.com/WarcraftPriests/bfa-shadow-priest/blob/master/azerite-traits/AzeritePowerWeights_AS.md
			-- First Imported: 03.09.2018, Updated: 10.07.2019
			[405] = 6.59,
			[575] = 5.22,
			[193] = 5,
			[196] = 4.49,
			[82] = 4.08,
			[562] = 3.72,
			[522] = 3.71,
			[526] = 3.69,
			[236] = 3.61,
			[192] = 3.54,
			[479] = 3.38,
			[501] = 3.35,
			[488] = 3.32,
			[569] = 3.2,
			[157] = 3.18,
			[194] = 3.03,
			[30] = 3.01,
			[486] = 2.92,
			[482] = 2.85,
			[521] = 2.81,
			[480] = 2.8,
			[504] = 2.78,
			[523] = 2.68,
			[577] = 2.64,
			[505] = 2.64,
			[404] = 2.63,
			[478] = 2.61,
			[195] = 2.46,
			[481] = 2.44,
			[489] = 2.37,
			[561] = 2.34,
			[498] = 2.13,
			[459] = 1.72,
			[560] = 1.7,
			[156] = 1.56,
			[31] = 1.54,
			[403] = 1.48,
			[22] = 1.46,
			[500] = 1.41,
			[21] = 1.4,
			[487] = 1.39,
			[499] = 1.25,
			[166] = 1.15,
			[38] = 1.1,
			[491] = 1.03,
			[462] = 0.98,
			[18] = 0.95,
			[541] = 0.91,
			[490] = 0.91,
			[461] = 0.81,
			[13] = 0.36,
			[115] = 0.02,
		}, {
		}, 1562749200)


		insertDefaultScalesData(offensiveName, 5, 1, { -- Discipline Priest

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