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
		["azeritePowerID"] = 13,
		["name"] = "Azerite Empowered",
		["icon"] = 2065624,
		["spellID"] = 263978,
	},
	["class"] = {
		{
			[73] = {
				{
					["azeritePowerID"] = 118,
					["name"] = "Deafening Crash",
					["icon"] = 136105,
					["spellID"] = 272824,
				}, -- [1]
				{
					["azeritePowerID"] = 177,
					["name"] = "Bloodsport",
					["icon"] = 1377132,
					["spellID"] = 279172,
				}, -- [2]
				{
					["azeritePowerID"] = 237,
					["name"] = "Bastion of Might",
					["icon"] = 254108,
					["spellID"] = 287377,
				}, -- [3]
				{
					["azeritePowerID"] = 440,
					["name"] = "Callous Reprisal",
					["icon"] = 132353,
					["spellID"] = 278760,
				}, -- [4]
				{
					["azeritePowerID"] = 441,
					["name"] = "Iron Fortress",
					["icon"] = 942783,
					["spellID"] = 278765,
				}, -- [5]
				{
					["azeritePowerID"] = 450,
					["name"] = "Brace for Impact",
					["icon"] = 134951,
					["spellID"] = 277636,
				}, -- [6]
			},
			[71] = {
				{
					["azeritePowerID"] = 121,
					["name"] = "Striking the Anvil",
					["icon"] = 236317,
					["spellID"] = 288452,
				}, -- [1]
				{
					["azeritePowerID"] = 174,
					["name"] = "Gathering Storm",
					["icon"] = 236303,
					["spellID"] = 273409,
				}, -- [2]
				{
					["azeritePowerID"] = 226,
					["name"] = "Test of Might",
					["icon"] = 236314,
					["spellID"] = 275529,
				}, -- [3]
				{
					["azeritePowerID"] = 433,
					["name"] = "Seismic Wave",
					["icon"] = 132223,
					["spellID"] = 277639,
				}, -- [4]
				{
					["azeritePowerID"] = 434,
					["name"] = "Crushing Assault",
					["icon"] = 132340,
					["spellID"] = 278751,
				}, -- [5]
				{
					["azeritePowerID"] = 435,
					["name"] = "Lord of War",
					["icon"] = 464973,
					["spellID"] = 278752,
				}, -- [6]
			},
			[72] = {
				{
					["azeritePowerID"] = 119,
					["name"] = "Unbridled Ferocity",
					["icon"] = 132344,
					["spellID"] = 288056,
				}, -- [1]
				{
					["azeritePowerID"] = 174,
					["name"] = "Gathering Storm",
					["icon"] = 236303,
					["spellID"] = 273409,
				}, -- [2]
				{
					["azeritePowerID"] = 176,
					["name"] = "Cold Steel, Hot Blood",
					["icon"] = 236276,
					["spellID"] = 288080,
				}, -- [3]
				{
					["azeritePowerID"] = 229,
					["name"] = "Pulverizing Blows",
					["icon"] = 132352,
					["spellID"] = 275632,
				}, -- [4]
				{
					["azeritePowerID"] = 437,
					["name"] = "Simmering Rage",
					["icon"] = 136110,
					["spellID"] = 278757,
				}, -- [5]
				{
					["azeritePowerID"] = 438,
					["name"] = "Reckless Flurry",
					["icon"] = 132147,
					["spellID"] = 278758,
				}, -- [6]
				{
					["azeritePowerID"] = 451,
					["name"] = "Infinite Fury",
					["icon"] = 458972,
					["spellID"] = 277638,
				}, -- [7]
			},
		}, -- [1]
		{
			[70] = {
				{
					["azeritePowerID"] = 125,
					["name"] = "Avenger's Might",
					["icon"] = 135875,
					["spellID"] = 272898,
				}, -- [1]
				{
					["azeritePowerID"] = 154,
					["name"] = "Relentless Inquisitor",
					["icon"] = 135897,
					["spellID"] = 278617,
				}, -- [2]
				{
					["azeritePowerID"] = 187,
					["name"] = "Expurgation",
					["icon"] = 1360757,
					["spellID"] = 273473,
				}, -- [3]
				{
					["azeritePowerID"] = 235,
					["name"] = "Indomitable Justice",
					["icon"] = 135959,
					["spellID"] = 275496,
				}, -- [4]
				{
					["azeritePowerID"] = 393,
					["name"] = "Grace of the Justicar",
					["icon"] = 135917,
					["spellID"] = 278593,
				}, -- [5]
				{
					["azeritePowerID"] = 396,
					["name"] = "Light's Decree",
					["icon"] = 135878,
					["spellID"] = 286229,
				}, -- [6]
				{
					["azeritePowerID"] = 453,
					["name"] = "Empyrean Power",
					["icon"] = 236263,
					["spellID"] = 286390,
				}, -- [7]
				{
					["azeritePowerID"] = 454,
					["name"] = "Judicious Defense",
					["icon"] = 1603010,
					["spellID"] = 277675,
				}, -- [8]
			},
			[65] = {
				{
					["azeritePowerID"] = 102,
					["name"] = "Synergistic Growth",
					["icon"] = 513195,
					["spellID"] = 267892,
				}, -- [1]
				{
					["azeritePowerID"] = 125,
					["name"] = "Avenger's Might",
					["icon"] = 135875,
					["spellID"] = 272898,
				}, -- [2]
				{
					["azeritePowerID"] = 139,
					["name"] = "Glimmer of Light",
					["icon"] = 1360764,
					["spellID"] = 287268,
				}, -- [3]
				{
					["azeritePowerID"] = 188,
					["name"] = "Moment of Compassion",
					["icon"] = 135907,
					["spellID"] = 273513,
				}, -- [4]
				{
					["azeritePowerID"] = 233,
					["name"] = "Divine Revelations",
					["icon"] = 236254,
					["spellID"] = 275463,
				}, -- [5]
				{
					["azeritePowerID"] = 235,
					["name"] = "Indomitable Justice",
					["icon"] = 135959,
					["spellID"] = 275496,
				}, -- [6]
				{
					["azeritePowerID"] = 393,
					["name"] = "Grace of the Justicar",
					["icon"] = 135917,
					["spellID"] = 278593,
				}, -- [7]
				{
					["azeritePowerID"] = 394,
					["name"] = "Breaking Dawn",
					["icon"] = 461859,
					["spellID"] = 278594,
				}, -- [8]
				{
					["azeritePowerID"] = 452,
					["name"] = "Radiant Incandescence",
					["icon"] = 135972,
					["spellID"] = 277674,
				}, -- [9]
				{
					["azeritePowerID"] = 454,
					["name"] = "Judicious Defense",
					["icon"] = 1603010,
					["spellID"] = 277675,
				}, -- [10]
			},
			[66] = {
				{
					["azeritePowerID"] = 125,
					["name"] = "Avenger's Might",
					["icon"] = 135875,
					["spellID"] = 272898,
				}, -- [1]
				{
					["azeritePowerID"] = 133,
					["name"] = "Bulwark of Light",
					["icon"] = 135943,
					["spellID"] = 272976,
				}, -- [2]
				{
					["azeritePowerID"] = 150,
					["name"] = "Soaring Shield",
					["icon"] = 135874,
					["spellID"] = 278605,
				}, -- [3]
				{
					["azeritePowerID"] = 189,
					["name"] = "Righteous Conviction",
					["icon"] = 135981,
					["spellID"] = 287126,
				}, -- [4]
				{
					["azeritePowerID"] = 234,
					["name"] = "Inner Light",
					["icon"] = 236265,
					["spellID"] = 275477,
				}, -- [5]
				{
					["azeritePowerID"] = 235,
					["name"] = "Indomitable Justice",
					["icon"] = 135959,
					["spellID"] = 275496,
				}, -- [6]
				{
					["azeritePowerID"] = 393,
					["name"] = "Grace of the Justicar",
					["icon"] = 135917,
					["spellID"] = 278593,
				}, -- [7]
				{
					["azeritePowerID"] = 395,
					["name"] = "Inspiring Vanguard",
					["icon"] = 133176,
					["spellID"] = 278609,
				}, -- [8]
				{
					["azeritePowerID"] = 454,
					["name"] = "Judicious Defense",
					["icon"] = 1603010,
					["spellID"] = 277675,
				}, -- [9]
			},
		}, -- [2]
		{
			[255] = {
				{
					["azeritePowerID"] = 107,
					["name"] = "Serrated Jaws",
					["icon"] = 132176,
					["spellID"] = 272717,
				}, -- [1]
				{
					["azeritePowerID"] = 110,
					["name"] = "Wildfire Cluster",
					["icon"] = 451164,
					["spellID"] = 272742,
				}, -- [2]
				{
					["azeritePowerID"] = 163,
					["name"] = "Latent Poison",
					["icon"] = 1033905,
					["spellID"] = 273283,
				}, -- [3]
				{
					["azeritePowerID"] = 213,
					["name"] = "Venomous Fangs",
					["icon"] = 136067,
					["spellID"] = 274590,
				}, -- [4]
				{
					["azeritePowerID"] = 365,
					["name"] = "Dire Consequences",
					["icon"] = 236186,
					["spellID"] = 287093,
				}, -- [5]
				{
					["azeritePowerID"] = 371,
					["name"] = "Blur of Talons",
					["icon"] = 2065565,
					["spellID"] = 277653,
				}, -- [6]
				{
					["azeritePowerID"] = 372,
					["name"] = "Wilderness Survival",
					["icon"] = 132214,
					["spellID"] = 278532,
				}, -- [7]
				{
					["azeritePowerID"] = 373,
					["name"] = "Primeval Intuition",
					["icon"] = 132210,
					["spellID"] = 288570,
				}, -- [8]
			},
			[254] = {
				{
					["azeritePowerID"] = 36,
					["name"] = "In The Rhythm",
					["icon"] = 461115,
					["spellID"] = 264198,
				}, -- [1]
				{
					["azeritePowerID"] = 162,
					["name"] = "Surging Shots",
					["icon"] = 132212,
					["spellID"] = 287707,
				}, -- [2]
				{
					["azeritePowerID"] = 212,
					["name"] = "Unerring Vision",
					["icon"] = 132329,
					["spellID"] = 274444,
				}, -- [3]
				{
					["azeritePowerID"] = 368,
					["name"] = "Steady Aim",
					["icon"] = 135130,
					["spellID"] = 277651,
				}, -- [4]
				{
					["azeritePowerID"] = 369,
					["name"] = "Rapid Reload",
					["icon"] = 132330,
					["spellID"] = 278530,
				}, -- [5]
				{
					["azeritePowerID"] = 370,
					["name"] = "Focused Fire",
					["icon"] = 878211,
					["spellID"] = 278531,
				}, -- [6]
			},
			[253] = {
				{
					["azeritePowerID"] = 107,
					["name"] = "Serrated Jaws",
					["icon"] = 132176,
					["spellID"] = 272717,
				}, -- [1]
				{
					["azeritePowerID"] = 161,
					["name"] = "Haze of Rage",
					["icon"] = 132127,
					["spellID"] = 273262,
				}, -- [2]
				{
					["azeritePowerID"] = 211,
					["name"] = "Dance of Death",
					["icon"] = 132133,
					["spellID"] = 274441,
				}, -- [3]
				{
					["azeritePowerID"] = 365,
					["name"] = "Dire Consequences",
					["icon"] = 236186,
					["spellID"] = 287093,
				}, -- [4]
				{
					["azeritePowerID"] = 366,
					["name"] = "Primal Instincts",
					["icon"] = 136074,
					["spellID"] = 279806,
				}, -- [5]
				{
					["azeritePowerID"] = 367,
					["name"] = "Feeding Frenzy",
					["icon"] = 2058007,
					["spellID"] = 278529,
				}, -- [6]
				{
					["azeritePowerID"] = 369,
					["name"] = "Rapid Reload",
					["icon"] = 132330,
					["spellID"] = 278530,
				}, -- [7]
			},
		}, -- [3]
		{
			[260] = {
				{
					["azeritePowerID"] = 129,
					["name"] = "Deadshot",
					["icon"] = 1373908,
					["spellID"] = 272935,
				}, -- [1]
				{
					["azeritePowerID"] = 180,
					["name"] = "Keep Your Wits About You",
					["icon"] = 132350,
					["spellID"] = 288979,
				}, -- [2]
				{
					["azeritePowerID"] = 239,
					["name"] = "Snake Eyes",
					["icon"] = 132336,
					["spellID"] = 275846,
				}, -- [3]
				{
					["azeritePowerID"] = 410,
					["name"] = "Paradise Lost",
					["icon"] = 1373910,
					["spellID"] = 278675,
				}, -- [4]
				{
					["azeritePowerID"] = 411,
					["name"] = "Ace Up Your Sleeve",
					["icon"] = 135610,
					["spellID"] = 278676,
				}, -- [5]
				{
					["azeritePowerID"] = 446,
					["name"] = "Brigand's Blitz",
					["icon"] = 136206,
					["spellID"] = 277676,
				}, -- [6]
			},
			[261] = {
				{
					["azeritePowerID"] = 124,
					["name"] = "Replicating Shadows",
					["icon"] = 237532,
					["spellID"] = 286121,
				}, -- [1]
				{
					["azeritePowerID"] = 175,
					["name"] = "Night's Vengeance",
					["icon"] = 1373907,
					["spellID"] = 273418,
				}, -- [2]
				{
					["azeritePowerID"] = 240,
					["name"] = "Blade In The Shadows",
					["icon"] = 1373912,
					["spellID"] = 275896,
				}, -- [3]
				{
					["azeritePowerID"] = 413,
					["name"] = "The First Dance",
					["icon"] = 236279,
					["spellID"] = 278681,
				}, -- [4]
				{
					["azeritePowerID"] = 414,
					["name"] = "Inevitability",
					["icon"] = 252272,
					["spellID"] = 278683,
				}, -- [5]
				{
					["azeritePowerID"] = 445,
					["name"] = "Perforate",
					["icon"] = 132090,
					["spellID"] = 277673,
				}, -- [6]
			},
			[259] = {
				{
					["azeritePowerID"] = 136,
					["name"] = "Double Dose",
					["icon"] = 132304,
					["spellID"] = 273007,
				}, -- [1]
				{
					["azeritePowerID"] = 181,
					["name"] = "Twist the Knife",
					["icon"] = 132287,
					["spellID"] = 273488,
				}, -- [2]
				{
					["azeritePowerID"] = 249,
					["name"] = "Nothing Personal",
					["icon"] = 458726,
					["spellID"] = 286573,
				}, -- [3]
				{
					["azeritePowerID"] = 406,
					["name"] = "Scent of Blood",
					["icon"] = 132302,
					["spellID"] = 277679,
				}, -- [4]
				{
					["azeritePowerID"] = 407,
					["name"] = "Echoing Blades",
					["icon"] = 236273,
					["spellID"] = 287649,
				}, -- [5]
				{
					["azeritePowerID"] = 408,
					["name"] = "Shrouded Suffocation",
					["icon"] = 132297,
					["spellID"] = 278666,
				}, -- [6]
			},
		}, -- [4]
		{
			[257] = {
				{
					["azeritePowerID"] = 102,
					["name"] = "Synergistic Growth",
					["icon"] = 513195,
					["spellID"] = 267892,
				}, -- [1]
				{
					["azeritePowerID"] = 114,
					["name"] = "Permeating Glow",
					["icon"] = 135907,
					["spellID"] = 272780,
				}, -- [2]
				{
					["azeritePowerID"] = 165,
					["name"] = "Blessed Sanctuary",
					["icon"] = 237541,
					["spellID"] = 273313,
				}, -- [3]
				{
					["azeritePowerID"] = 228,
					["name"] = "Prayerful Litany",
					["icon"] = 135943,
					["spellID"] = 275602,
				}, -- [4]
				{
					["azeritePowerID"] = 400,
					["name"] = "Everlasting Light",
					["icon"] = 135913,
					["spellID"] = 277681,
				}, -- [5]
				{
					["azeritePowerID"] = 401,
					["name"] = "Word of Mending",
					["icon"] = 135944,
					["spellID"] = 278645,
				}, -- [6]
				{
					["azeritePowerID"] = 402,
					["name"] = "Promise of Deliverance",
					["icon"] = 135937,
					["spellID"] = 287336,
				}, -- [7]
			},
			[258] = {
				{
					["azeritePowerID"] = 115,
					["name"] = "Searing Dialogue",
					["icon"] = 237565,
					["spellID"] = 272788,
				}, -- [1]
				{
					["azeritePowerID"] = 166,
					["name"] = "Thought Harvester",
					["icon"] = 135978,
					["spellID"] = 288340,
				}, -- [2]
				{
					["azeritePowerID"] = 227,
					["name"] = "Depth of the Shadows",
					["icon"] = 136202,
					["spellID"] = 275541,
				}, -- [3]
				{
					["azeritePowerID"] = 236,
					["name"] = "Whispers of the Damned",
					["icon"] = 237298,
					["spellID"] = 275722,
				}, -- [4]
				{
					["azeritePowerID"] = 403,
					["name"] = "Spiteful Apparitions",
					["icon"] = 458229,
					["spellID"] = 277682,
				}, -- [5]
				{
					["azeritePowerID"] = 404,
					["name"] = "Death Throes",
					["icon"] = 136163,
					["spellID"] = 278659,
				}, -- [6]
				{
					["azeritePowerID"] = 405,
					["name"] = "Chorus of Insanity",
					["icon"] = 1386549,
					["spellID"] = 278661,
				}, -- [7]
			},
			[256] = {
				{
					["azeritePowerID"] = 102,
					["name"] = "Synergistic Growth",
					["icon"] = 513195,
					["spellID"] = 267892,
				}, -- [1]
				{
					["azeritePowerID"] = 113,
					["name"] = "Moment of Repose",
					["icon"] = 135936,
					["spellID"] = 272775,
				}, -- [2]
				{
					["azeritePowerID"] = 164,
					["name"] = "Weal and Woe",
					["icon"] = 237545,
					["spellID"] = 273307,
				}, -- [3]
				{
					["azeritePowerID"] = 227,
					["name"] = "Depth of the Shadows",
					["icon"] = 136202,
					["spellID"] = 275541,
				}, -- [4]
				{
					["azeritePowerID"] = 397,
					["name"] = "Sudden Revelation",
					["icon"] = 135922,
					["spellID"] = 287355,
				}, -- [5]
				{
					["azeritePowerID"] = 398,
					["name"] = "Contemptuous Homily",
					["icon"] = 237567,
					["spellID"] = 278629,
				}, -- [6]
				{
					["azeritePowerID"] = 399,
					["name"] = "Enduring Luminescence",
					["icon"] = 1386546,
					["spellID"] = 278643,
				}, -- [7]
			},
		}, -- [5]
		{
			[252] = {
				{
					["azeritePowerID"] = 109,
					["name"] = "Magus of the Dead",
					["icon"] = 348276,
					["spellID"] = 288417,
				}, -- [1]
				{
					["azeritePowerID"] = 140,
					["name"] = "Bone Spike Graveyard",
					["icon"] = 136144,
					["spellID"] = 273088,
				}, -- [2]
				{
					["azeritePowerID"] = 142,
					["name"] = "Helchains",
					["icon"] = 342913,
					["spellID"] = 286832,
				}, -- [3]
				{
					["azeritePowerID"] = 199,
					["name"] = "Festermight",
					["icon"] = 1129420,
					["spellID"] = 274081,
				}, -- [4]
				{
					["azeritePowerID"] = 244,
					["name"] = "Harrowing Decay",
					["icon"] = 136145,
					["spellID"] = 275929,
				}, -- [5]
				{
					["azeritePowerID"] = 350,
					["name"] = "Cankerous Wounds",
					["icon"] = 879926,
					["spellID"] = 278482,
				}, -- [6]
				{
					["azeritePowerID"] = 351,
					["name"] = "Last Surprise",
					["icon"] = 136133,
					["spellID"] = 278489,
				}, -- [7]
			},
			[251] = {
				{
					["azeritePowerID"] = 108,
					["name"] = "Icy Citadel",
					["icon"] = 135372,
					["spellID"] = 272718,
				}, -- [1]
				{
					["azeritePowerID"] = 141,
					["name"] = "Latent Chill",
					["icon"] = 237520,
					["spellID"] = 273093,
				}, -- [2]
				{
					["azeritePowerID"] = 198,
					["name"] = "Frostwhelp's Indignation",
					["icon"] = 1580450,
					["spellID"] = 287283,
				}, -- [3]
				{
					["azeritePowerID"] = 242,
					["name"] = "Echoing Howl",
					["icon"] = 135833,
					["spellID"] = 275917,
				}, -- [4]
				{
					["azeritePowerID"] = 346,
					["name"] = "Killer Frost",
					["icon"] = 135305,
					["spellID"] = 278480,
				}, -- [5]
				{
					["azeritePowerID"] = 347,
					["name"] = "Frozen Tempest",
					["icon"] = 538770,
					["spellID"] = 278487,
				}, -- [6]
			},
			[250] = {
				{
					["azeritePowerID"] = 106,
					["name"] = "Deep Cuts",
					["icon"] = 132155,
					["spellID"] = 272684,
				}, -- [1]
				{
					["azeritePowerID"] = 140,
					["name"] = "Bone Spike Graveyard",
					["icon"] = 136144,
					["spellID"] = 273088,
				}, -- [2]
				{
					["azeritePowerID"] = 197,
					["name"] = "Marrowblood",
					["icon"] = 237517,
					["spellID"] = 274057,
				}, -- [3]
				{
					["azeritePowerID"] = 243,
					["name"] = "Bloody Runeblade",
					["icon"] = 135338,
					["spellID"] = 289339,
				}, -- [4]
				{
					["azeritePowerID"] = 348,
					["name"] = "Eternal Rune Weapon",
					["icon"] = 135277,
					["spellID"] = 278479,
				}, -- [5]
				{
					["azeritePowerID"] = 349,
					["name"] = "Bones of the Damned",
					["icon"] = 1376745,
					["spellID"] = 278484,
				}, -- [6]
			},
		}, -- [6]
		{
			[263] = {
				{
					["azeritePowerID"] = 17,
					["name"] = "Astral Shift",
					["icon"] = 538565,
					["spellID"] = 263786,
				}, -- [1]
				{
					["azeritePowerID"] = 137,
					["name"] = "Primal Primer",
					["icon"] = 236289,
					["spellID"] = 272992,
				}, -- [2]
				{
					["azeritePowerID"] = 179,
					["name"] = "Strength of Earth",
					["icon"] = 136086,
					["spellID"] = 273461,
				}, -- [3]
				{
					["azeritePowerID"] = 223,
					["name"] = "Lightning Conduit",
					["icon"] = 237443,
					["spellID"] = 275388,
				}, -- [4]
				{
					["azeritePowerID"] = 416,
					["name"] = "Natural Harmony",
					["icon"] = 136028,
					["spellID"] = 278697,
				}, -- [5]
				{
					["azeritePowerID"] = 420,
					["name"] = "Roiling Storm",
					["icon"] = 132314,
					["spellID"] = 278719,
				}, -- [6]
				{
					["azeritePowerID"] = 447,
					["name"] = "Ancestral Resonance",
					["icon"] = 451167,
					["spellID"] = 277666,
				}, -- [7]
				{
					["azeritePowerID"] = 448,
					["name"] = "Synapse Shock",
					["icon"] = 136048,
					["spellID"] = 277671,
				}, -- [8]
				{
					["azeritePowerID"] = 530,
					["name"] = "Thunderaan's Fury",
					["icon"] = 136046,
					["spellID"] = 287768,
				}, -- [9]
			},
			[264] = {
				{
					["azeritePowerID"] = 17,
					["name"] = "Astral Shift",
					["icon"] = 538565,
					["spellID"] = 263786,
				}, -- [1]
				{
					["azeritePowerID"] = 24,
					["name"] = "Lightningburn",
					["icon"] = 136015,
					["spellID"] = 263792,
				}, -- [2]
				{
					["azeritePowerID"] = 102,
					["name"] = "Synergistic Growth",
					["icon"] = 513195,
					["spellID"] = 267892,
				}, -- [3]
				{
					["azeritePowerID"] = 135,
					["name"] = "Volcanic Lightning",
					["icon"] = 237582,
					["spellID"] = 272978,
				}, -- [4]
				{
					["azeritePowerID"] = 138,
					["name"] = "Soothing Waters",
					["icon"] = 136042,
					["spellID"] = 272989,
				}, -- [5]
				{
					["azeritePowerID"] = 191,
					["name"] = "Turn of the Tide",
					["icon"] = 237590,
					["spellID"] = 287300,
				}, -- [6]
				{
					["azeritePowerID"] = 224,
					["name"] = "Swelling Stream",
					["icon"] = 135127,
					["spellID"] = 275488,
				}, -- [7]
				{
					["azeritePowerID"] = 416,
					["name"] = "Natural Harmony",
					["icon"] = 136028,
					["spellID"] = 278697,
				}, -- [8]
				{
					["azeritePowerID"] = 422,
					["name"] = "Surging Tides",
					["icon"] = 252995,
					["spellID"] = 278713,
				}, -- [9]
				{
					["azeritePowerID"] = 423,
					["name"] = "Spouting Spirits",
					["icon"] = 237586,
					["spellID"] = 278715,
				}, -- [10]
				{
					["azeritePowerID"] = 447,
					["name"] = "Ancestral Resonance",
					["icon"] = 451167,
					["spellID"] = 277666,
				}, -- [11]
				{
					["azeritePowerID"] = 448,
					["name"] = "Synapse Shock",
					["icon"] = 136048,
					["spellID"] = 277671,
				}, -- [12]
				{
					["azeritePowerID"] = 449,
					["name"] = "Overflowing Shores",
					["icon"] = 136037,
					["spellID"] = 277658,
				}, -- [13]
				{
					["azeritePowerID"] = 457,
					["name"] = "Igneous Potential",
					["icon"] = 451169,
					["spellID"] = 279829,
				}, -- [14]
			},
			[262] = {
				{
					["azeritePowerID"] = 17,
					["name"] = "Astral Shift",
					["icon"] = 538565,
					["spellID"] = 263786,
				}, -- [1]
				{
					["azeritePowerID"] = 24,
					["name"] = "Lightningburn",
					["icon"] = 136015,
					["spellID"] = 263792,
				}, -- [2]
				{
					["azeritePowerID"] = 135,
					["name"] = "Volcanic Lightning",
					["icon"] = 237582,
					["spellID"] = 272978,
				}, -- [3]
				{
					["azeritePowerID"] = 178,
					["name"] = "Lava Shock",
					["icon"] = 136026,
					["spellID"] = 273448,
				}, -- [4]
				{
					["azeritePowerID"] = 222,
					["name"] = "Echo of the Elementals",
					["icon"] = 135790,
					["spellID"] = 275381,
				}, -- [5]
				{
					["azeritePowerID"] = 416,
					["name"] = "Natural Harmony",
					["icon"] = 136028,
					["spellID"] = 278697,
				}, -- [6]
				{
					["azeritePowerID"] = 417,
					["name"] = "Tectonic Thunder",
					["icon"] = 136025,
					["spellID"] = 286949,
				}, -- [7]
				{
					["azeritePowerID"] = 447,
					["name"] = "Ancestral Resonance",
					["icon"] = 451167,
					["spellID"] = 277666,
				}, -- [8]
				{
					["azeritePowerID"] = 448,
					["name"] = "Synapse Shock",
					["icon"] = 136048,
					["spellID"] = 277671,
				}, -- [9]
				{
					["azeritePowerID"] = 457,
					["name"] = "Igneous Potential",
					["icon"] = 451169,
					["spellID"] = 279829,
				}, -- [10]
			},
		}, -- [7]
		{
			[64] = {
				{
					["azeritePowerID"] = 132,
					["name"] = "Packed Ice",
					["icon"] = 612394,
					["spellID"] = 272968,
				}, -- [1]
				{
					["azeritePowerID"] = 170,
					["name"] = "Flash Freeze",
					["icon"] = 236209,
					["spellID"] = 288164,
				}, -- [2]
				{
					["azeritePowerID"] = 225,
					["name"] = "Glacial Assault",
					["icon"] = 2126034,
					["spellID"] = 279854,
				}, -- [3]
				{
					["azeritePowerID"] = 379,
					["name"] = "Tunnel of Ice",
					["icon"] = 135846,
					["spellID"] = 277663,
				}, -- [4]
				{
					["azeritePowerID"] = 380,
					["name"] = "Whiteout",
					["icon"] = 135844,
					["spellID"] = 278541,
				}, -- [5]
				{
					["azeritePowerID"] = 381,
					["name"] = "Frigid Grasp",
					["icon"] = 135838,
					["spellID"] = 278542,
				}, -- [6]
			},
			[63] = {
				{
					["azeritePowerID"] = 128,
					["name"] = "Flames of Alacrity",
					["icon"] = 135810,
					["spellID"] = 272932,
				}, -- [1]
				{
					["azeritePowerID"] = 168,
					["name"] = "Wildfire",
					["icon"] = 460698,
					["spellID"] = 288755,
				}, -- [2]
				{
					["azeritePowerID"] = 215,
					["name"] = "Blaster Master",
					["icon"] = 135807,
					["spellID"] = 274596,
				}, -- [3]
				{
					["azeritePowerID"] = 376,
					["name"] = "Trailing Embers",
					["icon"] = 135808,
					["spellID"] = 277656,
				}, -- [4]
				{
					["azeritePowerID"] = 377,
					["name"] = "Duplicative Incineration",
					["icon"] = 135812,
					["spellID"] = 278538,
				}, -- [5]
				{
					["azeritePowerID"] = 378,
					["name"] = "Firemind",
					["icon"] = 236218,
					["spellID"] = 278539,
				}, -- [6]
			},
			[62] = {
				{
					["azeritePowerID"] = 88,
					["name"] = "Arcane Pummeling",
					["icon"] = 136096,
					["spellID"] = 270669,
				}, -- [1]
				{
					["azeritePowerID"] = 127,
					["name"] = "Equipoise",
					["icon"] = 135732,
					["spellID"] = 286027,
				}, -- [2]
				{
					["azeritePowerID"] = 167,
					["name"] = "Brain Storm",
					["icon"] = 136075,
					["spellID"] = 273326,
				}, -- [3]
				{
					["azeritePowerID"] = 214,
					["name"] = "Arcane Pressure",
					["icon"] = 236205,
					["spellID"] = 274594,
				}, -- [4]
				{
					["azeritePowerID"] = 374,
					["name"] = "Galvanizing Spark",
					["icon"] = 135730,
					["spellID"] = 278536,
				}, -- [5]
				{
					["azeritePowerID"] = 375,
					["name"] = "Explosive Echo",
					["icon"] = 136116,
					["spellID"] = 278537,
				}, -- [6]
			},
		}, -- [8]
		{
			[266] = {
				{
					["azeritePowerID"] = 130,
					["name"] = "Shadow's Bite",
					["icon"] = 136181,
					["spellID"] = 272944,
				}, -- [1]
				{
					["azeritePowerID"] = 190,
					["name"] = "Umbral Blaze",
					["icon"] = 236296,
					["spellID"] = 273523,
				}, -- [2]
				{
					["azeritePowerID"] = 231,
					["name"] = "Explosive Potential",
					["icon"] = 2032610,
					["spellID"] = 275395,
				}, -- [3]
				{
					["azeritePowerID"] = 428,
					["name"] = "Demonic Meteor",
					["icon"] = 535592,
					["spellID"] = 278737,
				}, -- [4]
				{
					["azeritePowerID"] = 429,
					["name"] = "Baleful Invocation",
					["icon"] = 237561,
					["spellID"] = 287059,
				}, -- [5]
				{
					["azeritePowerID"] = 443,
					["name"] = "Excoriate",
					["icon"] = 460856,
					["spellID"] = 276007,
				}, -- [6]
				{
					["azeritePowerID"] = 458,
					["name"] = "Supreme Commander",
					["icon"] = 2065628,
					["spellID"] = 279878,
				}, -- [7]
			},
			[267] = {
				{
					["azeritePowerID"] = 131,
					["name"] = "Chaos Shards",
					["icon"] = 134075,
					["spellID"] = 287637,
				}, -- [1]
				{
					["azeritePowerID"] = 232,
					["name"] = "Flashpoint",
					["icon"] = 135817,
					["spellID"] = 275425,
				}, -- [2]
				{
					["azeritePowerID"] = 431,
					["name"] = "Rolling Havoc",
					["icon"] = 1380866,
					["spellID"] = 278747,
				}, -- [3]
				{
					["azeritePowerID"] = 432,
					["name"] = "Chaotic Inferno",
					["icon"] = 135789,
					["spellID"] = 278748,
				}, -- [4]
				{
					["azeritePowerID"] = 444,
					["name"] = "Crashing Chaos",
					["icon"] = 236291,
					["spellID"] = 277644,
				}, -- [5]
				{
					["azeritePowerID"] = 460,
					["name"] = "Bursting Flare",
					["icon"] = 135807,
					["spellID"] = 279909,
				}, -- [6]
			},
			[265] = {
				{
					["azeritePowerID"] = 123,
					["name"] = "Wracking Brilliance",
					["icon"] = 237564,
					["spellID"] = 272891,
				}, -- [1]
				{
					["azeritePowerID"] = 183,
					["name"] = "Inevitable Demise",
					["icon"] = 537517,
					["spellID"] = 273521,
				}, -- [2]
				{
					["azeritePowerID"] = 230,
					["name"] = "Cascading Calamity",
					["icon"] = 136228,
					["spellID"] = 275372,
				}, -- [3]
				{
					["azeritePowerID"] = 425,
					["name"] = "Sudden Onset",
					["icon"] = 136139,
					["spellID"] = 278721,
				}, -- [4]
				{
					["azeritePowerID"] = 426,
					["name"] = "Dreadful Calling",
					["icon"] = 1416161,
					["spellID"] = 278727,
				}, -- [5]
				{
					["azeritePowerID"] = 442,
					["name"] = "Pandemic Invocation",
					["icon"] = 136230,
					["spellID"] = 289364,
				}, -- [6]
			},
		}, -- [9]
		{
			[269] = {
				{
					["azeritePowerID"] = 117,
					["name"] = "Fury of Xuen",
					["icon"] = 606548,
					["spellID"] = 287055,
				}, -- [1]
				{
					["azeritePowerID"] = 184,
					["name"] = "Sunrise Technique",
					["icon"] = 642415,
					["spellID"] = 273291,
				}, -- [2]
				{
					["azeritePowerID"] = 388,
					["name"] = "Glory of the Dawn",
					["icon"] = 1381297,
					["spellID"] = 288634,
				}, -- [3]
				{
					["azeritePowerID"] = 389,
					["name"] = "Open Palm Strikes",
					["icon"] = 627606,
					["spellID"] = 279918,
				}, -- [4]
				{
					["azeritePowerID"] = 390,
					["name"] = "Pressure Point",
					["icon"] = 606551,
					["spellID"] = 278577,
				}, -- [5]
				{
					["azeritePowerID"] = 391,
					["name"] = "Dance of Chi-Ji",
					["icon"] = 607849,
					["spellID"] = 286585,
				}, -- [6]
			},
			[270] = {
				{
					["azeritePowerID"] = 76,
					["name"] = "Secret Infusion",
					["icon"] = 611418,
					["spellID"] = 287829,
				}, -- [1]
				{
					["azeritePowerID"] = 102,
					["name"] = "Synergistic Growth",
					["icon"] = 513195,
					["spellID"] = 267892,
				}, -- [2]
				{
					["azeritePowerID"] = 184,
					["name"] = "Sunrise Technique",
					["icon"] = 642415,
					["spellID"] = 273291,
				}, -- [3]
				{
					["azeritePowerID"] = 185,
					["name"] = "Overflowing Mists",
					["icon"] = 775461,
					["spellID"] = 273328,
				}, -- [4]
				{
					["azeritePowerID"] = 248,
					["name"] = "Misty Peaks",
					["icon"] = 627487,
					["spellID"] = 275975,
				}, -- [5]
				{
					["azeritePowerID"] = 385,
					["name"] = "Burst of Life",
					["icon"] = 627485,
					["spellID"] = 277667,
				}, -- [6]
				{
					["azeritePowerID"] = 386,
					["name"] = "Font of Life",
					["icon"] = 1360978,
					["spellID"] = 279875,
				}, -- [7]
				{
					["azeritePowerID"] = 387,
					["name"] = "Uplifted Spirits",
					["icon"] = 1020466,
					["spellID"] = 278576,
				}, -- [8]
				{
					["azeritePowerID"] = 388,
					["name"] = "Glory of the Dawn",
					["icon"] = 1381297,
					["spellID"] = 288634,
				}, -- [9]
			},
			[268] = {
				{
					["azeritePowerID"] = 116,
					["name"] = "Boiling Brew",
					["icon"] = 615339,
					["spellID"] = 272792,
				}, -- [1]
				{
					["azeritePowerID"] = 186,
					["name"] = "Staggering Strikes",
					["icon"] = 1500803,
					["spellID"] = 273464,
				}, -- [2]
				{
					["azeritePowerID"] = 238,
					["name"] = "Fit to Burst",
					["icon"] = 133701,
					["spellID"] = 275892,
				}, -- [3]
				{
					["azeritePowerID"] = 382,
					["name"] = "Straight, No Chaser",
					["icon"] = 1360979,
					["spellID"] = 285958,
				}, -- [4]
				{
					["azeritePowerID"] = 383,
					["name"] = "Training of Niuzao",
					["icon"] = 611419,
					["spellID"] = 278569,
				}, -- [5]
				{
					["azeritePowerID"] = 384,
					["name"] = "Elusive Footwork",
					["icon"] = 642416,
					["spellID"] = 278571,
				}, -- [6]
			},
		}, -- [10]
		{
			[103] = {
				{
					["azeritePowerID"] = 111,
					["name"] = "Blood Mist",
					["icon"] = 236149,
					["spellID"] = 279524,
				}, -- [1]
				{
					["azeritePowerID"] = 169,
					["name"] = "Untamed Ferocity",
					["icon"] = 132122,
					["spellID"] = 273338,
				}, -- [2]
				{
					["azeritePowerID"] = 171,
					["name"] = "Masterful Instincts",
					["icon"] = 236169,
					["spellID"] = 273344,
				}, -- [3]
				{
					["azeritePowerID"] = 209,
					["name"] = "Jungle Fury",
					["icon"] = 132242,
					["spellID"] = 274424,
				}, -- [4]
				{
					["azeritePowerID"] = 241,
					["name"] = "Twisted Claws",
					["icon"] = 451161,
					["spellID"] = 275906,
				}, -- [5]
				{
					["azeritePowerID"] = 247,
					["name"] = "Iron Jaws",
					["icon"] = 132134,
					["spellID"] = 276021,
				}, -- [6]
				{
					["azeritePowerID"] = 358,
					["name"] = "Gushing Lacerations",
					["icon"] = 132152,
					["spellID"] = 278509,
				}, -- [7]
				{
					["azeritePowerID"] = 359,
					["name"] = "Wild Fleshrending",
					["icon"] = 236305,
					["spellID"] = 279527,
				}, -- [8]
			},
			[104] = {
				{
					["azeritePowerID"] = 51,
					["name"] = "Long Night",
					["icon"] = 136096,
					["spellID"] = 269379,
				}, -- [1]
				{
					["azeritePowerID"] = 112,
					["name"] = "Layered Mane",
					["icon"] = 1378702,
					["spellID"] = 279552,
				}, -- [2]
				{
					["azeritePowerID"] = 171,
					["name"] = "Masterful Instincts",
					["icon"] = 236169,
					["spellID"] = 273344,
				}, -- [3]
				{
					["azeritePowerID"] = 241,
					["name"] = "Twisted Claws",
					["icon"] = 451161,
					["spellID"] = 275906,
				}, -- [4]
				{
					["azeritePowerID"] = 251,
					["name"] = "Burst of Savagery",
					["icon"] = 571585,
					["spellID"] = 289314,
				}, -- [5]
				{
					["azeritePowerID"] = 359,
					["name"] = "Wild Fleshrending",
					["icon"] = 236305,
					["spellID"] = 279527,
				}, -- [6]
				{
					["azeritePowerID"] = 360,
					["name"] = "Gory Regeneration",
					["icon"] = 132091,
					["spellID"] = 278510,
				}, -- [7]
				{
					["azeritePowerID"] = 361,
					["name"] = "Guardian's Wrath",
					["icon"] = 132136,
					["spellID"] = 278511,
				}, -- [8]
			},
			[105] = {
				{
					["azeritePowerID"] = 51,
					["name"] = "Long Night",
					["icon"] = 136096,
					["spellID"] = 269379,
				}, -- [1]
				{
					["azeritePowerID"] = 102,
					["name"] = "Synergistic Growth",
					["icon"] = 513195,
					["spellID"] = 267892,
				}, -- [2]
				{
					["azeritePowerID"] = 120,
					["name"] = "Early Harvest",
					["icon"] = 236153,
					["spellID"] = 287251,
				}, -- [3]
				{
					["azeritePowerID"] = 172,
					["name"] = "Grove Tending",
					["icon"] = 134914,
					["spellID"] = 279778,
				}, -- [4]
				{
					["azeritePowerID"] = 210,
					["name"] = "Autumn Leaves",
					["icon"] = 136081,
					["spellID"] = 274432,
				}, -- [5]
				{
					["azeritePowerID"] = 356,
					["name"] = "High Noon",
					["icon"] = 236216,
					["spellID"] = 278505,
				}, -- [6]
				{
					["azeritePowerID"] = 362,
					["name"] = "Rampant Growth",
					["icon"] = 136085,
					["spellID"] = 278515,
				}, -- [7]
				{
					["azeritePowerID"] = 363,
					["name"] = "Waking Dream",
					["icon"] = 134157,
					["spellID"] = 278513,
				}, -- [8]
				{
					["azeritePowerID"] = 364,
					["name"] = "Lively Spirit",
					["icon"] = 136048,
					["spellID"] = 279642,
				}, -- [9]
			},
			[102] = {
				{
					["azeritePowerID"] = 51,
					["name"] = "Long Night",
					["icon"] = 136096,
					["spellID"] = 269379,
				}, -- [1]
				{
					["azeritePowerID"] = 122,
					["name"] = "Streaking Stars",
					["icon"] = 136060,
					["spellID"] = 272871,
				}, -- [2]
				{
					["azeritePowerID"] = 173,
					["name"] = "Power of the Moon",
					["icon"] = 136096,
					["spellID"] = 273367,
				}, -- [3]
				{
					["azeritePowerID"] = 200,
					["name"] = "Arcanic Pulsar",
					["icon"] = 135730,
					["spellID"] = 287773,
				}, -- [4]
				{
					["azeritePowerID"] = 250,
					["name"] = "Dawning Sun",
					["icon"] = 135753,
					["spellID"] = 276152,
				}, -- [5]
				{
					["azeritePowerID"] = 356,
					["name"] = "High Noon",
					["icon"] = 236216,
					["spellID"] = 278505,
				}, -- [6]
				{
					["azeritePowerID"] = 357,
					["name"] = "Lunar Shrapnel",
					["icon"] = 236168,
					["spellID"] = 278507,
				}, -- [7]
				{
					["azeritePowerID"] = 364,
					["name"] = "Lively Spirit",
					["icon"] = 136048,
					["spellID"] = 279642,
				}, -- [8]
			},
		}, -- [11]
		{
			[577] = {
				{
					["azeritePowerID"] = 126,
					["name"] = "Revolving Blades",
					["icon"] = 1305149,
					["spellID"] = 279581,
				}, -- [1]
				{
					["azeritePowerID"] = 159,
					["name"] = "Furious Gaze",
					["icon"] = 1305156,
					["spellID"] = 273231,
				}, -- [2]
				{
					["azeritePowerID"] = 160,
					["name"] = "Infernal Armor",
					["icon"] = 1344649,
					["spellID"] = 273236,
				}, -- [3]
				{
					["azeritePowerID"] = 220,
					["name"] = "Chaotic Transformation",
					["icon"] = 1305157,
					["spellID"] = 288754,
				}, -- [4]
				{
					["azeritePowerID"] = 245,
					["name"] = "Seething Power",
					["icon"] = 1097741,
					["spellID"] = 275934,
				}, -- [5]
				{
					["azeritePowerID"] = 352,
					["name"] = "Thirsting Blades",
					["icon"] = 1305152,
					["spellID"] = 278493,
				}, -- [6]
				{
					["azeritePowerID"] = 353,
					["name"] = "Eyes of Rage",
					["icon"] = 463286,
					["spellID"] = 278500,
				}, -- [7]
			},
			[581] = {
				{
					["azeritePowerID"] = 134,
					["name"] = "Revel in Pain",
					["icon"] = 1344647,
					["spellID"] = 272983,
				}, -- [1]
				{
					["azeritePowerID"] = 160,
					["name"] = "Infernal Armor",
					["icon"] = 1344649,
					["spellID"] = 273236,
				}, -- [2]
				{
					["azeritePowerID"] = 221,
					["name"] = "Rigid Carapace",
					["icon"] = 1344645,
					["spellID"] = 275350,
				}, -- [3]
				{
					["azeritePowerID"] = 246,
					["name"] = "Hour of Reaping",
					["icon"] = 615099,
					["spellID"] = 288878,
				}, -- [4]
				{
					["azeritePowerID"] = 354,
					["name"] = "Cycle of Binding",
					["icon"] = 1344652,
					["spellID"] = 278502,
				}, -- [5]
				{
					["azeritePowerID"] = 355,
					["name"] = "Essence Sever",
					["icon"] = 1344648,
					["spellID"] = 278501,
				}, -- [6]
			},
		}, -- [12]
	},
	["defensive"] = {
		{
			{
				["azeritePowerID"] = 476,
				["name"] = "Moment of Glory",
				["icon"] = 132351,
				["spellID"] = 280023,
			}, -- [1]
			{
				["azeritePowerID"] = 477,
				["name"] = "Bury the Hatchet",
				["icon"] = 132342,
				["spellID"] = 280128,
			}, -- [2]
			{
				["azeritePowerID"] = 554,
				["name"] = "Intimidating Presence",
				["icon"] = 132126,
				["spellID"] = 288641,
			}, -- [3]
		}, -- [1]
		{
			{
				["azeritePowerID"] = 206,
				["name"] = "Stalwart Protector",
				["icon"] = 524354,
				["spellID"] = 274388,
			}, -- [1]
			{
				["azeritePowerID"] = 471,
				["name"] = "Gallant Steed",
				["icon"] = 1360759,
				["spellID"] = 280017,
			}, -- [2]
			{
				["azeritePowerID"] = 538,
				["name"] = "Empyreal Ward",
				["icon"] = 135928,
				["spellID"] = 287729,
			}, -- [3]
		}, -- [2]
		{
			{
				["azeritePowerID"] = 203,
				["name"] = "Shellshock",
				["icon"] = 132199,
				["spellID"] = 274355,
			}, -- [1]
			{
				["azeritePowerID"] = 469,
				["name"] = "Duck and Cover",
				["icon"] = 132293,
				["spellID"] = 280014,
			}, -- [2]
			{
				["azeritePowerID"] = 543,
				["name"] = "Nature's Salve",
				["icon"] = 1014024,
				["spellID"] = 287938,
			}, -- [3]
		}, -- [3]
		{
			{
				["azeritePowerID"] = 217,
				["name"] = "Footpad",
				["icon"] = 132307,
				["spellID"] = 274692,
			}, -- [1]
			{
				["azeritePowerID"] = 473,
				["name"] = "Shrouded Mantle",
				["icon"] = 136177,
				["spellID"] = 280020,
			}, -- [2]
			{
				["azeritePowerID"] = 548,
				["name"] = "Lying In Wait",
				["icon"] = 132301,
				["spellID"] = 288079,
			}, -- [3]
		}, -- [4]
		{
			{
				["azeritePowerID"] = 204,
				["name"] = "Sanctum",
				["icon"] = 135994,
				["spellID"] = 274366,
			}, -- [1]
			{
				["azeritePowerID"] = 472,
				["name"] = "Twist Magic",
				["icon"] = 136066,
				["spellID"] = 280018,
			}, -- [2]
			{
				["azeritePowerID"] = 537,
				["name"] = "Death Denied",
				["icon"] = 463835,
				["spellID"] = 287717,
			}, -- [3]
		}, -- [5]
		{
			{
				["azeritePowerID"] = 201,
				["name"] = "Runic Barrier",
				["icon"] = 136120,
				["spellID"] = 280010,
			}, -- [1]
			{
				["azeritePowerID"] = 465,
				["name"] = "March of the Damned",
				["icon"] = 237561,
				["spellID"] = 280011,
			}, -- [2]
			{
				["azeritePowerID"] = 549,
				["name"] = "Cold Hearted",
				["icon"] = 237525,
				["spellID"] = 288424,
			}, -- [3]
		}, -- [6]
		{
			{
				["azeritePowerID"] = 207,
				["name"] = "Serene Spirit",
				["icon"] = 538565,
				["spellID"] = 274412,
			}, -- [1]
			{
				["azeritePowerID"] = 474,
				["name"] = "Pack Spirit",
				["icon"] = 136095,
				["spellID"] = 280021,
			}, -- [2]
			{
				["azeritePowerID"] = 539,
				["name"] = "Ancient Ankh Talisman",
				["icon"] = 133439,
				["spellID"] = 287774,
			}, -- [3]
		}, -- [7]
		{
			{
				["azeritePowerID"] = 205,
				["name"] = "Eldritch Warding",
				["icon"] = 135991,
				["spellID"] = 274379,
			}, -- [1]
			{
				["azeritePowerID"] = 468,
				["name"] = "Cauterizing Blink",
				["icon"] = 135736,
				["spellID"] = 280015,
			}, -- [2]
			{
				["azeritePowerID"] = 546,
				["name"] = "Quick Thinking",
				["icon"] = 135754,
				["spellID"] = 288121,
			}, -- [3]
		}, -- [8]
		{
			{
				["azeritePowerID"] = 208,
				["name"] = "Lifeblood",
				["icon"] = 538745,
				["spellID"] = 274418,
			}, -- [1]
			{
				["azeritePowerID"] = 475,
				["name"] = "Desperate Power",
				["icon"] = 136169,
				["spellID"] = 280022,
			}, -- [2]
			{
				["azeritePowerID"] = 531,
				["name"] = "Terror of the Mind",
				["icon"] = 136183,
				["spellID"] = 287822,
			}, -- [3]
		}, -- [9]
		{
			{
				["azeritePowerID"] = 218,
				["name"] = "Strength of Spirit",
				["icon"] = 606546,
				["spellID"] = 274762,
			}, -- [1]
			{
				["azeritePowerID"] = 470,
				["name"] = "Sweep the Leg",
				["icon"] = 642414,
				["spellID"] = 280016,
			}, -- [2]
			{
				["azeritePowerID"] = 566,
				["name"] = "Exit Strategy",
				["icon"] = 574574,
				["spellID"] = 289322,
			}, -- [3]
		}, -- [10]
		{
			{
				["azeritePowerID"] = 219,
				["name"] = "Reawakening",
				["icon"] = 136080,
				["spellID"] = 274813,
			}, -- [1]
			{
				["azeritePowerID"] = 467,
				["name"] = "Ursoc's Endurance",
				["icon"] = 136097,
				["spellID"] = 280013,
			}, -- [2]
			{
				["azeritePowerID"] = 540,
				["name"] = "Switch Hitter",
				["icon"] = 135879,
				["spellID"] = 287803,
			}, -- [3]
		}, -- [11]
		{
			{
				["azeritePowerID"] = 202,
				["name"] = "Soulmonger",
				["icon"] = 1305158,
				["spellID"] = 274344,
			}, -- [1]
			{
				["azeritePowerID"] = 466,
				["name"] = "Burning Soul",
				["icon"] = 828455,
				["spellID"] = 280012,
			}, -- [2]
			{
				["azeritePowerID"] = 564,
				["name"] = "Thrive in Chaos",
				["icon"] = 1392554,
				["spellID"] = 288973,
			}, -- [3]
		}, -- [12]
		["common"] = {
			{
				["azeritePowerID"] = 14,
				["name"] = "Longstrider",
				["icon"] = 538536,
				["spellID"] = 268594,
			}, -- [1]
			{
				["azeritePowerID"] = 15,
				["name"] = "Resounding Protection",
				["icon"] = 1769069,
				["spellID"] = 263962,
			}, -- [2]
			{
				["azeritePowerID"] = 44,
				["name"] = "Vampiric Speed",
				["icon"] = 237395,
				["spellID"] = 268599,
			}, -- [3]
			{
				["azeritePowerID"] = 83,
				["name"] = "Impassive Visage",
				["icon"] = 1387707,
				["spellID"] = 268437,
			}, -- [4]
			{
				["azeritePowerID"] = 84,
				["name"] = "Bulwark of the Masses",
				["icon"] = 651746,
				["spellID"] = 268595,
			}, -- [5]
			{
				["azeritePowerID"] = 85,
				["name"] = "Gemhide",
				["icon"] = 1686575,
				["spellID"] = 268596,
			}, -- [6]
			{
				["azeritePowerID"] = 86,
				["name"] = "Azerite Fortification",
				["icon"] = 646669,
				["spellID"] = 268435,
			}, -- [7]
			{
				["azeritePowerID"] = 87,
				["name"] = "Self Reliance",
				["icon"] = 413591,
				["spellID"] = 268600,
			}, -- [8]
		},
	},
	["role"] = {
		["tank"] = {
			{
				["azeritePowerID"] = 43,
				["name"] = "Winds of War",
				["icon"] = 1029596,
				["spellID"] = 267671,
			}, -- [1]
			{
				["azeritePowerID"] = 89,
				["name"] = "Azerite Veins",
				["icon"] = 1129419,
				["spellID"] = 267683,
			}, -- [2]
			{
				["azeritePowerID"] = 98,
				["name"] = "Crystalline Carapace",
				["icon"] = 134978,
				["spellID"] = 271536,
			}, -- [3]
			{
				["azeritePowerID"] = 99,
				["name"] = "Ablative Shielding",
				["icon"] = 645224,
				["spellID"] = 271540,
			}, -- [4]
			{
				["azeritePowerID"] = 100,
				["name"] = "Strength in Numbers",
				["icon"] = 136031,
				["spellID"] = 271546,
			}, -- [5]
			{
				["azeritePowerID"] = 101,
				["name"] = "Shimmering Haven",
				["icon"] = 1323035,
				["spellID"] = 271557,
			}, -- [6]
		},
		["nonhealer"] = {
			{
				["azeritePowerID"] = 21,
				["name"] = "Elemental Whirl",
				["icon"] = 1029585,
				["spellID"] = 263984,
			}, -- [1]
			{
				["azeritePowerID"] = 30,
				["name"] = "Overwhelming Power",
				["icon"] = 252174,
				["spellID"] = 266180,
			}, -- [2]
			{
				["azeritePowerID"] = 31,
				["name"] = "Gutripper",
				["icon"] = 132109,
				["spellID"] = 266937,
			}, -- [3]
			{
				["azeritePowerID"] = 462,
				["name"] = "Azerite Globules",
				["icon"] = 646670,
				["spellID"] = 266936,
			}, -- [4]
		},
		["healer"] = {
			{
				["azeritePowerID"] = 19,
				["name"] = "Woundbinder",
				["icon"] = 463526,
				["spellID"] = 267880,
			}, -- [1]
			{
				["azeritePowerID"] = 42,
				["name"] = "Savior",
				["icon"] = 413576,
				["spellID"] = 267883,
			}, -- [2]
			{
				["azeritePowerID"] = 103,
				["name"] = "Concentrated Mending",
				["icon"] = 970412,
				["spellID"] = 267882,
			}, -- [3]
			{
				["azeritePowerID"] = 104,
				["name"] = "Bracing Chill",
				["icon"] = 236832,
				["spellID"] = 267884,
			}, -- [4]
			{
				["azeritePowerID"] = 105,
				["name"] = "Ephemeral Recovery",
				["icon"] = 133020,
				["spellID"] = 267886,
			}, -- [5]
			{
				["azeritePowerID"] = 463,
				["name"] = "Blessed Portents",
				["icon"] = 135905,
				["spellID"] = 267889,
			}, -- [6]
		},
		["common"] = {
			{
				["azeritePowerID"] = 18,
				["name"] = "Blood Siphon",
				["icon"] = 538560,
				["spellID"] = 264108,
			}, -- [1]
			{
				["azeritePowerID"] = 20,
				["name"] = "Lifespeed",
				["icon"] = 236166,
				["spellID"] = 267665,
			}, -- [2]
			{
				["azeritePowerID"] = 22,
				["name"] = "Heed My Call",
				["icon"] = 237589,
				["spellID"] = 263987,
			}, -- [3]
			{
				["azeritePowerID"] = 38,
				["name"] = "On My Way",
				["icon"] = 132565,
				["spellID"] = 267879,
			}, -- [4]
			{
				["azeritePowerID"] = 459,
				["name"] = "Unstable Flames",
				["icon"] = 514016,
				["spellID"] = 279899,
			}, -- [5]
			{
				["azeritePowerID"] = 461,
				["name"] = "Earthlink",
				["icon"] = 2065623,
				["spellID"] = 279926,
			}, -- [6]
		},
	},
	["raid"] = {
		{
			["azeritePowerID"] = 483,
			["name"] = "Archive of the Titans",
			["icon"] = 2000853,
			["spellID"] = 280555,
		}, -- [1]
		{
			["azeritePowerID"] = 485,
			["name"] = "Laser Matrix",
			["icon"] = 136039,
			["spellID"] = 280559,
		}, -- [2]
		{
			["azeritePowerID"] = 560,
			["name"] = "Bonded Souls",
			["icon"] = 895888,
			["spellID"] = 288802,
		}, -- [3]
		{
			["azeritePowerID"] = 561,
			["name"] = "Seductive Power",
			["icon"] = 2442247,
			["spellID"] = 288749,
		}, -- [4]
		{
			["azeritePowerID"] = 562,
			["name"] = "Treacherous Covenant",
			["icon"] = 1778226,
			["spellID"] = 288953,
		}, -- [5]
		{
			["azeritePowerID"] = 575,
			["name"] = "Undulating Tides",
			["icon"] = 1698701,
			["spellID"] = 303008,
		}, -- [6]
		{
			["azeritePowerID"] = 576,
			["name"] = "Loyal to the End",
			["icon"] = 136159,
			["spellID"] = 303007,
		}, -- [7]
		{
			["azeritePowerID"] = 577,
			["name"] = "Arcane Heart",
			["icon"] = 1391778,
			["spellID"] = 303006,
		}, -- [8]
	},
	["zone"] = {
		{
			["azeritePowerID"] = 82,
			["name"] = "Champion of Azeroth",
			["icon"] = 135885,
			["spellID"] = 280710,
		}, -- [1]
		{
			["azeritePowerID"] = 156,
			["name"] = "Ruinous Bolt",
			["icon"] = 135780,
			["spellID"] = 273150,
		}, -- [2]
		{
			["azeritePowerID"] = 157,
			["name"] = "Rezan's Fury",
			["icon"] = 2011133,
			["spellID"] = 273790,
		}, -- [3]
		{
			["azeritePowerID"] = 192,
			["name"] = "Meticulous Scheming",
			["icon"] = 132299,
			["spellID"] = 273682,
		}, -- [4]
		{
			["azeritePowerID"] = 193,
			["name"] = "Blightborne Infusion",
			["icon"] = 1778229,
			["spellID"] = 273823,
		}, -- [5]
		{
			["azeritePowerID"] = 194,
			["name"] = "Filthy Transfusion",
			["icon"] = 840409,
			["spellID"] = 273834,
		}, -- [6]
		{
			["azeritePowerID"] = 195,
			["name"] = "Secrets of the Deep",
			["icon"] = 463858,
			["spellID"] = 273829,
		}, -- [7]
		{
			["azeritePowerID"] = 196,
			["name"] = "Swirling Sands",
			["icon"] = 796638,
			["spellID"] = 280429,
		}, -- [8]
		{
			["azeritePowerID"] = 478,
			["name"] = "Tidal Surge",
			["icon"] = 1698701,
			["spellID"] = 280402,
		}, -- [9]
		{
			["azeritePowerID"] = 479,
			["name"] = "Dagger in the Back",
			["icon"] = 135642,
			["spellID"] = 280284,
		}, -- [10]
		{
			["azeritePowerID"] = 480,
			["name"] = "Blood Rite",
			["icon"] = 463568,
			["spellID"] = 280407,
		}, -- [11]
		{
			["azeritePowerID"] = 481,
			["name"] = "Incite the Pack",
			["icon"] = 132193,
			["spellID"] = 280410,
		}, -- [12]
		{
			["azeritePowerID"] = 482,
			["name"] = "Thunderous Blast",
			["icon"] = 839983,
			["spellID"] = 280380,
		}, -- [13]
		{
			["azeritePowerID"] = 504,
			["name"] = "Unstable Catalyst",
			["icon"] = 2032578,
			["spellID"] = 281514,
		}, -- [14]
		{
			["azeritePowerID"] = 505,
			["name"] = "Tradewinds",
			["icon"] = 1029595,
			["spellID"] = 281841,
		}, -- [15]
		{
			["azeritePowerID"] = 521,
			["name"] = "Shadow of Elune",
			["icon"] = 135900,
			["spellID"] = 287467,
		}, -- [16]
		{
			["azeritePowerID"] = 522,
			["name"] = "Ancients' Bulwark",
			["icon"] = 874580,
			["spellID"] = 287604,
		}, -- [17]
		{
			["azeritePowerID"] = 523,
			["name"] = "Apothecary's Concoctions",
			["icon"] = 463547,
			["spellID"] = 287631,
		}, -- [18]
		{
			["azeritePowerID"] = 526,
			["name"] = "Endless Hunger",
			["icon"] = 2357388,
			["spellID"] = 287662,
		}, -- [19]
		{
			["azeritePowerID"] = 569,
			["name"] = "Clockwork Heart",
			["icon"] = 134377,
			["spellID"] = 300170,
		}, -- [20]
	},
	["profession"] = {
		{
			["azeritePowerID"] = 498,
			["name"] = "Barrage Of Many Bombs",
			["icon"] = 463515,
			["spellID"] = 280163,
		}, -- [1]
		{
			["azeritePowerID"] = 499,
			["name"] = "Ricocheting Inflatable Pyrosaw",
			["icon"] = 134427,
			["spellID"] = 280168,
		}, -- [2]
		{
			["azeritePowerID"] = 500,
			["name"] = "Synaptic Spark Capacitor",
			["icon"] = 1320373,
			["spellID"] = 280174,
		}, -- [3]
		{
			["azeritePowerID"] = 501,
			["name"] = "Relational Normalization Gizmo",
			["icon"] = 133873,
			["spellID"] = 280178,
		}, -- [4]
		{
			["azeritePowerID"] = 502,
			["name"] = "Personal Absorb-o-Tron",
			["icon"] = 1336885,
			["spellID"] = 280181,
		}, -- [5]
		{
			["azeritePowerID"] = 503,
			["name"] = "Auto-Self-Cauterizer",
			["icon"] = 514950,
			["spellID"] = 280172,
		}, -- [6]
		{
			["azeritePowerID"] = 568,
			["name"] = "Person-Computer Interface",
			["icon"] = 2115322,
			["spellID"] = 300168,
		}, -- [7]
	},
	["pvp"] = {
		{
			["azeritePowerID"] = 486,
			["name"] = "Glory in Battle",
			["icon"] = 1028980,
			["spellID"] = 280577,
		}, -- [1]
		{
			["azeritePowerID"] = 487,
			["name"] = "Retaliatory Fury",
			["icon"] = 1035504,
			["spellID"] = 280579,
		}, -- [2]
		{
			["azeritePowerID"] = 488,
			["name"] = "Battlefield Focus",
			["icon"] = 236646,
			["spellID"] = 280582,
		}, -- [3]
		{
			["azeritePowerID"] = 489,
			["name"] = "Sylvanas' Resolve",
			["icon"] = 236560,
			["spellID"] = 280598,
		}, -- [4]
		{
			["azeritePowerID"] = 490,
			["name"] = "Combined Might",
			["icon"] = 236324,
			["spellID"] = 280580,
		}, -- [5]
		{
			["azeritePowerID"] = 491,
			["name"] = "Collective Will",
			["icon"] = 136003,
			["spellID"] = 280581,
		}, -- [6]
		{
			["azeritePowerID"] = 492,
			["name"] = "Liberator's Might",
			["icon"] = 1028984,
			["spellID"] = 280623,
		}, -- [7]
		{
			["azeritePowerID"] = 493,
			["name"] = "Last Gift",
			["icon"] = 236478,
			["spellID"] = 280624,
		}, -- [8]
		{
			["azeritePowerID"] = 494,
			["name"] = "Battlefield Precision",
			["icon"] = 132486,
			["spellID"] = 280627,
		}, -- [9]
		{
			["azeritePowerID"] = 495,
			["name"] = "Anduin's Dedication",
			["icon"] = 1042294,
			["spellID"] = 280628,
		}, -- [10]
		{
			["azeritePowerID"] = 496,
			["name"] = "Stronger Together",
			["icon"] = 2022762,
			["spellID"] = 280625,
		}, -- [11]
		{
			["azeritePowerID"] = 497,
			["name"] = "Stand As One",
			["icon"] = 236344,
			["spellID"] = 280626,
		}, -- [12]
		{
			["azeritePowerID"] = 541,
			["name"] = "Fight or Flight",
			["icon"] = 236310,
			["spellID"] = 287818,
		}, -- [13]
	},
},
n.sourceData = sourceData
-- 8.2 Azerite Essences
local essenceData = {
	["common"] = {
		{
			["name"] = "Worldvein Resonance",
			["icon"] = 1830317,
			["essenceID"] = 4,
		}, -- [1]
		{
			["name"] = "The Crucible of Flame",
			["icon"] = 3015740,
			["essenceID"] = 12,
		}, -- [2]
		{
			["name"] = "Ripple in Space",
			["icon"] = 2967109,
			["essenceID"] = 15,
		}, -- [3]
		{
			["name"] = "Vision of Perfection",
			["icon"] = 3015743,
			["essenceID"] = 22,
		}, -- [4]
		{
			["name"] = "Memory of Lucid Dreams",
			["icon"] = 2967104,
			["essenceID"] = 27,
		}, -- [5]
		{
			["name"] = "Conflict and Strife",
			["icon"] = 3015742,
			["essenceID"] = 32,
		}, -- [6]
	},
	["tank"] = {
		{
			["name"] = "Azeroth's Undying Gift",
			["icon"] = 2967107,
			["essenceID"] = 2,
		}, -- [1]
		{
			["name"] = "Sphere of Suppression",
			["icon"] = 2065602,
			["essenceID"] = 3,
		}, -- [2]
		{
			["name"] = "Anima of Life and Death",
			["icon"] = 2967105,
			["essenceID"] = 7,
		}, -- [3]
		{
			["name"] = "Nullification Dynamo",
			["icon"] = 3015741,
			["essenceID"] = 13,
		}, -- [4]
		{
			["name"] = "Aegis of the Deep",
			["icon"] = 2967110,
			["essenceID"] = 25,
		}, -- [5]
	},
	["healer"] = {
		{
			["name"] = "The Ever-Rising Tide",
			["icon"] = 2967108,
			["essenceID"] = 17,
		}, -- [1]
		{
			["name"] = "Artifice of Time",
			["icon"] = 2967112,
			["essenceID"] = 18,
		}, -- [2]
		{
			["name"] = "The Well of Existence",
			["icon"] = 516796,
			["essenceID"] = 19,
		}, -- [3]
		{
			["name"] = "Life-Binder's Invocation",
			["icon"] = 2967106,
			["essenceID"] = 20,
		}, -- [4]
		{
			["name"] = "Vitality Conduit",
			["icon"] = 2967100,
			["essenceID"] = 21,
		}, -- [5]
	},
	["damager"] = {
		{
			["name"] = "Essence of the Focusing Iris",
			["icon"] = 2967111,
			["essenceID"] = 5,
		}, -- [1]
		{
			["name"] = "Purification Protocol",
			["icon"] = 2967103,
			["essenceID"] = 6,
		}, -- [2]
		{
			["name"] = "Condensed Life-Force",
			["icon"] = 2967113,
			["essenceID"] = 14,
		}, -- [3]
		{
			["name"] = "Blood of the Enemy",
			["icon"] = 2032580,
			["essenceID"] = 23,
		}, -- [4]
		{
			["name"] = "The Unbound Force",
			["icon"] = 2967102,
			["essenceID"] = 28,
		}, -- [5]
	},
},
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