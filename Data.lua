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
			-- Iterations: 7194 - 10502 (avg 7830), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[14] = 0.12, -- Longstrider
			[18] = 2.1, -- Blood Siphon
			[20] = 2.42, -- Lifespeed
			[21] = 2.48, -- Elemental Whirl
			[22] = 3.07, -- Heed My Call
			[30] = 4.36, -- Overwhelming Power
			[31] = 3.71, -- Gutripper
			[43] = 0.04, -- Winds of War
			[44] = 0.1, -- Vampiric Speed
			[82] = 8.22, -- Champion of Azeroth
			[84] = 0.03, -- Bulwark of the Masses
			[86] = 0.01, -- Azerite Fortification
			[98] = 0.07, -- Crystalline Carapace
			[99] = 0.03, -- Ablative Shielding
			[121] = 6.42, -- Striking the Anvil
			[156] = 4.49, -- Ruinous Bolt
			[157] = 7.48, -- Rezan's Fury
			[174] = 7.25, -- Gathering Storm
			[192] = 6.06, -- Meticulous Scheming
			[193] = 8.29, -- Blightborne Infusion
			[194] = 6.72, -- Filthy Transfusion
			[195] = 5.5, -- Secrets of the Deep
			[196] = 7.36, -- Swirling Sands
			[226] = 10, -- Test of Might
			[433] = 4.58, -- Seismic Wave
			[434] = 9.75, -- Crushing Assault
			[435] = 5.76, -- Lord of War
			[459] = 2.86, -- Unstable Flames
			[461] = 1.96, -- Earthlink
			[462] = 2.23, -- Azerite Globules
			[478] = 7.33, -- Tidal Surge
			[479] = 8.2, -- Dagger in the Back
			[480] = 4.74, -- Blood Rite
			[481] = 5.43, -- Incite the Pack
			[482] = 6.34, -- Thunderous Blast
			[483] = 6.03, -- Archive of the Titans
			[485] = 6.45, -- Laser Matrix
			[492] = 4.9, -- Liberator's Might
			[493] = 3.19, -- Last Gift
			[494] = 7.35, -- Battlefield Precision
			[495] = 5.26, -- Anduin's Dedication
			[496] = 1.32, -- Stronger Together
			[497] = 1.41, -- Stand As One
			[498] = 4.78, -- Barrage Of Many Bombs
			[499] = 3.01, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.02, -- Synaptic Spark Capacitor
			[501] = 6.2, -- Relational Normalization Gizmo
			[502] = 0.05, -- Personal Absorb-o-Tron
			[503] = 0.05, -- Auto-Self-Cauterizer
			[504] = 6.17, -- Unstable Catalyst
			[505] = 5.98, -- Tradewinds
			[521] = 4.76, -- Shadow of Elune
			[522] = 7.06, -- Ancients' Bulwark
			[523] = 5.85, -- Apothecary's Concoctions
			[526] = 7.01, -- Endless Hunger
			[554] = 0.03, -- Intimidating Presence
			[560] = 2.45, -- Bonded Souls
			[561] = 4.8, -- Seductive Power
			[562] = 9.4, -- Treacherous Covenant
		})

		-- Fury
		insertDefaultScalesData(defaultName, 1, 2, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 7476 - 11539 (avg 8228), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.07, -- Azerite Empowered
			[15] = 0.02, -- Resounding Protection
			[18] = 1.97, -- Blood Siphon
			[20] = 2.34, -- Lifespeed
			[21] = 2.21, -- Elemental Whirl
			[22] = 3.24, -- Heed My Call
			[30] = 4.63, -- Overwhelming Power
			[31] = 3.59, -- Gutripper
			[82] = 7.57, -- Champion of Azeroth
			[84] = 0.06, -- Bulwark of the Masses
			[119] = 10, -- Unbridled Ferocity
			[156] = 3.42, -- Ruinous Bolt
			[157] = 7.13, -- Rezan's Fury
			[176] = 6.66, -- Cold Steel, Hot Blood
			[192] = 5.64, -- Meticulous Scheming
			[193] = 6.42, -- Blightborne Infusion
			[194] = 6.58, -- Filthy Transfusion
			[195] = 4.45, -- Secrets of the Deep
			[196] = 5.87, -- Swirling Sands
			[229] = 5.82, -- Pulverizing Blows
			[437] = 7.75, -- Simmering Rage
			[438] = 7.81, -- Reckless Flurry
			[451] = 5.63, -- Infinite Fury
			[459] = 2.24, -- Unstable Flames
			[461] = 1.69, -- Earthlink
			[462] = 2.16, -- Azerite Globules
			[476] = 0.03, -- Moment of Glory
			[477] = 0.03, -- Bury the Hatchet
			[478] = 5.68, -- Tidal Surge
			[479] = 6.75, -- Dagger in the Back
			[480] = 4.23, -- Blood Rite
			[481] = 5.02, -- Incite the Pack
			[482] = 6.31, -- Thunderous Blast
			[483] = 5.01, -- Archive of the Titans
			[485] = 6.65, -- Laser Matrix
			[492] = 4.18, -- Liberator's Might
			[493] = 3.05, -- Last Gift
			[494] = 7.16, -- Battlefield Precision
			[495] = 4.46, -- Anduin's Dedication
			[496] = 1.2, -- Stronger Together
			[497] = 1.21, -- Stand As One
			[498] = 4.77, -- Barrage Of Many Bombs
			[499] = 2.86, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.21, -- Synaptic Spark Capacitor
			[501] = 5.38, -- Relational Normalization Gizmo
			[504] = 5.17, -- Unstable Catalyst
			[505] = 5.48, -- Tradewinds
			[521] = 4.18, -- Shadow of Elune
			[522] = 6.24, -- Ancients' Bulwark
			[523] = 4.7, -- Apothecary's Concoctions
			[526] = 6.2, -- Endless Hunger
			[541] = 0.03, -- Fight or Flight
			[560] = 2.77, -- Bonded Souls
			[561] = 4.52, -- Seductive Power
			[562] = 7.72, -- Treacherous Covenant
		})

		-- Protection
		insertDefaultScalesData(offensiveName, 1, 3, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 5619 - 8620 (avg 6258), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.05, -- Azerite Empowered
			[14] = 0.04, -- Longstrider
			[15] = 0.1, -- Resounding Protection
			[18] = 1.87, -- Blood Siphon
			[20] = 2.1, -- Lifespeed
			[21] = 2.22, -- Elemental Whirl
			[22] = 4.47, -- Heed My Call
			[30] = 4.31, -- Overwhelming Power
			[31] = 4.89, -- Gutripper
			[43] = 0.07, -- Winds of War
			[44] = 0.12, -- Vampiric Speed
			[82] = 7.1, -- Champion of Azeroth
			[83] = 0.08, -- Impassive Visage
			[84] = 0.15, -- Bulwark of the Masses
			[85] = 0.07, -- Gemhide
			[86] = 0.05, -- Azerite Fortification
			[87] = 0.11, -- Self Reliance
			[89] = 0.01, -- Azerite Veins
			[98] = 0.09, -- Crystalline Carapace
			[99] = 0.09, -- Ablative Shielding
			[100] = 0.03, -- Strength in Numbers
			[101] = 0.13, -- Shimmering Haven
			[118] = 4.49, -- Deafening Crash
			[156] = 5.26, -- Ruinous Bolt
			[157] = 10, -- Rezan's Fury
			[177] = 0.12, -- Bloodsport
			[192] = 5.39, -- Meticulous Scheming
			[193] = 6.95, -- Blightborne Infusion
			[194] = 9.11, -- Filthy Transfusion
			[195] = 5.44, -- Secrets of the Deep
			[196] = 6.15, -- Swirling Sands
			[237] = 7.21, -- Bastion of Might
			[440] = 0.14, -- Callous Reprisal
			[441] = 4.19, -- Iron Fortress
			[450] = 4.34, -- Brace for Impact
			[459] = 2.37, -- Unstable Flames
			[461] = 1.93, -- Earthlink
			[462] = 2.94, -- Azerite Globules
			[476] = 0.12, -- Moment of Glory
			[477] = 0.05, -- Bury the Hatchet
			[478] = 8.79, -- Tidal Surge
			[479] = 7.08, -- Dagger in the Back
			[480] = 4.12, -- Blood Rite
			[481] = 4.41, -- Incite the Pack
			[482] = 8.66, -- Thunderous Blast
			[483] = 5.8, -- Archive of the Titans
			[485] = 9.05, -- Laser Matrix
			[492] = 4.11, -- Liberator's Might
			[493] = 2.65, -- Last Gift
			[494] = 9.26, -- Battlefield Precision
			[495] = 5.18, -- Anduin's Dedication
			[496] = 1.43, -- Stronger Together
			[497] = 1.53, -- Stand As One
			[498] = 6.66, -- Barrage Of Many Bombs
			[499] = 4.14, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.69, -- Synaptic Spark Capacitor
			[501] = 5.65, -- Relational Normalization Gizmo
			[502] = 0.16, -- Personal Absorb-o-Tron
			[503] = 0.04, -- Auto-Self-Cauterizer
			[504] = 5.89, -- Unstable Catalyst
			[505] = 4.76, -- Tradewinds
			[521] = 4.26, -- Shadow of Elune
			[522] = 6.79, -- Ancients' Bulwark
			[523] = 7.4, -- Apothecary's Concoctions
			[526] = 6.77, -- Endless Hunger
			[554] = 0.17, -- Intimidating Presence
			[560] = 2.39, -- Bonded Souls
			[561] = 4.97, -- Seductive Power
			[562] = 9.21, -- Treacherous Covenant
		})
		insertDefaultScalesData(defensiveName, 1, 3, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 5487 - 8318 (avg 6224), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[15] = 10, -- Resounding Protection
			[18] = 5.05, -- Blood Siphon
			[21] = 0.01, -- Elemental Whirl
			[30] = 0.06, -- Overwhelming Power
			[43] = 0.01, -- Winds of War
			[44] = 0.01, -- Vampiric Speed
			[82] = 0.03, -- Champion of Azeroth
			[83] = 0.01, -- Impassive Visage
			[85] = 0.01, -- Gemhide
			[99] = 0.01, -- Ablative Shielding
			[157] = 0.06, -- Rezan's Fury
			[177] = 5.21, -- Bloodsport
			[192] = 0.06, -- Meticulous Scheming
			[193] = 0.11, -- Blightborne Infusion
			[194] = 0.09, -- Filthy Transfusion
			[195] = 0.02, -- Secrets of the Deep
			[196] = 0.08, -- Swirling Sands
			[237] = 0.95, -- Bastion of Might
			[441] = 0.01, -- Iron Fortress
			[450] = 0.01, -- Brace for Impact
			[459] = 0.04, -- Unstable Flames
			[476] = 0.01, -- Moment of Glory
			[477] = 0.01, -- Bury the Hatchet
			[479] = 0.08, -- Dagger in the Back
			[480] = 0.05, -- Blood Rite
			[483] = 0.02, -- Archive of the Titans
			[492] = 0.06, -- Liberator's Might
			[496] = 0.01, -- Stronger Together
			[501] = 0.01, -- Relational Normalization Gizmo
			[503] = 0.01, -- Auto-Self-Cauterizer
			[504] = 0.01, -- Unstable Catalyst
			[521] = 0.04, -- Shadow of Elune
			[523] = 0.05, -- Apothecary's Concoctions
			[554] = 0.01, -- Intimidating Presence
			[562] = 0.03, -- Treacherous Covenant
		})

	-- Paladin
		-- Holy
		insertDefaultScalesData(defaultName, 2, 1, {

		})

		-- Protection
		insertDefaultScalesData(offensiveName, 2, 2, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 13417 - 17130 (avg 14234), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.04, -- Azerite Empowered
			[14] = 0.09, -- Longstrider
			[18] = 1.44, -- Blood Siphon
			[20] = 1.45, -- Lifespeed
			[21] = 1.81, -- Elemental Whirl
			[22] = 3.39, -- Heed My Call
			[30] = 2.98, -- Overwhelming Power
			[31] = 3.84, -- Gutripper
			[38] = 1.59, -- On My Way
			[44] = 0.09, -- Vampiric Speed
			[82] = 5.43, -- Champion of Azeroth
			[84] = 0.01, -- Bulwark of the Masses
			[89] = 0.09, -- Azerite Veins
			[98] = 0.05, -- Crystalline Carapace
			[99] = 0.05, -- Ablative Shielding
			[100] = 0.11, -- Strength in Numbers
			[101] = 0.02, -- Shimmering Haven
			[103] = 0.09, -- Concentrated Mending
			[104] = 0.06, -- Bracing Chill
			[105] = 0.05, -- Ephemeral Recovery
			[125] = 3.42, -- Avenger's Might
			[144] = 0.1, -- Rejuvenating Grace
			[145] = 0.08, -- Fortifying Auras
			[148] = 0.03, -- Righteous Flames
			[149] = 0.06, -- Healing Hammer
			[150] = 1.49, -- Soaring Shield
			[156] = 4.45, -- Ruinous Bolt
			[157] = 7.69, -- Rezan's Fury
			[189] = 0.01, -- Righteous Conviction
			[192] = 4.25, -- Meticulous Scheming
			[193] = 5.58, -- Blightborne Infusion
			[194] = 6.72, -- Filthy Transfusion
			[195] = 4.27, -- Secrets of the Deep
			[196] = 4.96, -- Swirling Sands
			[206] = 0.03, -- Stalwart Protector
			[234] = 1.57, -- Inner Light
			[235] = 3.79, -- Indomitable Justice
			[393] = 0.07, -- Grace of the Justicar
			[395] = 10, -- Inspiring Vanguard
			[454] = 0.08, -- Judicious Defense
			[459] = 1.95, -- Unstable Flames
			[461] = 1.5, -- Earthlink
			[462] = 2.22, -- Azerite Globules
			[463] = 0.01, -- Blessed Portents
			[471] = 0.05, -- Gallant Steed
			[478] = 7.34, -- Tidal Surge
			[479] = 6.19, -- Dagger in the Back
			[480] = 3.14, -- Blood Rite
			[481] = 3.31, -- Incite the Pack
			[482] = 6.53, -- Thunderous Blast
			[483] = 4.61, -- Archive of the Titans
			[485] = 6.87, -- Laser Matrix
			[492] = 3.26, -- Liberator's Might
			[493] = 1.95, -- Last Gift
			[494] = 7.98, -- Battlefield Precision
			[495] = 4.28, -- Anduin's Dedication
			[496] = 1.01, -- Stronger Together
			[497] = 1.06, -- Stand As One
			[498] = 5.07, -- Barrage Of Many Bombs
			[499] = 3.06, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.06, -- Synaptic Spark Capacitor
			[501] = 4.53, -- Relational Normalization Gizmo
			[502] = 0.02, -- Personal Absorb-o-Tron
			[503] = 0.02, -- Auto-Self-Cauterizer
			[504] = 4.87, -- Unstable Catalyst
			[505] = 3.57, -- Tradewinds
			[521] = 3.27, -- Shadow of Elune
			[522] = 5.23, -- Ancients' Bulwark
			[523] = 6.28, -- Apothecary's Concoctions
			[526] = 5.14, -- Endless Hunger
			[538] = 0.07, -- Empyreal Ward
			[560] = 1.56, -- Bonded Souls
			[561] = 3.64, -- Seductive Power
			[562] = 7.42, -- Treacherous Covenant
		})
		insertDefaultScalesData(defensiveName, 2, 2, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 13532 - 17112 (avg 14237), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[15] = 10, -- Resounding Protection
			[18] = 2.9, -- Blood Siphon
			[21] = 0.01, -- Elemental Whirl
			[38] = 0.01, -- On My Way
			[82] = 0.02, -- Champion of Azeroth
			[125] = 0.01, -- Avenger's Might
			[150] = 0.01, -- Soaring Shield
			[481] = 0.03, -- Incite the Pack
			[493] = 0.01, -- Last Gift
			[497] = 0.01, -- Stand As One
			[501] = 0.02, -- Relational Normalization Gizmo
			[505] = 0.03, -- Tradewinds
			[522] = 0.04, -- Ancients' Bulwark
			[526] = 0.04, -- Endless Hunger
			[561] = 0.05, -- Seductive Power
		})

		-- Retribution
		insertDefaultScalesData(defaultName, 2, 3, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 11482 - 14217 (avg 12316), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.08, -- Azerite Empowered
			[18] = 1.65, -- Blood Siphon
			[20] = 1.92, -- Lifespeed
			[21] = 1.95, -- Elemental Whirl
			[22] = 2.53, -- Heed My Call
			[30] = 3.19, -- Overwhelming Power
			[31] = 2.58, -- Gutripper
			[38] = 1.66, -- On My Way
			[42] = 0.01, -- Savior
			[82] = 6.24, -- Champion of Azeroth
			[89] = 0.05, -- Azerite Veins
			[101] = 0.05, -- Shimmering Haven
			[103] = 0.01, -- Concentrated Mending
			[125] = 4.58, -- Avenger's Might
			[143] = 0.03, -- Inspiring Beacon
			[144] = 0.09, -- Rejuvenating Grace
			[145] = 0.07, -- Fortifying Auras
			[154] = 5.4, -- Relentless Inquisitor
			[156] = 3.3, -- Ruinous Bolt
			[157] = 5.48, -- Rezan's Fury
			[187] = 4.23, -- Expurgation
			[192] = 4.78, -- Meticulous Scheming
			[193] = 5.61, -- Blightborne Infusion
			[194] = 5.01, -- Filthy Transfusion
			[195] = 4.33, -- Secrets of the Deep
			[196] = 4.78, -- Swirling Sands
			[235] = 4.71, -- Indomitable Justice
			[396] = 10, -- Light's Decree
			[453] = 6.42, -- Empyrean Power
			[454] = 0.02, -- Judicious Defense
			[459] = 2.02, -- Unstable Flames
			[461] = 1.56, -- Earthlink
			[462] = 1.47, -- Azerite Globules
			[463] = 0.02, -- Blessed Portents
			[471] = 0.05, -- Gallant Steed
			[478] = 5.23, -- Tidal Surge
			[479] = 6.47, -- Dagger in the Back
			[480] = 3.52, -- Blood Rite
			[481] = 3.88, -- Incite the Pack
			[482] = 4.69, -- Thunderous Blast
			[483] = 4.67, -- Archive of the Titans
			[485] = 4.86, -- Laser Matrix
			[492] = 3.44, -- Liberator's Might
			[493] = 2.23, -- Last Gift
			[494] = 5.16, -- Battlefield Precision
			[495] = 4.3, -- Anduin's Dedication
			[496] = 1.11, -- Stronger Together
			[497] = 1.16, -- Stand As One
			[498] = 3.54, -- Barrage Of Many Bombs
			[499] = 2.07, -- Ricocheting Inflatable Pyrosaw
			[500] = 2.89, -- Synaptic Spark Capacitor
			[501] = 4.63, -- Relational Normalization Gizmo
			[504] = 4.7, -- Unstable Catalyst
			[505] = 4.17, -- Tradewinds
			[521] = 3.59, -- Shadow of Elune
			[522] = 5.83, -- Ancients' Bulwark
			[523] = 4.4, -- Apothecary's Concoctions
			[526] = 5.73, -- Endless Hunger
			[541] = 0.02, -- Fight or Flight
			[560] = 1.69, -- Bonded Souls
			[561] = 4.02, -- Seductive Power
			[562] = 7.63, -- Treacherous Covenant
		})

	-- Hunter
		-- Beast Mastery
		insertDefaultScalesData(defaultName, 3, 1, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 7175 - 9851 (avg 7950), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[18] = 2.08, -- Blood Siphon
			[21] = 2.44, -- Elemental Whirl
			[22] = 3.01, -- Heed My Call
			[30] = 3.53, -- Overwhelming Power
			[31] = 3.26, -- Gutripper
			[44] = 0.1, -- Vampiric Speed
			[82] = 7.52, -- Champion of Azeroth
			[107] = 4.82, -- Serrated Jaws
			[156] = 4.03, -- Ruinous Bolt
			[157] = 6.73, -- Rezan's Fury
			[161] = 6.79, -- Haze of Rage
			[192] = 5.42, -- Meticulous Scheming
			[193] = 7.37, -- Blightborne Infusion
			[194] = 6.02, -- Filthy Transfusion
			[195] = 5.84, -- Secrets of the Deep
			[196] = 6.18, -- Swirling Sands
			[211] = 4.29, -- Dance of Death
			[365] = 6.84, -- Dire Consequences
			[366] = 9.1, -- Primal Instincts
			[367] = 6.37, -- Feeding Frenzy
			[459] = 2.67, -- Unstable Flames
			[461] = 1.94, -- Earthlink
			[462] = 1.82, -- Azerite Globules
			[469] = 0.01, -- Duck and Cover
			[478] = 6.7, -- Tidal Surge
			[479] = 7.65, -- Dagger in the Back
			[480] = 4.12, -- Blood Rite
			[481] = 5.36, -- Incite the Pack
			[482] = 5.64, -- Thunderous Blast
			[483] = 6.17, -- Archive of the Titans
			[485] = 5.86, -- Laser Matrix
			[492] = 4.37, -- Liberator's Might
			[493] = 2.97, -- Last Gift
			[494] = 6.74, -- Battlefield Precision
			[495] = 5.74, -- Anduin's Dedication
			[496] = 1.27, -- Stronger Together
			[497] = 1.62, -- Stand As One
			[498] = 4.18, -- Barrage Of Many Bombs
			[499] = 2.64, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.64, -- Synaptic Spark Capacitor
			[501] = 5.79, -- Relational Normalization Gizmo
			[503] = 0.02, -- Auto-Self-Cauterizer
			[504] = 6.57, -- Unstable Catalyst
			[505] = 5.83, -- Tradewinds
			[521] = 4.17, -- Shadow of Elune
			[522] = 7.02, -- Ancients' Bulwark
			[523] = 5.4, -- Apothecary's Concoctions
			[526] = 6.95, -- Endless Hunger
			[560] = 2.07, -- Bonded Souls
			[561] = 4.85, -- Seductive Power
			[562] = 10, -- Treacherous Covenant
		})

		-- Marksmanship
		insertDefaultScalesData(defaultName, 3, 2, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 10420 - 13259 (avg 10948), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[18] = 1.5, -- Blood Siphon
			[21] = 1.75, -- Elemental Whirl
			[22] = 2.06, -- Heed My Call
			[30] = 2.96, -- Overwhelming Power
			[31] = 2.2, -- Gutripper
			[36] = 5.86, -- In The Rhythm
			[82] = 5.53, -- Champion of Azeroth
			[83] = 0.03, -- Impassive Visage
			[156] = 3.03, -- Ruinous Bolt
			[157] = 4.9, -- Rezan's Fury
			[162] = 3.69, -- Surging Shots
			[192] = 4.37, -- Meticulous Scheming
			[193] = 5.38, -- Blightborne Infusion
			[194] = 4.45, -- Filthy Transfusion
			[195] = 3.92, -- Secrets of the Deep
			[196] = 4.64, -- Swirling Sands
			[203] = 0.01, -- Shellshock
			[212] = 10, -- Unerring Vision
			[368] = 3.14, -- Steady Aim
			[370] = 4.27, -- Focused Fire
			[459] = 1.72, -- Unstable Flames
			[461] = 1.42, -- Earthlink
			[462] = 1.35, -- Azerite Globules
			[478] = 5.04, -- Tidal Surge
			[479] = 5.61, -- Dagger in the Back
			[480] = 3.55, -- Blood Rite
			[481] = 3.47, -- Incite the Pack
			[482] = 4.13, -- Thunderous Blast
			[483] = 4.23, -- Archive of the Titans
			[485] = 4.29, -- Laser Matrix
			[492] = 3.37, -- Liberator's Might
			[493] = 2.13, -- Last Gift
			[494] = 4.73, -- Battlefield Precision
			[495] = 3.91, -- Anduin's Dedication
			[496] = 0.95, -- Stronger Together
			[497] = 0.94, -- Stand As One
			[498] = 3.17, -- Barrage Of Many Bombs
			[499] = 1.85, -- Ricocheting Inflatable Pyrosaw
			[500] = 2.77, -- Synaptic Spark Capacitor
			[501] = 4.42, -- Relational Normalization Gizmo
			[504] = 4.3, -- Unstable Catalyst
			[505] = 3.77, -- Tradewinds
			[521] = 3.52, -- Shadow of Elune
			[522] = 5.45, -- Ancients' Bulwark
			[523] = 3.92, -- Apothecary's Concoctions
			[526] = 5.36, -- Endless Hunger
			[541] = 0.05, -- Fight or Flight
			[560] = 1.53, -- Bonded Souls
			[561] = 3.14, -- Seductive Power
			[562] = 6.85, -- Treacherous Covenant
		})

		-- Survival
		insertDefaultScalesData(defaultName, 3, 3, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 6620 - 10441 (avg 8419), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.05, -- Azerite Empowered
			[15] = 0.06, -- Resounding Protection
			[18] = 1.32, -- Blood Siphon
			[21] = 1.64, -- Elemental Whirl
			[22] = 2.16, -- Heed My Call
			[30] = 3.35, -- Overwhelming Power
			[31] = 2.3, -- Gutripper
			[82] = 5.1, -- Champion of Azeroth
			[83] = 0.14, -- Impassive Visage
			[84] = 0.07, -- Bulwark of the Masses
			[85] = 0.03, -- Gemhide
			[87] = 0.04, -- Self Reliance
			[107] = 3.13, -- Serrated Jaws
			[110] = 2.05, -- Wildfire Cluster
			[156] = 2.81, -- Ruinous Bolt
			[157] = 4.73, -- Rezan's Fury
			[163] = 6.26, -- Latent Poison
			[192] = 4.12, -- Meticulous Scheming
			[193] = 4.92, -- Blightborne Infusion
			[194] = 4.19, -- Filthy Transfusion
			[195] = 4.02, -- Secrets of the Deep
			[196] = 4.2, -- Swirling Sands
			[203] = 0.13, -- Shellshock
			[213] = 3.96, -- Venomous Fangs
			[365] = 2.15, -- Dire Consequences
			[371] = 10, -- Blur of Talons
			[372] = 7.75, -- Wilderness Survival
			[373] = 5.55, -- Primeval Intuition
			[459] = 1.74, -- Unstable Flames
			[461] = 1.38, -- Earthlink
			[462] = 1.46, -- Azerite Globules
			[469] = 0.05, -- Duck and Cover
			[478] = 4.49, -- Tidal Surge
			[479] = 5.52, -- Dagger in the Back
			[480] = 3.64, -- Blood Rite
			[481] = 2.84, -- Incite the Pack
			[482] = 4.04, -- Thunderous Blast
			[483] = 4.23, -- Archive of the Titans
			[485] = 4.15, -- Laser Matrix
			[492] = 3.16, -- Liberator's Might
			[493] = 1.55, -- Last Gift
			[494] = 4.69, -- Battlefield Precision
			[495] = 3.85, -- Anduin's Dedication
			[496] = 1, -- Stronger Together
			[497] = 1.06, -- Stand As One
			[498] = 3.1, -- Barrage Of Many Bombs
			[499] = 1.93, -- Ricocheting Inflatable Pyrosaw
			[500] = 2.54, -- Synaptic Spark Capacitor
			[501] = 4.71, -- Relational Normalization Gizmo
			[503] = 0.14, -- Auto-Self-Cauterizer
			[504] = 4.42, -- Unstable Catalyst
			[505] = 3.06, -- Tradewinds
			[521] = 3.75, -- Shadow of Elune
			[522] = 4.96, -- Ancients' Bulwark
			[523] = 3.96, -- Apothecary's Concoctions
			[526] = 4.91, -- Endless Hunger
			[560] = 1.87, -- Bonded Souls
			[561] = 3.43, -- Seductive Power
			[562] = 6.79, -- Treacherous Covenant
		})

	-- Rogue
		-- Assassination
		insertDefaultScalesData(defaultName, 4, 1, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 8615 - 11850 (avg 9405), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[18] = 2, -- Blood Siphon
			[21] = 2.54, -- Elemental Whirl
			[22] = 2.93, -- Heed My Call
			[30] = 4.45, -- Overwhelming Power
			[31] = 3.1, -- Gutripper
			[82] = 8.06, -- Champion of Azeroth
			[136] = 8.96, -- Double Dose
			[156] = 3.85, -- Ruinous Bolt
			[157] = 6.9, -- Rezan's Fury
			[181] = 6.8, -- Twist the Knife
			[192] = 4.48, -- Meticulous Scheming
			[193] = 8.06, -- Blightborne Infusion
			[194] = 5.98, -- Filthy Transfusion
			[195] = 5.49, -- Secrets of the Deep
			[196] = 7.21, -- Swirling Sands
			[249] = 8.79, -- Nothing Personal
			[406] = 4.01, -- Scent of Blood
			[408] = 1.08, -- Shrouded Suffocation
			[459] = 2.78, -- Unstable Flames
			[461] = 1.97, -- Earthlink
			[462] = 1.8, -- Azerite Globules
			[478] = 6.85, -- Tidal Surge
			[479] = 7.93, -- Dagger in the Back
			[480] = 5.05, -- Blood Rite
			[481] = 5.03, -- Incite the Pack
			[482] = 5.77, -- Thunderous Blast
			[483] = 6.18, -- Archive of the Titans
			[485] = 5.92, -- Laser Matrix
			[492] = 5.01, -- Liberator's Might
			[493] = 2.79, -- Last Gift
			[494] = 6.94, -- Battlefield Precision
			[495] = 5.77, -- Anduin's Dedication
			[496] = 1.21, -- Stronger Together
			[497] = 1.37, -- Stand As One
			[498] = 4.34, -- Barrage Of Many Bombs
			[499] = 2.54, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.64, -- Synaptic Spark Capacitor
			[501] = 6.62, -- Relational Normalization Gizmo
			[504] = 6.45, -- Unstable Catalyst
			[505] = 5.47, -- Tradewinds
			[521] = 5.13, -- Shadow of Elune
			[522] = 7.44, -- Ancients' Bulwark
			[523] = 5.45, -- Apothecary's Concoctions
			[526] = 7.39, -- Endless Hunger
			[560] = 2.41, -- Bonded Souls
			[561] = 4.8, -- Seductive Power
			[562] = 10, -- Treacherous Covenant
		})

		-- Outlaw
		insertDefaultScalesData(defaultName, 4, 2, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 32577 - 47326 (avg 36112), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.15, -- Azerite Empowered
			[14] = 0.07, -- Longstrider
			[15] = 0.05, -- Resounding Protection
			[18] = 1.86, -- Blood Siphon
			[21] = 2.45, -- Elemental Whirl
			[22] = 3.68, -- Heed My Call
			[30] = 4.66, -- Overwhelming Power
			[31] = 3.82, -- Gutripper
			[44] = 0.13, -- Vampiric Speed
			[82] = 7.76, -- Champion of Azeroth
			[83] = 0.08, -- Impassive Visage
			[84] = 0.08, -- Bulwark of the Masses
			[85] = 0.14, -- Gemhide
			[86] = 0.17, -- Azerite Fortification
			[87] = 0.14, -- Self Reliance
			[129] = 8.04, -- Deadshot
			[156] = 5, -- Ruinous Bolt
			[157] = 8.16, -- Rezan's Fury
			[180] = 5.62, -- Keep Your Wits About You
			[192] = 6.48, -- Meticulous Scheming
			[193] = 6.96, -- Blightborne Infusion
			[194] = 6.44, -- Filthy Transfusion
			[195] = 5.88, -- Secrets of the Deep
			[196] = 6.36, -- Swirling Sands
			[217] = 0.14, -- Footpad
			[239] = 4.99, -- Snake Eyes
			[410] = 5.07, -- Paradise Lost
			[411] = 7.44, -- Ace Up Your Sleeve
			[446] = 9.52, -- Brigand's Blitz
			[459] = 2.5, -- Unstable Flames
			[461] = 2.14, -- Earthlink
			[462] = 2.41, -- Azerite Globules
			[473] = 0.06, -- Shrouded Mantle
			[478] = 8.22, -- Tidal Surge
			[479] = 9.3, -- Dagger in the Back
			[480] = 5.32, -- Blood Rite
			[481] = 4.07, -- Incite the Pack
			[482] = 6.65, -- Thunderous Blast
			[483] = 6.25, -- Archive of the Titans
			[485] = 7.05, -- Laser Matrix
			[492] = 4.6, -- Liberator's Might
			[493] = 2.66, -- Last Gift
			[494] = 7.98, -- Battlefield Precision
			[495] = 5.8, -- Anduin's Dedication
			[496] = 1.52, -- Stronger Together
			[497] = 1.46, -- Stand As One
			[498] = 5.12, -- Barrage Of Many Bombs
			[499] = 3.12, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.4, -- Synaptic Spark Capacitor
			[501] = 6.73, -- Relational Normalization Gizmo
			[502] = 0.06, -- Personal Absorb-o-Tron
			[503] = 0.11, -- Auto-Self-Cauterizer
			[504] = 6.47, -- Unstable Catalyst
			[505] = 4.66, -- Tradewinds
			[521] = 5.31, -- Shadow of Elune
			[522] = 7.18, -- Ancients' Bulwark
			[523] = 6.57, -- Apothecary's Concoctions
			[526] = 7.11, -- Endless Hunger
			[541] = 0.18, -- Fight or Flight
			[560] = 2.6, -- Bonded Souls
			[561] = 5.02, -- Seductive Power
			[562] = 10, -- Treacherous Covenant
		})

		-- Subtley
		insertDefaultScalesData(defaultName, 4, 3, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 12451 - 17148 (avg 15148), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.01, -- Azerite Empowered
			[14] = 0.04, -- Longstrider
			[15] = 0.04, -- Resounding Protection
			[18] = 0.79, -- Blood Siphon
			[21] = 0.92, -- Elemental Whirl
			[22] = 1.19, -- Heed My Call
			[30] = 1.5, -- Overwhelming Power
			[31] = 1.33, -- Gutripper
			[44] = 0.06, -- Vampiric Speed
			[82] = 2.95, -- Champion of Azeroth
			[83] = 0.04, -- Impassive Visage
			[84] = 0.06, -- Bulwark of the Masses
			[85] = 0.04, -- Gemhide
			[86] = 0.06, -- Azerite Fortification
			[87] = 0.04, -- Self Reliance
			[124] = 1.08, -- Replicating Shadows
			[156] = 1.84, -- Ruinous Bolt
			[157] = 2.74, -- Rezan's Fury
			[175] = 2.55, -- Night's Vengeance
			[192] = 1.8, -- Meticulous Scheming
			[193] = 2.77, -- Blightborne Infusion
			[194] = 2.27, -- Filthy Transfusion
			[195] = 2.25, -- Secrets of the Deep
			[196] = 2.47, -- Swirling Sands
			[217] = 0.05, -- Footpad
			[240] = 3.57, -- Blade In The Shadows
			[413] = 10, -- The First Dance
			[414] = 4.24, -- Inevitability
			[445] = 1.27, -- Perforate
			[459] = 0.94, -- Unstable Flames
			[461] = 0.84, -- Earthlink
			[462] = 0.78, -- Azerite Globules
			[473] = 0.04, -- Shrouded Mantle
			[478] = 3.08, -- Tidal Surge
			[479] = 3.18, -- Dagger in the Back
			[480] = 1.92, -- Blood Rite
			[481] = 1.74, -- Incite the Pack
			[482] = 2.27, -- Thunderous Blast
			[483] = 2.41, -- Archive of the Titans
			[485] = 2.41, -- Laser Matrix
			[492] = 1.74, -- Liberator's Might
			[493] = 1.05, -- Last Gift
			[494] = 2.77, -- Battlefield Precision
			[495] = 2.18, -- Anduin's Dedication
			[496] = 0.53, -- Stronger Together
			[497] = 0.58, -- Stand As One
			[498] = 1.78, -- Barrage Of Many Bombs
			[499] = 1.1, -- Ricocheting Inflatable Pyrosaw
			[500] = 1.67, -- Synaptic Spark Capacitor
			[501] = 2.45, -- Relational Normalization Gizmo
			[502] = 0.04, -- Personal Absorb-o-Tron
			[503] = 0.03, -- Auto-Self-Cauterizer
			[504] = 2.47, -- Unstable Catalyst
			[505] = 1.9, -- Tradewinds
			[521] = 1.87, -- Shadow of Elune
			[522] = 2.72, -- Ancients' Bulwark
			[523] = 2.28, -- Apothecary's Concoctions
			[526] = 2.7, -- Endless Hunger
			[541] = 0.01, -- Fight or Flight
			[548] = 0.03, -- Lying In Wait
			[560] = 0.86, -- Bonded Souls
			[561] = 1.81, -- Seductive Power
			[562] = 3.88, -- Treacherous Covenant
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
			-- First Imported: 03.09.2018, Updated: 27.01.2019
			[562] = 4.8,
			[405] = 4.67,
			[193] = 4.42,
			[82] = 4.29,
			[479] = 4.09,
			[196] = 3.93,
			[488] = 3.66,
			[157] = 3.56,
			[526] = 3.56,
			[522] = 3.56,
			[501] = 3.42,
			[192] = 3.34,
			[236] = 3.2,
			[483] = 3.19,
			[504] = 3.18,
			[485] = 3.18,
			[194] = 3.16,
			[478] = 3.14,
			[482] = 3.06,
			[403] = 3.01,
			[523] = 2.91,
			[195] = 2.87,
			[404] = 2.84,
			[505] = 2.79,
			[489] = 2.75,
			[30] = 2.7,
			[480] = 2.65,
			[521] = 2.63,
			[561] = 2.62,
			[486] = 2.59,
			[481] = 2.57,
			[498] = 2.28,
			[156] = 1.89,
			[31] = 1.74,
			[500] = 1.73,
			[22] = 1.59,
			[459] = 1.52,
			[487] = 1.47,
			[560] = 1.42,
			[499] = 1.4,
			[21] = 1.3,
			[166] = 1.22,
			[491] = 1.06,
			[18] = 1.05,
			[462] = 1.03,
			[38] = 1,
			[461] = 0.95,
			[490] = 0.79,
			[13] = 0.43,
			[541] = 0.01,
		})

	-- Death Knight
		-- Blood
		insertDefaultScalesData(offensiveName, 6, 1, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 7080 - 10252 (avg 7849), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.1, -- Azerite Empowered
			[14] = 0.14, -- Longstrider
			[15] = 0.16, -- Resounding Protection
			[18] = 1.77, -- Blood Siphon
			[20] = 1.72, -- Lifespeed
			[21] = 2.14, -- Elemental Whirl
			[22] = 4.39, -- Heed My Call
			[30] = 3.36, -- Overwhelming Power
			[31] = 4.96, -- Gutripper
			[43] = 0.2, -- Winds of War
			[44] = 0.11, -- Vampiric Speed
			[82] = 6.74, -- Champion of Azeroth
			[83] = 0.03, -- Impassive Visage
			[84] = 0.12, -- Bulwark of the Masses
			[85] = 0.23, -- Gemhide
			[86] = 0.1, -- Azerite Fortification
			[87] = 0.16, -- Self Reliance
			[89] = 0.14, -- Azerite Veins
			[98] = 0.11, -- Crystalline Carapace
			[99] = 0.06, -- Ablative Shielding
			[100] = 0.08, -- Strength in Numbers
			[101] = 0.1, -- Shimmering Haven
			[106] = 2.8, -- Deep Cuts
			[140] = 1.28, -- Bone Spike Graveyard
			[156] = 5.65, -- Ruinous Bolt
			[157] = 10, -- Rezan's Fury
			[192] = 4.51, -- Meticulous Scheming
			[193] = 7.25, -- Blightborne Infusion
			[194] = 9.3, -- Filthy Transfusion
			[195] = 5.11, -- Secrets of the Deep
			[196] = 6.47, -- Swirling Sands
			[197] = 0.03, -- Marrowblood
			[201] = 0.11, -- Runic Barrier
			[243] = 4.4, -- Bloody Runeblade
			[348] = 4.86, -- Eternal Rune Weapon
			[349] = 0.39, -- Bones of the Damned
			[459] = 2.52, -- Unstable Flames
			[461] = 1.76, -- Earthlink
			[462] = 3.02, -- Azerite Globules
			[465] = 0.12, -- March of the Damned
			[478] = 9.29, -- Tidal Surge
			[479] = 8.15, -- Dagger in the Back
			[480] = 3.61, -- Blood Rite
			[481] = 4.29, -- Incite the Pack
			[482] = 8.73, -- Thunderous Blast
			[483] = 5.68, -- Archive of the Titans
			[485] = 8.91, -- Laser Matrix
			[492] = 3.89, -- Liberator's Might
			[493] = 2.48, -- Last Gift
			[494] = 9.99, -- Battlefield Precision
			[495] = 5.11, -- Anduin's Dedication
			[496] = 1.23, -- Stronger Together
			[497] = 1.45, -- Stand As One
			[498] = 6.54, -- Barrage Of Many Bombs
			[499] = 3.98, -- Ricocheting Inflatable Pyrosaw
			[500] = 5.04, -- Synaptic Spark Capacitor
			[501] = 5.22, -- Relational Normalization Gizmo
			[502] = 0.02, -- Personal Absorb-o-Tron
			[503] = 0.04, -- Auto-Self-Cauterizer
			[504] = 5.86, -- Unstable Catalyst
			[505] = 4.62, -- Tradewinds
			[521] = 3.55, -- Shadow of Elune
			[522] = 6.62, -- Ancients' Bulwark
			[523] = 8.32, -- Apothecary's Concoctions
			[526] = 6.69, -- Endless Hunger
			[541] = 0.06, -- Fight or Flight
			[549] = 0.02, -- Cold Hearted
			[560] = 1.57, -- Bonded Souls
			[561] = 4.82, -- Seductive Power
			[562] = 8.88, -- Treacherous Covenant
		})
		insertDefaultScalesData(defensiveName, 6, 1, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 7252 - 10282 (avg 7830), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[15] = 10, -- Resounding Protection
			[18] = 1.91, -- Blood Siphon
			[20] = 1.46, -- Lifespeed
			[21] = 0.73, -- Elemental Whirl
			[22] = 0.08, -- Heed My Call
			[30] = 2.32, -- Overwhelming Power
			[31] = 0.1, -- Gutripper
			[44] = 0.09, -- Vampiric Speed
			[82] = 1.66, -- Champion of Azeroth
			[84] = 0.02, -- Bulwark of the Masses
			[85] = 0.15, -- Gemhide
			[86] = 0.04, -- Azerite Fortification
			[87] = 0.09, -- Self Reliance
			[89] = 0.05, -- Azerite Veins
			[98] = 0.01, -- Crystalline Carapace
			[101] = 0.11, -- Shimmering Haven
			[106] = 2.82, -- Deep Cuts
			[140] = 2.13, -- Bone Spike Graveyard
			[192] = 3.14, -- Meticulous Scheming
			[193] = 0.87, -- Blightborne Infusion
			[195] = 0.62, -- Secrets of the Deep
			[196] = 0.84, -- Swirling Sands
			[197] = 4.3, -- Marrowblood
			[201] = 0.12, -- Runic Barrier
			[243] = 5.46, -- Bloody Runeblade
			[348] = 0.94, -- Eternal Rune Weapon
			[349] = 0.63, -- Bones of the Damned
			[459] = 0.31, -- Unstable Flames
			[461] = 0.25, -- Earthlink
			[462] = 0.05, -- Azerite Globules
			[465] = 0.08, -- March of the Damned
			[478] = 0.05, -- Tidal Surge
			[479] = 0.07, -- Dagger in the Back
			[480] = 2.51, -- Blood Rite
			[481] = 0.51, -- Incite the Pack
			[483] = 0.63, -- Archive of the Titans
			[485] = 0.04, -- Laser Matrix
			[492] = 1.37, -- Liberator's Might
			[493] = 0.34, -- Last Gift
			[494] = 0.05, -- Battlefield Precision
			[495] = 0.7, -- Anduin's Dedication
			[496] = 0.4, -- Stronger Together
			[497] = 0.17, -- Stand As One
			[501] = 1.99, -- Relational Normalization Gizmo
			[502] = 0.03, -- Personal Absorb-o-Tron
			[503] = 0.06, -- Auto-Self-Cauterizer
			[504] = 0.7, -- Unstable Catalyst
			[505] = 0.51, -- Tradewinds
			[521] = 2.44, -- Shadow of Elune
			[522] = 0.77, -- Ancients' Bulwark
			[523] = 0.04, -- Apothecary's Concoctions
			[526] = 0.88, -- Endless Hunger
			[541] = 0.09, -- Fight or Flight
			[560] = 1.23, -- Bonded Souls
			[561] = 0.17, -- Seductive Power
			[562] = 1.12, -- Treacherous Covenant
		})

		-- Frost
		insertDefaultScalesData(defaultName, 6, 2, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 17495 - 21460 (avg 18621), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[14] = 0.01, -- Longstrider
			[18] = 2.19, -- Blood Siphon
			[20] = 1.65, -- Lifespeed
			[21] = 2.37, -- Elemental Whirl
			[22] = 2.78, -- Heed My Call
			[30] = 3.35, -- Overwhelming Power
			[31] = 3.01, -- Gutripper
			[82] = 7.28, -- Champion of Azeroth
			[86] = 0.02, -- Azerite Fortification
			[99] = 0.03, -- Ablative Shielding
			[108] = 5.17, -- Icy Citadel
			[141] = 4.41, -- Latent Chill
			[156] = 4.06, -- Ruinous Bolt
			[157] = 6.49, -- Rezan's Fury
			[192] = 3.63, -- Meticulous Scheming
			[193] = 7.4, -- Blightborne Infusion
			[194] = 5.81, -- Filthy Transfusion
			[195] = 5.87, -- Secrets of the Deep
			[196] = 6.58, -- Swirling Sands
			[198] = 3.47, -- Frostwhelp's Indignation
			[242] = 4.22, -- Echoing Howl
			[346] = 3.83, -- Killer Frost
			[347] = 5.03, -- Frozen Tempest
			[459] = 2.54, -- Unstable Flames
			[461] = 1.94, -- Earthlink
			[462] = 1.82, -- Azerite Globules
			[478] = 8.09, -- Tidal Surge
			[479] = 7.44, -- Dagger in the Back
			[480] = 4.06, -- Blood Rite
			[481] = 5.8, -- Incite the Pack
			[482] = 5.41, -- Thunderous Blast
			[483] = 6.16, -- Archive of the Titans
			[485] = 5.69, -- Laser Matrix
			[492] = 4.2, -- Liberator's Might
			[493] = 3.35, -- Last Gift
			[494] = 6.25, -- Battlefield Precision
			[495] = 5.82, -- Anduin's Dedication
			[496] = 1.38, -- Stronger Together
			[497] = 1.49, -- Stand As One
			[498] = 4.05, -- Barrage Of Many Bombs
			[499] = 2.44, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.84, -- Synaptic Spark Capacitor
			[501] = 5.69, -- Relational Normalization Gizmo
			[504] = 6.79, -- Unstable Catalyst
			[505] = 6.3, -- Tradewinds
			[521] = 3.92, -- Shadow of Elune
			[522] = 6.96, -- Ancients' Bulwark
			[523] = 5.2, -- Apothecary's Concoctions
			[526] = 6.97, -- Endless Hunger
			[560] = 1.56, -- Bonded Souls
			[561] = 4.65, -- Seductive Power
			[562] = 10, -- Treacherous Covenant
		})

		-- Unholy
		insertDefaultScalesData(defaultName, 6, 3, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 7685 - 10732 (avg 8357), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[14] = 0.17, -- Longstrider
			[15] = 0.07, -- Resounding Protection
			[18] = 1.92, -- Blood Siphon
			[20] = 1.96, -- Lifespeed
			[21] = 2.28, -- Elemental Whirl
			[22] = 3.23, -- Heed My Call
			[30] = 3.96, -- Overwhelming Power
			[31] = 3.54, -- Gutripper
			[43] = 0.14, -- Winds of War
			[44] = 0.12, -- Vampiric Speed
			[82] = 6.97, -- Champion of Azeroth
			[83] = 0.1, -- Impassive Visage
			[84] = 0.15, -- Bulwark of the Masses
			[85] = 0.22, -- Gemhide
			[87] = 0.15, -- Self Reliance
			[89] = 0.08, -- Azerite Veins
			[98] = 0.07, -- Crystalline Carapace
			[99] = 0.01, -- Ablative Shielding
			[100] = 0.09, -- Strength in Numbers
			[101] = 0.24, -- Shimmering Haven
			[109] = 5.17, -- Magus of the Dead
			[140] = 0.15, -- Bone Spike Graveyard
			[142] = 6.5, -- Helchains
			[156] = 4.37, -- Ruinous Bolt
			[157] = 7.24, -- Rezan's Fury
			[192] = 4.61, -- Meticulous Scheming
			[193] = 7.54, -- Blightborne Infusion
			[194] = 6.63, -- Filthy Transfusion
			[195] = 5.64, -- Secrets of the Deep
			[196] = 6.79, -- Swirling Sands
			[199] = 9.94, -- Festermight
			[201] = 0.09, -- Runic Barrier
			[244] = 6.19, -- Harrowing Decay
			[350] = 4.32, -- Cankerous Wounds
			[351] = 3.77, -- Last Surprise
			[459] = 2.87, -- Unstable Flames
			[461] = 2.06, -- Earthlink
			[462] = 2.23, -- Azerite Globules
			[465] = 0.09, -- March of the Damned
			[478] = 7.3, -- Tidal Surge
			[479] = 8.48, -- Dagger in the Back
			[480] = 4.37, -- Blood Rite
			[481] = 4.42, -- Incite the Pack
			[482] = 6.37, -- Thunderous Blast
			[483] = 5.9, -- Archive of the Titans
			[485] = 6.32, -- Laser Matrix
			[492] = 4.34, -- Liberator's Might
			[493] = 2.57, -- Last Gift
			[494] = 7.46, -- Battlefield Precision
			[495] = 5.76, -- Anduin's Dedication
			[496] = 1.37, -- Stronger Together
			[497] = 1.54, -- Stand As One
			[498] = 4.74, -- Barrage Of Many Bombs
			[499] = 2.8, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.06, -- Synaptic Spark Capacitor
			[501] = 5.91, -- Relational Normalization Gizmo
			[502] = 0.13, -- Personal Absorb-o-Tron
			[503] = 0.04, -- Auto-Self-Cauterizer
			[504] = 6.41, -- Unstable Catalyst
			[505] = 4.77, -- Tradewinds
			[521] = 4.38, -- Shadow of Elune
			[522] = 7.31, -- Ancients' Bulwark
			[523] = 6.13, -- Apothecary's Concoctions
			[526] = 7.3, -- Endless Hunger
			[541] = 0.03, -- Fight or Flight
			[549] = 0.04, -- Cold Hearted
			[560] = 1.94, -- Bonded Souls
			[561] = 4.66, -- Seductive Power
			[562] = 10, -- Treacherous Covenant
		})

	-- Shaman
		-- Elemental
		insertDefaultScalesData(defaultName, 7, 1, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 12772 - 16591 (avg 13619), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[18] = 1.38, -- Blood Siphon
			[19] = 0.03, -- Woundbinder
			[21] = 2.26, -- Elemental Whirl
			[22] = 2.61, -- Heed My Call
			[30] = 4.03, -- Overwhelming Power
			[31] = 2.96, -- Gutripper
			[38] = 2.03, -- On My Way
			[82] = 7.2, -- Champion of Azeroth
			[83] = 0.05, -- Impassive Visage
			[105] = 0.06, -- Ephemeral Recovery
			[156] = 3.68, -- Ruinous Bolt
			[157] = 6.13, -- Rezan's Fury
			[178] = 4.41, -- Lava Shock
			[192] = 3.84, -- Meticulous Scheming
			[193] = 8.21, -- Blightborne Infusion
			[194] = 5.22, -- Filthy Transfusion
			[195] = 5.63, -- Secrets of the Deep
			[196] = 7.33, -- Swirling Sands
			[207] = 0.06, -- Serene Spirit
			[222] = 8.78, -- Echo of the Elementals
			[416] = 6.01, -- Natural Harmony
			[447] = 6.22, -- Ancestral Resonance
			[448] = 6.15, -- Synapse Shock
			[457] = 3.36, -- Igneous Potential
			[459] = 2.85, -- Unstable Flames
			[461] = 1.87, -- Earthlink
			[462] = 1.74, -- Azerite Globules
			[478] = 6.18, -- Tidal Surge
			[479] = 7.26, -- Dagger in the Back
			[480] = 4.54, -- Blood Rite
			[481] = 3.71, -- Incite the Pack
			[482] = 5.19, -- Thunderous Blast
			[483] = 6.02, -- Archive of the Titans
			[485] = 5.25, -- Laser Matrix
			[492] = 4.93, -- Liberator's Might
			[493] = 2.06, -- Last Gift
			[494] = 5.84, -- Battlefield Precision
			[495] = 5.46, -- Anduin's Dedication
			[496] = 1.45, -- Stronger Together
			[497] = 1.43, -- Stand As One
			[498] = 3.8, -- Barrage Of Many Bombs
			[499] = 2.38, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.61, -- Synaptic Spark Capacitor
			[501] = 6.06, -- Relational Normalization Gizmo
			[503] = 0.02, -- Auto-Self-Cauterizer
			[504] = 6.36, -- Unstable Catalyst
			[505] = 3.82, -- Tradewinds
			[521] = 4.67, -- Shadow of Elune
			[522] = 6.79, -- Ancients' Bulwark
			[523] = 5.03, -- Apothecary's Concoctions
			[526] = 6.89, -- Endless Hunger
			[541] = 0.03, -- Fight or Flight
			[560] = 2.33, -- Bonded Souls
			[561] = 4.74, -- Seductive Power
			[562] = 10, -- Treacherous Covenant
		})

		-- Enhancement
		insertDefaultScalesData(defaultName, 7, 2, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 14401 - 19931 (avg 17610), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.07, -- Azerite Empowered
			[14] = 0.04, -- Longstrider
			[15] = 0.04, -- Resounding Protection
			[18] = 1.37, -- Blood Siphon
			[21] = 1.77, -- Elemental Whirl
			[22] = 2.02, -- Heed My Call
			[30] = 2.82, -- Overwhelming Power
			[31] = 2.23, -- Gutripper
			[38] = 1.46, -- On My Way
			[44] = 0.11, -- Vampiric Speed
			[82] = 5.24, -- Champion of Azeroth
			[83] = 0.07, -- Impassive Visage
			[84] = 0.09, -- Bulwark of the Masses
			[85] = 0.07, -- Gemhide
			[86] = 0.05, -- Azerite Fortification
			[87] = 0.04, -- Self Reliance
			[103] = 0.12, -- Concentrated Mending
			[104] = 0.03, -- Bracing Chill
			[105] = 0.04, -- Ephemeral Recovery
			[137] = 10, -- Primal Primer
			[156] = 2.75, -- Ruinous Bolt
			[157] = 4.64, -- Rezan's Fury
			[179] = 6.18, -- Strength of Earth
			[192] = 3.91, -- Meticulous Scheming
			[193] = 5.2, -- Blightborne Infusion
			[194] = 4.06, -- Filthy Transfusion
			[195] = 4.1, -- Secrets of the Deep
			[196] = 4.69, -- Swirling Sands
			[207] = 0.15, -- Serene Spirit
			[223] = 2.59, -- Lightning Conduit
			[416] = 6.62, -- Natural Harmony
			[420] = 5.86, -- Roiling Storm
			[447] = 5.25, -- Ancestral Resonance
			[448] = 0.02, -- Synapse Shock
			[459] = 1.84, -- Unstable Flames
			[461] = 1.48, -- Earthlink
			[462] = 1.45, -- Azerite Globules
			[474] = 0.07, -- Pack Spirit
			[478] = 4.58, -- Tidal Surge
			[479] = 5.3, -- Dagger in the Back
			[480] = 3.17, -- Blood Rite
			[481] = 3.46, -- Incite the Pack
			[482] = 3.94, -- Thunderous Blast
			[483] = 4.38, -- Archive of the Titans
			[485] = 4.1, -- Laser Matrix
			[492] = 3.28, -- Liberator's Might
			[493] = 1.98, -- Last Gift
			[494] = 4.5, -- Battlefield Precision
			[495] = 4.02, -- Anduin's Dedication
			[496] = 1.06, -- Stronger Together
			[497] = 1.14, -- Stand As One
			[498] = 3.09, -- Barrage Of Many Bombs
			[499] = 1.87, -- Ricocheting Inflatable Pyrosaw
			[500] = 2.43, -- Synaptic Spark Capacitor
			[501] = 4.34, -- Relational Normalization Gizmo
			[502] = 0.06, -- Personal Absorb-o-Tron
			[503] = 0.13, -- Auto-Self-Cauterizer
			[504] = 4.7, -- Unstable Catalyst
			[505] = 3.8, -- Tradewinds
			[521] = 3.21, -- Shadow of Elune
			[522] = 4.93, -- Ancients' Bulwark
			[523] = 3.73, -- Apothecary's Concoctions
			[526] = 4.99, -- Endless Hunger
			[530] = 5.1, -- Thunderaan's Fury
			[539] = 0.12, -- Ancient Ankh Talisman
			[541] = 0.04, -- Fight or Flight
			[560] = 1.64, -- Bonded Souls
			[561] = 3.44, -- Seductive Power
			[562] = 7.04, -- Treacherous Covenant
		})

		-- Restoration
		insertDefaultScalesData(defaultName, 7, 3, {

		})

	-- Mage
		-- Arcane
		insertDefaultScalesData(defaultName, 8, 1, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 19665 - 24359 (avg 20936), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[18] = 2.04, -- Blood Siphon
			[21] = 2.13, -- Elemental Whirl
			[22] = 2.8, -- Heed My Call
			[30] = 2.85, -- Overwhelming Power
			[31] = 3.06, -- Gutripper
			[82] = 6.52, -- Champion of Azeroth
			[88] = 4.97, -- Arcane Pummeling
			[127] = 4.7, -- Equipoise
			[156] = 4.22, -- Ruinous Bolt
			[157] = 6.48, -- Rezan's Fury
			[167] = 3.73, -- Brain Storm
			[192] = 2.54, -- Meticulous Scheming
			[193] = 7.07, -- Blightborne Infusion
			[194] = 5.69, -- Filthy Transfusion
			[195] = 5.68, -- Secrets of the Deep
			[196] = 5.5, -- Swirling Sands
			[214] = 2.88, -- Arcane Pressure
			[374] = 7.65, -- Galvanizing Spark
			[459] = 2.29, -- Unstable Flames
			[461] = 1.94, -- Earthlink
			[462] = 1.76, -- Azerite Globules
			[478] = 6.97, -- Tidal Surge
			[479] = 7.36, -- Dagger in the Back
			[480] = 3.81, -- Blood Rite
			[481] = 4.68, -- Incite the Pack
			[482] = 5.27, -- Thunderous Blast
			[483] = 6.06, -- Archive of the Titans
			[485] = 5.76, -- Laser Matrix
			[492] = 3.92, -- Liberator's Might
			[493] = 2.5, -- Last Gift
			[494] = 5.45, -- Battlefield Precision
			[495] = 5.59, -- Anduin's Dedication
			[496] = 1.14, -- Stronger Together
			[497] = 1.32, -- Stand As One
			[498] = 4.03, -- Barrage Of Many Bombs
			[499] = 2.39, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.9, -- Synaptic Spark Capacitor
			[501] = 5.69, -- Relational Normalization Gizmo
			[504] = 6.26, -- Unstable Catalyst
			[505] = 5.06, -- Tradewinds
			[521] = 3.9, -- Shadow of Elune
			[522] = 6.91, -- Ancients' Bulwark
			[523] = 5.19, -- Apothecary's Concoctions
			[526] = 7.07, -- Endless Hunger
			[560] = 1.51, -- Bonded Souls
			[561] = 4.5, -- Seductive Power
			[562] = 10, -- Treacherous Covenant
		})

		-- Fire
		insertDefaultScalesData(defaultName, 8, 2, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 27794 - 32705 (avg 29926), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[14] = 0.09, -- Longstrider
			[18] = 1.39, -- Blood Siphon
			[21] = 1.52, -- Elemental Whirl
			[22] = 2.42, -- Heed My Call
			[30] = 1.91, -- Overwhelming Power
			[31] = 2.57, -- Gutripper
			[44] = 0.03, -- Vampiric Speed
			[82] = 4.83, -- Champion of Azeroth
			[86] = 0.01, -- Azerite Fortification
			[87] = 0.01, -- Self Reliance
			[128] = 2.07, -- Flames of Alacrity
			[156] = 3.29, -- Ruinous Bolt
			[157] = 5.26, -- Rezan's Fury
			[168] = 10, -- Wildfire
			[192] = 2.45, -- Meticulous Scheming
			[193] = 5.23, -- Blightborne Infusion
			[194] = 4.25, -- Filthy Transfusion
			[195] = 3.98, -- Secrets of the Deep
			[196] = 4.49, -- Swirling Sands
			[215] = 1.08, -- Blaster Master
			[376] = 3.43, -- Trailing Embers
			[377] = 5.06, -- Duplicative Incineration
			[378] = 5.18, -- Firemind
			[459] = 1.7, -- Unstable Flames
			[461] = 1.32, -- Earthlink
			[462] = 1.55, -- Azerite Globules
			[478] = 5.6, -- Tidal Surge
			[479] = 6.16, -- Dagger in the Back
			[480] = 2.32, -- Blood Rite
			[481] = 3.58, -- Incite the Pack
			[482] = 4.49, -- Thunderous Blast
			[483] = 4.33, -- Archive of the Titans
			[485] = 4.79, -- Laser Matrix
			[492] = 2.54, -- Liberator's Might
			[493] = 2.05, -- Last Gift
			[494] = 5.23, -- Battlefield Precision
			[495] = 3.83, -- Anduin's Dedication
			[496] = 0.9, -- Stronger Together
			[497] = 1.05, -- Stand As One
			[498] = 3.45, -- Barrage Of Many Bombs
			[499] = 2.03, -- Ricocheting Inflatable Pyrosaw
			[500] = 2.98, -- Synaptic Spark Capacitor
			[501] = 3.59, -- Relational Normalization Gizmo
			[504] = 4.61, -- Unstable Catalyst
			[505] = 3.78, -- Tradewinds
			[521] = 2.34, -- Shadow of Elune
			[522] = 5.05, -- Ancients' Bulwark
			[523] = 4.34, -- Apothecary's Concoctions
			[526] = 4.97, -- Endless Hunger
			[546] = 0.13, -- Quick Thinking
			[560] = 1.08, -- Bonded Souls
			[561] = 3.38, -- Seductive Power
			[562] = 6.89, -- Treacherous Covenant
		})

		-- Frost
		insertDefaultScalesData(defaultName, 8, 3, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 17715 - 21119 (avg 19460), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.02, -- Azerite Empowered
			[14] = 0.03, -- Longstrider
			[15] = 0.01, -- Resounding Protection
			[18] = 1.4, -- Blood Siphon
			[21] = 1.93, -- Elemental Whirl
			[22] = 2.4, -- Heed My Call
			[30] = 3.09, -- Overwhelming Power
			[31] = 2.6, -- Gutripper
			[82] = 5.89, -- Champion of Azeroth
			[86] = 0.04, -- Azerite Fortification
			[132] = 4.7, -- Packed Ice
			[156] = 3.35, -- Ruinous Bolt
			[157] = 5.49, -- Rezan's Fury
			[170] = 10, -- Flash Freeze
			[192] = 3.54, -- Meticulous Scheming
			[193] = 5.62, -- Blightborne Infusion
			[194] = 5.07, -- Filthy Transfusion
			[195] = 4.84, -- Secrets of the Deep
			[196] = 5.4, -- Swirling Sands
			[225] = 5.16, -- Glacial Assault
			[379] = 5.22, -- Tunnel of Ice
			[380] = 4.84, -- Whiteout
			[381] = 4.69, -- Frigid Grasp
			[459] = 2.24, -- Unstable Flames
			[461] = 1.59, -- Earthlink
			[462] = 1.52, -- Azerite Globules
			[468] = 0.09, -- Cauterizing Blink
			[478] = 5.53, -- Tidal Surge
			[479] = 6.34, -- Dagger in the Back
			[480] = 3.38, -- Blood Rite
			[481] = 3.78, -- Incite the Pack
			[482] = 4.71, -- Thunderous Blast
			[483] = 5.15, -- Archive of the Titans
			[485] = 4.87, -- Laser Matrix
			[492] = 3.73, -- Liberator's Might
			[493] = 2.12, -- Last Gift
			[494] = 5.26, -- Battlefield Precision
			[495] = 4.84, -- Anduin's Dedication
			[496] = 1.12, -- Stronger Together
			[497] = 1.3, -- Stand As One
			[498] = 3.59, -- Barrage Of Many Bombs
			[499] = 2.15, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.03, -- Synaptic Spark Capacitor
			[501] = 4.88, -- Relational Normalization Gizmo
			[503] = 0.03, -- Auto-Self-Cauterizer
			[504] = 5.56, -- Unstable Catalyst
			[505] = 4, -- Tradewinds
			[521] = 3.41, -- Shadow of Elune
			[522] = 5.58, -- Ancients' Bulwark
			[523] = 4.45, -- Apothecary's Concoctions
			[526] = 5.6, -- Endless Hunger
			[541] = 0.02, -- Fight or Flight
			[546] = 0.02, -- Quick Thinking
			[560] = 1.67, -- Bonded Souls
			[561] = 4.19, -- Seductive Power
			[562] = 8.2, -- Treacherous Covenant
		})

	-- Warlock
		-- Affliction
		insertDefaultScalesData(defaultName, 9, 1, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 10832 - 14340 (avg 11828), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.09, -- Azerite Empowered
			[14] = 0.08, -- Longstrider
			[15] = 0.02, -- Resounding Protection
			[18] = 2.4, -- Blood Siphon
			[21] = 2.53, -- Elemental Whirl
			[22] = 3.35, -- Heed My Call
			[30] = 4.64, -- Overwhelming Power
			[31] = 3.82, -- Gutripper
			[82] = 7.89, -- Champion of Azeroth
			[83] = 0.15, -- Impassive Visage
			[84] = 0.14, -- Bulwark of the Masses
			[85] = 0.07, -- Gemhide
			[86] = 0.06, -- Azerite Fortification
			[87] = 0.08, -- Self Reliance
			[123] = 8.15, -- Wracking Brilliance
			[156] = 4.69, -- Ruinous Bolt
			[157] = 7.77, -- Rezan's Fury
			[183] = 7.67, -- Inevitable Demise
			[192] = 5.73, -- Meticulous Scheming
			[193] = 7.07, -- Blightborne Infusion
			[194] = 7.03, -- Filthy Transfusion
			[195] = 6.02, -- Secrets of the Deep
			[196] = 6.43, -- Swirling Sands
			[208] = 0.01, -- Lifeblood
			[230] = 6.43, -- Cascading Calamity
			[425] = 6.72, -- Sudden Onset
			[426] = 4.83, -- Dreadful Calling
			[442] = 6.86, -- Pandemic Invocation
			[459] = 2.57, -- Unstable Flames
			[461] = 2.07, -- Earthlink
			[462] = 2.37, -- Azerite Globules
			[475] = 0.14, -- Desperate Power
			[478] = 7.65, -- Tidal Surge
			[479] = 8.98, -- Dagger in the Back
			[480] = 5.02, -- Blood Rite
			[481] = 5.93, -- Incite the Pack
			[482] = 6.69, -- Thunderous Blast
			[483] = 6.12, -- Archive of the Titans
			[485] = 6.92, -- Laser Matrix
			[492] = 4.55, -- Liberator's Might
			[493] = 3.47, -- Last Gift
			[494] = 8.09, -- Battlefield Precision
			[495] = 5.77, -- Anduin's Dedication
			[496] = 1.57, -- Stronger Together
			[497] = 1.53, -- Stand As One
			[498] = 4.91, -- Barrage Of Many Bombs
			[499] = 3.01, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.04, -- Synaptic Spark Capacitor
			[501] = 6.64, -- Relational Normalization Gizmo
			[503] = 0.08, -- Auto-Self-Cauterizer
			[504] = 6.65, -- Unstable Catalyst
			[505] = 6.57, -- Tradewinds
			[521] = 4.94, -- Shadow of Elune
			[522] = 7.48, -- Ancients' Bulwark
			[523] = 6.37, -- Apothecary's Concoctions
			[526] = 7.53, -- Endless Hunger
			[531] = 0.06, -- Terror of the Mind
			[541] = 0.02, -- Fight or Flight
			[560] = 2.63, -- Bonded Souls
			[561] = 5.11, -- Seductive Power
			[562] = 10, -- Treacherous Covenant
		})

		-- Demonology
		insertDefaultScalesData(defaultName, 9, 2, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 11597 - 14967 (avg 12537), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[14] = 0.03, -- Longstrider
			[156] = 3.5, -- Ruinous Bolt
			[18] = 1.95, -- Blood Siphon
			[21] = 2.17, -- Elemental Whirl
			[22] = 2.63, -- Heed My Call
			[30] = 3.73, -- Overwhelming Power
			[31] = 2.68, -- Gutripper
			[82] = 6.9, -- Champion of Azeroth
			[86] = 0.01, -- Azerite Fortification
			[87] = 0.02, -- Self Reliance
			[130] = 3.83, -- Shadow's Bite
			[157] = 5.88, -- Rezan's Fury
			[190] = 2.86, -- Umbral Blaze
			[192] = 4.77, -- Meticulous Scheming
			[193] = 7.21, -- Blightborne Infusion
			[194] = 5.41, -- Filthy Transfusion
			[195] = 5.71, -- Secrets of the Deep
			[196] = 5.09, -- Swirling Sands
			[428] = 4.49, -- Demonic Meteor
			[429] = 10, -- Baleful Invocation
			[458] = 6.04, -- Supreme Commander
			[459] = 2.33, -- Unstable Flames
			[461] = 1.84, -- Earthlink
			[462] = 1.59, -- Azerite Globules
			[478] = 5.67, -- Tidal Surge
			[479] = 6.72, -- Dagger in the Back
			[480] = 4.15, -- Blood Rite
			[481] = 5.11, -- Incite the Pack
			[482] = 4.83, -- Thunderous Blast
			[483] = 5.98, -- Archive of the Titans
			[485] = 5.21, -- Laser Matrix
			[492] = 4.1, -- Liberator's Might
			[493] = 2.92, -- Last Gift
			[494] = 4.19, -- Battlefield Precision
			[495] = 5.64, -- Anduin's Dedication
			[496] = 1.29, -- Stronger Together
			[497] = 1.46, -- Stand As One
			[498] = 3.78, -- Barrage Of Many Bombs
			[499] = 2.2, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.11, -- Synaptic Spark Capacitor
			[501] = 5.85, -- Relational Normalization Gizmo
			[503] = 0.01, -- Auto-Self-Cauterizer
			[504] = 6.28, -- Unstable Catalyst
			[505] = 5.46, -- Tradewinds
			[521] = 4.31, -- Shadow of Elune
			[522] = 7.05, -- Ancients' Bulwark
			[523] = 4.71, -- Apothecary's Concoctions
			[526] = 7.01, -- Endless Hunger
			[560] = 1.88, -- Bonded Souls
			[561] = 4.87, -- Seductive Power
			[562] = 9.73, -- Treacherous Covenant
		})

		-- Destruction
		insertDefaultScalesData(defaultName, 9, 3, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 10898 - 14135 (avg 11911), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.04, -- Azerite Empowered
			[18] = 2.27, -- Blood Siphon
			[21] = 2.34, -- Elemental Whirl
			[22] = 2.86, -- Heed My Call
			[30] = 4.19, -- Overwhelming Power
			[31] = 3.02, -- Gutripper
			[44] = 0.12, -- Vampiric Speed
			[82] = 7.59, -- Champion of Azeroth
			[84] = 0.11, -- Bulwark of the Masses
			[131] = 6.85, -- Chaos Shards
			[156] = 3.85, -- Ruinous Bolt
			[157] = 6.46, -- Rezan's Fury
			[192] = 5, -- Meticulous Scheming
			[193] = 7.06, -- Blightborne Infusion
			[194] = 5.59, -- Filthy Transfusion
			[195] = 5.53, -- Secrets of the Deep
			[196] = 6.03, -- Swirling Sands
			[208] = 0.02, -- Lifeblood
			[232] = 5.08, -- Flashpoint
			[432] = 6.91, -- Chaotic Inferno
			[444] = 8.01, -- Crashing Chaos
			[459] = 2.67, -- Unstable Flames
			[460] = 5.87, -- Bursting Flare
			[461] = 2.05, -- Earthlink
			[462] = 1.9, -- Azerite Globules
			[475] = 0.07, -- Desperate Power
			[478] = 6.32, -- Tidal Surge
			[479] = 7.47, -- Dagger in the Back
			[480] = 4.7, -- Blood Rite
			[481] = 5.18, -- Incite the Pack
			[482] = 5.46, -- Thunderous Blast
			[483] = 5.8, -- Archive of the Titans
			[485] = 5.55, -- Laser Matrix
			[492] = 4.83, -- Liberator's Might
			[493] = 3.11, -- Last Gift
			[494] = 6.01, -- Battlefield Precision
			[495] = 5.56, -- Anduin's Dedication
			[496] = 1.54, -- Stronger Together
			[497] = 1.48, -- Stand As One
			[498] = 4.2, -- Barrage Of Many Bombs
			[499] = 2.61, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.46, -- Synaptic Spark Capacitor
			[501] = 6.3, -- Relational Normalization Gizmo
			[502] = 0.16, -- Personal Absorb-o-Tron
			[503] = 0.21, -- Auto-Self-Cauterizer
			[504] = 6.26, -- Unstable Catalyst
			[505] = 5.8, -- Tradewinds
			[521] = 4.66, -- Shadow of Elune
			[522] = 7.91, -- Ancients' Bulwark
			[523] = 5.24, -- Apothecary's Concoctions
			[526] = 7.96, -- Endless Hunger
			[560] = 2.64, -- Bonded Souls
			[561] = 4.66, -- Seductive Power
			[562] = 10, -- Treacherous Covenant
		})

	-- Monk
		-- Brewmaster
		insertDefaultScalesData(offensiveName, 10, 1, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 5060 - 8876 (avg 5611), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.02, -- Azerite Empowered
			[14] = 0.1, -- Longstrider
			[15] = 0.07, -- Resounding Protection
			[18] = 1.58, -- Blood Siphon
			[20] = 1.23, -- Lifespeed
			[21] = 1.78, -- Elemental Whirl
			[22] = 4.33, -- Heed My Call
			[30] = 2.09, -- Overwhelming Power
			[31] = 4.74, -- Gutripper
			[38] = 1.69, -- On My Way
			[42] = 0.05, -- Savior
			[43] = 0.03, -- Winds of War
			[44] = 0.02, -- Vampiric Speed
			[82] = 5.56, -- Champion of Azeroth
			[83] = 0.15, -- Impassive Visage
			[84] = 0.05, -- Bulwark of the Masses
			[85] = 0.09, -- Gemhide
			[86] = 0.11, -- Azerite Fortification
			[87] = 0.08, -- Self Reliance
			[98] = 0.12, -- Crystalline Carapace
			[99] = 0.08, -- Ablative Shielding
			[100] = 0.02, -- Strength in Numbers
			[101] = 0.03, -- Shimmering Haven
			[103] = 0.05, -- Concentrated Mending
			[104] = 0.09, -- Bracing Chill
			[105] = 0.07, -- Ephemeral Recovery
			[116] = 1.64, -- Boiling Brew
			[156] = 5.47, -- Ruinous Bolt
			[157] = 9.58, -- Rezan's Fury
			[192] = 2.62, -- Meticulous Scheming
			[193] = 5.64, -- Blightborne Infusion
			[194] = 8.44, -- Filthy Transfusion
			[195] = 4.24, -- Secrets of the Deep
			[196] = 5.18, -- Swirling Sands
			[218] = 0.12, -- Strength of Spirit
			[238] = 0.02, -- Fit to Burst
			[382] = 0.07, -- Straight, No Chaser
			[383] = 2.08, -- Training of Niuzao
			[384] = 4.42, -- Elusive Footwork
			[459] = 2.1, -- Unstable Flames
			[461] = 1.52, -- Earthlink
			[462] = 2.92, -- Azerite Globules
			[463] = 0.21, -- Blessed Portents
			[470] = 0.01, -- Sweep the Leg
			[478] = 9.03, -- Tidal Surge
			[479] = 7.87, -- Dagger in the Back
			[480] = 2.1, -- Blood Rite
			[481] = 3.75, -- Incite the Pack
			[482] = 8.24, -- Thunderous Blast
			[483] = 4.6, -- Archive of the Titans
			[485] = 8.51, -- Laser Matrix
			[492] = 3.03, -- Liberator's Might
			[493] = 2.26, -- Last Gift
			[494] = 10, -- Battlefield Precision
			[495] = 4.15, -- Anduin's Dedication
			[496] = 1.06, -- Stronger Together
			[497] = 1.14, -- Stand As One
			[498] = 6.25, -- Barrage Of Many Bombs
			[499] = 3.71, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.82, -- Synaptic Spark Capacitor
			[501] = 3.6, -- Relational Normalization Gizmo
			[502] = 0.04, -- Personal Absorb-o-Tron
			[504] = 4.68, -- Unstable Catalyst
			[505] = 4.06, -- Tradewinds
			[521] = 2.16, -- Shadow of Elune
			[522] = 5.67, -- Ancients' Bulwark
			[523] = 7.83, -- Apothecary's Concoctions
			[526] = 5.64, -- Endless Hunger
			[541] = 0.13, -- Fight or Flight
			[560] = 1.21, -- Bonded Souls
			[561] = 3.83, -- Seductive Power
			[562] = 7.11, -- Treacherous Covenant
			[566] = 0.02, -- Exit Strategy
		})
		insertDefaultScalesData(defensiveName, 10, 1, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 5100 - 8686 (avg 5600), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[15] = 6.51, -- Resounding Protection
			[18] = 1.78, -- Blood Siphon
			[21] = 0.07, -- Elemental Whirl
			[38] = 0.08, -- On My Way
			[82] = 0.25, -- Champion of Azeroth
			[89] = 0.01, -- Azerite Veins
			[116] = 10, -- Boiling Brew
			[186] = 0.28, -- Staggering Strikes
			[192] = 0.01, -- Meticulous Scheming
			[193] = 0.37, -- Blightborne Infusion
			[195] = 0.2, -- Secrets of the Deep
			[196] = 0.33, -- Swirling Sands
			[383] = 0.12, -- Training of Niuzao
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
			[561] = 0.1, -- Seductive Power
			[562] = 0.35, -- Treacherous Covenant
		})

		-- Mistweaver
		insertDefaultScalesData(defaultName, 10, 2, {

		})

		-- Windwalker
		insertDefaultScalesData(defaultName, 10, 3, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 9474 - 14115 (avg 10208), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.09, -- Azerite Empowered
			[14] = 0.08, -- Longstrider
			[15] = 0.09, -- Resounding Protection
			[18] = 1.08, -- Blood Siphon
			[19] = 0.12, -- Woundbinder
			[20] = 1.14, -- Lifespeed
			[21] = 1.38, -- Elemental Whirl
			[22] = 1.76, -- Heed My Call
			[30] = 1.91, -- Overwhelming Power
			[31] = 1.99, -- Gutripper
			[38] = 1.24, -- On My Way
			[42] = 0.08, -- Savior
			[43] = 0.07, -- Winds of War
			[44] = 0.13, -- Vampiric Speed
			[82] = 3.95, -- Champion of Azeroth
			[83] = 0.1, -- Impassive Visage
			[84] = 0.13, -- Bulwark of the Masses
			[85] = 0.11, -- Gemhide
			[86] = 0.09, -- Azerite Fortification
			[87] = 0.14, -- Self Reliance
			[89] = 0.15, -- Azerite Veins
			[98] = 0.05, -- Crystalline Carapace
			[99] = 0.08, -- Ablative Shielding
			[100] = 0.02, -- Strength in Numbers
			[101] = 0.18, -- Shimmering Haven
			[103] = 0.02, -- Concentrated Mending
			[104] = 0.09, -- Bracing Chill
			[105] = 0.06, -- Ephemeral Recovery
			[117] = 10, -- Fury of Xuen
			[156] = 2.69, -- Ruinous Bolt
			[157] = 4.1, -- Rezan's Fury
			[184] = 3.57, -- Sunrise Technique
			[192] = 2.46, -- Meticulous Scheming
			[193] = 3.72, -- Blightborne Infusion
			[194] = 3.51, -- Filthy Transfusion
			[195] = 2.92, -- Secrets of the Deep
			[196] = 3.25, -- Swirling Sands
			[218] = 0.11, -- Strength of Spirit
			[388] = 6.22, -- Glory of the Dawn
			[389] = 5.61, -- Open Palm Strikes
			[390] = 3.5, -- Pressure Point
			[391] = 3.93, -- Dance of Chi-Ji
			[459] = 1.27, -- Unstable Flames
			[461] = 1.13, -- Earthlink
			[462] = 1.25, -- Azerite Globules
			[463] = 0.04, -- Blessed Portents
			[470] = 0.01, -- Sweep the Leg
			[478] = 4.47, -- Tidal Surge
			[479] = 4.69, -- Dagger in the Back
			[480] = 2.29, -- Blood Rite
			[481] = 2.46, -- Incite the Pack
			[482] = 3.37, -- Thunderous Blast
			[483] = 3.23, -- Archive of the Titans
			[485] = 3.57, -- Laser Matrix
			[492] = 2.43, -- Liberator's Might
			[493] = 1.49, -- Last Gift
			[494] = 3.93, -- Battlefield Precision
			[495] = 2.97, -- Anduin's Dedication
			[496] = 0.78, -- Stronger Together
			[497] = 0.87, -- Stand As One
			[498] = 2.63, -- Barrage Of Many Bombs
			[499] = 1.56, -- Ricocheting Inflatable Pyrosaw
			[500] = 0.6, -- Synaptic Spark Capacitor
			[501] = 3.26, -- Relational Normalization Gizmo
			[502] = 0.18, -- Personal Absorb-o-Tron
			[503] = 0.09, -- Auto-Self-Cauterizer
			[504] = 3.38, -- Unstable Catalyst
			[505] = 2.69, -- Tradewinds
			[521] = 2.25, -- Shadow of Elune
			[522] = 4.09, -- Ancients' Bulwark
			[523] = 1.07, -- Apothecary's Concoctions
			[526] = 4.07, -- Endless Hunger
			[541] = 0.14, -- Fight or Flight
			[560] = 1.12, -- Bonded Souls
			[561] = 2.6, -- Seductive Power
			[562] = 5.16, -- Treacherous Covenant
			[566] = 0.03, -- Exit Strategy
		})

	-- Druid
		-- Balance
		insertDefaultScalesData(defaultName, 11, 1, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 10051 - 13041 (avg 10740), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[18] = 1.7, -- Blood Siphon
			[19] = 0.03, -- Woundbinder
			[20] = 1.61, -- Lifespeed
			[21] = 1.87, -- Elemental Whirl
			[22] = 2.13, -- Heed My Call
			[30] = 3.34, -- Overwhelming Power
			[31] = 2.29, -- Gutripper
			[38] = 1.53, -- On My Way
			[44] = 0.01, -- Vampiric Speed
			[82] = 6.04, -- Champion of Azeroth
			[87] = 0.04, -- Self Reliance
			[122] = 3.71, -- Streaking Stars
			[156] = 2.68, -- Ruinous Bolt
			[157] = 4.83, -- Rezan's Fury
			[173] = 3.22, -- Power of the Moon
			[192] = 4.34, -- Meticulous Scheming
			[193] = 5.36, -- Blightborne Infusion
			[194] = 4.33, -- Filthy Transfusion
			[195] = 4.25, -- Secrets of the Deep
			[196] = 4.83, -- Swirling Sands
			[200] = 10, -- Arcanic Pulsar
			[250] = 4.67, -- Dawning Sun
			[356] = 2.16, -- High Noon
			[364] = 3.01, -- Lively Spirit
			[459] = 1.79, -- Unstable Flames
			[461] = 1.51, -- Earthlink
			[462] = 1.43, -- Azerite Globules
			[478] = 4.51, -- Tidal Surge
			[479] = 5.49, -- Dagger in the Back
			[480] = 3.49, -- Blood Rite
			[481] = 4.62, -- Incite the Pack
			[482] = 4.15, -- Thunderous Blast
			[483] = 4.67, -- Archive of the Titans
			[485] = 4.36, -- Laser Matrix
			[492] = 3.28, -- Liberator's Might
			[493] = 2.55, -- Last Gift
			[494] = 4.8, -- Battlefield Precision
			[495] = 4.22, -- Anduin's Dedication
			[496] = 1.04, -- Stronger Together
			[497] = 1.13, -- Stand As One
			[498] = 3.16, -- Barrage Of Many Bombs
			[499] = 1.84, -- Ricocheting Inflatable Pyrosaw
			[500] = 2.47, -- Synaptic Spark Capacitor
			[501] = 4.7, -- Relational Normalization Gizmo
			[504] = 4.87, -- Unstable Catalyst
			[505] = 4.91, -- Tradewinds
			[521] = 3.46, -- Shadow of Elune
			[522] = 5.4, -- Ancients' Bulwark
			[523] = 3.86, -- Apothecary's Concoctions
			[526] = 5.28, -- Endless Hunger
			[560] = 1.76, -- Bonded Souls
			[561] = 3.77, -- Seductive Power
			[562] = 7.29, -- Treacherous Covenant
		})

		-- Feral
		insertDefaultScalesData(defaultName, 11, 2, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 15090 - 18818 (avg 15971), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[14] = 0.1, -- Longstrider
			[15] = 0.09, -- Resounding Protection
			[18] = 2.1, -- Blood Siphon
			[20] = 1.93, -- Lifespeed
			[21] = 2.3, -- Elemental Whirl
			[22] = 2.65, -- Heed My Call
			[30] = 3.28, -- Overwhelming Power
			[31] = 2.85, -- Gutripper
			[38] = 1.86, -- On My Way
			[82] = 7.79, -- Champion of Azeroth
			[101] = 0.01, -- Shimmering Haven
			[105] = 0.01, -- Ephemeral Recovery
			[111] = 6.25, -- Blood Mist
			[156] = 4.03, -- Ruinous Bolt
			[157] = 6.09, -- Rezan's Fury
			[169] = 3.22, -- Untamed Ferocity
			[171] = 0.03, -- Masterful Instincts
			[192] = 4.89, -- Meticulous Scheming
			[193] = 8.02, -- Blightborne Infusion
			[194] = 4.96, -- Filthy Transfusion
			[195] = 5.22, -- Secrets of the Deep
			[196] = 7.34, -- Swirling Sands
			[209] = 10, -- Jungle Fury
			[241] = 0.05, -- Twisted Claws
			[247] = 1.36, -- Iron Jaws
			[358] = 6.14, -- Gushing Lacerations
			[359] = 6.69, -- Wild Fleshrending
			[459] = 2.87, -- Unstable Flames
			[461] = 1.7, -- Earthlink
			[462] = 1.72, -- Azerite Globules
			[463] = 0.02, -- Blessed Portents
			[478] = 6.74, -- Tidal Surge
			[479] = 6.98, -- Dagger in the Back
			[480] = 4.17, -- Blood Rite
			[481] = 5.24, -- Incite the Pack
			[482] = 4.97, -- Thunderous Blast
			[483] = 5.8, -- Archive of the Titans
			[485] = 5.34, -- Laser Matrix
			[492] = 4.61, -- Liberator's Might
			[493] = 2.99, -- Last Gift
			[494] = 6.08, -- Battlefield Precision
			[495] = 5.01, -- Anduin's Dedication
			[496] = 1.22, -- Stronger Together
			[497] = 1.25, -- Stand As One
			[498] = 3.8, -- Barrage Of Many Bombs
			[499] = 2.15, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.64, -- Synaptic Spark Capacitor
			[501] = 5.6, -- Relational Normalization Gizmo
			[504] = 5.87, -- Unstable Catalyst
			[505] = 5.66, -- Tradewinds
			[521] = 4.33, -- Shadow of Elune
			[522] = 6.69, -- Ancients' Bulwark
			[523] = 4.93, -- Apothecary's Concoctions
			[526] = 6.78, -- Endless Hunger
			[560] = 1.96, -- Bonded Souls
			[561] = 4.23, -- Seductive Power
			[562] = 9.12, -- Treacherous Covenant
		})

		-- Guardian
		insertDefaultScalesData(offensiveName, 11, 3, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 5740 - 8232 (avg 6181), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[18] = 1.77, -- Blood Siphon
			[20] = 2.06, -- Lifespeed
			[21] = 2.16, -- Elemental Whirl
			[22] = 4.11, -- Heed My Call
			[30] = 3.8, -- Overwhelming Power
			[31] = 4.51, -- Gutripper
			[38] = 1.89, -- On My Way
			[82] = 7.21, -- Champion of Azeroth
			[156] = 5.9, -- Ruinous Bolt
			[157] = 9.74, -- Rezan's Fury
			[192] = 5.91, -- Meticulous Scheming
			[193] = 6.86, -- Blightborne Infusion
			[194] = 8.48, -- Filthy Transfusion
			[195] = 5.15, -- Secrets of the Deep
			[196] = 6.11, -- Swirling Sands
			[219] = 0.1, -- Reawakening
			[241] = 6.01, -- Twisted Claws
			[251] = 5.35, -- Burst of Savagery
			[359] = 2.07, -- Wild Fleshrending
			[361] = 4.83, -- Guardian's Wrath
			[459] = 2.27, -- Unstable Flames
			[461] = 1.56, -- Earthlink
			[462] = 2.86, -- Azerite Globules
			[463] = 0.04, -- Blessed Portents
			[478] = 10, -- Tidal Surge
			[479] = 7.62, -- Dagger in the Back
			[480] = 4.4, -- Blood Rite
			[481] = 4.26, -- Incite the Pack
			[482] = 8.2, -- Thunderous Blast
			[483] = 5.51, -- Archive of the Titans
			[485] = 8.52, -- Laser Matrix
			[492] = 4.1, -- Liberator's Might
			[493] = 2.44, -- Last Gift
			[494] = 9.74, -- Battlefield Precision
			[495] = 4.81, -- Anduin's Dedication
			[496] = 1.26, -- Stronger Together
			[497] = 1.25, -- Stand As One
			[498] = 6.29, -- Barrage Of Many Bombs
			[499] = 3.72, -- Ricocheting Inflatable Pyrosaw
			[500] = 5.28, -- Synaptic Spark Capacitor
			[501] = 5.66, -- Relational Normalization Gizmo
			[504] = 5.79, -- Unstable Catalyst
			[505] = 4.75, -- Tradewinds
			[521] = 4.38, -- Shadow of Elune
			[522] = 6.84, -- Ancients' Bulwark
			[523] = 7.83, -- Apothecary's Concoctions
			[526] = 6.89, -- Endless Hunger
			[540] = 0.04, -- Switch Hitter
			[560] = 2.09, -- Bonded Souls
			[561] = 4.23, -- Seductive Power
			[562] = 8.56, -- Treacherous Covenant
		})
		-- Guardian
		insertDefaultScalesData(defensiveName, 11, 3, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 5644 - 8334 (avg 6161), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[14] = 0.02, -- Longstrider
			[18] = 10, -- Blood Siphon
			[83] = 0.01, -- Impassive Visage
			[89] = 0.01, -- Azerite Veins
			[98] = 0.01, -- Crystalline Carapace
			[105] = 0.02, -- Ephemeral Recovery
			[112] = 0.02, -- Layered Mane
			[156] = 0.02, -- Ruinous Bolt
			[157] = 0.01, -- Rezan's Fury
			[171] = 0.01, -- Masterful Instincts
			[194] = 0.01, -- Filthy Transfusion
			[195] = 0.01, -- Secrets of the Deep
			[459] = 0.02, -- Unstable Flames
			[478] = 0.02, -- Tidal Surge
			[480] = 0.02, -- Blood Rite
			[485] = 0.01, -- Laser Matrix
			[499] = 0.02, -- Ricocheting Inflatable Pyrosaw
			[500] = 0.01, -- Synaptic Spark Capacitor
			[521] = 0.01, -- Shadow of Elune
		})

		-- Restoration
		insertDefaultScalesData(defaultName, 11, 4, {

		})

	-- Demon Hunter
		-- Havoc
		insertDefaultScalesData(defaultName, 12, 1, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 3248 - 5837 (avg 4011), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.14, -- Azerite Empowered
			[15] = 0.13, -- Resounding Protection
			[18] = 1.46, -- Blood Siphon
			[20] = 1.97, -- Lifespeed
			[21] = 2.04, -- Elemental Whirl
			[22] = 3.43, -- Heed My Call
			[30] = 4.14, -- Overwhelming Power
			[31] = 3.76, -- Gutripper
			[43] = 0.09, -- Winds of War
			[44] = 0.1, -- Vampiric Speed
			[82] = 6.67, -- Champion of Azeroth
			[84] = 0.13, -- Bulwark of the Masses
			[85] = 0.04, -- Gemhide
			[100] = 0.09, -- Strength in Numbers
			[101] = 0.01, -- Shimmering Haven
			[126] = 7.45, -- Revolving Blades
			[156] = 4.29, -- Ruinous Bolt
			[157] = 7.8, -- Rezan's Fury
			[159] = 8.93, -- Furious Gaze
			[160] = 0.05, -- Infernal Armor
			[192] = 3.17, -- Meticulous Scheming
			[193] = 6.68, -- Blightborne Infusion
			[194] = 6.52, -- Filthy Transfusion
			[195] = 5.9, -- Secrets of the Deep
			[196] = 5.89, -- Swirling Sands
			[202] = 0.03, -- Soulmonger
			[220] = 6.64, -- Chaotic Transformation
			[245] = 6.34, -- Seething Power
			[352] = 8.49, -- Thirsting Blades
			[353] = 4.42, -- Eyes of Rage
			[459] = 2.34, -- Unstable Flames
			[461] = 2.04, -- Earthlink
			[462] = 2.3, -- Azerite Globules
			[466] = 0.12, -- Burning Soul
			[478] = 7.16, -- Tidal Surge
			[479] = 8.88, -- Dagger in the Back
			[480] = 4.09, -- Blood Rite
			[481] = 3.62, -- Incite the Pack
			[482] = 6.55, -- Thunderous Blast
			[483] = 6.15, -- Archive of the Titans
			[485] = 6.86, -- Laser Matrix
			[492] = 4.18, -- Liberator's Might
			[493] = 2.08, -- Last Gift
			[494] = 7.91, -- Battlefield Precision
			[495] = 5.74, -- Anduin's Dedication
			[496] = 1.2, -- Stronger Together
			[497] = 1.48, -- Stand As One
			[498] = 5.05, -- Barrage Of Many Bombs
			[499] = 3.12, -- Ricocheting Inflatable Pyrosaw
			[500] = 4.01, -- Synaptic Spark Capacitor
			[501] = 5.81, -- Relational Normalization Gizmo
			[502] = 0.11, -- Personal Absorb-o-Tron
			[504] = 6.62, -- Unstable Catalyst
			[505] = 3.87, -- Tradewinds
			[521] = 4.21, -- Shadow of Elune
			[522] = 7.41, -- Ancients' Bulwark
			[523] = 6.24, -- Apothecary's Concoctions
			[526] = 7.2, -- Endless Hunger
			[560] = 2.29, -- Bonded Souls
			[561] = 5.1, -- Seductive Power
			[562] = 10, -- Treacherous Covenant
		})

		-- Vengeance
		insertDefaultScalesData(offensiveName, 12, 2, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 6027 - 8922 (avg 6558), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.03, -- Azerite Empowered
			[14] = 0.02, -- Longstrider
			[15] = 0.06, -- Resounding Protection
			[18] = 1.86, -- Blood Siphon
			[20] = 1.82, -- Lifespeed
			[21] = 2.21, -- Elemental Whirl
			[22] = 4.47, -- Heed My Call
			[30] = 3.16, -- Overwhelming Power
			[31] = 4.75, -- Gutripper
			[82] = 6.83, -- Champion of Azeroth
			[84] = 0.03, -- Bulwark of the Masses
			[99] = 0.04, -- Ablative Shielding
			[101] = 0.03, -- Shimmering Haven
			[134] = 0.04, -- Revel in Pain
			[156] = 6.08, -- Ruinous Bolt
			[157] = 9.92, -- Rezan's Fury
			[192] = 4.6, -- Meticulous Scheming
			[193] = 7.02, -- Blightborne Infusion
			[194] = 8.6, -- Filthy Transfusion
			[195] = 5.25, -- Secrets of the Deep
			[196] = 6.24, -- Swirling Sands
			[246] = 0.03, -- Hour of Reaping
			[354] = 0.01, -- Cycle of Binding
			[459] = 2.48, -- Unstable Flames
			[461] = 1.82, -- Earthlink
			[462] = 2.94, -- Azerite Globules
			[466] = 0.07, -- Burning Soul
			[478] = 9.98, -- Tidal Surge
			[479] = 8.01, -- Dagger in the Back
			[480] = 3.76, -- Blood Rite
			[481] = 4.51, -- Incite the Pack
			[482] = 8.4, -- Thunderous Blast
			[483] = 5.74, -- Archive of the Titans
			[485] = 8.87, -- Laser Matrix
			[492] = 3.82, -- Liberator's Might
			[493] = 2.65, -- Last Gift
			[494] = 10, -- Battlefield Precision
			[495] = 5.15, -- Anduin's Dedication
			[496] = 1.27, -- Stronger Together
			[497] = 1.38, -- Stand As One
			[498] = 6.31, -- Barrage Of Many Bombs
			[499] = 3.85, -- Ricocheting Inflatable Pyrosaw
			[500] = 7.67, -- Synaptic Spark Capacitor
			[501] = 5.41, -- Relational Normalization Gizmo
			[503] = 0.08, -- Auto-Self-Cauterizer
			[504] = 5.92, -- Unstable Catalyst
			[505] = 4.77, -- Tradewinds
			[521] = 3.64, -- Shadow of Elune
			[522] = 6.59, -- Ancients' Bulwark
			[523] = 6.65, -- Apothecary's Concoctions
			[526] = 6.67, -- Endless Hunger
			[560] = 1.78, -- Bonded Souls
			[561] = 4.38, -- Seductive Power
			[562] = 8.97, -- Treacherous Covenant
			[564] = 0.09, -- Thrive in Chaos
		})
		insertDefaultScalesData(defensiveName, 12, 2, {
			-- SimulationCraft 810-02 for World of Warcraft 8.1.0 Live (wow build 29088)
			-- Iterations: 5951 - 8674 (avg 6562), TargetError: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 27.01.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.01, -- Azerite Empowered
			[15] = 10, -- Resounding Protection
			[18] = 3.09, -- Blood Siphon
			[20] = 1.23, -- Lifespeed
			[21] = 0.89, -- Elemental Whirl
			[30] = 2.29, -- Overwhelming Power
			[31] = 0.01, -- Gutripper
			[82] = 2.93, -- Champion of Azeroth
			[86] = 0.02, -- Azerite Fortification
			[87] = 0.02, -- Self Reliance
			[160] = 0.01, -- Infernal Armor
			[192] = 3.49, -- Meticulous Scheming
			[193] = 1.92, -- Blightborne Infusion
			[195] = 1.62, -- Secrets of the Deep
			[196] = 1.77, -- Swirling Sands
			[221] = 0.01, -- Rigid Carapace
			[355] = 0.01, -- Essence Sever
			[459] = 0.67, -- Unstable Flames
			[461] = 0.54, -- Earthlink
			[480] = 2.73, -- Blood Rite
			[481] = 1.43, -- Incite the Pack
			[483] = 1.79, -- Archive of the Titans
			[492] = 1.71, -- Liberator's Might
			[493] = 0.8, -- Last Gift
			[495] = 1.55, -- Anduin's Dedication
			[496] = 0.4, -- Stronger Together
			[497] = 0.2, -- Stand As One
			[501] = 2.32, -- Relational Normalization Gizmo
			[504] = 1.89, -- Unstable Catalyst
			[505] = 1.57, -- Tradewinds
			[521] = 2.67, -- Shadow of Elune
			[522] = 1.89, -- Ancients' Bulwark
			[526] = 1.97, -- Endless Hunger
			[560] = 1.4, -- Bonded Souls
			[561] = 0.22, -- Seductive Power
			[562] = 2.79, -- Treacherous Covenant
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
