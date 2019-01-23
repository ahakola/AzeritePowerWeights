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
			[13] = 0.12, -- Azerite Empowered
			[18] = 2.27, -- Blood Siphon
			[20] = 2.38, -- Lifespeed
			[21] = 2.58, -- Elemental Whirl
			[22] = 3.54, -- Heed My Call
			[30] = 4.56, -- Overwhelming Power
			[31] = 3.81, -- Gutripper
			[43] = 0.03, -- Winds of War
			[44] = 0.11, -- Vampiric Speed
			[82] = 8.49, -- Champion of Azeroth
			[83] = 0.06, -- Impassive Visage
			[84] = 0.06, -- Bulwark of the Masses
			[85] = 0.03, -- Gemhide
			[89] = 0.13, -- Azerite Veins
			[99] = 0.18, -- Ablative Shielding
			[101] = 0.07, -- Shimmering Haven
			[156] = 4.74, -- Ruinous Bolt
			[157] = 7.95, -- Rezan's Fury
			[174] = 7.08, -- Gathering Storm
			[192] = 6.21, -- Meticulous Scheming
			[193] = 8.34, -- Blightborne Infusion
			[194] = 7.02, -- Filthy Transfusion
			[195] = 6.07, -- Secrets of the Deep
			[196] = 7.29, -- Swirling Sands
			[226] = 7.64, -- Test of Might
			[433] = 5.30, -- Seismic Wave
			[434] = 10.00, -- Crushing Assault
			[435] = 6.18, -- Lord of War
			[459] = 2.85, -- Unstable Flames
			[461] = 2.02, -- Earthlink
			[462] = 2.28, -- Azerite Globules
			[476] = 0.17, -- Moment of Glory
			[477] = 0.02, -- Bury the Hatchet
			[478] = 8.09, -- Tidal Surge
			[479] = 8.72, -- Dagger in the Back
			[480] = 4.82, -- Blood Rite
			[481] = 5.42, -- Incite the Pack
			[482] = 6.61, -- Thunderous Blast
			[483] = 6.28, -- Archive of the Titans
			[485] = 6.98, -- Laser Matrix
			[492] = 4.97, -- Liberator's Might
			[494] = 7.79, -- Battlefield Precision
			[495] = 5.69, -- Anduin's Dedication
			[496] = 1.38, -- Stronger Together
			[497] = 1.54, -- Stand As One
			[498] = 4.98, -- Barrage Of Many Bombs
			[499] = 3.00, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.20, -- Synaptic Spark Capacitor
			[501] = 6.54, -- Relational Normalization Gizmo
			[503] = 0.01, -- Auto-Self-Cauterizer
			[504] = 6.61, -- Unstable Catalyst
			[505] = 5.73, -- Tradewinds
			[522] = 0.05, -- Ancients' Bulwark
			[523] = 0.04, -- Apothecary's Concoctions
			[526] = 0.14, -- Endless Hunger
			[541] = 0.01, -- Fight or Flight
			[550] = 0.02, -- Striking the Anvil
			[554] = 0.16, -- Intimidating Presence
			[561] = 0.02, -- Seductive Power
			[562] = 0.03, -- Treacherous Covenant
		})

		-- Fury
		insertDefaultScalesData(defaultName, 1, 2, {
			[13] = 0.09, -- Azerite Empowered
			[18] = 2.39, -- Blood Siphon
			[20] = 2.87, -- Lifespeed
			[21] = 2.80, -- Elemental Whirl
			[22] = 4.39, -- Heed My Call
			[30] = 6.47, -- Overwhelming Power
			[31] = 4.50, -- Gutripper
			[43] = 0.12, -- Winds of War
			[44] = 0.16, -- Vampiric Speed
			[82] = 9.18, -- Champion of Azeroth
			[83] = 0.04, -- Impassive Visage
			[84] = 0.08, -- Bulwark of the Masses
			[87] = 0.03, -- Self Reliance
			[99] = 0.05, -- Ablative Shielding
			[100] = 0.04, -- Strength in Numbers
			[101] = 0.06, -- Shimmering Haven
			[156] = 4.63, -- Ruinous Bolt
			[157] = 9.30, -- Rezan's Fury
			[192] = 7.20, -- Meticulous Scheming
			[193] = 7.55, -- Blightborne Infusion
			[194] = 8.29, -- Filthy Transfusion
			[195] = 5.70, -- Secrets of the Deep
			[196] = 6.82, -- Swirling Sands
			[229] = 7.12, -- Pulverizing Blows
			[437] = 10.00, -- Simmering Rage
			[438] = 2.52, -- Reckless Flurry
			[451] = 5.97, -- Infinite Fury
			[459] = 2.70, -- Unstable Flames
			[461] = 1.96, -- Earthlink
			[462] = 2.71, -- Azerite Globules
			[477] = 0.10, -- Bury the Hatchet
			[478] = 7.85, -- Tidal Surge
			[479] = 8.79, -- Dagger in the Back
			[480] = 5.71, -- Blood Rite
			[481] = 6.30, -- Incite the Pack
			[482] = 8.10, -- Thunderous Blast
			[483] = 6.33, -- Archive of the Titans
			[485] = 8.55, -- Laser Matrix
			[492] = 5.27, -- Liberator's Might
			[493] = 0.19, -- Last Gift
			[494] = 9.24, -- Battlefield Precision
			[495] = 5.77, -- Anduin's Dedication
			[496] = 1.33, -- Stronger Together
			[497] = 1.58, -- Stand As One
			[498] = 6.13, -- Barrage Of Many Bombs
			[499] = 3.72, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.06, -- Synaptic Spark Capacitor
			[501] = 6.72, -- Relational Normalization Gizmo
			[502] = 0.07, -- Personal Absorb-o-Tron
			[504] = 6.46, -- Unstable Catalyst
			[505] = 6.72, -- Tradewinds
			[521] = 0.09, -- Shadow of Elune
			[522] = 0.14, -- Ancients' Bulwark
			[526] = 0.03, -- Endless Hunger
			[541] = 0.01, -- Fight or Flight
			[545] = 0.07, -- Cold Steel, Hot Blood
			[554] = 0.03, -- Intimidating Presence
			[560] = 0.09, -- Bonded Souls
			[561] = 0.06, -- Seductive Power
			[562] = 0.07, -- Treacherous Covenant
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
			[13] = 0.04, -- Azerite Empowered
			[14] = 0.11, -- Longstrider
			[15] = 0.08, -- Resounding Protection
			[18] = 1.50, -- Blood Siphon
			[19] = 0.10, -- Woundbinder
			[20] = 1.81, -- Lifespeed
			[21] = 1.90, -- Elemental Whirl
			[22] = 3.64, -- Heed My Call
			[30] = 3.44, -- Overwhelming Power
			[31] = 4.00, -- Gutripper
			[38] = 1.62, -- On My Way
			[42] = 0.06, -- Savior
			[43] = 0.07, -- Winds of War
			[82] = 6.06, -- Champion of Azeroth
			[86] = 0.08, -- Azerite Fortification
			[87] = 0.11, -- Self Reliance
			[89] = 0.09, -- Azerite Veins
			[98] = 0.02, -- Crystalline Carapace
			[99] = 0.11, -- Ablative Shielding
			[101] = 0.05, -- Shimmering Haven
			[105] = 0.10, -- Ephemeral Recovery
			[125] = 3.35, -- Avenger's Might
			[133] = 0.11, -- Bulwark of Light
			[143] = 0.09, -- Inspiring Beacon
			[148] = 0.03, -- Righteous Flames
			[150] = 1.63, -- Soaring Shield
			[156] = 4.91, -- Ruinous Bolt
			[157] = 8.47, -- Rezan's Fury
			[192] = 4.67, -- Meticulous Scheming
			[193] = 5.98, -- Blightborne Infusion
			[194] = 7.18, -- Filthy Transfusion
			[195] = 4.48, -- Secrets of the Deep
			[196] = 5.25, -- Swirling Sands
			[234] = 1.61, -- Inner Light
			[235] = 3.96, -- Indomitable Justice
			[393] = 0.05, -- Grace of the Justicar
			[395] = 10.00, -- Inspiring Vanguard
			[459] = 2.13, -- Unstable Flames
			[461] = 1.42, -- Earthlink
			[462] = 2.46, -- Azerite Globules
			[463] = 0.01, -- Blessed Portents
			[478] = 8.18, -- Tidal Surge
			[479] = 6.58, -- Dagger in the Back
			[480] = 3.66, -- Blood Rite
			[481] = 3.67, -- Incite the Pack
			[482] = 7.11, -- Thunderous Blast
			[483] = 4.75, -- Archive of the Titans
			[485] = 7.61, -- Laser Matrix
			[492] = 3.60, -- Liberator's Might
			[494] = 8.33, -- Battlefield Precision
			[495] = 4.43, -- Anduin's Dedication
			[496] = 1.02, -- Stronger Together
			[497] = 1.22, -- Stand As One
			[498] = 5.41, -- Barrage Of Many Bombs
			[499] = 3.22, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.46, -- Synaptic Spark Capacitor
			[501] = 4.91, -- Relational Normalization Gizmo
			[504] = 5.04, -- Unstable Catalyst
			[505] = 4.00, -- Tradewinds
			[521] = 0.01, -- Shadow of Elune
			[522] = 0.07, -- Ancients' Bulwark
			[526] = 0.06, -- Endless Hunger
			[538] = 0.01, -- Empyreal Ward
			[541] = 0.02, -- Fight or Flight
			[560] = 0.12, -- Bonded Souls
			[561] = 0.05, -- Seductive Power
		})
		insertDefaultScalesData(defensiveName, 2, 2, {
			[15] = 10.00, -- Resounding Protection
			[18] = 2.51, -- Blood Siphon
			[21] = 0.02, -- Elemental Whirl
			[38] = 0.02, -- On My Way
			[82] = 0.07, -- Champion of Azeroth
			[99] = 0.01, -- Ablative Shielding
			[101] = 0.01, -- Shimmering Haven
			[103] = 0.01, -- Concentrated Mending
			[125] = 0.09, -- Avenger's Might
			[144] = 0.01, -- Rejuvenating Grace
			[149] = 0.01, -- Healing Hammer
			[150] = 0.07, -- Soaring Shield
			[196] = 0.01, -- Swirling Sands
			[459] = 0.01, -- Unstable Flames
			[461] = 0.01, -- Earthlink
			[479] = 0.01, -- Dagger in the Back
			[481] = 0.14, -- Incite the Pack
			[485] = 0.01, -- Laser Matrix
			[492] = 0.01, -- Liberator's Might
			[494] = 0.01, -- Battlefield Precision
			[496] = 0.01, -- Stronger Together
			[497] = 0.01, -- Stand As One
			[505] = 0.14, -- Tradewinds
			[538] = 0.01, -- Empyreal Ward
		})

		-- Retribution
		insertDefaultScalesData(defaultName, 2, 3, {
			[13] = 0.04, -- Azerite Empowered
			[14] = 0.18, -- Longstrider
			[15] = 0.15, -- Resounding Protection
			[18] = 2.44, -- Blood Siphon
			[19] = 0.23, -- Woundbinder
			[20] = 2.87, -- Lifespeed
			[21] = 2.84, -- Elemental Whirl
			[22] = 3.96, -- Heed My Call
			[30] = 5.14, -- Overwhelming Power
			[31] = 4.25, -- Gutripper
			[38] = 2.45, -- On My Way
			[42] = 0.14, -- Savior
			[43] = 0.22, -- Winds of War
			[44] = 0.13, -- Vampiric Speed
			[82] = 9.00, -- Champion of Azeroth
			[83] = 0.19, -- Impassive Visage
			[84] = 0.18, -- Bulwark of the Masses
			[85] = 0.33, -- Gemhide
			[86] = 0.17, -- Azerite Fortification
			[87] = 0.31, -- Self Reliance
			[89] = 0.25, -- Azerite Veins
			[99] = 0.17, -- Ablative Shielding
			[100] = 0.18, -- Strength in Numbers
			[101] = 0.32, -- Shimmering Haven
			[103] = 0.26, -- Concentrated Mending
			[104] = 0.24, -- Bracing Chill
			[105] = 0.28, -- Ephemeral Recovery
			[125] = 6.14, -- Avenger's Might
			[143] = 0.20, -- Inspiring Beacon
			[144] = 0.21, -- Rejuvenating Grace
			[145] = 0.11, -- Fortifying Auras
			[148] = 0.23, -- Righteous Flames
			[149] = 0.13, -- Healing Hammer
			[154] = 8.12, -- Relentless Inquisitor
			[156] = 5.20, -- Ruinous Bolt
			[157] = 8.80, -- Rezan's Fury
			[187] = 6.62, -- Expurgation
			[192] = 7.17, -- Meticulous Scheming
			[193] = 8.09, -- Blightborne Infusion
			[194] = 7.93, -- Filthy Transfusion
			[195] = 6.57, -- Secrets of the Deep
			[196] = 6.73, -- Swirling Sands
			[206] = 0.22, -- Stalwart Protector
			[235] = 6.63, -- Indomitable Justice
			[393] = 0.10, -- Grace of the Justicar
			[454] = 0.10, -- Judicious Defense
			[459] = 3.25, -- Unstable Flames
			[461] = 2.36, -- Earthlink
			[462] = 2.52, -- Azerite Globules
			[463] = 0.25, -- Blessed Portents
			[471] = 0.15, -- Gallant Steed
			[478] = 8.46, -- Tidal Surge
			[479] = 10.00, -- Dagger in the Back
			[480] = 5.34, -- Blood Rite
			[481] = 5.82, -- Incite the Pack
			[482] = 7.23, -- Thunderous Blast
			[483] = 7.08, -- Archive of the Titans
			[485] = 7.51, -- Laser Matrix
			[492] = 5.15, -- Liberator's Might
			[493] = 0.15, -- Last Gift
			[494] = 7.94, -- Battlefield Precision
			[495] = 6.44, -- Anduin's Dedication
			[496] = 1.54, -- Stronger Together
			[497] = 1.89, -- Stand As One
			[498] = 5.57, -- Barrage Of Many Bombs
			[499] = 3.49, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.61, -- Synaptic Spark Capacitor
			[501] = 6.83, -- Relational Normalization Gizmo
			[502] = 0.20, -- Personal Absorb-o-Tron
			[503] = 0.06, -- Auto-Self-Cauterizer
			[504] = 6.95, -- Unstable Catalyst
			[505] = 6.17, -- Tradewinds
			[507] = 0.36, -- Empyrean Power
			[508] = 0.13, -- Light's Decree
			[521] = 0.16, -- Shadow of Elune
			[522] = 0.14, -- Ancients' Bulwark
			[523] = 0.17, -- Apothecary's Concoctions
			[526] = 0.22, -- Endless Hunger
			[538] = 0.15, -- Empyreal Ward
			[541] = 0.08, -- Fight or Flight
			[560] = 0.16, -- Bonded Souls
			[561] = 0.30, -- Seductive Power
			[562] = 0.23, -- Treacherous Covenant
		})

	-- Hunter
		-- Beast Mastery
		insertDefaultScalesData(defaultName, 3, 1, {
			[18] = 2.13, -- Blood Siphon
			[21] = 2.43, -- Elemental Whirl
			[22] = 3.02, -- Heed My Call
			[30] = 4.04, -- Overwhelming Power
			[31] = 3.15, -- Gutripper
			[82] = 7.70, -- Champion of Azeroth
			[83] = 0.01, -- Impassive Visage
			[84] = 0.12, -- Bulwark of the Masses
			[85] = 0.03, -- Gemhide
			[87] = 0.09, -- Self Reliance
			[107] = 4.76, -- Serrated Jaws
			[156] = 4.29, -- Ruinous Bolt
			[157] = 7.01, -- Rezan's Fury
			[161] = 6.47, -- Haze of Rage
			[192] = 5.75, -- Meticulous Scheming
			[193] = 7.11, -- Blightborne Infusion
			[194] = 5.92, -- Filthy Transfusion
			[195] = 5.71, -- Secrets of the Deep
			[196] = 5.99, -- Swirling Sands
			[211] = 4.41, -- Dance of Death
			[366] = 10.00, -- Primal Instincts
			[367] = 7.01, -- Feeding Frenzy
			[459] = 2.60, -- Unstable Flames
			[461] = 1.90, -- Earthlink
			[462] = 1.95, -- Azerite Globules
			[478] = 7.08, -- Tidal Surge
			[479] = 7.98, -- Dagger in the Back
			[480] = 4.40, -- Blood Rite
			[481] = 5.24, -- Incite the Pack
			[482] = 5.79, -- Thunderous Blast
			[483] = 5.95, -- Archive of the Titans
			[485] = 5.97, -- Laser Matrix
			[492] = 4.29, -- Liberator's Might
			[494] = 6.53, -- Battlefield Precision
			[495] = 5.56, -- Anduin's Dedication
			[496] = 1.24, -- Stronger Together
			[497] = 1.57, -- Stand As One
			[498] = 4.33, -- Barrage Of Many Bombs
			[499] = 2.62, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.79, -- Synaptic Spark Capacitor
			[501] = 5.95, -- Relational Normalization Gizmo
			[504] = 6.41, -- Unstable Catalyst
			[505] = 5.71, -- Tradewinds
			[521] = 0.13, -- Shadow of Elune
			[541] = 0.04, -- Fight or Flight
			[543] = 0.08, -- Nature's Salve
			[560] = 0.03, -- Bonded Souls
			[561] = 0.05, -- Seductive Power
		})

		-- Marksmanship
		insertDefaultScalesData(defaultName, 3, 2, {
			[13] = 0.05, -- Azerite Empowered
			[14] = 0.02, -- Longstrider
			[15] = 0.08, -- Resounding Protection
			[18] = 2.22, -- Blood Siphon
			[21] = 2.35, -- Elemental Whirl
			[22] = 3.03, -- Heed My Call
			[30] = 4.13, -- Overwhelming Power
			[31] = 3.35, -- Gutripper
			[36] = 10.00, -- In The Rhythm
			[44] = 0.04, -- Vampiric Speed
			[82] = 8.04, -- Champion of Azeroth
			[83] = 0.09, -- Impassive Visage
			[84] = 0.07, -- Bulwark of the Masses
			[85] = 0.20, -- Gemhide
			[86] = 0.11, -- Azerite Fortification
			[87] = 0.03, -- Self Reliance
			[156] = 4.60, -- Ruinous Bolt
			[157] = 7.24, -- Rezan's Fury
			[192] = 5.80, -- Meticulous Scheming
			[193] = 6.97, -- Blightborne Infusion
			[194] = 6.43, -- Filthy Transfusion
			[195] = 5.26, -- Secrets of the Deep
			[196] = 6.09, -- Swirling Sands
			[203] = 0.18, -- Shellshock
			[212] = 9.86, -- Unerring Vision
			[368] = 4.24, -- Steady Aim
			[369] = 0.12, -- Rapid Reload
			[370] = 7.48, -- Focused Fire
			[459] = 2.27, -- Unstable Flames
			[461] = 1.96, -- Earthlink
			[462] = 2.23, -- Azerite Globules
			[478] = 7.59, -- Tidal Surge
			[479] = 8.22, -- Dagger in the Back
			[480] = 4.75, -- Blood Rite
			[481] = 4.92, -- Incite the Pack
			[482] = 6.16, -- Thunderous Blast
			[483] = 5.61, -- Archive of the Titans
			[485] = 6.33, -- Laser Matrix
			[492] = 4.74, -- Liberator's Might
			[493] = 0.14, -- Last Gift
			[494] = 7.15, -- Battlefield Precision
			[495] = 5.07, -- Anduin's Dedication
			[496] = 1.39, -- Stronger Together
			[497] = 1.47, -- Stand As One
			[498] = 4.66, -- Barrage Of Many Bombs
			[499] = 2.76, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.27, -- Synaptic Spark Capacitor
			[501] = 5.75, -- Relational Normalization Gizmo
			[502] = 0.19, -- Personal Absorb-o-Tron
			[504] = 5.77, -- Unstable Catalyst
			[505] = 5.39, -- Tradewinds
			[521] = 0.20, -- Shadow of Elune
			[523] = 0.08, -- Apothecary's Concoctions
			[526] = 0.05, -- Endless Hunger
			[528] = 0.03, -- Surging Shots
			[541] = 0.17, -- Fight or Flight
			[543] = 0.08, -- Nature's Salve
			[560] = 0.04, -- Bonded Souls
			[562] = 0.27, -- Treacherous Covenant
		})

		-- Survival
		insertDefaultScalesData(defaultName, 3, 3, {
			[14] = 0.04, -- Longstrider
			[18] = 1.11, -- Blood Siphon
			[21] = 1.47, -- Elemental Whirl
			[22] = 2.08, -- Heed My Call
			[30] = 3.17, -- Overwhelming Power
			[31] = 2.32, -- Gutripper
			[82] = 4.91, -- Champion of Azeroth
			[107] = 3.07, -- Serrated Jaws
			[110] = 2.01, -- Wildfire Cluster
			[156] = 2.70, -- Ruinous Bolt
			[157] = 4.89, -- Rezan's Fury
			[163] = 6.39, -- Latent Poison
			[192] = 3.77, -- Meticulous Scheming
			[193] = 4.43, -- Blightborne Infusion
			[194] = 4.27, -- Filthy Transfusion
			[195] = 3.94, -- Secrets of the Deep
			[196] = 3.93, -- Swirling Sands
			[213] = 3.82, -- Venomous Fangs
			[371] = 10.00, -- Blur of Talons
			[372] = 8.43, -- Wilderness Survival
			[459] = 1.54, -- Unstable Flames
			[461] = 1.31, -- Earthlink
			[462] = 1.38, -- Azerite Globules
			[478] = 4.72, -- Tidal Surge
			[479] = 5.54, -- Dagger in the Back
			[480] = 3.32, -- Blood Rite
			[481] = 2.63, -- Incite the Pack
			[482] = 4.02, -- Thunderous Blast
			[483] = 4.11, -- Archive of the Titans
			[485] = 4.18, -- Laser Matrix
			[492] = 2.90, -- Liberator's Might
			[494] = 4.79, -- Battlefield Precision
			[495] = 3.85, -- Anduin's Dedication
			[496] = 0.71, -- Stronger Together
			[497] = 0.95, -- Stand As One
			[498] = 3.03, -- Barrage Of Many Bombs
			[499] = 1.94, -- Ricocheting Inflatable Pyrosaw
			[500] = 2.46, -- Synaptic Spark Capacitor
			[501] = 4.29, -- Relational Normalization Gizmo
			[504] = 4.42, -- Unstable Catalyst
			[505] = 2.98, -- Tradewinds
		})

	-- Rogue
		-- Assassination
		insertDefaultScalesData(defaultName, 4, 1, {
			[14] = 0.03, -- Longstrider
			[15] = 0.09, -- Resounding Protection
			[18] = 2.41, -- Blood Siphon
			[21] = 2.68, -- Elemental Whirl
			[22] = 3.32, -- Heed My Call
			[30] = 4.67, -- Overwhelming Power
			[31] = 3.83, -- Gutripper
			[82] = 8.43, -- Champion of Azeroth
			[83] = 0.13, -- Impassive Visage
			[84] = 0.16, -- Bulwark of the Masses
			[85] = 0.06, -- Gemhide
			[86] = 0.26, -- Azerite Fortification
			[87] = 0.06, -- Self Reliance
			[136] = 10.00, -- Double Dose
			[156] = 4.57, -- Ruinous Bolt
			[157] = 7.74, -- Rezan's Fury
			[181] = 7.49, -- Twist the Knife
			[192] = 4.55, -- Meticulous Scheming
			[193] = 8.26, -- Blightborne Infusion
			[194] = 6.59, -- Filthy Transfusion
			[195] = 6.38, -- Secrets of the Deep
			[196] = 7.26, -- Swirling Sands
			[217] = 0.10, -- Footpad
			[406] = 4.53, -- Scent of Blood
			[408] = 1.55, -- Shrouded Suffocation
			[459] = 2.89, -- Unstable Flames
			[461] = 2.12, -- Earthlink
			[462] = 2.44, -- Azerite Globules
			[478] = 7.43, -- Tidal Surge
			[479] = 8.84, -- Dagger in the Back
			[480] = 4.94, -- Blood Rite
			[481] = 5.32, -- Incite the Pack
			[482] = 6.39, -- Thunderous Blast
			[483] = 6.59, -- Archive of the Titans
			[485] = 6.83, -- Laser Matrix
			[492] = 4.96, -- Liberator's Might
			[494] = 7.84, -- Battlefield Precision
			[495] = 6.15, -- Anduin's Dedication
			[496] = 1.34, -- Stronger Together
			[497] = 1.68, -- Stand As One
			[498] = 5.04, -- Barrage Of Many Bombs
			[499] = 3.09, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.28, -- Synaptic Spark Capacitor
			[501] = 6.78, -- Relational Normalization Gizmo
			[502] = 0.10, -- Personal Absorb-o-Tron
			[504] = 7.21, -- Unstable Catalyst
			[505] = 5.99, -- Tradewinds
			[509] = 0.04, -- Nothing Personal
			[521] = 0.02, -- Shadow of Elune
			[522] = 0.09, -- Ancients' Bulwark
			[524] = 0.10, -- Echoing Blades
			[526] = 0.02, -- Endless Hunger
			[541] = 0.06, -- Fight or Flight
			[560] = 0.01, -- Bonded Souls
			[561] = 0.05, -- Seductive Power
		})

		-- Outlaw
		insertDefaultScalesData(defaultName, 4, 2, {
			[13] = 0.01, -- Azerite Empowered
			[18] = 1.51, -- Blood Siphon
			[21] = 2.10, -- Elemental Whirl
			[22] = 3.61, -- Heed My Call
			[30] = 4.26, -- Overwhelming Power
			[31] = 4.03, -- Gutripper
			[82] = 7.34, -- Champion of Azeroth
			[129] = 8.69, -- Deadshot
			[156] = 4.97, -- Ruinous Bolt
			[157] = 8.63, -- Rezan's Fury
			[180] = 5.69, -- Keep Your Wits About You
			[192] = 5.44, -- Meticulous Scheming
			[193] = 6.62, -- Blightborne Infusion
			[194] = 6.82, -- Filthy Transfusion
			[195] = 5.86, -- Secrets of the Deep
			[196] = 6.08, -- Swirling Sands
			[239] = 4.77, -- Snake Eyes
			[410] = 4.87, -- Paradise Lost
			[411] = 8.19, -- Ace Up Your Sleeve
			[446] = 7.53, -- Brigand's Blitz
			[459] = 2.24, -- Unstable Flames
			[461] = 1.83, -- Earthlink
			[462] = 2.43, -- Azerite Globules
			[478] = 8.15, -- Tidal Surge
			[479] = 10.00, -- Dagger in the Back
			[480] = 4.31, -- Blood Rite
			[481] = 4.08, -- Incite the Pack
			[482] = 6.98, -- Thunderous Blast
			[483] = 6.29, -- Archive of the Titans
			[485] = 7.64, -- Laser Matrix
			[492] = 4.08, -- Liberator's Might
			[494] = 8.60, -- Battlefield Precision
			[495] = 5.51, -- Anduin's Dedication
			[496] = 1.00, -- Stronger Together
			[497] = 1.43, -- Stand As One
			[498] = 5.55, -- Barrage Of Many Bombs
			[499] = 3.21, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.43, -- Synaptic Spark Capacitor
			[501] = 5.92, -- Relational Normalization Gizmo
			[504] = 6.24, -- Unstable Catalyst
			[505] = 4.42, -- Tradewinds
			[521] = 0.01, -- Shadow of Elune
			[548] = 0.01, -- Lying In Wait
		})

		-- Subtley
		insertDefaultScalesData(defaultName, 4, 3, {
			[15] = 0.02, -- Resounding Protection
			[18] = 1.21, -- Blood Siphon
			[21] = 1.21, -- Elemental Whirl
			[22] = 1.94, -- Heed My Call
			[30] = 1.88, -- Overwhelming Power
			[31] = 2.12, -- Gutripper
			[82] = 4.05, -- Champion of Azeroth
			[83] = 0.05, -- Impassive Visage
			[84] = 0.02, -- Bulwark of the Masses
			[85] = 0.04, -- Gemhide
			[86] = 0.03, -- Azerite Fortification
			[156] = 2.66, -- Ruinous Bolt
			[157] = 4.36, -- Rezan's Fury
			[175] = 3.36, -- Night's Vengeance
			[192] = 2.05, -- Meticulous Scheming
			[193] = 3.66, -- Blightborne Infusion
			[194] = 3.60, -- Filthy Transfusion
			[195] = 3.42, -- Secrets of the Deep
			[196] = 3.30, -- Swirling Sands
			[217] = 0.05, -- Footpad
			[240] = 5.13, -- Blade In The Shadows
			[413] = 10.00, -- The First Dance
			[414] = 7.69, -- Inevitability
			[445] = 2.63, -- Perforate
			[459] = 1.33, -- Unstable Flames
			[461] = 1.14, -- Earthlink
			[462] = 1.28, -- Azerite Globules
			[473] = 0.01, -- Shrouded Mantle
			[478] = 4.48, -- Tidal Surge
			[479] = 5.03, -- Dagger in the Back
			[480] = 2.13, -- Blood Rite
			[481] = 2.73, -- Incite the Pack
			[482] = 3.51, -- Thunderous Blast
			[483] = 3.49, -- Archive of the Titans
			[485] = 3.76, -- Laser Matrix
			[492] = 2.16, -- Liberator's Might
			[493] = 0.01, -- Last Gift
			[494] = 4.32, -- Battlefield Precision
			[495] = 3.29, -- Anduin's Dedication
			[496] = 0.76, -- Stronger Together
			[497] = 0.88, -- Stand As One
			[498] = 2.75, -- Barrage Of Many Bombs
			[499] = 1.63, -- Ricocheting Inflatable Pyrosaw
			[500] = 2.44, -- Synaptic Spark Capacitor
			[501] = 3.21, -- Relational Normalization Gizmo
			[502] = 0.09, -- Personal Absorb-o-Tron
			[503] = 0.03, -- Auto-Self-Cauterizer
			[504] = 3.69, -- Unstable Catalyst
			[505] = 2.89, -- Tradewinds
			[506] = 0.03, -- Replicating Shadows
			[522] = 0.02, -- Ancients' Bulwark
			[523] = 0.04, -- Apothecary's Concoctions
			[526] = 0.07, -- Endless Hunger
			[541] = 0.08, -- Fight or Flight
			[548] = 0.06, -- Lying In Wait
			[561] = 0.04, -- Seductive Power
			[562] = 0.06, -- Treacherous Covenant
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
			[13] = 0.06, -- Azerite Empowered
			[14] = 0.07, -- Longstrider
			[15] = 0.10, -- Resounding Protection
			[18] = 1.63, -- Blood Siphon
			[20] = 2.60, -- Lifespeed
			[21] = 2.29, -- Elemental Whirl
			[22] = 4.30, -- Heed My Call
			[30] = 4.08, -- Overwhelming Power
			[31] = 4.85, -- Gutripper
			[43] = 0.01, -- Winds of War
			[82] = 7.93, -- Champion of Azeroth
			[83] = 0.02, -- Impassive Visage
			[85] = 0.02, -- Gemhide
			[86] = 0.03, -- Azerite Fortification
			[98] = 0.16, -- Crystalline Carapace
			[100] = 0.11, -- Strength in Numbers
			[106] = 2.68, -- Deep Cuts
			[140] = 1.12, -- Bone Spike Graveyard
			[156] = 5.54, -- Ruinous Bolt
			[157] = 10.00, -- Rezan's Fury
			[192] = 5.11, -- Meticulous Scheming
			[193] = 6.85, -- Blightborne Infusion
			[194] = 9.13, -- Filthy Transfusion
			[195] = 4.99, -- Secrets of the Deep
			[196] = 6.23, -- Swirling Sands
			[348] = 4.96, -- Eternal Rune Weapon
			[349] = 0.45, -- Bones of the Damned
			[459] = 2.40, -- Unstable Flames
			[461] = 1.51, -- Earthlink
			[462] = 2.92, -- Azerite Globules
			[478] = 9.38, -- Tidal Surge
			[479] = 8.02, -- Dagger in the Back
			[480] = 4.21, -- Blood Rite
			[481] = 3.87, -- Incite the Pack
			[482] = 8.60, -- Thunderous Blast
			[483] = 5.33, -- Archive of the Titans
			[485] = 8.88, -- Laser Matrix
			[492] = 4.65, -- Liberator's Might
			[493] = 0.03, -- Last Gift
			[494] = 9.81, -- Battlefield Precision
			[495] = 4.78, -- Anduin's Dedication
			[496] = 1.13, -- Stronger Together
			[497] = 1.20, -- Stand As One
			[498] = 6.38, -- Barrage Of Many Bombs
			[499] = 3.95, -- Ricocheting Inflatable Pyrosaw
			[500] = 5.12, -- Synaptic Spark Capacitor
			[501] = 5.31, -- Relational Normalization Gizmo
			[504] = 5.49, -- Unstable Catalyst
			[505] = 4.25, -- Tradewinds
			[522] = 0.14, -- Ancients' Bulwark
			[561] = 0.06, -- Seductive Power
		})
		insertDefaultScalesData(defensiveName, 6, 1, {
			[15] = 10.00, -- Resounding Protection
			[18] = 1.29, -- Blood Siphon
			[20] = 0.75, -- Lifespeed
			[21] = 0.24, -- Elemental Whirl
			[30] = 1.51, -- Overwhelming Power
			[82] = 1.05, -- Champion of Azeroth
			[106] = 2.06, -- Deep Cuts
			[140] = 1.43, -- Bone Spike Graveyard
			[192] = 1.87, -- Meticulous Scheming
			[193] = 0.54, -- Blightborne Infusion
			[195] = 0.32, -- Secrets of the Deep
			[196] = 0.43, -- Swirling Sands
			[197] = 2.78, -- Marrowblood
			[348] = 0.67, -- Eternal Rune Weapon
			[349] = 0.41, -- Bones of the Damned
			[459] = 0.10, -- Unstable Flames
			[480] = 1.44, -- Blood Rite
			[481] = 0.24, -- Incite the Pack
			[483] = 0.41, -- Archive of the Titans
			[492] = 0.76, -- Liberator's Might
			[495] = 0.30, -- Anduin's Dedication
			[496] = 0.13, -- Stronger Together
			[501] = 1.12, -- Relational Normalization Gizmo
			[503] = 0.02, -- Auto-Self-Cauterizer
			[504] = 0.37, -- Unstable Catalyst
			[505] = 0.30, -- Tradewinds
		})

		-- Frost
		insertDefaultScalesData(defaultName, 6, 2, {
			[18] = 2.72, -- Blood Siphon
			[20] = 2.01, -- Lifespeed
			[21] = 2.73, -- Elemental Whirl
			[22] = 3.50, -- Heed My Call
			[30] = 4.08, -- Overwhelming Power
			[31] = 3.65, -- Gutripper
			[44] = 0.10, -- Vampiric Speed
			[82] = 8.67, -- Champion of Azeroth
			[108] = 6.00, -- Icy Citadel
			[141] = 5.13, -- Latent Chill
			[156] = 5.32, -- Ruinous Bolt
			[157] = 7.77, -- Rezan's Fury
			[192] = 4.33, -- Meticulous Scheming
			[193] = 8.38, -- Blightborne Infusion
			[194] = 6.94, -- Filthy Transfusion
			[195] = 7.15, -- Secrets of the Deep
			[196] = 7.31, -- Swirling Sands
			[242] = 4.84, -- Echoing Howl
			[346] = 4.49, -- Killer Frost
			[347] = 3.11, -- Frozen Tempest
			[459] = 2.99, -- Unstable Flames
			[461] = 2.30, -- Earthlink
			[462] = 2.21, -- Azerite Globules
			[478] = 10.00, -- Tidal Surge
			[479] = 9.06, -- Dagger in the Back
			[480] = 4.51, -- Blood Rite
			[481] = 6.81, -- Incite the Pack
			[482] = 6.43, -- Thunderous Blast
			[483] = 7.38, -- Archive of the Titans
			[485] = 6.69, -- Laser Matrix
			[492] = 4.80, -- Liberator's Might
			[494] = 7.64, -- Battlefield Precision
			[495] = 7.11, -- Anduin's Dedication
			[496] = 1.29, -- Stronger Together
			[497] = 1.89, -- Stand As One
			[498] = 4.87, -- Barrage Of Many Bombs
			[499] = 3.08, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.77, -- Synaptic Spark Capacitor
			[501] = 6.86, -- Relational Normalization Gizmo
			[504] = 8.24, -- Unstable Catalyst
			[505] = 7.41, -- Tradewinds
			[523] = 0.07, -- Apothecary's Concoctions
		})

		-- Unholy
		insertDefaultScalesData(defaultName, 6, 3, {
			[13] = 0.11, -- Azerite Empowered
			[14] = 0.19, -- Longstrider
			[18] = 2.16, -- Blood Siphon
			[20] = 2.99, -- Lifespeed
			[21] = 2.74, -- Elemental Whirl
			[22] = 3.73, -- Heed My Call
			[30] = 4.88, -- Overwhelming Power
			[31] = 4.01, -- Gutripper
			[82] = 8.45, -- Champion of Azeroth
			[83] = 0.06, -- Impassive Visage
			[84] = 0.01, -- Bulwark of the Masses
			[85] = 0.14, -- Gemhide
			[86] = 0.25, -- Azerite Fortification
			[89] = 0.03, -- Azerite Veins
			[99] = 0.12, -- Ablative Shielding
			[101] = 0.03, -- Shimmering Haven
			[140] = 1.02, -- Bone Spike Graveyard
			[156] = 5.22, -- Ruinous Bolt
			[157] = 8.42, -- Rezan's Fury
			[192] = 6.19, -- Meticulous Scheming
			[193] = 8.37, -- Blightborne Infusion
			[194] = 7.70, -- Filthy Transfusion
			[195] = 6.29, -- Secrets of the Deep
			[196] = 7.31, -- Swirling Sands
			[199] = 10.00, -- Festermight
			[201] = 0.09, -- Runic Barrier
			[244] = 7.24, -- Harrowing Decay
			[350] = 4.77, -- Cankerous Wounds
			[351] = 4.50, -- Last Surprise
			[459] = 3.06, -- Unstable Flames
			[461] = 2.35, -- Earthlink
			[462] = 2.41, -- Azerite Globules
			[465] = 0.08, -- March of the Damned
			[478] = 8.74, -- Tidal Surge
			[479] = 9.73, -- Dagger in the Back
			[480] = 5.06, -- Blood Rite
			[481] = 5.07, -- Incite the Pack
			[482] = 7.24, -- Thunderous Blast
			[483] = 6.89, -- Archive of the Titans
			[485] = 7.51, -- Laser Matrix
			[492] = 4.99, -- Liberator's Might
			[494] = 8.52, -- Battlefield Precision
			[495] = 6.39, -- Anduin's Dedication
			[496] = 1.49, -- Stronger Together
			[497] = 1.70, -- Stand As One
			[498] = 5.58, -- Barrage Of Many Bombs
			[499] = 3.19, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.74, -- Synaptic Spark Capacitor
			[501] = 7.07, -- Relational Normalization Gizmo
			[502] = 0.13, -- Personal Absorb-o-Tron
			[504] = 7.45, -- Unstable Catalyst
			[505] = 5.51, -- Tradewinds
			[521] = 0.07, -- Shadow of Elune
			[522] = 0.01, -- Ancients' Bulwark
			[526] = 0.06, -- Endless Hunger
			[541] = 0.11, -- Fight or Flight
			[549] = 0.01, -- Cold Hearted
			[552] = 0.04, -- Magus of the Dead
		})

	-- Shaman
		-- Elemental
		insertDefaultScalesData(defaultName, 7, 1, {
			[18] = 1.56, -- Blood Siphon
			[21] = 2.35, -- Elemental Whirl
			[22] = 2.68, -- Heed My Call
			[30] = 4.31, -- Overwhelming Power
			[31] = 3.03, -- Gutripper
			[38] = 2.01, -- On My Way
			[82] = 7.79, -- Champion of Azeroth
			[156] = 4.07, -- Ruinous Bolt
			[157] = 6.76, -- Rezan's Fury
			[178] = 5.00, -- Lava Shock
			[192] = 4.05, -- Meticulous Scheming
			[193] = 8.34, -- Blightborne Infusion
			[194] = 5.54, -- Filthy Transfusion
			[195] = 6.07, -- Secrets of the Deep
			[196] = 7.05, -- Swirling Sands
			[222] = 10.00, -- Echo of the Elementals
			[416] = 6.41, -- Natural Harmony
			[447] = 6.78, -- Ancestral Resonance
			[448] = 6.60, -- Synapse Shock
			[457] = 3.32, -- Igneous Potential
			[459] = 2.67, -- Unstable Flames
			[461] = 1.95, -- Earthlink
			[462] = 1.77, -- Azerite Globules
			[478] = 6.89, -- Tidal Surge
			[479] = 7.78, -- Dagger in the Back
			[480] = 4.88, -- Blood Rite
			[481] = 3.65, -- Incite the Pack
			[482] = 5.56, -- Thunderous Blast
			[483] = 6.38, -- Archive of the Titans
			[485] = 5.79, -- Laser Matrix
			[492] = 4.82, -- Liberator's Might
			[494] = 6.23, -- Battlefield Precision
			[495] = 5.99, -- Anduin's Dedication
			[496] = 1.23, -- Stronger Together
			[497] = 1.32, -- Stand As One
			[498] = 4.31, -- Barrage Of Many Bombs
			[499] = 2.58, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.74, -- Synaptic Spark Capacitor
			[501] = 6.59, -- Relational Normalization Gizmo
			[504] = 6.87, -- Unstable Catalyst
			[505] = 4.16, -- Tradewinds
		})

		-- Enhancement
		insertDefaultScalesData(defaultName, 7, 2, {
			[13] = 0.05, -- Azerite Empowered
			[14] = 0.09, -- Longstrider
			[15] = 0.03, -- Resounding Protection
			[18] = 1.61, -- Blood Siphon
			[19] = 0.03, -- Woundbinder
			[21] = 1.91, -- Elemental Whirl
			[22] = 2.29, -- Heed My Call
			[30] = 3.06, -- Overwhelming Power
			[31] = 2.48, -- Gutripper
			[38] = 1.56, -- On My Way
			[42] = 0.12, -- Savior
			[44] = 0.13, -- Vampiric Speed
			[82] = 5.72, -- Champion of Azeroth
			[83] = 0.07, -- Impassive Visage
			[84] = 0.08, -- Bulwark of the Masses
			[85] = 0.02, -- Gemhide
			[86] = 0.11, -- Azerite Fortification
			[87] = 0.01, -- Self Reliance
			[103] = 0.13, -- Concentrated Mending
			[104] = 0.07, -- Bracing Chill
			[105] = 0.03, -- Ephemeral Recovery
			[137] = 4.60, -- Primal Primer
			[156] = 3.21, -- Ruinous Bolt
			[157] = 5.42, -- Rezan's Fury
			[179] = 6.26, -- Strength of Earth
			[192] = 3.94, -- Meticulous Scheming
			[193] = 5.12, -- Blightborne Infusion
			[194] = 4.61, -- Filthy Transfusion
			[195] = 4.27, -- Secrets of the Deep
			[196] = 4.65, -- Swirling Sands
			[223] = 2.59, -- Lightning Conduit
			[416] = 4.53, -- Natural Harmony
			[420] = 6.67, -- Roiling Storm
			[447] = 6.04, -- Ancestral Resonance
			[448] = 0.09, -- Synapse Shock
			[459] = 1.82, -- Unstable Flames
			[461] = 1.51, -- Earthlink
			[462] = 1.50, -- Azerite Globules
			[474] = 0.02, -- Pack Spirit
			[478] = 5.24, -- Tidal Surge
			[479] = 6.02, -- Dagger in the Back
			[480] = 3.31, -- Blood Rite
			[481] = 3.94, -- Incite the Pack
			[482] = 4.45, -- Thunderous Blast
			[483] = 4.53, -- Archive of the Titans
			[485] = 4.66, -- Laser Matrix
			[492] = 3.14, -- Liberator's Might
			[493] = 0.03, -- Last Gift
			[494] = 5.21, -- Battlefield Precision
			[495] = 4.28, -- Anduin's Dedication
			[496] = 0.99, -- Stronger Together
			[497] = 1.14, -- Stand As One
			[498] = 3.45, -- Barrage Of Many Bombs
			[499] = 2.08, -- Ricocheting Inflatable Pyrosaw
			[500] = 2.76, -- Synaptic Spark Capacitor
			[501] = 4.53, -- Relational Normalization Gizmo
			[502] = 0.10, -- Personal Absorb-o-Tron
			[504] = 4.98, -- Unstable Catalyst
			[505] = 4.23, -- Tradewinds
			[521] = 0.08, -- Shadow of Elune
			[523] = 0.02, -- Apothecary's Concoctions
			[526] = 0.04, -- Endless Hunger
			[530] = 10.00, -- Thunderaan's Fury
			[539] = 0.11, -- Ancient Ankh Talisman
			[541] = 0.18, -- Fight or Flight
			[560] = 0.08, -- Bonded Souls
			[561] = 0.02, -- Seductive Power
			[562] = 0.01, -- Treacherous Covenant
		})

		-- Restoration
		insertDefaultScalesData(defaultName, 7, 3, {

		})

	-- Mage
		-- Arcane
		insertDefaultScalesData(defaultName, 8, 1, {
			[14] = 0.07, -- Longstrider
			[18] = 2.54, -- Blood Siphon
			[21] = 2.71, -- Elemental Whirl
			[22] = 3.74, -- Heed My Call
			[30] = 3.10, -- Overwhelming Power
			[31] = 3.76, -- Gutripper
			[82] = 8.88, -- Champion of Azeroth
			[83] = 0.10, -- Impassive Visage
			[84] = 0.15, -- Bulwark of the Masses
			[85] = 0.09, -- Gemhide
			[87] = 0.01, -- Self Reliance
			[88] = 6.57, -- Arcane Pummeling
			[156] = 5.67, -- Ruinous Bolt
			[157] = 8.38, -- Rezan's Fury
			[167] = 4.86, -- Brain Storm
			[192] = 2.63, -- Meticulous Scheming
			[193] = 9.01, -- Blightborne Infusion
			[194] = 7.56, -- Filthy Transfusion
			[195] = 7.28, -- Secrets of the Deep
			[196] = 6.85, -- Swirling Sands
			[205] = 0.06, -- Eldritch Warding
			[214] = 3.67, -- Arcane Pressure
			[374] = 10.00, -- Galvanizing Spark
			[375] = 0.10, -- Explosive Echo
			[459] = 2.97, -- Unstable Flames
			[461] = 2.65, -- Earthlink
			[462] = 2.39, -- Azerite Globules
			[468] = 0.13, -- Cauterizing Blink
			[478] = 9.05, -- Tidal Surge
			[479] = 9.65, -- Dagger in the Back
			[480] = 4.01, -- Blood Rite
			[481] = 5.93, -- Incite the Pack
			[482] = 6.96, -- Thunderous Blast
			[483] = 7.85, -- Archive of the Titans
			[485] = 7.24, -- Laser Matrix
			[492] = 4.93, -- Liberator's Might
			[493] = 0.04, -- Last Gift
			[494] = 6.92, -- Battlefield Precision
			[495] = 7.33, -- Anduin's Dedication
			[496] = 1.56, -- Stronger Together
			[497] = 1.78, -- Stand As One
			[498] = 5.24, -- Barrage Of Many Bombs
			[499] = 3.16, -- Ricocheting Inflatable Pyrosaw
			[500] = 5.08, -- Synaptic Spark Capacitor
			[501] = 6.71, -- Relational Normalization Gizmo
			[502] = 0.01, -- Personal Absorb-o-Tron
			[504] = 8.04, -- Unstable Catalyst
			[505] = 6.30, -- Tradewinds
			[514] = 0.10, -- Equipoise
			[521] = 0.02, -- Shadow of Elune
			[522] = 0.08, -- Ancients' Bulwark
			[541] = 0.18, -- Fight or Flight
			[546] = 0.04, -- Quick Thinking
		})

		-- Fire
		insertDefaultScalesData(defaultName, 8, 2, {
			[15] = 0.06, -- Resounding Protection
			[18] = 2.14, -- Blood Siphon
			[21] = 2.17, -- Elemental Whirl
			[22] = 4.08, -- Heed My Call
			[30] = 2.90, -- Overwhelming Power
			[31] = 4.13, -- Gutripper
			[82] = 6.50, -- Champion of Azeroth
			[83] = 0.14, -- Impassive Visage
			[85] = 0.09, -- Gemhide
			[86] = 0.03, -- Azerite Fortification
			[128] = 5.49, -- Flames of Alacrity
			[156] = 5.63, -- Ruinous Bolt
			[157] = 8.63, -- Rezan's Fury
			[192] = 4.34, -- Meticulous Scheming
			[193] = 7.12, -- Blightborne Infusion
			[194] = 7.45, -- Filthy Transfusion
			[195] = 6.35, -- Secrets of the Deep
			[196] = 6.32, -- Swirling Sands
			[215] = 0.95, -- Blaster Master
			[376] = 5.13, -- Trailing Embers
			[377] = 9.34, -- Duplicative Incineration
			[378] = 7.74, -- Firemind
			[459] = 2.34, -- Unstable Flames
			[461] = 2.08, -- Earthlink
			[462] = 2.62, -- Azerite Globules
			[478] = 9.66, -- Tidal Surge
			[479] = 10.00, -- Dagger in the Back
			[480] = 4.32, -- Blood Rite
			[481] = 5.24, -- Incite the Pack
			[482] = 7.26, -- Thunderous Blast
			[483] = 7.08, -- Archive of the Titans
			[485] = 7.84, -- Laser Matrix
			[492] = 3.43, -- Liberator's Might
			[494] = 8.71, -- Battlefield Precision
			[495] = 6.40, -- Anduin's Dedication
			[496] = 1.23, -- Stronger Together
			[497] = 2.02, -- Stand As One
			[498] = 5.68, -- Barrage Of Many Bombs
			[499] = 3.30, -- Ricocheting Inflatable Pyrosaw
			[500] = 5.24, -- Synaptic Spark Capacitor
			[501] = 6.27, -- Relational Normalization Gizmo
			[504] = 7.48, -- Unstable Catalyst
			[505] = 5.90, -- Tradewinds
			[521] = 0.06, -- Shadow of Elune
			[541] = 0.20, -- Fight or Flight
			[560] = 0.17, -- Bonded Souls
		})

		-- Frost
		insertDefaultScalesData(defaultName, 8, 3, {
			[14] = 0.07, -- Longstrider
			[18] = 1.93, -- Blood Siphon
			[21] = 2.75, -- Elemental Whirl
			[22] = 3.58, -- Heed My Call
			[30] = 4.45, -- Overwhelming Power
			[31] = 3.92, -- Gutripper
			[82] = 8.74, -- Champion of Azeroth
			[84] = 0.01, -- Bulwark of the Masses
			[132] = 7.31, -- Packed Ice
			[156] = 5.63, -- Ruinous Bolt
			[157] = 8.91, -- Rezan's Fury
			[192] = 5.02, -- Meticulous Scheming
			[193] = 7.10, -- Blightborne Infusion
			[194] = 7.66, -- Filthy Transfusion
			[195] = 7.27, -- Secrets of the Deep
			[196] = 7.38, -- Swirling Sands
			[225] = 7.79, -- Glacial Assault
			[379] = 7.73, -- Tunnel of Ice
			[380] = 7.53, -- Whiteout
			[381] = 7.11, -- Frigid Grasp
			[459] = 3.13, -- Unstable Flames
			[461] = 2.23, -- Earthlink
			[462] = 2.39, -- Azerite Globules
			[478] = 9.10, -- Tidal Surge
			[479] = 10.00, -- Dagger in the Back
			[480] = 5.20, -- Blood Rite
			[481] = 5.36, -- Incite the Pack
			[482] = 7.36, -- Thunderous Blast
			[483] = 7.52, -- Archive of the Titans
			[485] = 7.70, -- Laser Matrix
			[492] = 5.18, -- Liberator's Might
			[494] = 8.28, -- Battlefield Precision
			[495] = 7.23, -- Anduin's Dedication
			[496] = 1.39, -- Stronger Together
			[497] = 2.05, -- Stand As One
			[498] = 5.36, -- Barrage Of Many Bombs
			[499] = 3.27, -- Ricocheting Inflatable Pyrosaw
			[500] = 5.10, -- Synaptic Spark Capacitor
			[501] = 7.37, -- Relational Normalization Gizmo
			[504] = 8.39, -- Unstable Catalyst
			[505] = 5.89, -- Tradewinds
			[562] = 0.01, -- Treacherous Covenant
		})

	-- Warlock
		-- Affliction
		insertDefaultScalesData(defaultName, 9, 1, {
			[18] = 2.61, -- Blood Siphon
			[21] = 2.44, -- Elemental Whirl
			[22] = 3.84, -- Heed My Call
			[30] = 4.72, -- Overwhelming Power
			[31] = 4.04, -- Gutripper
			[82] = 8.35, -- Champion of Azeroth
			[123] = 8.39, -- Wracking Brilliance
			[156] = 5.26, -- Ruinous Bolt
			[157] = 8.58, -- Rezan's Fury
			[183] = 7.48, -- Inevitable Demise
			[192] = 6.17, -- Meticulous Scheming
			[193] = 7.55, -- Blightborne Infusion
			[194] = 7.87, -- Filthy Transfusion
			[195] = 6.28, -- Secrets of the Deep
			[196] = 6.79, -- Swirling Sands
			[230] = 6.92, -- Cascading Calamity
			[425] = 7.26, -- Sudden Onset
			[426] = 5.26, -- Dreadful Calling
			[442] = 8.16, -- Pandemic Invocation
			[459] = 2.58, -- Unstable Flames
			[461] = 2.11, -- Earthlink
			[462] = 2.51, -- Azerite Globules
			[478] = 8.69, -- Tidal Surge
			[479] = 10.00, -- Dagger in the Back
			[480] = 5.19, -- Blood Rite
			[481] = 6.51, -- Incite the Pack
			[482] = 7.36, -- Thunderous Blast
			[483] = 6.62, -- Archive of the Titans
			[485] = 7.38, -- Laser Matrix
			[492] = 4.56, -- Liberator's Might
			[494] = 8.63, -- Battlefield Precision
			[495] = 6.11, -- Anduin's Dedication
			[496] = 1.37, -- Stronger Together
			[497] = 1.63, -- Stand As One
			[498] = 5.45, -- Barrage Of Many Bombs
			[499] = 3.28, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.59, -- Synaptic Spark Capacitor
			[501] = 7.16, -- Relational Normalization Gizmo
			[502] = 0.02, -- Personal Absorb-o-Tron
			[504] = 7.27, -- Unstable Catalyst
			[505] = 7.00, -- Tradewinds
			[522] = 0.05, -- Ancients' Bulwark
			[526] = 0.01, -- Endless Hunger
			[531] = 0.03, -- Terror of the Mind
		})

		-- Demonology
		insertDefaultScalesData(defaultName, 9, 2, {
			[18] = 1.77, -- Blood Siphon
			[21] = 1.94, -- Elemental Whirl
			[22] = 2.36, -- Heed My Call
			[30] = 3.35, -- Overwhelming Power
			[31] = 2.64, -- Gutripper
			[82] = 6.38, -- Champion of Azeroth
			[130] = 3.84, -- Shadow's Bite
			[156] = 3.33, -- Ruinous Bolt
			[157] = 5.56, -- Rezan's Fury
			[190] = 3.16, -- Umbral Blaze
			[192] = 3.90, -- Meticulous Scheming
			[193] = 6.24, -- Blightborne Infusion
			[194] = 5.14, -- Filthy Transfusion
			[195] = 5.08, -- Secrets of the Deep
			[196] = 4.42, -- Swirling Sands
			[208] = 0.06, -- Lifeblood
			[428] = 4.77, -- Demonic Meteor
			[429] = 10.00, -- Baleful Invocation
			[458] = 6.03, -- Supreme Commander
			[459] = 2.04, -- Unstable Flames
			[461] = 1.51, -- Earthlink
			[462] = 1.64, -- Azerite Globules
			[478] = 5.46, -- Tidal Surge
			[479] = 6.46, -- Dagger in the Back
			[480] = 3.48, -- Blood Rite
			[481] = 4.51, -- Incite the Pack
			[482] = 4.67, -- Thunderous Blast
			[483] = 5.21, -- Archive of the Titans
			[485] = 5.00, -- Laser Matrix
			[492] = 3.59, -- Liberator's Might
			[494] = 4.01, -- Battlefield Precision
			[495] = 5.03, -- Anduin's Dedication
			[496] = 0.98, -- Stronger Together
			[497] = 1.23, -- Stand As One
			[498] = 3.62, -- Barrage Of Many Bombs
			[499] = 1.94, -- Ricocheting Inflatable Pyrosaw
			[500] = 2.92, -- Synaptic Spark Capacitor
			[501] = 5.33, -- Relational Normalization Gizmo
			[504] = 5.75, -- Unstable Catalyst
			[505] = 4.80, -- Tradewinds
		})

		-- Destruction
		insertDefaultScalesData(defaultName, 9, 3, {
			[14] = 0.02, -- Longstrider
			[18] = 2.64, -- Blood Siphon
			[21] = 2.84, -- Elemental Whirl
			[22] = 3.95, -- Heed My Call
			[30] = 4.80, -- Overwhelming Power
			[31] = 4.19, -- Gutripper
			[82] = 8.86, -- Champion of Azeroth
			[84] = 0.04, -- Bulwark of the Masses
			[85] = 0.02, -- Gemhide
			[86] = 0.10, -- Azerite Fortification
			[156] = 5.17, -- Ruinous Bolt
			[157] = 8.94, -- Rezan's Fury
			[192] = 5.25, -- Meticulous Scheming
			[193] = 8.40, -- Blightborne Infusion
			[194] = 7.67, -- Filthy Transfusion
			[195] = 6.48, -- Secrets of the Deep
			[196] = 7.04, -- Swirling Sands
			[232] = 5.73, -- Flashpoint
			[432] = 8.31, -- Chaotic Inferno
			[444] = 9.00, -- Crashing Chaos
			[459] = 3.00, -- Unstable Flames
			[460] = 7.25, -- Bursting Flare
			[461] = 2.56, -- Earthlink
			[462] = 2.58, -- Azerite Globules
			[475] = 0.18, -- Desperate Power
			[478] = 8.27, -- Tidal Surge
			[479] = 10.00, -- Dagger in the Back
			[480] = 4.96, -- Blood Rite
			[481] = 6.49, -- Incite the Pack
			[482] = 7.44, -- Thunderous Blast
			[483] = 6.90, -- Archive of the Titans
			[485] = 7.71, -- Laser Matrix
			[492] = 4.75, -- Liberator's Might
			[494] = 7.93, -- Battlefield Precision
			[495] = 6.34, -- Anduin's Dedication
			[496] = 1.63, -- Stronger Together
			[497] = 1.58, -- Stand As One
			[498] = 5.70, -- Barrage Of Many Bombs
			[499] = 3.38, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.74, -- Synaptic Spark Capacitor
			[501] = 7.00, -- Relational Normalization Gizmo
			[504] = 7.42, -- Unstable Catalyst
			[505] = 7.15, -- Tradewinds
			[541] = 0.21, -- Fight or Flight
		})

	-- Monk
		-- Brewmaster
		insertDefaultScalesData(offensiveName, 10, 1, {
			[13] = 0.06, -- Azerite Empowered
			[14] = 0.23, -- Longstrider
			[15] = 0.04, -- Resounding Protection
			[18] = 1.72, -- Blood Siphon
			[19] = 0.06, -- Woundbinder
			[20] = 1.10, -- Lifespeed
			[21] = 1.91, -- Elemental Whirl
			[22] = 4.38, -- Heed My Call
			[30] = 2.20, -- Overwhelming Power
			[31] = 4.80, -- Gutripper
			[38] = 1.76, -- On My Way
			[42] = 0.12, -- Savior
			[43] = 0.11, -- Winds of War
			[44] = 0.01, -- Vampiric Speed
			[82] = 5.69, -- Champion of Azeroth
			[83] = 0.13, -- Impassive Visage
			[84] = 0.14, -- Bulwark of the Masses
			[85] = 0.02, -- Gemhide
			[86] = 0.09, -- Azerite Fortification
			[87] = 0.05, -- Self Reliance
			[89] = 0.16, -- Azerite Veins
			[98] = 0.17, -- Crystalline Carapace
			[99] = 0.14, -- Ablative Shielding
			[100] = 0.11, -- Strength in Numbers
			[101] = 0.09, -- Shimmering Haven
			[103] = 0.06, -- Concentrated Mending
			[104] = 0.12, -- Bracing Chill
			[105] = 0.18, -- Ephemeral Recovery
			[116] = 2.33, -- Boiling Brew
			[156] = 6.09, -- Ruinous Bolt
			[157] = 9.85, -- Rezan's Fury
			[186] = 0.17, -- Staggering Strikes
			[192] = 2.61, -- Meticulous Scheming
			[193] = 5.90, -- Blightborne Infusion
			[194] = 8.71, -- Filthy Transfusion
			[195] = 4.71, -- Secrets of the Deep
			[196] = 5.31, -- Swirling Sands
			[218] = 0.10, -- Strength of Spirit
			[238] = 0.15, -- Fit to Burst
			[383] = 2.26, -- Training of Niuzao
			[384] = 5.01, -- Elusive Footwork
			[459] = 2.04, -- Unstable Flames
			[461] = 1.60, -- Earthlink
			[462] = 2.93, -- Azerite Globules
			[463] = 0.15, -- Blessed Portents
			[470] = 0.04, -- Sweep the Leg
			[478] = 10.00, -- Tidal Surge
			[479] = 7.92, -- Dagger in the Back
			[480] = 2.18, -- Blood Rite
			[481] = 4.01, -- Incite the Pack
			[482] = 8.24, -- Thunderous Blast
			[483] = 5.07, -- Archive of the Titans
			[485] = 8.82, -- Laser Matrix
			[492] = 3.11, -- Liberator's Might
			[493] = 0.16, -- Last Gift
			[494] = 9.84, -- Battlefield Precision
			[495] = 4.35, -- Anduin's Dedication
			[496] = 1.16, -- Stronger Together
			[497] = 1.33, -- Stand As One
			[498] = 6.35, -- Barrage Of Many Bombs
			[499] = 3.85, -- Ricocheting Inflatable Pyrosaw
			[500] = 5.92, -- Synaptic Spark Capacitor
			[501] = 3.78, -- Relational Normalization Gizmo
			[502] = 0.12, -- Personal Absorb-o-Tron
			[503] = 0.17, -- Auto-Self-Cauterizer
			[504] = 5.10, -- Unstable Catalyst
			[505] = 4.36, -- Tradewinds
			[513] = 0.28, -- Straight, No Chaser
			[522] = 0.03, -- Ancients' Bulwark
			[523] = 0.12, -- Apothecary's Concoctions
			[541] = 0.17, -- Fight or Flight
			[560] = 0.18, -- Bonded Souls
			[561] = 0.12, -- Seductive Power
			[562] = 0.10, -- Treacherous Covenant
			[566] = 0.14, -- Exit Strategy
		})
		insertDefaultScalesData(defensiveName, 10, 1, {
			[14] = 0.01, -- Longstrider
			[15] = 9.15, -- Resounding Protection
			[18] = 1.66, -- Blood Siphon
			[19] = 0.02, -- Woundbinder
			[21] = 0.11, -- Elemental Whirl
			[22] = 0.02, -- Heed My Call
			[31] = 0.01, -- Gutripper
			[38] = 0.14, -- On My Way
			[42] = 0.03, -- Savior
			[43] = 0.02, -- Winds of War
			[82] = 0.29, -- Champion of Azeroth
			[83] = 0.03, -- Impassive Visage
			[85] = 0.01, -- Gemhide
			[86] = 0.01, -- Azerite Fortification
			[87] = 0.01, -- Self Reliance
			[89] = 0.01, -- Azerite Veins
			[99] = 0.02, -- Ablative Shielding
			[100] = 0.03, -- Strength in Numbers
			[101] = 0.01, -- Shimmering Haven
			[103] = 0.02, -- Concentrated Mending
			[105] = 0.02, -- Ephemeral Recovery
			[116] = 10.00, -- Boiling Brew
			[156] = 0.03, -- Ruinous Bolt
			[186] = 0.75, -- Staggering Strikes
			[193] = 0.53, -- Blightborne Infusion
			[194] = 0.03, -- Filthy Transfusion
			[195] = 0.37, -- Secrets of the Deep
			[196] = 0.46, -- Swirling Sands
			[383] = 0.20, -- Training of Niuzao
			[384] = 0.04, -- Elusive Footwork
			[459] = 0.19, -- Unstable Flames
			[461] = 0.13, -- Earthlink
			[462] = 0.03, -- Azerite Globules
			[463] = 0.02, -- Blessed Portents
			[470] = 0.01, -- Sweep the Leg
			[478] = 0.02, -- Tidal Surge
			[481] = 0.32, -- Incite the Pack
			[482] = 0.02, -- Thunderous Blast
			[483] = 0.38, -- Archive of the Titans
			[492] = 0.11, -- Liberator's Might
			[494] = 0.01, -- Battlefield Precision
			[495] = 0.34, -- Anduin's Dedication
			[496] = 0.06, -- Stronger Together
			[498] = 0.02, -- Barrage Of Many Bombs
			[499] = 0.02, -- Ricocheting Inflatable Pyrosaw
			[502] = 0.02, -- Personal Absorb-o-Tron
			[503] = 0.01, -- Auto-Self-Cauterizer
			[504] = 0.40, -- Unstable Catalyst
			[505] = 0.36, -- Tradewinds
			[513] = 0.02, -- Straight, No Chaser
			[521] = 0.01, -- Shadow of Elune
			[523] = 0.02, -- Apothecary's Concoctions
			[561] = 0.01, -- Seductive Power
			[562] = 0.02, -- Treacherous Covenant
			[566] = 0.05, -- Exit Strategy
		})

		-- Mistweaver
		insertDefaultScalesData(defaultName, 10, 2, {

		})

		-- Windwalker
		insertDefaultScalesData(defaultName, 10, 3, {
			[18] = 1.50, -- Blood Siphon
			[19] = 0.08, -- Woundbinder
			[20] = 1.78, -- Lifespeed
			[21] = 2.03, -- Elemental Whirl
			[22] = 2.68, -- Heed My Call
			[30] = 3.14, -- Overwhelming Power
			[31] = 3.18, -- Gutripper
			[38] = 1.74, -- On My Way
			[42] = 0.01, -- Savior
			[82] = 6.36, -- Champion of Azeroth
			[84] = 0.06, -- Bulwark of the Masses
			[87] = 0.02, -- Self Reliance
			[98] = 0.06, -- Crystalline Carapace
			[101] = 0.07, -- Shimmering Haven
			[104] = 0.03, -- Bracing Chill
			[156] = 4.23, -- Ruinous Bolt
			[157] = 6.68, -- Rezan's Fury
			[184] = 6.03, -- Sunrise Technique
			[192] = 4.06, -- Meticulous Scheming
			[193] = 5.91, -- Blightborne Infusion
			[194] = 5.46, -- Filthy Transfusion
			[195] = 4.96, -- Secrets of the Deep
			[196] = 5.18, -- Swirling Sands
			[218] = 0.10, -- Strength of Spirit
			[388] = 10.00, -- Glory of the Dawn
			[389] = 8.96, -- Open Palm Strikes
			[390] = 7.16, -- Pressure Point
			[459] = 2.22, -- Unstable Flames
			[461] = 1.67, -- Earthlink
			[462] = 1.89, -- Azerite Globules
			[463] = 0.05, -- Blessed Portents
			[470] = 0.06, -- Sweep the Leg
			[478] = 7.27, -- Tidal Surge
			[479] = 7.68, -- Dagger in the Back
			[480] = 3.58, -- Blood Rite
			[481] = 4.03, -- Incite the Pack
			[482] = 5.48, -- Thunderous Blast
			[483] = 5.19, -- Archive of the Titans
			[485] = 5.82, -- Laser Matrix
			[492] = 3.61, -- Liberator's Might
			[493] = 0.04, -- Last Gift
			[494] = 6.52, -- Battlefield Precision
			[495] = 4.85, -- Anduin's Dedication
			[496] = 1.12, -- Stronger Together
			[497] = 1.43, -- Stand As One
			[498] = 4.13, -- Barrage Of Many Bombs
			[499] = 2.64, -- Ricocheting Inflatable Pyrosaw
			[500] = 0.38, -- Synaptic Spark Capacitor
			[501] = 5.44, -- Relational Normalization Gizmo
			[504] = 5.61, -- Unstable Catalyst
			[505] = 4.55, -- Tradewinds
			[516] = 0.03, -- Dance of Chi-Ji
			[517] = 0.10, -- Fury of Xuen
			[523] = 0.10, -- Apothecary's Concoctions
			[560] = 0.11, -- Bonded Souls
			[562] = 0.06, -- Treacherous Covenant
		})

	-- Druid
		-- Balance
		insertDefaultScalesData(defaultName, 11, 1, {
			[14] = 0.02, -- Longstrider
			[18] = 2.59, -- Blood Siphon
			[20] = 3.07, -- Lifespeed
			[21] = 3.19, -- Elemental Whirl
			[22] = 3.69, -- Heed My Call
			[30] = 5.95, -- Overwhelming Power
			[31] = 3.97, -- Gutripper
			[38] = 2.40, -- On My Way
			[42] = 0.01, -- Savior
			[44] = 0.02, -- Vampiric Speed
			[82] = 10.00, -- Champion of Azeroth
			[87] = 0.02, -- Self Reliance
			[98] = 0.06, -- Crystalline Carapace
			[122] = 6.43, -- Streaking Stars
			[156] = 4.66, -- Ruinous Bolt
			[157] = 8.41, -- Rezan's Fury
			[173] = 5.12, -- Power of the Moon
			[192] = 7.45, -- Meticulous Scheming
			[193] = 8.66, -- Blightborne Infusion
			[194] = 7.51, -- Filthy Transfusion
			[195] = 6.91, -- Secrets of the Deep
			[196] = 7.59, -- Swirling Sands
			[250] = 7.36, -- Dawning Sun
			[356] = 3.35, -- High Noon
			[364] = 4.70, -- Lively Spirit
			[459] = 3.14, -- Unstable Flames
			[461] = 2.37, -- Earthlink
			[462] = 2.32, -- Azerite Globules
			[478] = 8.07, -- Tidal Surge
			[479] = 9.64, -- Dagger in the Back
			[480] = 5.82, -- Blood Rite
			[481] = 6.95, -- Incite the Pack
			[482] = 7.35, -- Thunderous Blast
			[483] = 7.39, -- Archive of the Titans
			[485] = 7.42, -- Laser Matrix
			[492] = 5.70, -- Liberator's Might
			[494] = 8.46, -- Battlefield Precision
			[495] = 6.72, -- Anduin's Dedication
			[496] = 1.57, -- Stronger Together
			[497] = 1.71, -- Stand As One
			[498] = 5.44, -- Barrage Of Many Bombs
			[499] = 3.18, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.20, -- Synaptic Spark Capacitor
			[501] = 7.97, -- Relational Normalization Gizmo
			[503] = 0.05, -- Auto-Self-Cauterizer
			[504] = 7.74, -- Unstable Catalyst
			[505] = 7.52, -- Tradewinds
			[560] = 0.08, -- Bonded Souls
			[561] = 0.03, -- Seductive Power
		})

		-- Feral
		insertDefaultScalesData(defaultName, 11, 2, {
			[13] = 0.06, -- Azerite Empowered
			[14] = 0.08, -- Longstrider
			[18] = 2.25, -- Blood Siphon
			[19] = 0.09, -- Woundbinder
			[20] = 1.82, -- Lifespeed
			[21] = 2.44, -- Elemental Whirl
			[22] = 3.05, -- Heed My Call
			[30] = 3.57, -- Overwhelming Power
			[31] = 3.30, -- Gutripper
			[38] = 1.88, -- On My Way
			[42] = 0.07, -- Savior
			[44] = 0.08, -- Vampiric Speed
			[82] = 7.90, -- Champion of Azeroth
			[83] = 0.03, -- Impassive Visage
			[84] = 0.05, -- Bulwark of the Masses
			[85] = 0.18, -- Gemhide
			[86] = 0.08, -- Azerite Fortification
			[87] = 0.15, -- Self Reliance
			[89] = 0.16, -- Azerite Veins
			[98] = 0.02, -- Crystalline Carapace
			[111] = 6.35, -- Blood Mist
			[156] = 4.32, -- Ruinous Bolt
			[157] = 6.79, -- Rezan's Fury
			[169] = 3.24, -- Untamed Ferocity
			[171] = 0.06, -- Masterful Instincts
			[192] = 4.74, -- Meticulous Scheming
			[193] = 8.24, -- Blightborne Infusion
			[194] = 5.70, -- Filthy Transfusion
			[195] = 5.44, -- Secrets of the Deep
			[196] = 7.27, -- Swirling Sands
			[209] = 10.00, -- Jungle Fury
			[219] = 0.05, -- Reawakening
			[241] = 0.09, -- Twisted Claws
			[247] = 0.61, -- Iron Jaws
			[358] = 6.37, -- Gushing Lacerations
			[359] = 6.81, -- Wild Fleshrending
			[459] = 2.75, -- Unstable Flames
			[461] = 1.97, -- Earthlink
			[462] = 1.98, -- Azerite Globules
			[467] = 0.08, -- Ursoc's Endurance
			[478] = 7.29, -- Tidal Surge
			[479] = 7.78, -- Dagger in the Back
			[480] = 4.01, -- Blood Rite
			[481] = 5.35, -- Incite the Pack
			[482] = 5.62, -- Thunderous Blast
			[483] = 5.90, -- Archive of the Titans
			[485] = 6.00, -- Laser Matrix
			[492] = 4.55, -- Liberator's Might
			[493] = 0.09, -- Last Gift
			[494] = 6.94, -- Battlefield Precision
			[495] = 5.32, -- Anduin's Dedication
			[496] = 1.29, -- Stronger Together
			[497] = 1.53, -- Stand As One
			[498] = 4.32, -- Barrage Of Many Bombs
			[499] = 2.59, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.94, -- Synaptic Spark Capacitor
			[501] = 5.54, -- Relational Normalization Gizmo
			[502] = 0.07, -- Personal Absorb-o-Tron
			[503] = 0.05, -- Auto-Self-Cauterizer
			[504] = 6.16, -- Unstable Catalyst
			[505] = 5.82, -- Tradewinds
			[521] = 0.09, -- Shadow of Elune
			[522] = 0.02, -- Ancients' Bulwark
			[523] = 0.12, -- Apothecary's Concoctions
			[526] = 0.14, -- Endless Hunger
			[540] = 0.08, -- Switch Hitter
			[541] = 0.12, -- Fight or Flight
			[560] = 0.12, -- Bonded Souls
			[561] = 0.03, -- Seductive Power
		})

		-- Guardian
		insertDefaultScalesData(offensiveName, 11, 3, {
			[18] = 1.63, -- Blood Siphon
			[20] = 1.67, -- Lifespeed
			[21] = 1.97, -- Elemental Whirl
			[22] = 4.29, -- Heed My Call
			[30] = 3.68, -- Overwhelming Power
			[31] = 4.62, -- Gutripper
			[38] = 1.76, -- On My Way
			[43] = 0.02, -- Winds of War
			[82] = 6.78, -- Champion of Azeroth
			[99] = 0.07, -- Ablative Shielding
			[156] = 5.55, -- Ruinous Bolt
			[157] = 9.79, -- Rezan's Fury
			[192] = 5.05, -- Meticulous Scheming
			[193] = 6.20, -- Blightborne Infusion
			[194] = 8.63, -- Filthy Transfusion
			[195] = 4.96, -- Secrets of the Deep
			[196] = 5.62, -- Swirling Sands
			[241] = 5.82, -- Twisted Claws
			[251] = 4.51, -- Burst of Savagery
			[359] = 1.06, -- Wild Fleshrending
			[361] = 4.51, -- Guardian's Wrath
			[459] = 2.11, -- Unstable Flames
			[461] = 1.40, -- Earthlink
			[462] = 2.75, -- Azerite Globules
			[478] = 9.49, -- Tidal Surge
			[479] = 7.60, -- Dagger in the Back
			[480] = 3.86, -- Blood Rite
			[481] = 4.16, -- Incite the Pack
			[482] = 8.24, -- Thunderous Blast
			[483] = 5.24, -- Archive of the Titans
			[485] = 8.59, -- Laser Matrix
			[492] = 3.80, -- Liberator's Might
			[494] = 10.00, -- Battlefield Precision
			[495] = 4.72, -- Anduin's Dedication
			[496] = 0.98, -- Stronger Together
			[497] = 1.26, -- Stand As One
			[498] = 6.07, -- Barrage Of Many Bombs
			[499] = 3.65, -- Ricocheting Inflatable Pyrosaw
			[500] = 5.18, -- Synaptic Spark Capacitor
			[501] = 5.27, -- Relational Normalization Gizmo
			[504] = 5.49, -- Unstable Catalyst
			[505] = 4.38, -- Tradewinds
			[523] = 0.05, -- Apothecary's Concoctions
			[526] = 0.02, -- Endless Hunger
		})
		-- Guardian
		insertDefaultScalesData(defensiveName, 11, 3, {
			[14] = 0.05, -- Longstrider
			[15] = 0.04, -- Resounding Protection
			[18] = 10.00, -- Blood Siphon
			[30] = 0.01, -- Overwhelming Power
			[31] = 0.02, -- Gutripper
			[42] = 0.02, -- Savior
			[83] = 0.02, -- Impassive Visage
			[85] = 0.01, -- Gemhide
			[86] = 0.02, -- Azerite Fortification
			[87] = 0.02, -- Self Reliance
			[89] = 0.06, -- Azerite Veins
			[99] = 0.02, -- Ablative Shielding
			[100] = 0.01, -- Strength in Numbers
			[103] = 0.04, -- Concentrated Mending
			[104] = 0.02, -- Bracing Chill
			[105] = 0.03, -- Ephemeral Recovery
			[112] = 0.01, -- Layered Mane
			[156] = 0.02, -- Ruinous Bolt
			[171] = 0.01, -- Masterful Instincts
			[192] = 0.01, -- Meticulous Scheming
			[193] = 0.01, -- Blightborne Infusion
			[194] = 0.07, -- Filthy Transfusion
			[195] = 0.04, -- Secrets of the Deep
			[196] = 0.01, -- Swirling Sands
			[219] = 0.04, -- Reawakening
			[241] = 0.05, -- Twisted Claws
			[360] = 0.05, -- Gory Regeneration
			[361] = 0.01, -- Guardian's Wrath
			[459] = 0.05, -- Unstable Flames
			[462] = 0.04, -- Azerite Globules
			[463] = 0.02, -- Blessed Portents
			[467] = 0.06, -- Ursoc's Endurance
			[479] = 0.02, -- Dagger in the Back
			[480] = 0.02, -- Blood Rite
			[483] = 0.01, -- Archive of the Titans
			[485] = 0.05, -- Laser Matrix
			[492] = 0.03, -- Liberator's Might
			[493] = 0.03, -- Last Gift
			[494] = 0.03, -- Battlefield Precision
			[495] = 0.03, -- Anduin's Dedication
			[499] = 0.02, -- Ricocheting Inflatable Pyrosaw
			[500] = 0.02, -- Synaptic Spark Capacitor
			[502] = 0.01, -- Personal Absorb-o-Tron
			[503] = 0.04, -- Auto-Self-Cauterizer
			[504] = 0.03, -- Unstable Catalyst
			[521] = 0.03, -- Shadow of Elune
			[523] = 0.04, -- Apothecary's Concoctions
			[526] = 0.03, -- Endless Hunger
			[560] = 0.01, -- Bonded Souls
			[561] = 0.06, -- Seductive Power
			[562] = 0.05, -- Treacherous Covenant
		})

		-- Restoration
		insertDefaultScalesData(defaultName, 11, 4, {

		})

	-- Demon Hunter
		-- Havoc
		insertDefaultScalesData(defaultName, 12, 1, {
			[13] = 0.08, -- Azerite Empowered
			[14] = 0.03, -- Longstrider
			[15] = 0.05, -- Resounding Protection
			[18] = 1.52, -- Blood Siphon
			[20] = 1.74, -- Lifespeed
			[21] = 1.95, -- Elemental Whirl
			[22] = 3.20, -- Heed My Call
			[30] = 3.36, -- Overwhelming Power
			[31] = 3.43, -- Gutripper
			[43] = 0.07, -- Winds of War
			[44] = 0.17, -- Vampiric Speed
			[82] = 6.45, -- Champion of Azeroth
			[83] = 0.14, -- Impassive Visage
			[84] = 0.21, -- Bulwark of the Masses
			[85] = 0.02, -- Gemhide
			[86] = 0.12, -- Azerite Fortification
			[87] = 0.10, -- Self Reliance
			[89] = 0.02, -- Azerite Veins
			[98] = 0.08, -- Crystalline Carapace
			[99] = 0.09, -- Ablative Shielding
			[126] = 7.88, -- Revolving Blades
			[156] = 4.07, -- Ruinous Bolt
			[157] = 7.07, -- Rezan's Fury
			[159] = 6.80, -- Furious Gaze
			[160] = 0.08, -- Infernal Armor
			[192] = 4.18, -- Meticulous Scheming
			[193] = 6.41, -- Blightborne Infusion
			[194] = 6.01, -- Filthy Transfusion
			[195] = 5.57, -- Secrets of the Deep
			[196] = 5.74, -- Swirling Sands
			[202] = 0.16, -- Soulmonger
			[245] = 6.50, -- Seething Power
			[352] = 10.00, -- Thirsting Blades
			[353] = 3.07, -- Eyes of Rage
			[459] = 2.33, -- Unstable Flames
			[461] = 1.94, -- Earthlink
			[462] = 2.07, -- Azerite Globules
			[466] = 0.24, -- Burning Soul
			[478] = 6.80, -- Tidal Surge
			[479] = 8.05, -- Dagger in the Back
			[480] = 3.41, -- Blood Rite
			[481] = 3.45, -- Incite the Pack
			[482] = 5.91, -- Thunderous Blast
			[483] = 5.92, -- Archive of the Titans
			[485] = 6.29, -- Laser Matrix
			[492] = 3.66, -- Liberator's Might
			[493] = 0.07, -- Last Gift
			[494] = 7.12, -- Battlefield Precision
			[495] = 5.50, -- Anduin's Dedication
			[496] = 1.22, -- Stronger Together
			[497] = 1.54, -- Stand As One
			[498] = 4.54, -- Barrage Of Many Bombs
			[499] = 2.86, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.72, -- Synaptic Spark Capacitor
			[501] = 5.09, -- Relational Normalization Gizmo
			[502] = 0.16, -- Personal Absorb-o-Tron
			[503] = 0.07, -- Auto-Self-Cauterizer
			[504] = 6.36, -- Unstable Catalyst
			[505] = 4.03, -- Tradewinds
			[521] = 0.12, -- Shadow of Elune
			[522] = 0.21, -- Ancients' Bulwark
			[523] = 0.11, -- Apothecary's Concoctions
			[526] = 0.09, -- Endless Hunger
			[541] = 0.12, -- Fight or Flight
			[555] = 0.20, -- Chaotic Transformation
			[560] = 0.10, -- Bonded Souls
			[561] = 0.17, -- Seductive Power
			[562] = 0.16, -- Treacherous Covenant
			[564] = 0.11, -- Thrive in Chaos
		})

		-- Vengeance
		insertDefaultScalesData(offensiveName, 12, 2, {
			[18] = 1.81, -- Blood Siphon
			[20] = 2.06, -- Lifespeed
			[21] = 2.11, -- Elemental Whirl
			[22] = 4.41, -- Heed My Call
			[30] = 3.47, -- Overwhelming Power
			[31] = 4.69, -- Gutripper
			[43] = 0.03, -- Winds of War
			[44] = 0.02, -- Vampiric Speed
			[82] = 6.95, -- Champion of Azeroth
			[83] = 0.09, -- Impassive Visage
			[84] = 0.10, -- Bulwark of the Masses
			[85] = 0.06, -- Gemhide
			[86] = 0.13, -- Azerite Fortification
			[87] = 0.05, -- Self Reliance
			[98] = 0.10, -- Crystalline Carapace
			[99] = 0.04, -- Ablative Shielding
			[100] = 0.11, -- Strength in Numbers
			[101] = 0.14, -- Shimmering Haven
			[134] = 0.06, -- Revel in Pain
			[156] = 6.17, -- Ruinous Bolt
			[157] = 9.97, -- Rezan's Fury
			[192] = 4.78, -- Meticulous Scheming
			[193] = 6.67, -- Blightborne Infusion
			[194] = 8.71, -- Filthy Transfusion
			[195] = 5.32, -- Secrets of the Deep
			[196] = 5.95, -- Swirling Sands
			[202] = 0.05, -- Soulmonger
			[221] = 0.04, -- Rigid Carapace
			[459] = 2.35, -- Unstable Flames
			[461] = 1.82, -- Earthlink
			[462] = 2.95, -- Azerite Globules
			[466] = 0.11, -- Burning Soul
			[478] = 9.99, -- Tidal Surge
			[479] = 8.06, -- Dagger in the Back
			[480] = 3.73, -- Blood Rite
			[481] = 4.15, -- Incite the Pack
			[482] = 8.32, -- Thunderous Blast
			[483] = 5.56, -- Archive of the Titans
			[485] = 8.74, -- Laser Matrix
			[492] = 4.19, -- Liberator's Might
			[493] = 0.13, -- Last Gift
			[494] = 10.00, -- Battlefield Precision
			[495] = 4.91, -- Anduin's Dedication
			[496] = 1.21, -- Stronger Together
			[497] = 1.41, -- Stand As One
			[498] = 6.40, -- Barrage Of Many Bombs
			[499] = 4.03, -- Ricocheting Inflatable Pyrosaw
			[500] = 7.77, -- Synaptic Spark Capacitor
			[501] = 5.53, -- Relational Normalization Gizmo
			[502] = 0.16, -- Personal Absorb-o-Tron
			[503] = 0.01, -- Auto-Self-Cauterizer
			[504] = 5.82, -- Unstable Catalyst
			[505] = 4.68, -- Tradewinds
			[521] = 0.08, -- Shadow of Elune
			[522] = 0.03, -- Ancients' Bulwark
			[523] = 0.01, -- Apothecary's Concoctions
			[526] = 0.01, -- Endless Hunger
			[558] = 0.04, -- Hour of Reaping
			[560] = 0.06, -- Bonded Souls
		})
		insertDefaultScalesData(defensiveName, 12, 2, {
			[15] = 10.00, -- Resounding Protection
			[18] = 2.15, -- Blood Siphon
			[20] = 1.00, -- Lifespeed
			[21] = 0.53, -- Elemental Whirl
			[30] = 1.74, -- Overwhelming Power
			[43] = 0.07, -- Winds of War
			[82] = 2.07, -- Champion of Azeroth
			[84] = 0.04, -- Bulwark of the Masses
			[86] = 0.02, -- Azerite Fortification
			[89] = 0.02, -- Azerite Veins
			[101] = 0.01, -- Shimmering Haven
			[156] = 0.02, -- Ruinous Bolt
			[192] = 2.47, -- Meticulous Scheming
			[193] = 1.34, -- Blightborne Infusion
			[195] = 1.25, -- Secrets of the Deep
			[196] = 1.22, -- Swirling Sands
			[202] = 0.02, -- Soulmonger
			[355] = 0.03, -- Essence Sever
			[459] = 0.49, -- Unstable Flames
			[461] = 0.37, -- Earthlink
			[480] = 1.94, -- Blood Rite
			[481] = 0.98, -- Incite the Pack
			[482] = 0.01, -- Thunderous Blast
			[483] = 1.34, -- Archive of the Titans
			[492] = 1.13, -- Liberator's Might
			[493] = 0.02, -- Last Gift
			[495] = 1.10, -- Anduin's Dedication
			[496] = 0.24, -- Stronger Together
			[497] = 0.17, -- Stand As One
			[501] = 1.67, -- Relational Normalization Gizmo
			[503] = 0.03, -- Auto-Self-Cauterizer
			[504] = 1.37, -- Unstable Catalyst
			[505] = 1.05, -- Tradewinds
			[521] = 0.01, -- Shadow of Elune
			[522] = 0.05, -- Ancients' Bulwark
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
