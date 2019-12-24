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
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3203 - 3901 (avg 3448), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[22] = 3.05, -- Heed My Call
			[560] = 1.93, -- Bonded Souls
			[485] = 5.75, -- Laser Matrix
			[87] = 0.08, -- Self Reliance
			[105] = 0.04, -- Ephemeral Recovery
			[492] = 4.47, -- Liberator's Might
			[38] = 2.39, -- On My Way
			[98] = 0.04, -- Crystalline Carapace
			[89] = 0.02, -- Azerite Veins
			[497] = 1.49, -- Stand As One
			[577] = 2.56, -- Arcane Heart
			[541] = 1.82, -- Fight or Flight
			[478] = 6.16, -- Tidal Surge
			[575] = 9.96, -- Undulating Tides
			[194] = 5.25, -- Filthy Transfusion
			[494] = 6.55, -- Battlefield Precision
			[156] = 3.73, -- Ruinous Bolt
			[86] = 0.28, -- Azerite Fortification
			[126] = 6.09, -- Revolving Blades
			[480] = 4.46, -- Blood Rite
			[220] = 4.75, -- Chaotic Transformation
			[569] = 5.85, -- Clockwork Heart
			[495] = 4.66, -- Anduin's Dedication
			[522] = 8.2, -- Ancients' Bulwark
			[496] = 1.56, -- Stronger Together
			[499] = 2.46, -- Ricocheting Inflatable Pyrosaw
			[504] = 5.61, -- Unstable Catalyst
			[202] = 0.09, -- Soulmonger
			[500] = 3.27, -- Synaptic Spark Capacitor
			[352] = 7.62, -- Thirsting Blades
			[461] = 1.47, -- Earthlink
			[479] = 6.42, -- Dagger in the Back
			[44] = 0.22, -- Vampiric Speed
			[483] = 5.56, -- Archive of the Titans
			[157] = 6.67, -- Rezan's Fury
			[82] = 6.89, -- Champion of Azeroth
			[15] = 0.19, -- Resounding Protection
			[99] = 0.15, -- Ablative Shielding
			[523] = 5.12, -- Apothecary's Concoctions
			[196] = 6.88, -- Swirling Sands
			[193] = 7.76, -- Blightborne Infusion
			[562] = 7.18, -- Treacherous Covenant
			[505] = 3.82, -- Tradewinds
			[459] = 2.83, -- Unstable Flames
			[568] = 0.11, -- Person-Computer Interface
			[481] = 3.36, -- Incite the Pack
			[19] = 0.1, -- Woundbinder
			[498] = 4.17, -- Barrage Of Many Bombs
			[576] = 2.69, -- Loyal to the End
			[195] = 4.69, -- Secrets of the Deep
			[20] = 1.92, -- Lifespeed
			[245] = 5.61, -- Seething Power
			[482] = 5.16, -- Thunderous Blast
			[493] = 1.78, -- Last Gift
			[159] = 10, -- Furious Gaze
			[18] = 1.55, -- Blood Siphon
			[31] = 2.94, -- Gutripper
			[353] = 7.33, -- Eyes of Rage
			[21] = 2.14, -- Elemental Whirl
			[192] = 3.41, -- Meticulous Scheming
			[30] = 4.29, -- Overwhelming Power
			[521] = 4.72, -- Shadow of Elune
			[561] = 4.2, -- Seductive Power
			[501] = 5.42, -- Relational Normalization Gizmo
			[526] = 8.07, -- Endless Hunger
			[462] = 1.79, -- Azerite Globules
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3245 - 4700 (avg 3508), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[28] = { 3.63, 1.88 }, -- The Unbound Force
			[5] = { 8.4, 3.34 }, -- Essence of the Focusing Iris
			[14] = { 10, 3.71 }, -- Condensed Life-Force
			[4] = { 0.69, 1.32 }, -- Worldvein Resonance
			[12] = { 7.98, 3.7 }, -- The Crucible of Flame
			[22] = { 6.7, 1.45 }, -- Vision of Perfection
			[27] = { 3.11, 1.75 }, -- Memory of Lucid Dreams
			[32] = { 0, 2.36 }, -- Conflict and Strife
			[23] = { 6.16, 1.67 }, -- Blood of the Enemy
			[6] = { 5.84, 3.15 }, -- Purification Protocol
			[15] = { 3.72, 0.08 }, -- Ripple in Space
		}, 1577181600)

		insertDefaultScalesData(offensiveName, 12, 2, { -- Vengeance Demon Hunter
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 1205 - 2204 (avg 1459), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[202] = 0.11, -- Soulmonger
			[561] = 2.97, -- Seductive Power
			[157] = 6.25, -- Rezan's Fury
			[504] = 4.15, -- Unstable Catalyst
			[568] = 0.03, -- Person-Computer Interface
			[522] = 4.29, -- Ancients' Bulwark
			[562] = 5.62, -- Treacherous Covenant
			[523] = 5.13, -- Apothecary's Concoctions
			[20] = 1.09, -- Lifespeed
			[501] = 3.6, -- Relational Normalization Gizmo
			[19] = 0.05, -- Woundbinder
			[462] = 1.75, -- Azerite Globules
			[479] = 4.55, -- Dagger in the Back
			[498] = 3.96, -- Barrage Of Many Bombs
			[192] = 3.34, -- Meticulous Scheming
			[22] = 2.71, -- Heed My Call
			[496] = 1, -- Stronger Together
			[21] = 1.46, -- Elemental Whirl
			[493] = 1.71, -- Last Gift
			[499] = 2.27, -- Ricocheting Inflatable Pyrosaw
			[38] = 1.22, -- On My Way
			[15] = 0.02, -- Resounding Protection
			[156] = 3.93, -- Ruinous Bolt
			[194] = 5.79, -- Filthy Transfusion
			[478] = 6.47, -- Tidal Surge
			[459] = 1.67, -- Unstable Flames
			[569] = 3.79, -- Clockwork Heart
			[521] = 2.67, -- Shadow of Elune
			[44] = 0.04, -- Vampiric Speed
			[82] = 4.18, -- Champion of Azeroth
			[355] = 0.07, -- Essence Sever
			[485] = 5.46, -- Laser Matrix
			[483] = 4.15, -- Archive of the Titans
			[500] = 3.4, -- Synaptic Spark Capacitor
			[30] = 2.35, -- Overwhelming Power
			[461] = 1.22, -- Earthlink
			[31] = 3.17, -- Gutripper
			[505] = 3.15, -- Tradewinds
			[560] = 0.95, -- Bonded Souls
			[577] = 0.64, -- Arcane Heart
			[576] = 2.26, -- Loyal to the End
			[480] = 2.66, -- Blood Rite
			[494] = 6.3, -- Battlefield Precision
			[85] = 0.12, -- Gemhide
			[495] = 3.58, -- Anduin's Dedication
			[87] = 0.07, -- Self Reliance
			[18] = 1.15, -- Blood Siphon
			[575] = 10, -- Undulating Tides
			[196] = 4.47, -- Swirling Sands
			[103] = 0.02, -- Concentrated Mending
			[101] = 0.09, -- Shimmering Haven
			[99] = 0.18, -- Ablative Shielding
			[502] = 0.04, -- Personal Absorb-o-Tron
			[83] = 0.04, -- Impassive Visage
			[84] = 0.08, -- Bulwark of the Masses
			[482] = 5.28, -- Thunderous Blast
			[195] = 3.56, -- Secrets of the Deep
			[541] = 1.32, -- Fight or Flight
			[492] = 2.84, -- Liberator's Might
			[193] = 5.14, -- Blightborne Infusion
			[526] = 4.17, -- Endless Hunger
			[246] = 0.07, -- Hour of Reaping
			[497] = 1.08, -- Stand As One
			[481] = 2.86, -- Incite the Pack
			[98] = 0.2, -- Crystalline Carapace
			[13] = 0.01, -- Azerite Empowered
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 1203 - 1600 (avg 1372), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[22] = { 0.88, 0.06 }, -- Vision of Perfection
			[25] = { 0.41, 0.47 }, -- Aegis of the Deep
			[27] = { 1.05, 0.89 }, -- Memory of Lucid Dreams
			[32] = { 1.11, 1.02 }, -- Conflict and Strife
			[2] = { 0, 0.03 }, -- Azeroth's Undying Gift
			[4] = { 1.08, 0.91 }, -- Worldvein Resonance
			[15] = { 3.97, 0.07 }, -- Ripple in Space
			[3] = { 2.37, 2.38 }, -- Sphere of Suppression
			[7] = { 2.43, 0 }, -- Anima of Life and Death
			[12] = { 10, 3.51 }, -- The Crucible of Flame
		}, 1577181600)

		insertDefaultScalesData(offensiveName, 6, 1, { -- Blood Death Knight
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2200 - 3102 (avg 2373), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[560] = 1.83, -- Bonded Souls
			[478] = 6.13, -- Tidal Surge
			[462] = 2.01, -- Azerite Globules
			[561] = 2.84, -- Seductive Power
			[568] = 0.08, -- Person-Computer Interface
			[21] = 1.72, -- Elemental Whirl
			[140] = 0.66, -- Bone Spike Graveyard
			[22] = 2.88, -- Heed My Call
			[503] = 0.09, -- Auto-Self-Cauterizer
			[562] = 4.85, -- Treacherous Covenant
			[480] = 3.18, -- Blood Rite
			[98] = 0.02, -- Crystalline Carapace
			[500] = 3.26, -- Synaptic Spark Capacitor
			[193] = 5.54, -- Blightborne Infusion
			[541] = 1.3, -- Fight or Flight
			[196] = 4.69, -- Swirling Sands
			[492] = 3.16, -- Liberator's Might
			[192] = 4.19, -- Meticulous Scheming
			[156] = 3.57, -- Ruinous Bolt
			[101] = 0.02, -- Shimmering Haven
			[103] = 0.03, -- Concentrated Mending
			[18] = 1.11, -- Blood Siphon
			[479] = 4.53, -- Dagger in the Back
			[14] = 0.02, -- Longstrider
			[349] = 0.19, -- Bones of the Damned
			[31] = 3.04, -- Gutripper
			[38] = 1.36, -- On My Way
			[499] = 2.42, -- Ricocheting Inflatable Pyrosaw
			[44] = 0.05, -- Vampiric Speed
			[576] = 2.01, -- Loyal to the End
			[481] = 2.7, -- Incite the Pack
			[522] = 4.61, -- Ancients' Bulwark
			[461] = 0.98, -- Earthlink
			[30] = 3.33, -- Overwhelming Power
			[493] = 1.73, -- Last Gift
			[104] = 0.02, -- Bracing Chill
			[243] = 3.59, -- Bloody Runeblade
			[498] = 4.04, -- Barrage Of Many Bombs
			[501] = 3.96, -- Relational Normalization Gizmo
			[504] = 3.59, -- Unstable Catalyst
			[194] = 5.52, -- Filthy Transfusion
			[496] = 0.93, -- Stronger Together
			[494] = 6.21, -- Battlefield Precision
			[195] = 3.16, -- Secrets of the Deep
			[87] = 0.01, -- Self Reliance
			[523] = 5.24, -- Apothecary's Concoctions
			[577] = 0.72, -- Arcane Heart
			[106] = 1.93, -- Deep Cuts
			[497] = 0.72, -- Stand As One
			[495] = 3.21, -- Anduin's Dedication
			[82] = 4.49, -- Champion of Azeroth
			[482] = 5.38, -- Thunderous Blast
			[348] = 3.06, -- Eternal Rune Weapon
			[483] = 3.48, -- Archive of the Titans
			[575] = 10, -- Undulating Tides
			[569] = 4.2, -- Clockwork Heart
			[526] = 4.78, -- Endless Hunger
			[485] = 5.33, -- Laser Matrix
			[13] = 0.01, -- Azerite Empowered
			[20] = 1.3, -- Lifespeed
			[459] = 1.89, -- Unstable Flames
			[85] = 0.04, -- Gemhide
			[505] = 2.82, -- Tradewinds
			[157] = 6.39, -- Rezan's Fury
			[521] = 3.13, -- Shadow of Elune
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2104 - 2437 (avg 2300), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[12] = { 10, 3.48 }, -- The Crucible of Flame
			[22] = { 0.01, 0.02 }, -- Vision of Perfection
			[27] = { 0, 1.38 }, -- Memory of Lucid Dreams
			[15] = { 3.7, 0 }, -- Ripple in Space
			[13] = { 0.09, 0.03 }, -- Nullification Dynamo
			[32] = { 1.25, 1.23 }, -- Conflict and Strife
			[3] = { 3.12, 3.21 }, -- Sphere of Suppression
			[25] = { 0.53, 0.58 }, -- Aegis of the Deep
			[4] = { 1.24, 0.79 }, -- Worldvein Resonance
			[7] = { 2.1, 0.05 }, -- Anima of Life and Death
		}, 1577181600)

		insertDefaultScalesData(defaultName, 6, 2, { -- Frost Death Knight
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4000 - 4903 (avg 4313), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[101] = 0.3, -- Shimmering Haven
			[20] = 2.49, -- Lifespeed
			[141] = 5.46, -- Latent Chill
			[194] = 4.92, -- Filthy Transfusion
			[193] = 8.75, -- Blightborne Infusion
			[523] = 5.22, -- Apothecary's Concoctions
			[346] = 5.07, -- Killer Frost
			[504] = 7.27, -- Unstable Catalyst
			[499] = 2.7, -- Ricocheting Inflatable Pyrosaw
			[462] = 1.85, -- Azerite Globules
			[21] = 3.24, -- Elemental Whirl
			[485] = 5.35, -- Laser Matrix
			[98] = 0.25, -- Crystalline Carapace
			[82] = 8.56, -- Champion of Azeroth
			[103] = 0.62, -- Concentrated Mending
			[84] = 0.13, -- Bulwark of the Masses
			[492] = 5.18, -- Liberator's Might
			[541] = 2.47, -- Fight or Flight
			[495] = 5.96, -- Anduin's Dedication
			[503] = 0.19, -- Auto-Self-Cauterizer
			[43] = 0.39, -- Winds of War
			[478] = 6.19, -- Tidal Surge
			[192] = 5.23, -- Meticulous Scheming
			[31] = 3.22, -- Gutripper
			[461] = 2, -- Earthlink
			[562] = 9.44, -- Treacherous Covenant
			[100] = 0.18, -- Strength in Numbers
			[99] = 0.43, -- Ablative Shielding
			[560] = 2.19, -- Bonded Souls
			[347] = 6.36, -- Frozen Tempest
			[482] = 5.43, -- Thunderous Blast
			[494] = 6.42, -- Battlefield Precision
			[15] = 0.37, -- Resounding Protection
			[105] = 0.22, -- Ephemeral Recovery
			[13] = 0.06, -- Azerite Empowered
			[498] = 4.45, -- Barrage Of Many Bombs
			[19] = 0.34, -- Woundbinder
			[480] = 5.43, -- Blood Rite
			[576] = 5.06, -- Loyal to the End
			[497] = 1.65, -- Stand As One
			[85] = 0.07, -- Gemhide
			[18] = 2.91, -- Blood Siphon
			[30] = 4.82, -- Overwhelming Power
			[569] = 5.88, -- Clockwork Heart
			[577] = 3.74, -- Arcane Heart
			[86] = 0.19, -- Azerite Fortification
			[89] = 0.21, -- Azerite Veins
			[493] = 4.04, -- Last Gift
			[196] = 8.1, -- Swirling Sands
			[481] = 6.89, -- Incite the Pack
			[526] = 9.91, -- Endless Hunger
			[198] = 4.56, -- Frostwhelp's Indignation
			[463] = 0.36, -- Blessed Portents
			[44] = 0.14, -- Vampiric Speed
			[157] = 6.15, -- Rezan's Fury
			[156] = 3.5, -- Ruinous Bolt
			[568] = 0.08, -- Person-Computer Interface
			[242] = 4.84, -- Echoing Howl
			[87] = 0.17, -- Self Reliance
			[496] = 1.94, -- Stronger Together
			[108] = 6.48, -- Icy Citadel
			[38] = 2.66, -- On My Way
			[195] = 5.93, -- Secrets of the Deep
			[483] = 6.46, -- Archive of the Titans
			[465] = 0.45, -- March of the Damned
			[14] = 0.31, -- Longstrider
			[500] = 3.41, -- Synaptic Spark Capacitor
			[502] = 0.26, -- Personal Absorb-o-Tron
			[83] = 0.45, -- Impassive Visage
			[479] = 6.45, -- Dagger in the Back
			[521] = 5.04, -- Shadow of Elune
			[522] = 9.88, -- Ancients' Bulwark
			[201] = 0.2, -- Runic Barrier
			[549] = 0.47, -- Cold Hearted
			[561] = 5.35, -- Seductive Power
			[459] = 3.4, -- Unstable Flames
			[22] = 2.88, -- Heed My Call
			[575] = 10, -- Undulating Tides
			[505] = 7.43, -- Tradewinds
			[501] = 6.73, -- Relational Normalization Gizmo
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3600 - 4503 (avg 4118), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[27] = { 10, 6.19 }, -- Memory of Lucid Dreams
			[32] = { 6.88, 2.74 }, -- Conflict and Strife
			[15] = { 4.44, 0.14 }, -- Ripple in Space
			[5] = { 9.26, 3.63 }, -- Essence of the Focusing Iris
			[4] = { 2.02, 1.53 }, -- Worldvein Resonance
			[22] = { 4.34, 0 }, -- Vision of Perfection
			[14] = { 8.46, 3.05 }, -- Condensed Life-Force
			[23] = { 8.92, 1.73 }, -- Blood of the Enemy
			[6] = { 6.26, 2.7 }, -- Purification Protocol
			[28] = { 4.02, 2.03 }, -- The Unbound Force
			[12] = { 7.91, 3.45 }, -- The Crucible of Flame
		}, 1577181600)

		insertDefaultScalesData(defaultName, 6, 3, { -- Unholy Death Knight
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2501 - 3401 (avg 2748), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[195] = 5.03, -- Secrets of the Deep
			[560] = 2.58, -- Bonded Souls
			[15] = 0.12, -- Resounding Protection
			[549] = 0.21, -- Cold Hearted
			[157] = 6.1, -- Rezan's Fury
			[562] = 8.61, -- Treacherous Covenant
			[501] = 5.96, -- Relational Normalization Gizmo
			[522] = 9.24, -- Ancients' Bulwark
			[86] = 0.07, -- Azerite Fortification
			[523] = 4.96, -- Apothecary's Concoctions
			[496] = 1.79, -- Stronger Together
			[350] = 3.77, -- Cankerous Wounds
			[19] = 0.23, -- Woundbinder
			[504] = 5.94, -- Unstable Catalyst
			[193] = 8.22, -- Blightborne Infusion
			[482] = 5.55, -- Thunderous Blast
			[481] = 5.1, -- Incite the Pack
			[576] = 3.44, -- Loyal to the End
			[492] = 4.97, -- Liberator's Might
			[569] = 6.16, -- Clockwork Heart
			[500] = 3, -- Synaptic Spark Capacitor
			[502] = 0.03, -- Personal Absorb-o-Tron
			[493] = 2.64, -- Last Gift
			[498] = 3.82, -- Barrage Of Many Bombs
			[485] = 5.53, -- Laser Matrix
			[192] = 5.3, -- Meticulous Scheming
			[465] = 0.08, -- March of the Damned
			[103] = 0.2, -- Concentrated Mending
			[87] = 0.07, -- Self Reliance
			[21] = 2.61, -- Elemental Whirl
			[18] = 1.89, -- Blood Siphon
			[459] = 2.93, -- Unstable Flames
			[22] = 2.63, -- Heed My Call
			[494] = 6.06, -- Battlefield Precision
			[44] = 0.08, -- Vampiric Speed
			[196] = 7.49, -- Swirling Sands
			[20] = 2.64, -- Lifespeed
			[461] = 1.87, -- Earthlink
			[98] = 0.01, -- Crystalline Carapace
			[351] = 2.88, -- Last Surprise
			[541] = 1.72, -- Fight or Flight
			[194] = 5.03, -- Filthy Transfusion
			[568] = 0.1, -- Person-Computer Interface
			[156] = 3.55, -- Ruinous Bolt
			[199] = 9.16, -- Festermight
			[497] = 1.39, -- Stand As One
			[462] = 1.76, -- Azerite Globules
			[479] = 6.83, -- Dagger in the Back
			[483] = 5.63, -- Archive of the Titans
			[521] = 4.97, -- Shadow of Elune
			[575] = 10, -- Undulating Tides
			[499] = 2.42, -- Ricocheting Inflatable Pyrosaw
			[505] = 5.33, -- Tradewinds
			[85] = 0.08, -- Gemhide
			[577] = 1.46, -- Arcane Heart
			[561] = 4.35, -- Seductive Power
			[244] = 5.83, -- Harrowing Decay
			[38] = 2.34, -- On My Way
			[142] = 5.88, -- Helchains
			[109] = 6.7, -- Magus of the Dead
			[526] = 9.3, -- Endless Hunger
			[478] = 5.38, -- Tidal Surge
			[495] = 5.29, -- Anduin's Dedication
			[480] = 4.7, -- Blood Rite
			[82] = 7.66, -- Champion of Azeroth
			[31] = 3.05, -- Gutripper
			[105] = 0.11, -- Ephemeral Recovery
			[30] = 4.86, -- Overwhelming Power
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2400 - 3593 (avg 2749), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = { 3.93, 0.08 }, -- Ripple in Space
			[28] = { 3.64, 1.77 }, -- The Unbound Force
			[14] = { 8.34, 3.03 }, -- Condensed Life-Force
			[23] = { 6.82, 0.91 }, -- Blood of the Enemy
			[22] = { 6.5, 2.09 }, -- Vision of Perfection
			[12] = { 8.01, 3.09 }, -- The Crucible of Flame
			[6] = { 5.52, 2.45 }, -- Purification Protocol
			[27] = { 4.58, 3.12 }, -- Memory of Lucid Dreams
			[32] = { 2.24, 2.08 }, -- Conflict and Strife
			[5] = { 10, 3.07 }, -- Essence of the Focusing Iris
			[4] = { 1.2, 1.04 }, -- Worldvein Resonance
		}, 1577181600)

		insertDefaultScalesData(defaultName, 11, 1, { -- Balance Druid
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2800 - 3901 (avg 3058), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[156] = 2.11, -- Ruinous Bolt
			[21] = 1.62, -- Elemental Whirl
			[541] = 1.22, -- Fight or Flight
			[493] = 2.13, -- Last Gift
			[562] = 5.39, -- Treacherous Covenant
			[483] = 3.61, -- Archive of the Titans
			[196] = 5.27, -- Swirling Sands
			[498] = 2.45, -- Barrage Of Many Bombs
			[522] = 5.59, -- Ancients' Bulwark
			[501] = 4.11, -- Relational Normalization Gizmo
			[356] = 1.62, -- High Noon
			[250] = 3.67, -- Dawning Sun
			[561] = 2.87, -- Seductive Power
			[194] = 3.43, -- Filthy Transfusion
			[195] = 3.54, -- Secrets of the Deep
			[481] = 4, -- Incite the Pack
			[495] = 3.25, -- Anduin's Dedication
			[492] = 3.51, -- Liberator's Might
			[494] = 3.99, -- Battlefield Precision
			[104] = 0.03, -- Bracing Chill
			[502] = 0.05, -- Personal Absorb-o-Tron
			[364] = 2.71, -- Lively Spirit
			[575] = 6.37, -- Undulating Tides
			[576] = 2.79, -- Loyal to the End
			[521] = 3.36, -- Shadow of Elune
			[122] = 3.73, -- Streaking Stars
			[193] = 5.75, -- Blightborne Infusion
			[523] = 3.18, -- Apothecary's Concoctions
			[504] = 3.91, -- Unstable Catalyst
			[18] = 1.71, -- Blood Siphon
			[31] = 1.95, -- Gutripper
			[13] = 0.09, -- Azerite Empowered
			[540] = 0.04, -- Switch Hitter
			[38] = 1.69, -- On My Way
			[503] = 0.02, -- Auto-Self-Cauterizer
			[83] = 0.01, -- Impassive Visage
			[569] = 4.54, -- Clockwork Heart
			[505] = 4.38, -- Tradewinds
			[560] = 1.77, -- Bonded Souls
			[462] = 1.2, -- Azerite Globules
			[467] = 0.06, -- Ursoc's Endurance
			[82] = 5.46, -- Champion of Azeroth
			[30] = 3.25, -- Overwhelming Power
			[577] = 2.15, -- Arcane Heart
			[497] = 1.14, -- Stand As One
			[200] = 10, -- Arcanic Pulsar
			[496] = 1.08, -- Stronger Together
			[480] = 3.37, -- Blood Rite
			[461] = 1.14, -- Earthlink
			[22] = 1.69, -- Heed My Call
			[173] = 2.4, -- Power of the Moon
			[43] = 0.01, -- Winds of War
			[482] = 3.45, -- Thunderous Blast
			[485] = 3.69, -- Laser Matrix
			[192] = 4.31, -- Meticulous Scheming
			[44] = 0.01, -- Vampiric Speed
			[526] = 5.36, -- Endless Hunger
			[479] = 4.14, -- Dagger in the Back
			[157] = 3.87, -- Rezan's Fury
			[478] = 3.63, -- Tidal Surge
			[85] = 0.01, -- Gemhide
			[20] = 1.7, -- Lifespeed
			[500] = 2.11, -- Synaptic Spark Capacitor
			[14] = 0.02, -- Longstrider
			[459] = 2.04, -- Unstable Flames
			[357] = 0.09, -- Lunar Shrapnel
			[499] = 1.57, -- Ricocheting Inflatable Pyrosaw
			[19] = 0.13, -- Woundbinder
			[89] = 0.01, -- Azerite Veins
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2403 - 3301 (avg 3005), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[12] = { 5.01, 2.85 }, -- The Crucible of Flame
			[14] = { 7.57, 2.79 }, -- Condensed Life-Force
			[4] = { 0.21, 1.17 }, -- Worldvein Resonance
			[32] = { 10, 1.9 }, -- Conflict and Strife
			[5] = { 7.02, 3.33 }, -- Essence of the Focusing Iris
			[28] = { 2.88, 2.04 }, -- The Unbound Force
			[27] = { 4.47, 2.51 }, -- Memory of Lucid Dreams
			[23] = { 4.96, 1.21 }, -- Blood of the Enemy
			[6] = { 4.04, 2.34 }, -- Purification Protocol
			[15] = { 2.44, 0 }, -- Ripple in Space
			[22] = { 4.47, 1.07 }, -- Vision of Perfection
		}, 1577181600)

		insertDefaultScalesData(defaultName, 11, 2, { -- Feral Druid
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4403 - 5402 (avg 4827), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[483] = 4.89, -- Archive of the Titans
			[523] = 4.49, -- Apothecary's Concoctions
			[192] = 4.58, -- Meticulous Scheming
			[482] = 4.31, -- Thunderous Blast
			[21] = 2.51, -- Elemental Whirl
			[358] = 5.36, -- Gushing Lacerations
			[492] = 4.36, -- Liberator's Might
			[31] = 2.64, -- Gutripper
			[522] = 7.41, -- Ancients' Bulwark
			[18] = 2.21, -- Blood Siphon
			[459] = 2.57, -- Unstable Flames
			[462] = 1.51, -- Azerite Globules
			[485] = 4.96, -- Laser Matrix
			[504] = 4.76, -- Unstable Catalyst
			[111] = 4.72, -- Blood Mist
			[463] = 0.05, -- Blessed Portents
			[209] = 10, -- Jungle Fury
			[498] = 3.3, -- Barrage Of Many Bombs
			[501] = 5.11, -- Relational Normalization Gizmo
			[38] = 2.22, -- On My Way
			[157] = 5.46, -- Rezan's Fury
			[461] = 1.66, -- Earthlink
			[467] = 0.05, -- Ursoc's Endurance
			[480] = 3.69, -- Blood Rite
			[479] = 5.55, -- Dagger in the Back
			[20] = 1.6, -- Lifespeed
			[505] = 5.76, -- Tradewinds
			[569] = 6.43, -- Clockwork Heart
			[193] = 8.22, -- Blightborne Infusion
			[478] = 5.19, -- Tidal Surge
			[194] = 4.36, -- Filthy Transfusion
			[15] = 0.24, -- Resounding Protection
			[576] = 3.94, -- Loyal to the End
			[499] = 2.02, -- Ricocheting Inflatable Pyrosaw
			[562] = 6.43, -- Treacherous Covenant
			[156] = 3, -- Ruinous Bolt
			[502] = 0.01, -- Personal Absorb-o-Tron
			[99] = 0.2, -- Ablative Shielding
			[497] = 1.03, -- Stand As One
			[101] = 0.02, -- Shimmering Haven
			[521] = 3.77, -- Shadow of Elune
			[30] = 3.36, -- Overwhelming Power
			[98] = 0.16, -- Crystalline Carapace
			[568] = 0.06, -- Person-Computer Interface
			[196] = 7.49, -- Swirling Sands
			[481] = 5.45, -- Incite the Pack
			[89] = 0.16, -- Azerite Veins
			[43] = 0.06, -- Winds of War
			[575] = 8.36, -- Undulating Tides
			[496] = 1.47, -- Stronger Together
			[577] = 2.42, -- Arcane Heart
			[247] = 1.35, -- Iron Jaws
			[561] = 3.6, -- Seductive Power
			[13] = 0.24, -- Azerite Empowered
			[500] = 2.84, -- Synaptic Spark Capacitor
			[82] = 7.08, -- Champion of Azeroth
			[493] = 2.82, -- Last Gift
			[103] = 0.07, -- Concentrated Mending
			[494] = 5.67, -- Battlefield Precision
			[22] = 2.15, -- Heed My Call
			[359] = 6.24, -- Wild Fleshrending
			[541] = 1.71, -- Fight or Flight
			[195] = 4.22, -- Secrets of the Deep
			[171] = 0.07, -- Masterful Instincts
			[87] = 0.06, -- Self Reliance
			[495] = 4.11, -- Anduin's Dedication
			[173] = 0.13, -- Power of the Moon
			[560] = 1.72, -- Bonded Souls
			[83] = 0.03, -- Impassive Visage
			[104] = 0.12, -- Bracing Chill
			[84] = 0.11, -- Bulwark of the Masses
			[169] = 2.9, -- Untamed Ferocity
			[100] = 0.11, -- Strength in Numbers
			[526] = 7.5, -- Endless Hunger
			[44] = 0.06, -- Vampiric Speed
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4400 - 5001 (avg 4736), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[28] = { 2.21, 1.17 }, -- The Unbound Force
			[22] = { 1.86, 0.42 }, -- Vision of Perfection
			[27] = { 2.67, 2.23 }, -- Memory of Lucid Dreams
			[32] = { 10, 1.76 }, -- Conflict and Strife
			[12] = { 5.87, 2.4 }, -- The Crucible of Flame
			[6] = { 4.52, 1.96 }, -- Purification Protocol
			[4] = { 0.84, 0.84 }, -- Worldvein Resonance
			[15] = { 2.72, 0 }, -- Ripple in Space
			[14] = { 6.02, 2.25 }, -- Condensed Life-Force
			[23] = { 4.62, 0.66 }, -- Blood of the Enemy
			[5] = { 5.97, 2.32 }, -- Essence of the Focusing Iris
		}, 1577181600)

		insertDefaultScalesData(offensiveName, 11, 3, { -- Guardian Druid
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 1100 - 1701 (avg 1240), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[496] = 1.07, -- Stronger Together
			[481] = 3.51, -- Incite the Pack
			[498] = 3.99, -- Barrage Of Many Bombs
			[112] = 0.05, -- Layered Mane
			[171] = 0.2, -- Masterful Instincts
			[101] = 0.04, -- Shimmering Haven
			[541] = 1.43, -- Fight or Flight
			[103] = 0.07, -- Concentrated Mending
			[480] = 3.43, -- Blood Rite
			[195] = 4.05, -- Secrets of the Deep
			[21] = 1.7, -- Elemental Whirl
			[492] = 3.23, -- Liberator's Might
			[500] = 3.22, -- Synaptic Spark Capacitor
			[360] = 0.08, -- Gory Regeneration
			[521] = 3.26, -- Shadow of Elune
			[86] = 0.06, -- Azerite Fortification
			[361] = 3.97, -- Guardian's Wrath
			[13] = 0.03, -- Azerite Empowered
			[461] = 1.33, -- Earthlink
			[485] = 5.35, -- Laser Matrix
			[194] = 5.39, -- Filthy Transfusion
			[495] = 3.69, -- Anduin's Dedication
			[560] = 1.71, -- Bonded Souls
			[494] = 6.39, -- Battlefield Precision
			[503] = 0.14, -- Auto-Self-Cauterizer
			[483] = 4.4, -- Archive of the Titans
			[196] = 4.45, -- Swirling Sands
			[19] = 0.07, -- Woundbinder
			[241] = 4.45, -- Twisted Claws
			[522] = 5.13, -- Ancients' Bulwark
			[192] = 4.06, -- Meticulous Scheming
			[20] = 1.78, -- Lifespeed
			[156] = 3.54, -- Ruinous Bolt
			[575] = 10, -- Undulating Tides
			[526] = 5.25, -- Endless Hunger
			[22] = 2.73, -- Heed My Call
			[462] = 1.88, -- Azerite Globules
			[193] = 4.95, -- Blightborne Infusion
			[576] = 2.6, -- Loyal to the End
			[561] = 3.25, -- Seductive Power
			[31] = 3.03, -- Gutripper
			[18] = 1.51, -- Blood Siphon
			[497] = 0.99, -- Stand As One
			[251] = 4.48, -- Burst of Savagery
			[482] = 5.24, -- Thunderous Blast
			[82] = 5.06, -- Champion of Azeroth
			[87] = 0.01, -- Self Reliance
			[577] = 1.25, -- Arcane Heart
			[568] = 0.05, -- Person-Computer Interface
			[100] = 0.12, -- Strength in Numbers
			[569] = 4, -- Clockwork Heart
			[98] = 0.05, -- Crystalline Carapace
			[499] = 2.49, -- Ricocheting Inflatable Pyrosaw
			[478] = 6.32, -- Tidal Surge
			[30] = 3.01, -- Overwhelming Power
			[38] = 1.44, -- On My Way
			[479] = 4.49, -- Dagger in the Back
			[359] = 1.56, -- Wild Fleshrending
			[459] = 1.79, -- Unstable Flames
			[523] = 5.02, -- Apothecary's Concoctions
			[562] = 5.88, -- Treacherous Covenant
			[157] = 6.28, -- Rezan's Fury
			[505] = 3.64, -- Tradewinds
			[501] = 4.11, -- Relational Normalization Gizmo
			[504] = 4.18, -- Unstable Catalyst
			[493] = 2.02, -- Last Gift
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 1100 - 1312 (avg 1195), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[7] = { 2.08, 0 }, -- Anima of Life and Death
			[2] = { 0.07, 0 }, -- Azeroth's Undying Gift
			[3] = { 3.52, 3.51 }, -- Sphere of Suppression
			[32] = { 6.59, 1.54 }, -- Conflict and Strife
			[12] = { 10, 3.85 }, -- The Crucible of Flame
			[22] = { 1.59, 0.01 }, -- Vision of Perfection
			[13] = { 0, 0.05 }, -- Nullification Dynamo
			[25] = { 0.68, 0.72 }, -- Aegis of the Deep
			[4] = { 0.85, 1.1 }, -- Worldvein Resonance
			[15] = { 3.9, 0.02 }, -- Ripple in Space
			[27] = { 1.31, 0.78 }, -- Memory of Lucid Dreams
		}, 1577181600)

		insertDefaultScalesData(defaultName, 11, 4, { -- Restoration Druid
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2000 - 2800 (avg 2231), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[356] = 2.91, -- High Noon
			[504] = 4.59, -- Unstable Catalyst
			[521] = 4.74, -- Shadow of Elune
			[568] = 0.11, -- Person-Computer Interface
			[30] = 4.12, -- Overwhelming Power
			[462] = 1.84, -- Azerite Globules
			[482] = 5.29, -- Thunderous Blast
			[14] = 0.11, -- Longstrider
			[526] = 7.14, -- Endless Hunger
			[498] = 3.99, -- Barrage Of Many Bombs
			[496] = 1.42, -- Stronger Together
			[100] = 0.16, -- Strength in Numbers
			[569] = 5.52, -- Clockwork Heart
			[577] = 1.65, -- Arcane Heart
			[479] = 6.8, -- Dagger in the Back
			[492] = 4.72, -- Liberator's Might
			[157] = 6.27, -- Rezan's Fury
			[105] = 0.1, -- Ephemeral Recovery
			[85] = 0.01, -- Gemhide
			[20] = 2.36, -- Lifespeed
			[494] = 6.43, -- Battlefield Precision
			[195] = 4, -- Secrets of the Deep
			[22] = 2.9, -- Heed My Call
			[499] = 2.25, -- Ricocheting Inflatable Pyrosaw
			[478] = 6.67, -- Tidal Surge
			[99] = 0.1, -- Ablative Shielding
			[192] = 5.72, -- Meticulous Scheming
			[575] = 10, -- Undulating Tides
			[562] = 6.24, -- Treacherous Covenant
			[483] = 4.64, -- Archive of the Titans
			[561] = 3.31, -- Seductive Power
			[540] = 0.08, -- Switch Hitter
			[467] = 0.13, -- Ursoc's Endurance
			[481] = 0.02, -- Incite the Pack
			[89] = 0.21, -- Azerite Veins
			[87] = 0.05, -- Self Reliance
			[363] = 0.26, -- Waking Dream
			[560] = 2.71, -- Bonded Souls
			[459] = 2.27, -- Unstable Flames
			[495] = 4.08, -- Anduin's Dedication
			[172] = 0.09, -- Grove Tending
			[501] = 5.49, -- Relational Normalization Gizmo
			[576] = 0.09, -- Loyal to the End
			[82] = 6.08, -- Champion of Azeroth
			[194] = 5.17, -- Filthy Transfusion
			[86] = 0.09, -- Azerite Fortification
			[43] = 0.23, -- Winds of War
			[196] = 6.16, -- Swirling Sands
			[156] = 3.91, -- Ruinous Bolt
			[193] = 7.29, -- Blightborne Infusion
			[31] = 3.23, -- Gutripper
			[500] = 3.43, -- Synaptic Spark Capacitor
			[84] = 0.2, -- Bulwark of the Masses
			[461] = 1.38, -- Earthlink
			[38] = 2.16, -- On My Way
			[522] = 7.41, -- Ancients' Bulwark
			[541] = 1.34, -- Fight or Flight
			[18] = 0.13, -- Blood Siphon
			[485] = 5.48, -- Laser Matrix
			[523] = 5.03, -- Apothecary's Concoctions
			[21] = 2.28, -- Elemental Whirl
			[103] = 0.11, -- Concentrated Mending
			[480] = 4.62, -- Blood Rite
			[44] = 0.11, -- Vampiric Speed
			[15] = 0.05, -- Resounding Protection
			[497] = 1.01, -- Stand As One
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2001 - 2412 (avg 2228), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = { 0.1, 0 }, -- Ripple in Space
			[23] = { 1.62, 1.72 }, -- Blood of the Enemy
			[27] = { 0.82, 0.11 }, -- Memory of Lucid Dreams
			[5] = { 2.92, 2.79 }, -- Essence of the Focusing Iris
			[4] = { 0.97, 0.87 }, -- Worldvein Resonance
			[22] = { 0, 0.09 }, -- Vision of Perfection
			[28] = { 1.45, 1.45 }, -- The Unbound Force
			[6] = { 2.56, 2.57 }, -- Purification Protocol
			[12] = { 10, 4.01 }, -- The Crucible of Flame
			[32] = { 2.03, 1.83 }, -- Conflict and Strife
			[14] = { 2.83, 3.08 }, -- Condensed Life-Force
		}, 1577181600)

		insertDefaultScalesData(defaultName, 3, 1, { -- Beast Mastery Hunter
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2891 - 3702 (avg 3120), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[38] = 2.07, -- On My Way
			[89] = 0.14, -- Azerite Veins
			[194] = 3.54, -- Filthy Transfusion
			[30] = 3.7, -- Overwhelming Power
			[499] = 1.95, -- Ricocheting Inflatable Pyrosaw
			[502] = 0.14, -- Personal Absorb-o-Tron
			[483] = 4.82, -- Archive of the Titans
			[105] = 0.14, -- Ephemeral Recovery
			[485] = 4.27, -- Laser Matrix
			[526] = 6.8, -- Endless Hunger
			[193] = 6.52, -- Blightborne Infusion
			[577] = 1.02, -- Arcane Heart
			[18] = 1.91, -- Blood Siphon
			[157] = 5.13, -- Rezan's Fury
			[21] = 2.06, -- Elemental Whirl
			[568] = 0.04, -- Person-Computer Interface
			[196] = 5.54, -- Swirling Sands
			[203] = 0.15, -- Shellshock
			[195] = 4.56, -- Secrets of the Deep
			[463] = 0.13, -- Blessed Portents
			[103] = 0.26, -- Concentrated Mending
			[561] = 3.44, -- Seductive Power
			[576] = 3.27, -- Loyal to the End
			[543] = 0.1, -- Nature's Salve
			[500] = 3.08, -- Synaptic Spark Capacitor
			[504] = 4.86, -- Unstable Catalyst
			[82] = 6.43, -- Champion of Azeroth
			[522] = 6.79, -- Ancients' Bulwark
			[367] = 6.09, -- Feeding Frenzy
			[541] = 1.77, -- Fight or Flight
			[492] = 4.04, -- Liberator's Might
			[211] = 8.77, -- Dance of Death
			[459] = 2.37, -- Unstable Flames
			[505] = 4.92, -- Tradewinds
			[192] = 5.8, -- Meticulous Scheming
			[104] = 0.16, -- Bracing Chill
			[569] = 5.93, -- Clockwork Heart
			[498] = 3.31, -- Barrage Of Many Bombs
			[493] = 2.49, -- Last Gift
			[523] = 4.07, -- Apothecary's Concoctions
			[161] = 5.65, -- Haze of Rage
			[31] = 2.41, -- Gutripper
			[461] = 1.42, -- Earthlink
			[501] = 5.17, -- Relational Normalization Gizmo
			[43] = 0.08, -- Winds of War
			[462] = 1.51, -- Azerite Globules
			[481] = 4.47, -- Incite the Pack
			[86] = 0.11, -- Azerite Fortification
			[560] = 2.28, -- Bonded Souls
			[479] = 5.25, -- Dagger in the Back
			[575] = 7.78, -- Undulating Tides
			[480] = 4.12, -- Blood Rite
			[494] = 4.95, -- Battlefield Precision
			[84] = 0.18, -- Bulwark of the Masses
			[496] = 1.44, -- Stronger Together
			[107] = 3.6, -- Serrated Jaws
			[87] = 0.18, -- Self Reliance
			[14] = 0.14, -- Longstrider
			[100] = 0.08, -- Strength in Numbers
			[562] = 6.77, -- Treacherous Covenant
			[365] = 5.07, -- Dire Consequences
			[521] = 4.42, -- Shadow of Elune
			[44] = 0.24, -- Vampiric Speed
			[20] = 2.01, -- Lifespeed
			[469] = 0.01, -- Duck and Cover
			[156] = 3.28, -- Ruinous Bolt
			[497] = 1.25, -- Stand As One
			[366] = 10, -- Primal Instincts
			[482] = 4.18, -- Thunderous Blast
			[478] = 5.5, -- Tidal Surge
			[19] = 0.01, -- Woundbinder
			[22] = 2.19, -- Heed My Call
			[503] = 0.17, -- Auto-Self-Cauterizer
			[495] = 4.37, -- Anduin's Dedication
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2701 - 3302 (avg 3042), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[32] = { 2.11, 2.11 }, -- Conflict and Strife
			[27] = { 0.9, 0.93 }, -- Memory of Lucid Dreams
			[15] = { 3.83, 0.08 }, -- Ripple in Space
			[14] = { 6.9, 2.51 }, -- Condensed Life-Force
			[28] = { 3.63, 1.4 }, -- The Unbound Force
			[4] = { 1.6, 1.13 }, -- Worldvein Resonance
			[12] = { 7.76, 2.94 }, -- The Crucible of Flame
			[22] = { 0.87, 0 }, -- Vision of Perfection
			[6] = { 5.44, 2.2 }, -- Purification Protocol
			[23] = { 4.98, 0.59 }, -- Blood of the Enemy
			[5] = { 10, 3.2 }, -- Essence of the Focusing Iris
		}, 1577181600)

		insertDefaultScalesData(defaultName, 3, 2, { -- Marksmanship Hunter
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3004 - 4201 (avg 3392), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[499] = 1.92, -- Ricocheting Inflatable Pyrosaw
			[195] = 3.86, -- Secrets of the Deep
			[526] = 6.84, -- Endless Hunger
			[501] = 5.17, -- Relational Normalization Gizmo
			[504] = 4.3, -- Unstable Catalyst
			[500] = 2.76, -- Synaptic Spark Capacitor
			[560] = 2.16, -- Bonded Souls
			[492] = 4.33, -- Liberator's Might
			[485] = 4.21, -- Laser Matrix
			[561] = 3.36, -- Seductive Power
			[82] = 6.63, -- Champion of Azeroth
			[36] = 10, -- In The Rhythm
			[194] = 4.34, -- Filthy Transfusion
			[575] = 8.16, -- Undulating Tides
			[192] = 5.43, -- Meticulous Scheming
			[156] = 3.39, -- Ruinous Bolt
			[461] = 1.17, -- Earthlink
			[370] = 8.44, -- Focused Fire
			[459] = 2.18, -- Unstable Flames
			[569] = 4.63, -- Clockwork Heart
			[494] = 4.88, -- Battlefield Precision
			[31] = 2.27, -- Gutripper
			[30] = 4.05, -- Overwhelming Power
			[541] = 1.32, -- Fight or Flight
			[562] = 6.33, -- Treacherous Covenant
			[196] = 5.79, -- Swirling Sands
			[162] = 6.4, -- Surging Shots
			[523] = 4.31, -- Apothecary's Concoctions
			[21] = 2.27, -- Elemental Whirl
			[493] = 2.42, -- Last Gift
			[505] = 5.05, -- Tradewinds
			[193] = 6.75, -- Blightborne Infusion
			[577] = 2, -- Arcane Heart
			[498] = 2.73, -- Barrage Of Many Bombs
			[22] = 2.04, -- Heed My Call
			[496] = 1, -- Stronger Together
			[522] = 6.8, -- Ancients' Bulwark
			[497] = 0.83, -- Stand As One
			[157] = 5.21, -- Rezan's Fury
			[495] = 3.65, -- Anduin's Dedication
			[462] = 0.97, -- Azerite Globules
			[20] = 2.1, -- Lifespeed
			[478] = 5.14, -- Tidal Surge
			[482] = 3.98, -- Thunderous Blast
			[479] = 5.43, -- Dagger in the Back
			[368] = 2.7, -- Steady Aim
			[212] = 7.43, -- Unerring Vision
			[480] = 4.59, -- Blood Rite
			[521] = 4.53, -- Shadow of Elune
			[483] = 4.32, -- Archive of the Titans
			[576] = 3.39, -- Loyal to the End
			[18] = 1.72, -- Blood Siphon
			[38] = 1.75, -- On My Way
			[481] = 4.67, -- Incite the Pack
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3001 - 3807 (avg 3393), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[12] = { 7.64, 4.02 }, -- The Crucible of Flame
			[32] = { 2.38, 2.57 }, -- Conflict and Strife
			[14] = { 8.42, 3.36 }, -- Condensed Life-Force
			[27] = { 1.52, 0.81 }, -- Memory of Lucid Dreams
			[5] = { 10, 4.77 }, -- Essence of the Focusing Iris
			[4] = { 0.58, 1.25 }, -- Worldvein Resonance
			[6] = { 5.67, 2.61 }, -- Purification Protocol
			[23] = { 4.93, 0.71 }, -- Blood of the Enemy
			[15] = { 3.07, 0 }, -- Ripple in Space
			[22] = { 5.12, 1.97 }, -- Vision of Perfection
			[28] = { 2.3, 1.67 }, -- The Unbound Force
		}, 1577181600)

		insertDefaultScalesData(defaultName, 3, 3, { -- Survival Hunter
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2700 - 3527 (avg 2911), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[479] = 6.69, -- Dagger in the Back
			[463] = 0.03, -- Blessed Portents
			[462] = 1.65, -- Azerite Globules
			[500] = 3.48, -- Synaptic Spark Capacitor
			[100] = 0.16, -- Strength in Numbers
			[478] = 5.98, -- Tidal Surge
			[493] = 2.79, -- Last Gift
			[480] = 5.98, -- Blood Rite
			[499] = 2.22, -- Ricocheting Inflatable Pyrosaw
			[522] = 8.13, -- Ancients' Bulwark
			[43] = 0.13, -- Winds of War
			[38] = 2.27, -- On My Way
			[494] = 6.18, -- Battlefield Precision
			[22] = 2.62, -- Heed My Call
			[526] = 8.46, -- Endless Hunger
			[483] = 5.77, -- Archive of the Titans
			[459] = 2.84, -- Unstable Flames
			[568] = 0.11, -- Person-Computer Interface
			[365] = 5.86, -- Dire Consequences
			[18] = 2.1, -- Blood Siphon
			[577] = 2.19, -- Arcane Heart
			[496] = 1.81, -- Stronger Together
			[523] = 5.06, -- Apothecary's Concoctions
			[541] = 1.6, -- Fight or Flight
			[163] = 7.28, -- Latent Poison
			[372] = 9.62, -- Wilderness Survival
			[30] = 5.56, -- Overwhelming Power
			[83] = 0.07, -- Impassive Visage
			[21] = 2.65, -- Elemental Whirl
			[31] = 3.13, -- Gutripper
			[107] = 3.84, -- Serrated Jaws
			[89] = 0.23, -- Azerite Veins
			[157] = 6.58, -- Rezan's Fury
			[569] = 6.27, -- Clockwork Heart
			[192] = 6.4, -- Meticulous Scheming
			[495] = 5.05, -- Anduin's Dedication
			[482] = 5.29, -- Thunderous Blast
			[195] = 5.13, -- Secrets of the Deep
			[560] = 2.9, -- Bonded Souls
			[156] = 3.48, -- Ruinous Bolt
			[87] = 0.02, -- Self Reliance
			[505] = 5.39, -- Tradewinds
			[15] = 0.01, -- Resounding Protection
			[501] = 6.7, -- Relational Normalization Gizmo
			[194] = 5.18, -- Filthy Transfusion
			[193] = 7.99, -- Blightborne Infusion
			[576] = 3.91, -- Loyal to the End
			[82] = 7.72, -- Champion of Azeroth
			[371] = 8.72, -- Blur of Talons
			[101] = 0.06, -- Shimmering Haven
			[481] = 5.27, -- Incite the Pack
			[98] = 0.08, -- Crystalline Carapace
			[14] = 0.17, -- Longstrider
			[213] = 4.98, -- Venomous Fangs
			[521] = 5.84, -- Shadow of Elune
			[498] = 3.8, -- Barrage Of Many Bombs
			[497] = 1.53, -- Stand As One
			[110] = 2.82, -- Wildfire Cluster
			[196] = 7.23, -- Swirling Sands
			[561] = 4.5, -- Seductive Power
			[492] = 4.97, -- Liberator's Might
			[44] = 0.04, -- Vampiric Speed
			[562] = 7.92, -- Treacherous Covenant
			[373] = 7.97, -- Primeval Intuition
			[504] = 5.55, -- Unstable Catalyst
			[461] = 1.7, -- Earthlink
			[485] = 5.83, -- Laser Matrix
			[86] = 0.2, -- Azerite Fortification
			[543] = 0.15, -- Nature's Salve
			[575] = 10, -- Undulating Tides
			[20] = 2.64, -- Lifespeed
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2501 - 3165 (avg 2831), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[6] = { 5.68, 2.63 }, -- Purification Protocol
			[15] = { 3.73, 0.12 }, -- Ripple in Space
			[22] = { 3.74, 0.22 }, -- Vision of Perfection
			[32] = { 2.23, 2.34 }, -- Conflict and Strife
			[12] = { 7.81, 3.38 }, -- The Crucible of Flame
			[14] = { 7.42, 3.15 }, -- Condensed Life-Force
			[28] = { 3.33, 1.77 }, -- The Unbound Force
			[4] = { 0.77, 1.28 }, -- Worldvein Resonance
			[27] = { 7.2, 2.29 }, -- Memory of Lucid Dreams
			[5] = { 10, 4.24 }, -- Essence of the Focusing Iris
			[23] = { 5.45, 1.03 }, -- Blood of the Enemy
		}, 1577181600)

		insertDefaultScalesData(defaultName, 8, 1, { -- Arcane Mage
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 5701 - 6701 (avg 6083), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[479] = 4.67, -- Dagger in the Back
			[127] = 10, -- Equipoise
			[214] = 2.84, -- Arcane Pressure
			[157] = 4.53, -- Rezan's Fury
			[20] = 1.17, -- Lifespeed
			[560] = 1.66, -- Bonded Souls
			[523] = 3.66, -- Apothecary's Concoctions
			[86] = 0.07, -- Azerite Fortification
			[480] = 3.16, -- Blood Rite
			[104] = 0.01, -- Bracing Chill
			[478] = 4.37, -- Tidal Surge
			[493] = 2.74, -- Last Gift
			[577] = 2.4, -- Arcane Heart
			[462] = 1.37, -- Azerite Globules
			[482] = 3.72, -- Thunderous Blast
			[196] = 5.56, -- Swirling Sands
			[541] = 1.67, -- Fight or Flight
			[498] = 2.97, -- Barrage Of Many Bombs
			[167] = 2.62, -- Brain Storm
			[459] = 2.25, -- Unstable Flames
			[18] = 1.92, -- Blood Siphon
			[502] = 0.12, -- Personal Absorb-o-Tron
			[569] = 3.4, -- Clockwork Heart
			[30] = 2.6, -- Overwhelming Power
			[31] = 1.84, -- Gutripper
			[521] = 3.15, -- Shadow of Elune
			[156] = 2.83, -- Ruinous Bolt
			[503] = 0.05, -- Auto-Self-Cauterizer
			[461] = 1.69, -- Earthlink
			[193] = 6.92, -- Blightborne Infusion
			[562] = 7.23, -- Treacherous Covenant
			[38] = 2.15, -- On My Way
			[88] = 5.42, -- Arcane Pummeling
			[22] = 2.11, -- Heed My Call
			[82] = 5.78, -- Champion of Azeroth
			[497] = 0.96, -- Stand As One
			[374] = 6.18, -- Galvanizing Spark
			[495] = 4.55, -- Anduin's Dedication
			[494] = 3.97, -- Battlefield Precision
			[505] = 4.66, -- Tradewinds
			[501] = 4.61, -- Relational Normalization Gizmo
			[194] = 3.95, -- Filthy Transfusion
			[492] = 4.05, -- Liberator's Might
			[500] = 2.39, -- Synaptic Spark Capacitor
			[496] = 1.39, -- Stronger Together
			[576] = 3.52, -- Loyal to the End
			[195] = 4.58, -- Secrets of the Deep
			[42] = 0.02, -- Savior
			[575] = 7.02, -- Undulating Tides
			[13] = 0.19, -- Azerite Empowered
			[483] = 4.61, -- Archive of the Titans
			[481] = 4.43, -- Incite the Pack
			[561] = 3.6, -- Seductive Power
			[526] = 7.23, -- Endless Hunger
			[192] = 2.39, -- Meticulous Scheming
			[499] = 1.71, -- Ricocheting Inflatable Pyrosaw
			[21] = 2.35, -- Elemental Whirl
			[485] = 3.72, -- Laser Matrix
			[89] = 0.09, -- Azerite Veins
			[522] = 7.16, -- Ancients' Bulwark
			[504] = 4.92, -- Unstable Catalyst
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 5600 - 8102 (avg 6370), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[14] = { 10, 3.33 }, -- Condensed Life-Force
			[5] = { 9.18, 3.53 }, -- Essence of the Focusing Iris
			[4] = { 1.6, 1.48 }, -- Worldvein Resonance
			[12] = { 7.33, 3.48 }, -- The Crucible of Flame
			[15] = { 2.31, 0.15 }, -- Ripple in Space
			[22] = { 0.73, 0 }, -- Vision of Perfection
			[28] = { 0.38, 1.52 }, -- The Unbound Force
			[23] = { 3.58, 0.31 }, -- Blood of the Enemy
			[32] = { 2.85, 2.8 }, -- Conflict and Strife
			[27] = { 5.11, 3.86 }, -- Memory of Lucid Dreams
			[6] = { 3.44, 2.91 }, -- Purification Protocol
		}, 1577181600)

		insertDefaultScalesData(defaultName, 8, 2, { -- Fire Mage
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 7100 - 8300 (avg 7632), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[479] = 6.17, -- Dagger in the Back
			[501] = 5.27, -- Relational Normalization Gizmo
			[195] = 4.29, -- Secrets of the Deep
			[480] = 4.25, -- Blood Rite
			[31] = 2.78, -- Gutripper
			[575] = 10, -- Undulating Tides
			[526] = 7.5, -- Endless Hunger
			[522] = 7.48, -- Ancients' Bulwark
			[485] = 5.65, -- Laser Matrix
			[576] = 3.49, -- Loyal to the End
			[482] = 5.04, -- Thunderous Blast
			[461] = 1.41, -- Earthlink
			[500] = 3.52, -- Synaptic Spark Capacitor
			[22] = 2.49, -- Heed My Call
			[505] = 4.85, -- Tradewinds
			[577] = 3.19, -- Arcane Heart
			[561] = 3.73, -- Seductive Power
			[494] = 6.02, -- Battlefield Precision
			[498] = 3.65, -- Barrage Of Many Bombs
			[521] = 4.15, -- Shadow of Elune
			[493] = 2.57, -- Last Gift
			[377] = 5.1, -- Duplicative Incineration
			[462] = 1.62, -- Azerite Globules
			[497] = 1.15, -- Stand As One
			[82] = 6.95, -- Champion of Azeroth
			[378] = 6.31, -- Firemind
			[481] = 4.58, -- Incite the Pack
			[478] = 6.06, -- Tidal Surge
			[128] = 3.35, -- Flames of Alacrity
			[459] = 2.19, -- Unstable Flames
			[168] = 9.58, -- Wildfire
			[560] = 1.55, -- Bonded Souls
			[20] = 2.01, -- Lifespeed
			[193] = 7.73, -- Blightborne Infusion
			[569] = 7.35, -- Clockwork Heart
			[492] = 4.2, -- Liberator's Might
			[196] = 7.19, -- Swirling Sands
			[38] = 1.88, -- On My Way
			[192] = 3.97, -- Meticulous Scheming
			[504] = 4.91, -- Unstable Catalyst
			[562] = 7.21, -- Treacherous Covenant
			[523] = 4.93, -- Apothecary's Concoctions
			[18] = 1.96, -- Blood Siphon
			[157] = 5.82, -- Rezan's Fury
			[21] = 2.14, -- Elemental Whirl
			[495] = 4.24, -- Anduin's Dedication
			[215] = 6.66, -- Blaster Master
			[499] = 2.23, -- Ricocheting Inflatable Pyrosaw
			[496] = 1.33, -- Stronger Together
			[541] = 1.56, -- Fight or Flight
			[156] = 3.68, -- Ruinous Bolt
			[483] = 4.68, -- Archive of the Titans
			[194] = 4.46, -- Filthy Transfusion
			[30] = 4.26, -- Overwhelming Power
			[376] = 4.07, -- Trailing Embers
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 6900 - 7704 (avg 7423), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[14] = { 5.48, 1.84 }, -- Condensed Life-Force
			[12] = { 4.12, 1.96 }, -- The Crucible of Flame
			[32] = { 1.02, 1.16 }, -- Conflict and Strife
			[23] = { 1.49, 0.78 }, -- Blood of the Enemy
			[15] = { 2.3, 0 }, -- Ripple in Space
			[6] = { 3.12, 1.58 }, -- Purification Protocol
			[5] = { 5.23, 1.7 }, -- Essence of the Focusing Iris
			[28] = { 1.6, 0.77 }, -- The Unbound Force
			[4] = { 0.5, 0.53 }, -- Worldvein Resonance
			[27] = { 10, 4.86 }, -- Memory of Lucid Dreams
		}, 1577181600)

		insertDefaultScalesData(defaultName, 8, 3, { -- Frost Mage
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4000 - 4964 (avg 4349), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[38] = 1.58, -- On My Way
			[30] = 3.02, -- Overwhelming Power
			[483] = 4.07, -- Archive of the Titans
			[560] = 1.49, -- Bonded Souls
			[478] = 3.99, -- Tidal Surge
			[381] = 3.57, -- Frigid Grasp
			[493] = 2.12, -- Last Gift
			[22] = 1.67, -- Heed My Call
			[494] = 3.73, -- Battlefield Precision
			[541] = 1.33, -- Fight or Flight
			[461] = 1.25, -- Earthlink
			[499] = 1.61, -- Ricocheting Inflatable Pyrosaw
			[577] = 1.04, -- Arcane Heart
			[561] = 3.24, -- Seductive Power
			[170] = 10, -- Flash Freeze
			[575] = 6.29, -- Undulating Tides
			[492] = 3.79, -- Liberator's Might
			[194] = 3.58, -- Filthy Transfusion
			[380] = 3.71, -- Whiteout
			[504] = 4.54, -- Unstable Catalyst
			[31] = 1.64, -- Gutripper
			[43] = 0.01, -- Winds of War
			[156] = 2.25, -- Ruinous Bolt
			[480] = 3.53, -- Blood Rite
			[521] = 3.4, -- Shadow of Elune
			[498] = 2.51, -- Barrage Of Many Bombs
			[195] = 3.59, -- Secrets of the Deep
			[192] = 3.28, -- Meticulous Scheming
			[576] = 2.56, -- Loyal to the End
			[505] = 3.84, -- Tradewinds
			[495] = 3.88, -- Anduin's Dedication
			[501] = 4.41, -- Relational Normalization Gizmo
			[502] = 0.09, -- Personal Absorb-o-Tron
			[463] = 0.05, -- Blessed Portents
			[19] = 0.01, -- Woundbinder
			[157] = 3.99, -- Rezan's Fury
			[459] = 2.39, -- Unstable Flames
			[132] = 3.53, -- Packed Ice
			[496] = 1.3, -- Stronger Together
			[497] = 0.91, -- Stand As One
			[225] = 3.73, -- Glacial Assault
			[21] = 1.88, -- Elemental Whirl
			[481] = 3.61, -- Incite the Pack
			[479] = 4.13, -- Dagger in the Back
			[82] = 5.34, -- Champion of Azeroth
			[485] = 3.36, -- Laser Matrix
			[18] = 1.35, -- Blood Siphon
			[562] = 5.74, -- Treacherous Covenant
			[379] = 4.03, -- Tunnel of Ice
			[523] = 3.19, -- Apothecary's Concoctions
			[193] = 5.52, -- Blightborne Infusion
			[83] = 0.2, -- Impassive Visage
			[526] = 5.91, -- Endless Hunger
			[20] = 1.38, -- Lifespeed
			[569] = 4.65, -- Clockwork Heart
			[500] = 2.08, -- Synaptic Spark Capacitor
			[462] = 1.11, -- Azerite Globules
			[522] = 5.84, -- Ancients' Bulwark
			[482] = 3.28, -- Thunderous Blast
			[196] = 5.63, -- Swirling Sands
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4000 - 4509 (avg 4302), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[23] = { 4.67, 1.23 }, -- Blood of the Enemy
			[15] = { 3.74, 0 }, -- Ripple in Space
			[22] = { 4.02, 0.72 }, -- Vision of Perfection
			[32] = { 2.98, 2.85 }, -- Conflict and Strife
			[27] = { 5.67, 3.8 }, -- Memory of Lucid Dreams
			[5] = { 8.01, 4.28 }, -- Essence of the Focusing Iris
			[14] = { 10, 3.37 }, -- Condensed Life-Force
			[4] = { 0.15, 1.4 }, -- Worldvein Resonance
			[12] = { 6.03, 3.76 }, -- The Crucible of Flame
			[6] = { 4.88, 2.97 }, -- Purification Protocol
			[28] = { 3.14, 1.99 }, -- The Unbound Force
		}, 1577181600)

		insertDefaultScalesData(offensiveName, 10, 1, { -- Brewmaster Monk
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2702 - 3600 (avg 2968), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[495] = 2.7, -- Anduin's Dedication
			[497] = 0.65, -- Stand As One
			[99] = 0.02, -- Ablative Shielding
			[194] = 4.92, -- Filthy Transfusion
			[503] = 0.08, -- Auto-Self-Cauterizer
			[492] = 2.7, -- Liberator's Might
			[568] = 3.47, -- Person-Computer Interface
			[566] = 0.04, -- Exit Strategy
			[526] = 4.85, -- Endless Hunger
			[22] = 2.6, -- Heed My Call
			[480] = 2.09, -- Blood Rite
			[561] = 2.41, -- Seductive Power
			[192] = 2.9, -- Meticulous Scheming
			[479] = 4.75, -- Dagger in the Back
			[196] = 4.6, -- Swirling Sands
			[494] = 6.5, -- Battlefield Precision
			[562] = 4, -- Treacherous Covenant
			[31] = 3.09, -- Gutripper
			[463] = 0.05, -- Blessed Portents
			[15] = 0.05, -- Resounding Protection
			[98] = 0.1, -- Crystalline Carapace
			[483] = 2.85, -- Archive of the Titans
			[569] = 3.56, -- Clockwork Heart
			[100] = 0.08, -- Strength in Numbers
			[86] = 0.12, -- Azerite Fortification
			[103] = 0.06, -- Concentrated Mending
			[21] = 1.32, -- Elemental Whirl
			[30] = 1.84, -- Overwhelming Power
			[504] = 2.98, -- Unstable Catalyst
			[14] = 0.01, -- Longstrider
			[193] = 5.17, -- Blightborne Infusion
			[461] = 0.98, -- Earthlink
			[541] = 0.98, -- Fight or Flight
			[384] = 3, -- Elusive Footwork
			[104] = 0.05, -- Bracing Chill
			[116] = 1.71, -- Boiling Brew
			[38] = 1.45, -- On My Way
			[496] = 1.05, -- Stronger Together
			[522] = 4.54, -- Ancients' Bulwark
			[383] = 4.36, -- Training of Niuzao
			[157] = 6.33, -- Rezan's Fury
			[482] = 5.21, -- Thunderous Blast
			[575] = 10, -- Undulating Tides
			[42] = 0.02, -- Savior
			[20] = 1, -- Lifespeed
			[493] = 1.59, -- Last Gift
			[485] = 5.48, -- Laser Matrix
			[478] = 6.51, -- Tidal Surge
			[481] = 2.44, -- Incite the Pack
			[459] = 1.79, -- Unstable Flames
			[505] = 2.74, -- Tradewinds
			[84] = 0.08, -- Bulwark of the Masses
			[470] = 0.04, -- Sweep the Leg
			[576] = 1.87, -- Loyal to the End
			[382] = 0.16, -- Straight, No Chaser
			[523] = 5.19, -- Apothecary's Concoctions
			[195] = 2.72, -- Secrets of the Deep
			[560] = 0.84, -- Bonded Souls
			[156] = 3.89, -- Ruinous Bolt
			[500] = 3.38, -- Synaptic Spark Capacitor
			[521] = 2.26, -- Shadow of Elune
			[238] = 0.14, -- Fit to Burst
			[577] = 1.16, -- Arcane Heart
			[501] = 3.06, -- Relational Normalization Gizmo
			[462] = 1.78, -- Azerite Globules
			[18] = 1.08, -- Blood Siphon
			[82] = 4.1, -- Champion of Azeroth
			[499] = 2.33, -- Ricocheting Inflatable Pyrosaw
			[498] = 3.97, -- Barrage Of Many Bombs
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2702 - 3005 (avg 2928), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[7] = { 1.91, 0 }, -- Anima of Life and Death
			[4] = { 0.96, 0.52 }, -- Worldvein Resonance
			[27] = { 0.24, 0.36 }, -- Memory of Lucid Dreams
			[2] = { 0.03, 0 }, -- Azeroth's Undying Gift
			[32] = { 1.35, 1.34 }, -- Conflict and Strife
			[3] = { 2.02, 2.07 }, -- Sphere of Suppression
			[25] = { 0.69, 0.69 }, -- Aegis of the Deep
			[15] = { 3.64, 0 }, -- Ripple in Space
			[12] = { 10, 3.52 }, -- The Crucible of Flame
		}, 1577181600)

		insertDefaultScalesData(defaultName, 10, 3, { -- Windwalker Monk
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4702 - 5400 (avg 5003), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[84] = 0.21, -- Bulwark of the Masses
			[485] = 4.99, -- Laser Matrix
			[492] = 3.55, -- Liberator's Might
			[194] = 4.81, -- Filthy Transfusion
			[495] = 3.92, -- Anduin's Dedication
			[494] = 5.75, -- Battlefield Precision
			[498] = 3.73, -- Barrage Of Many Bombs
			[575] = 9.28, -- Undulating Tides
			[43] = 0.06, -- Winds of War
			[562] = 6.57, -- Treacherous Covenant
			[480] = 3.76, -- Blood Rite
			[459] = 2.15, -- Unstable Flames
			[503] = 0.11, -- Auto-Self-Cauterizer
			[391] = 6.27, -- Dance of Chi-Ji
			[497] = 1.1, -- Stand As One
			[569] = 4.97, -- Clockwork Heart
			[462] = 1.66, -- Azerite Globules
			[479] = 6.21, -- Dagger in the Back
			[20] = 1.39, -- Lifespeed
			[560] = 1.47, -- Bonded Souls
			[156] = 3.66, -- Ruinous Bolt
			[19] = 0.09, -- Woundbinder
			[184] = 5.15, -- Sunrise Technique
			[504] = 4.72, -- Unstable Catalyst
			[195] = 4.32, -- Secrets of the Deep
			[541] = 1.23, -- Fight or Flight
			[82] = 6.02, -- Champion of Azeroth
			[501] = 4.83, -- Relational Normalization Gizmo
			[478] = 5.83, -- Tidal Surge
			[482] = 4.84, -- Thunderous Blast
			[521] = 3.63, -- Shadow of Elune
			[577] = 1.87, -- Arcane Heart
			[483] = 4.62, -- Archive of the Titans
			[117] = 10, -- Fury of Xuen
			[21] = 1.95, -- Elemental Whirl
			[505] = 4.25, -- Tradewinds
			[85] = 0.07, -- Gemhide
			[576] = 2.96, -- Loyal to the End
			[388] = 5.86, -- Glory of the Dawn
			[526] = 7.53, -- Endless Hunger
			[500] = 3.33, -- Synaptic Spark Capacitor
			[390] = 6.18, -- Pressure Point
			[389] = 7.73, -- Open Palm Strikes
			[523] = 5.06, -- Apothecary's Concoctions
			[493] = 2.25, -- Last Gift
			[42] = 0.02, -- Savior
			[193] = 6.54, -- Blightborne Infusion
			[499] = 1.99, -- Ricocheting Inflatable Pyrosaw
			[461] = 1.49, -- Earthlink
			[522] = 7.35, -- Ancients' Bulwark
			[30] = 3.36, -- Overwhelming Power
			[18] = 1.34, -- Blood Siphon
			[38] = 1.91, -- On My Way
			[22] = 2.55, -- Heed My Call
			[470] = 0.05, -- Sweep the Leg
			[481] = 3.73, -- Incite the Pack
			[196] = 6.11, -- Swirling Sands
			[31] = 2.92, -- Gutripper
			[157] = 5.95, -- Rezan's Fury
			[561] = 3.75, -- Seductive Power
			[192] = 3.87, -- Meticulous Scheming
			[496] = 1.35, -- Stronger Together
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4303 - 5700 (avg 5028), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[27] = { 0.47, 0 }, -- Memory of Lucid Dreams
			[4] = { 0.96, 0.57 }, -- Worldvein Resonance
			[12] = { 5.55, 2.03 }, -- The Crucible of Flame
			[15] = { 2.63, 0 }, -- Ripple in Space
			[22] = { 0.59, 0.54 }, -- Vision of Perfection
			[23] = { 3.14, 0.27 }, -- Blood of the Enemy
			[5] = { 6.18, 1.82 }, -- Essence of the Focusing Iris
			[6] = { 4.01, 1.62 }, -- Purification Protocol
			[14] = { 5.39, 1.84 }, -- Condensed Life-Force
			[28] = { 1.99, 0.68 }, -- The Unbound Force
			[32] = { 10, 1.27 }, -- Conflict and Strife
		}, 1577181600)

		insertDefaultScalesData(offensiveName, 2, 2, { -- Protection Paladin
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4904 - 6001 (avg 5400), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[562] = 5.7, -- Treacherous Covenant
			[18] = 1.1, -- Blood Siphon
			[20] = 1.68, -- Lifespeed
			[505] = 3.36, -- Tradewinds
			[493] = 1.84, -- Last Gift
			[125] = 3.19, -- Avenger's Might
			[235] = 3.44, -- Indomitable Justice
			[492] = 3.77, -- Liberator's Might
			[454] = 0.01, -- Judicious Defense
			[98] = 0.13, -- Crystalline Carapace
			[478] = 6.22, -- Tidal Surge
			[38] = 1.78, -- On My Way
			[85] = 0.15, -- Gemhide
			[568] = 0.1, -- Person-Computer Interface
			[193] = 6.4, -- Blightborne Infusion
			[462] = 1.72, -- Azerite Globules
			[30] = 3.33, -- Overwhelming Power
			[523] = 5.17, -- Apothecary's Concoctions
			[19] = 0.01, -- Woundbinder
			[485] = 5.64, -- Laser Matrix
			[82] = 5.45, -- Champion of Azeroth
			[522] = 5.89, -- Ancients' Bulwark
			[575] = 10, -- Undulating Tides
			[481] = 3.23, -- Incite the Pack
			[14] = 0.02, -- Longstrider
			[526] = 6.13, -- Endless Hunger
			[395] = 8.88, -- Inspiring Vanguard
			[101] = 0.14, -- Shimmering Haven
			[22] = 2.87, -- Heed My Call
			[479] = 4.54, -- Dagger in the Back
			[521] = 3.76, -- Shadow of Elune
			[496] = 1.28, -- Stronger Together
			[504] = 4.1, -- Unstable Catalyst
			[561] = 3.13, -- Seductive Power
			[196] = 5.78, -- Swirling Sands
			[234] = 1.62, -- Inner Light
			[541] = 1.35, -- Fight or Flight
			[482] = 5.12, -- Thunderous Blast
			[498] = 4.17, -- Barrage Of Many Bombs
			[156] = 3.62, -- Ruinous Bolt
			[577] = 1.7, -- Arcane Heart
			[459] = 2.15, -- Unstable Flames
			[461] = 0.99, -- Earthlink
			[500] = 3.34, -- Synaptic Spark Capacitor
			[44] = 0.04, -- Vampiric Speed
			[21] = 1.86, -- Elemental Whirl
			[480] = 3.6, -- Blood Rite
			[495] = 3.49, -- Anduin's Dedication
			[576] = 2.29, -- Loyal to the End
			[157] = 6.32, -- Rezan's Fury
			[483] = 4.04, -- Archive of the Titans
			[497] = 0.87, -- Stand As One
			[192] = 4.81, -- Meticulous Scheming
			[538] = 0.04, -- Empyreal Ward
			[194] = 5.04, -- Filthy Transfusion
			[31] = 3.07, -- Gutripper
			[560] = 1.69, -- Bonded Souls
			[195] = 3.67, -- Secrets of the Deep
			[499] = 2.29, -- Ricocheting Inflatable Pyrosaw
			[150] = 1.62, -- Soaring Shield
			[42] = 0.06, -- Savior
			[569] = 4.18, -- Clockwork Heart
			[494] = 6.27, -- Battlefield Precision
			[501] = 4.55, -- Relational Normalization Gizmo
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4702 - 6003 (avg 5350), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[32] = { 2.02, 1.97 }, -- Conflict and Strife
			[25] = { 0.88, 0.81 }, -- Aegis of the Deep
			[3] = { 4.05, 4.15 }, -- Sphere of Suppression
			[7] = { 2.07, 0.03 }, -- Anima of Life and Death
			[4] = { 1.19, 0.83 }, -- Worldvein Resonance
			[22] = { 2.97, 1 }, -- Vision of Perfection
			[12] = { 10, 3.84 }, -- The Crucible of Flame
			[27] = { 0.86, 0.66 }, -- Memory of Lucid Dreams
			[15] = { 2.71, 0.04 }, -- Ripple in Space
		}, 1577181600)

		insertDefaultScalesData(defaultName, 2, 3, { -- Retribution Paladin
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3903 - 4703 (avg 4240), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[523] = 3.43, -- Apothecary's Concoctions
			[14] = 0.02, -- Longstrider
			[125] = 4.21, -- Avenger's Might
			[462] = 1.15, -- Azerite Globules
			[504] = 3.4, -- Unstable Catalyst
			[396] = 10, -- Light's Decree
			[156] = 2.53, -- Ruinous Bolt
			[21] = 1.7, -- Elemental Whirl
			[481] = 3.28, -- Incite the Pack
			[83] = 0.15, -- Impassive Visage
			[485] = 3.69, -- Laser Matrix
			[206] = 0.1, -- Stalwart Protector
			[157] = 4.05, -- Rezan's Fury
			[482] = 3.54, -- Thunderous Blast
			[31] = 2, -- Gutripper
			[22] = 1.87, -- Heed My Call
			[196] = 4.15, -- Swirling Sands
			[187] = 5.35, -- Expurgation
			[30] = 3.06, -- Overwhelming Power
			[193] = 4.95, -- Blightborne Infusion
			[561] = 2.76, -- Seductive Power
			[86] = 0.08, -- Azerite Fortification
			[99] = 0.1, -- Ablative Shielding
			[480] = 3.18, -- Blood Rite
			[495] = 3.17, -- Anduin's Dedication
			[20] = 1.74, -- Lifespeed
			[471] = 0.04, -- Gallant Steed
			[492] = 3.08, -- Liberator's Might
			[235] = 3.42, -- Indomitable Justice
			[568] = 0.09, -- Person-Computer Interface
			[154] = 5.53, -- Relentless Inquisitor
			[494] = 3.83, -- Battlefield Precision
			[82] = 5.26, -- Champion of Azeroth
			[522] = 5.22, -- Ancients' Bulwark
			[496] = 1.12, -- Stronger Together
			[194] = 3.5, -- Filthy Transfusion
			[38] = 1.47, -- On My Way
			[483] = 3.6, -- Archive of the Titans
			[503] = 0.01, -- Auto-Self-Cauterizer
			[18] = 1.33, -- Blood Siphon
			[521] = 3.19, -- Shadow of Elune
			[459] = 1.96, -- Unstable Flames
			[479] = 4.32, -- Dagger in the Back
			[505] = 3.7, -- Tradewinds
			[569] = 3.81, -- Clockwork Heart
			[461] = 1.1, -- Earthlink
			[562] = 4.96, -- Treacherous Covenant
			[560] = 1.72, -- Bonded Souls
			[577] = 1.67, -- Arcane Heart
			[453] = 5.11, -- Empyrean Power
			[541] = 1.29, -- Fight or Flight
			[499] = 1.48, -- Ricocheting Inflatable Pyrosaw
			[500] = 2.21, -- Synaptic Spark Capacitor
			[575] = 6.43, -- Undulating Tides
			[498] = 2.67, -- Barrage Of Many Bombs
			[497] = 0.93, -- Stand As One
			[526] = 5.13, -- Endless Hunger
			[105] = 0.05, -- Ephemeral Recovery
			[195] = 3.19, -- Secrets of the Deep
			[89] = 0.03, -- Azerite Veins
			[192] = 4.25, -- Meticulous Scheming
			[493] = 1.98, -- Last Gift
			[478] = 4.07, -- Tidal Surge
			[501] = 3.83, -- Relational Normalization Gizmo
			[576] = 2.27, -- Loyal to the End
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3700 - 4703 (avg 4146), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[5] = { 10, 3.94 }, -- Essence of the Focusing Iris
			[6] = { 6.02, 2.85 }, -- Purification Protocol
			[4] = { 1.37, 1.21 }, -- Worldvein Resonance
			[15] = { 0, 0.06 }, -- Ripple in Space
			[22] = { 9.8, 3.32 }, -- Vision of Perfection
			[27] = { 5.02, 3.48 }, -- Memory of Lucid Dreams
			[14] = { 8.73, 3.14 }, -- Condensed Life-Force
			[23] = { 4.1, 0.46 }, -- Blood of the Enemy
			[32] = { 2.52, 2.33 }, -- Conflict and Strife
			[12] = { 8.76, 3.5 }, -- The Crucible of Flame
			[28] = { 3.02, 1.39 }, -- The Unbound Force
		}, 1577181600)

		insertDefaultScalesData(defaultName, 4, 1, { -- Assassination Rogue
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3202 - 4101 (avg 3455), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[136] = 8.33, -- Double Dose
			[504] = 6, -- Unstable Catalyst
			[497] = 1.05, -- Stand As One
			[499] = 2.21, -- Ricocheting Inflatable Pyrosaw
			[496] = 1.89, -- Stronger Together
			[18] = 2.16, -- Blood Siphon
			[196] = 8, -- Swirling Sands
			[493] = 3.07, -- Last Gift
			[459] = 2.86, -- Unstable Flames
			[561] = 4.25, -- Seductive Power
			[481] = 5.44, -- Incite the Pack
			[87] = 0.09, -- Self Reliance
			[42] = 0.07, -- Savior
			[501] = 6.44, -- Relational Normalization Gizmo
			[541] = 1.32, -- Fight or Flight
			[495] = 5.06, -- Anduin's Dedication
			[500] = 3.33, -- Synaptic Spark Capacitor
			[181] = 6.22, -- Twist the Knife
			[22] = 2.55, -- Heed My Call
			[483] = 5.77, -- Archive of the Titans
			[485] = 5.33, -- Laser Matrix
			[494] = 6.01, -- Battlefield Precision
			[157] = 6.19, -- Rezan's Fury
			[195] = 5.12, -- Secrets of the Deep
			[15] = 0.01, -- Resounding Protection
			[406] = 3.72, -- Scent of Blood
			[462] = 1.52, -- Azerite Globules
			[526] = 8.14, -- Endless Hunger
			[30] = 4.53, -- Overwhelming Power
			[479] = 6.07, -- Dagger in the Back
			[249] = 10, -- Nothing Personal
			[461] = 1.61, -- Earthlink
			[20] = 2.17, -- Lifespeed
			[193] = 8.92, -- Blightborne Infusion
			[523] = 4.78, -- Apothecary's Concoctions
			[560] = 2.45, -- Bonded Souls
			[38] = 2.41, -- On My Way
			[498] = 4.05, -- Barrage Of Many Bombs
			[482] = 5.03, -- Thunderous Blast
			[21] = 2.45, -- Elemental Whirl
			[473] = 0.02, -- Shrouded Mantle
			[194] = 4.99, -- Filthy Transfusion
			[98] = 0.05, -- Crystalline Carapace
			[156] = 3.63, -- Ruinous Bolt
			[576] = 3.85, -- Loyal to the End
			[577] = 3.55, -- Arcane Heart
			[502] = 0.08, -- Personal Absorb-o-Tron
			[192] = 4.43, -- Meticulous Scheming
			[521] = 5.01, -- Shadow of Elune
			[562] = 7.96, -- Treacherous Covenant
			[478] = 5.93, -- Tidal Surge
			[569] = 5.75, -- Clockwork Heart
			[505] = 5.52, -- Tradewinds
			[575] = 9.81, -- Undulating Tides
			[31] = 2.98, -- Gutripper
			[82] = 7.56, -- Champion of Azeroth
			[480] = 5.07, -- Blood Rite
			[522] = 7.92, -- Ancients' Bulwark
			[492] = 5.15, -- Liberator's Might
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2813 - 3835 (avg 3360), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[27] = { 10, 3.96 }, -- Memory of Lucid Dreams
			[6] = { 4.44, 1.79 }, -- Purification Protocol
			[5] = { 7.55, 2.74 }, -- Essence of the Focusing Iris
			[23] = { 6.11, 1.03 }, -- Blood of the Enemy
			[4] = { 1.35, 0.8 }, -- Worldvein Resonance
			[14] = { 6.3, 2.17 }, -- Condensed Life-Force
			[12] = { 6.73, 2.24 }, -- The Crucible of Flame
			[15] = { 3.49, 0 }, -- Ripple in Space
			[22] = { 1.55, 0 }, -- Vision of Perfection
			[32] = { 1.69, 1.55 }, -- Conflict and Strife
			[28] = { 3.51, 1.7 }, -- The Unbound Force
		}, 1577181600)

		insertDefaultScalesData(defaultName, 4, 2, { -- Outlaw Rogue
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 8902 - 11901 (avg 9980), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[561] = 3.88, -- Seductive Power
			[42] = 0.03, -- Savior
			[541] = 1.61, -- Fight or Flight
			[461] = 1.8, -- Earthlink
			[485] = 5.41, -- Laser Matrix
			[100] = 0.22, -- Strength in Numbers
			[38] = 1.97, -- On My Way
			[239] = 4.04, -- Snake Eyes
			[411] = 7.71, -- Ace Up Your Sleeve
			[99] = 0.13, -- Ablative Shielding
			[496] = 1.44, -- Stronger Together
			[500] = 3.23, -- Synaptic Spark Capacitor
			[21] = 2.28, -- Elemental Whirl
			[459] = 2.38, -- Unstable Flames
			[482] = 5.13, -- Thunderous Blast
			[157] = 6.34, -- Rezan's Fury
			[98] = 0.01, -- Crystalline Carapace
			[499] = 2.47, -- Ricocheting Inflatable Pyrosaw
			[575] = 10, -- Undulating Tides
			[494] = 6.28, -- Battlefield Precision
			[497] = 1.03, -- Stand As One
			[86] = 0.13, -- Azerite Fortification
			[495] = 4.22, -- Anduin's Dedication
			[82] = 6.47, -- Champion of Azeroth
			[481] = 3.43, -- Incite the Pack
			[83] = 0.07, -- Impassive Visage
			[483] = 5.1, -- Archive of the Titans
			[576] = 2.39, -- Loyal to the End
			[480] = 4.59, -- Blood Rite
			[548] = 0.19, -- Lying In Wait
			[522] = 7.11, -- Ancients' Bulwark
			[129] = 6.36, -- Deadshot
			[194] = 4.83, -- Filthy Transfusion
			[15] = 0.31, -- Resounding Protection
			[196] = 6, -- Swirling Sands
			[501] = 5.5, -- Relational Normalization Gizmo
			[446] = 7.74, -- Brigand's Blitz
			[493] = 2.01, -- Last Gift
			[30] = 4.3, -- Overwhelming Power
			[503] = 0.16, -- Auto-Self-Cauterizer
			[523] = 5.2, -- Apothecary's Concoctions
			[18] = 1.52, -- Blood Siphon
			[569] = 5.33, -- Clockwork Heart
			[180] = 4.21, -- Keep Your Wits About You
			[479] = 6.57, -- Dagger in the Back
			[577] = 2.19, -- Arcane Heart
			[87] = 0.15, -- Self Reliance
			[526] = 6.9, -- Endless Hunger
			[195] = 4.36, -- Secrets of the Deep
			[410] = 3.74, -- Paradise Lost
			[521] = 4.66, -- Shadow of Elune
			[31] = 2.91, -- Gutripper
			[19] = 0.11, -- Woundbinder
			[568] = 0.08, -- Person-Computer Interface
			[462] = 1.81, -- Azerite Globules
			[505] = 3.45, -- Tradewinds
			[562] = 6.95, -- Treacherous Covenant
			[192] = 5.55, -- Meticulous Scheming
			[156] = 3.67, -- Ruinous Bolt
			[504] = 4.8, -- Unstable Catalyst
			[498] = 3.99, -- Barrage Of Many Bombs
			[478] = 6.01, -- Tidal Surge
			[13] = 0.06, -- Azerite Empowered
			[492] = 4.52, -- Liberator's Might
			[560] = 2.32, -- Bonded Souls
			[20] = 2.25, -- Lifespeed
			[85] = 0.14, -- Gemhide
			[101] = 0.01, -- Shimmering Haven
			[193] = 6.55, -- Blightborne Infusion
			[22] = 2.84, -- Heed My Call
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 8300 - 10303 (avg 9553), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[22] = { 5.84, 2.63 }, -- Vision of Perfection
			[4] = { 1.58, 1.19 }, -- Worldvein Resonance
			[23] = { 3.5, 0.9 }, -- Blood of the Enemy
			[28] = { 3.23, 1.19 }, -- The Unbound Force
			[12] = { 10, 3.66 }, -- The Crucible of Flame
			[27] = { 8.49, 6.54 }, -- Memory of Lucid Dreams
			[5] = { 9.4, 3.76 }, -- Essence of the Focusing Iris
			[6] = { 6.86, 2.92 }, -- Purification Protocol
			[14] = { 9.41, 3.51 }, -- Condensed Life-Force
			[15] = { 4.26, 0 }, -- Ripple in Space
			[32] = { 2.5, 2.34 }, -- Conflict and Strife
		}, 1577181600)

		insertDefaultScalesData(defaultName, 4, 3, { -- Subtlety Rogue
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 5200 - 6003 (avg 5563), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[493] = 1.01, -- Last Gift
			[478] = 2.9, -- Tidal Surge
			[194] = 2.41, -- Filthy Transfusion
			[483] = 2.57, -- Archive of the Titans
			[492] = 2.34, -- Liberator's Might
			[494] = 2.86, -- Battlefield Precision
			[30] = 2.09, -- Overwhelming Power
			[485] = 2.5, -- Laser Matrix
			[462] = 0.74, -- Azerite Globules
			[561] = 1.75, -- Seductive Power
			[31] = 1.34, -- Gutripper
			[496] = 0.63, -- Stronger Together
			[82] = 3.14, -- Champion of Azeroth
			[38] = 0.96, -- On My Way
			[445] = 1.67, -- Perforate
			[499] = 0.92, -- Ricocheting Inflatable Pyrosaw
			[482] = 2.3, -- Thunderous Blast
			[481] = 1.77, -- Incite the Pack
			[562] = 3.49, -- Treacherous Covenant
			[22] = 1.14, -- Heed My Call
			[18] = 0.67, -- Blood Siphon
			[240] = 3.77, -- Blade In The Shadows
			[196] = 3.33, -- Swirling Sands
			[20] = 1.06, -- Lifespeed
			[156] = 1.91, -- Ruinous Bolt
			[193] = 3.54, -- Blightborne Infusion
			[576] = 1.28, -- Loyal to the End
			[495] = 2.14, -- Anduin's Dedication
			[413] = 10, -- The First Dance
			[569] = 3.36, -- Clockwork Heart
			[479] = 3.1, -- Dagger in the Back
			[480] = 2.46, -- Blood Rite
			[577] = 0.64, -- Arcane Heart
			[521] = 2.56, -- Shadow of Elune
			[459] = 1.24, -- Unstable Flames
			[195] = 2.27, -- Secrets of the Deep
			[192] = 2.41, -- Meticulous Scheming
			[461] = 0.76, -- Earthlink
			[541] = 0.65, -- Fight or Flight
			[523] = 2.28, -- Apothecary's Concoctions
			[526] = 3.52, -- Endless Hunger
			[522] = 3.57, -- Ancients' Bulwark
			[414] = 3.52, -- Inevitability
			[124] = 1.25, -- Replicating Shadows
			[505] = 1.94, -- Tradewinds
			[497] = 0.59, -- Stand As One
			[500] = 1.58, -- Synaptic Spark Capacitor
			[21] = 1.04, -- Elemental Whirl
			[504] = 2.59, -- Unstable Catalyst
			[157] = 2.96, -- Rezan's Fury
			[175] = 3.73, -- Night's Vengeance
			[560] = 0.88, -- Bonded Souls
			[575] = 4.45, -- Undulating Tides
			[498] = 1.75, -- Barrage Of Many Bombs
			[501] = 2.9, -- Relational Normalization Gizmo
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4902 - 5901 (avg 5427), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[12] = { 7.73, 2.55 }, -- The Crucible of Flame
			[22] = { 3.48, 0.79 }, -- Vision of Perfection
			[4] = { 1.82, 0.84 }, -- Worldvein Resonance
			[15] = { 4.11, 0 }, -- Ripple in Space
			[14] = { 6.44, 2.26 }, -- Condensed Life-Force
			[28] = { 3.44, 1.28 }, -- The Unbound Force
			[23] = { 4.8, 0.36 }, -- Blood of the Enemy
			[6] = { 5.35, 1.86 }, -- Purification Protocol
			[27] = { 10, 6.53 }, -- Memory of Lucid Dreams
			[32] = { 1.71, 1.79 }, -- Conflict and Strife
			[5] = { 8.26, 3.3 }, -- Essence of the Focusing Iris
		}, 1577181600)

		insertDefaultScalesData(defaultName, 7, 1, { -- Elemental Shaman
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3401 - 4503 (avg 3747), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[196] = 5.7, -- Swirling Sands
			[207] = 0.03, -- Serene Spirit
			[457] = 10, -- Igneous Potential
			[461] = 1.29, -- Earthlink
			[526] = 5.25, -- Endless Hunger
			[474] = 0.15, -- Pack Spirit
			[417] = 0.04, -- Tectonic Thunder
			[494] = 3.94, -- Battlefield Precision
			[485] = 3.39, -- Laser Matrix
			[479] = 4.33, -- Dagger in the Back
			[30] = 2.72, -- Overwhelming Power
			[492] = 3.67, -- Liberator's Might
			[82] = 4.93, -- Champion of Azeroth
			[577] = 1.77, -- Arcane Heart
			[575] = 6.59, -- Undulating Tides
			[19] = 0.03, -- Woundbinder
			[459] = 2.12, -- Unstable Flames
			[192] = 3.86, -- Meticulous Scheming
			[501] = 4.09, -- Relational Normalization Gizmo
			[31] = 2.12, -- Gutripper
			[18] = 0.77, -- Blood Siphon
			[568] = 0.05, -- Person-Computer Interface
			[101] = 0.07, -- Shimmering Haven
			[103] = 0.07, -- Concentrated Mending
			[98] = 0.03, -- Crystalline Carapace
			[481] = 2.17, -- Incite the Pack
			[498] = 2.62, -- Barrage Of Many Bombs
			[85] = 0.01, -- Gemhide
			[500] = 2.36, -- Synaptic Spark Capacitor
			[478] = 4.12, -- Tidal Surge
			[496] = 1.07, -- Stronger Together
			[495] = 3.56, -- Anduin's Dedication
			[561] = 3.07, -- Seductive Power
			[539] = 0.16, -- Ancient Ankh Talisman
			[104] = 0.11, -- Bracing Chill
			[448] = 3.22, -- Synapse Shock
			[482] = 3.57, -- Thunderous Blast
			[157] = 4.1, -- Rezan's Fury
			[193] = 6.39, -- Blightborne Infusion
			[86] = 0.06, -- Azerite Fortification
			[178] = 3.51, -- Lava Shock
			[195] = 3.79, -- Secrets of the Deep
			[462] = 1.32, -- Azerite Globules
			[84] = 0.06, -- Bulwark of the Masses
			[497] = 1.16, -- Stand As One
			[562] = 5.8, -- Treacherous Covenant
			[222] = 2.7, -- Echo of the Elementals
			[194] = 3.56, -- Filthy Transfusion
			[521] = 3.12, -- Shadow of Elune
			[447] = 3.71, -- Ancestral Resonance
			[105] = 0.11, -- Ephemeral Recovery
			[38] = 1.51, -- On My Way
			[483] = 4.05, -- Archive of the Titans
			[156] = 2.52, -- Ruinous Bolt
			[522] = 5.25, -- Ancients' Bulwark
			[499] = 1.52, -- Ricocheting Inflatable Pyrosaw
			[493] = 1.26, -- Last Gift
			[504] = 4.17, -- Unstable Catalyst
			[560] = 1.74, -- Bonded Souls
			[541] = 1.24, -- Fight or Flight
			[480] = 3.29, -- Blood Rite
			[523] = 3.34, -- Apothecary's Concoctions
			[15] = 0.01, -- Resounding Protection
			[503] = 0.15, -- Auto-Self-Cauterizer
			[576] = 1.7, -- Loyal to the End
			[505] = 2.08, -- Tradewinds
			[22] = 1.78, -- Heed My Call
			[42] = 0.19, -- Savior
			[20] = 1.85, -- Lifespeed
			[21] = 1.64, -- Elemental Whirl
			[416] = 6.13, -- Natural Harmony
			[569] = 4.16, -- Clockwork Heart
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3100 - 3904 (avg 3648), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[28] = { 2.61, 2.46 }, -- The Unbound Force
			[4] = { 0.43, 1.21 }, -- Worldvein Resonance
			[5] = { 7.14, 3.13 }, -- Essence of the Focusing Iris
			[15] = { 2.89, 0 }, -- Ripple in Space
			[22] = { 2.45, 0.12 }, -- Vision of Perfection
			[12] = { 5.72, 3.01 }, -- The Crucible of Flame
			[23] = { 5.23, 0.95 }, -- Blood of the Enemy
			[27] = { 1.4, 0.98 }, -- Memory of Lucid Dreams
			[32] = { 10, 2.05 }, -- Conflict and Strife
			[6] = { 4.39, 2.22 }, -- Purification Protocol
			[14] = { 6.85, 2.7 }, -- Condensed Life-Force
		}, 1577181600)

		insertDefaultScalesData(defaultName, 7, 2, { -- Enhancement Shaman
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 7101 - 9402 (avg 8471), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[526] = 4.94, -- Endless Hunger
			[474] = 0.11, -- Pack Spirit
			[42] = 0.03, -- Savior
			[31] = 1.91, -- Gutripper
			[492] = 2.95, -- Liberator's Might
			[530] = 5.47, -- Thunderaan's Fury
			[448] = 0.02, -- Synapse Shock
			[561] = 2.85, -- Seductive Power
			[480] = 3.29, -- Blood Rite
			[223] = 2.09, -- Lightning Conduit
			[462] = 1.16, -- Azerite Globules
			[575] = 6.1, -- Undulating Tides
			[30] = 2.94, -- Overwhelming Power
			[19] = 0.06, -- Woundbinder
			[523] = 3.2, -- Apothecary's Concoctions
			[18] = 1.34, -- Blood Siphon
			[505] = 3.51, -- Tradewinds
			[22] = 1.69, -- Heed My Call
			[461] = 1.12, -- Earthlink
			[38] = 1.54, -- On My Way
			[137] = 2.81, -- Primal Primer
			[499] = 1.39, -- Ricocheting Inflatable Pyrosaw
			[521] = 3.29, -- Shadow of Elune
			[496] = 1.22, -- Stronger Together
			[539] = 0.08, -- Ancient Ankh Talisman
			[493] = 1.91, -- Last Gift
			[576] = 2.43, -- Loyal to the End
			[44] = 0.01, -- Vampiric Speed
			[504] = 3.51, -- Unstable Catalyst
			[485] = 3.44, -- Laser Matrix
			[459] = 1.85, -- Unstable Flames
			[562] = 5.06, -- Treacherous Covenant
			[500] = 2.01, -- Synaptic Spark Capacitor
			[498] = 2.6, -- Barrage Of Many Bombs
			[568] = 0.02, -- Person-Computer Interface
			[495] = 3, -- Anduin's Dedication
			[494] = 3.84, -- Battlefield Precision
			[481] = 3.11, -- Incite the Pack
			[179] = 3.46, -- Strength of Earth
			[105] = 0.04, -- Ephemeral Recovery
			[194] = 3.26, -- Filthy Transfusion
			[13] = 0.07, -- Azerite Empowered
			[193] = 5.21, -- Blightborne Infusion
			[20] = 1.6, -- Lifespeed
			[416] = 6.81, -- Natural Harmony
			[560] = 1.47, -- Bonded Souls
			[195] = 3.49, -- Secrets of the Deep
			[192] = 4.05, -- Meticulous Scheming
			[100] = 0.12, -- Strength in Numbers
			[483] = 3.57, -- Archive of the Titans
			[196] = 4.62, -- Swirling Sands
			[43] = 0.06, -- Winds of War
			[577] = 1.71, -- Arcane Heart
			[541] = 1.2, -- Fight or Flight
			[479] = 4.06, -- Dagger in the Back
			[478] = 3.76, -- Tidal Surge
			[21] = 1.62, -- Elemental Whirl
			[89] = 0.19, -- Azerite Veins
			[207] = 0.03, -- Serene Spirit
			[482] = 3.2, -- Thunderous Blast
			[497] = 0.63, -- Stand As One
			[501] = 3.91, -- Relational Normalization Gizmo
			[156] = 2.37, -- Ruinous Bolt
			[447] = 5.45, -- Ancestral Resonance
			[522] = 4.96, -- Ancients' Bulwark
			[82] = 4.81, -- Champion of Azeroth
			[569] = 3.79, -- Clockwork Heart
			[157] = 3.92, -- Rezan's Fury
			[420] = 10, -- Roiling Storm
			[503] = 0.06, -- Auto-Self-Cauterizer
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 6501 - 8800 (avg 8110), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[32] = { 7.07, 2.56 }, -- Conflict and Strife
			[23] = { 8.45, 2.58 }, -- Blood of the Enemy
			[6] = { 6.71, 2.88 }, -- Purification Protocol
			[4] = { 2.02, 1.35 }, -- Worldvein Resonance
			[22] = { 1.81, 0.16 }, -- Vision of Perfection
			[28] = { 4.14, 2.44 }, -- The Unbound Force
			[27] = { 2.45, 1.55 }, -- Memory of Lucid Dreams
			[5] = { 10, 4.33 }, -- Essence of the Focusing Iris
			[14] = { 9.49, 3.61 }, -- Condensed Life-Force
			[15] = { 4.18, 0 }, -- Ripple in Space
			[12] = { 9.1, 3.75 }, -- The Crucible of Flame
		}, 1577181600)

		insertDefaultScalesData(offensiveName, 7, 3, { -- Restoration Shaman
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2301 - 3286 (avg 2481), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[82] = 2.73, -- Champion of Azeroth
			[504] = 2.75, -- Unstable Catalyst
			[560] = 1.08, -- Bonded Souls
			[22] = 1.66, -- Heed My Call
			[84] = 0.03, -- Bulwark of the Masses
			[462] = 1.13, -- Azerite Globules
			[521] = 2.39, -- Shadow of Elune
			[498] = 2.58, -- Barrage Of Many Bombs
			[156] = 2.34, -- Ruinous Bolt
			[479] = 4.16, -- Dagger in the Back
			[86] = 0.08, -- Azerite Fortification
			[485] = 3.33, -- Laser Matrix
			[461] = 0.99, -- Earthlink
			[416] = 3.18, -- Natural Harmony
			[30] = 2.12, -- Overwhelming Power
			[569] = 2.14, -- Clockwork Heart
			[457] = 10, -- Igneous Potential
			[38] = 1.13, -- On My Way
			[561] = 2.23, -- Seductive Power
			[42] = 0.05, -- Savior
			[194] = 3.38, -- Filthy Transfusion
			[18] = 0.11, -- Blood Siphon
			[448] = 2.6, -- Synapse Shock
			[575] = 6.23, -- Undulating Tides
			[20] = 1.19, -- Lifespeed
			[449] = 0.04, -- Overflowing Shores
			[21] = 0.8, -- Elemental Whirl
			[492] = 2.04, -- Liberator's Might
			[480] = 2.47, -- Blood Rite
			[478] = 4.11, -- Tidal Surge
			[192] = 1.43, -- Meticulous Scheming
			[483] = 2.8, -- Archive of the Titans
			[83] = 0.09, -- Impassive Visage
			[541] = 0.86, -- Fight or Flight
			[522] = 3.88, -- Ancients' Bulwark
			[493] = 0.04, -- Last Gift
			[31] = 1.88, -- Gutripper
			[193] = 3.35, -- Blightborne Infusion
			[500] = 2.23, -- Synaptic Spark Capacitor
			[43] = 0.03, -- Winds of War
			[497] = 0.63, -- Stand As One
			[577] = 0.96, -- Arcane Heart
			[195] = 2.57, -- Secrets of the Deep
			[459] = 1.23, -- Unstable Flames
			[523] = 3.19, -- Apothecary's Concoctions
			[482] = 3.37, -- Thunderous Blast
			[85] = 0.01, -- Gemhide
			[447] = 1.12, -- Ancestral Resonance
			[496] = 0.75, -- Stronger Together
			[495] = 2.47, -- Anduin's Dedication
			[157] = 4.01, -- Rezan's Fury
			[562] = 3.97, -- Treacherous Covenant
			[13] = 0.04, -- Azerite Empowered
			[15] = 0.01, -- Resounding Protection
			[494] = 3.59, -- Battlefield Precision
			[499] = 1.52, -- Ricocheting Inflatable Pyrosaw
			[501] = 3.15, -- Relational Normalization Gizmo
			[196] = 2.93, -- Swirling Sands
			[526] = 3.91, -- Endless Hunger
			[191] = 0.07, -- Turn of the Tide
			[576] = 0.03, -- Loyal to the End
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2301 - 2604 (avg 2476), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[32] = { 2.45, 2.42 }, -- Conflict and Strife
			[6] = { 3.14, 3.41 }, -- Purification Protocol
			[14] = { 3.67, 3.87 }, -- Condensed Life-Force
			[23] = { 0.69, 0.78 }, -- Blood of the Enemy
			[4] = { 0.02, 1.13 }, -- Worldvein Resonance
			[12] = { 10, 5.13 }, -- The Crucible of Flame
			[22] = { 0.12, 0 }, -- Vision of Perfection
			[5] = { 3.5, 3.56 }, -- Essence of the Focusing Iris
			[28] = { 1.58, 1.61 }, -- The Unbound Force
			[27] = { 0.04, 0 }, -- Memory of Lucid Dreams
			[15] = { 3.22, 0.03 }, -- Ripple in Space
		}, 1577181600)

		insertDefaultScalesData(defaultName, 9, 1, { -- Affliction Warlock
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4003 - 5507 (avg 4560), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[505] = 6.01, -- Tradewinds
			[425] = 5.03, -- Sudden Onset
			[499] = 2.42, -- Ricocheting Inflatable Pyrosaw
			[31] = 3.3, -- Gutripper
			[20] = 2.21, -- Lifespeed
			[463] = 0.08, -- Blessed Portents
			[480] = 4.96, -- Blood Rite
			[504] = 4.95, -- Unstable Catalyst
			[100] = 0.25, -- Strength in Numbers
			[42] = 0.14, -- Savior
			[156] = 3.67, -- Ruinous Bolt
			[230] = 7.41, -- Cascading Calamity
			[560] = 2.58, -- Bonded Souls
			[497] = 1.03, -- Stand As One
			[494] = 6.52, -- Battlefield Precision
			[157] = 6.39, -- Rezan's Fury
			[38] = 2.14, -- On My Way
			[183] = 7.32, -- Inevitable Demise
			[495] = 4.4, -- Anduin's Dedication
			[479] = 6.29, -- Dagger in the Back
			[561] = 3.84, -- Seductive Power
			[21] = 2.68, -- Elemental Whirl
			[569] = 4.82, -- Clockwork Heart
			[576] = 3.95, -- Loyal to the End
			[523] = 5.06, -- Apothecary's Concoctions
			[492] = 4.99, -- Liberator's Might
			[493] = 3.08, -- Last Gift
			[462] = 1.84, -- Azerite Globules
			[123] = 6.46, -- Wracking Brilliance
			[496] = 1.69, -- Stronger Together
			[522] = 7.1, -- Ancients' Bulwark
			[15] = 0.07, -- Resounding Protection
			[193] = 7.95, -- Blightborne Infusion
			[485] = 5.74, -- Laser Matrix
			[500] = 3.2, -- Synaptic Spark Capacitor
			[19] = 0.01, -- Woundbinder
			[89] = 0.03, -- Azerite Veins
			[459] = 2.84, -- Unstable Flames
			[196] = 6.71, -- Swirling Sands
			[442] = 6.1, -- Pandemic Invocation
			[482] = 5.37, -- Thunderous Blast
			[195] = 4.31, -- Secrets of the Deep
			[483] = 4.54, -- Archive of the Titans
			[575] = 10, -- Undulating Tides
			[82] = 7.3, -- Champion of Azeroth
			[18] = 2.3, -- Blood Siphon
			[461] = 1.33, -- Earthlink
			[30] = 4.82, -- Overwhelming Power
			[541] = 1.53, -- Fight or Flight
			[577] = 2, -- Arcane Heart
			[194] = 5.59, -- Filthy Transfusion
			[562] = 6.84, -- Treacherous Covenant
			[481] = 5.32, -- Incite the Pack
			[521] = 4.75, -- Shadow of Elune
			[478] = 5.94, -- Tidal Surge
			[192] = 5.58, -- Meticulous Scheming
			[22] = 2.72, -- Heed My Call
			[426] = 6.7, -- Dreadful Calling
			[501] = 6.06, -- Relational Normalization Gizmo
			[526] = 7.37, -- Endless Hunger
			[498] = 4.14, -- Barrage Of Many Bombs
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2802 - 5500 (avg 4506), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[23] = { 6.63, 1.02 }, -- Blood of the Enemy
			[28] = { 3.78, 1.85 }, -- The Unbound Force
			[27] = { 3.02, 1.05 }, -- Memory of Lucid Dreams
			[6] = { 5.57, 2.35 }, -- Purification Protocol
			[14] = { 7.62, 2.79 }, -- Condensed Life-Force
			[4] = { 0.78, 0.87 }, -- Worldvein Resonance
			[5] = { 10, 3.38 }, -- Essence of the Focusing Iris
			[32] = { 1.78, 1.75 }, -- Conflict and Strife
			[12] = { 7.47, 2.96 }, -- The Crucible of Flame
			[15] = { 3.23, 0 }, -- Ripple in Space
			[22] = { 0.68, 2.53 }, -- Vision of Perfection
		}, 1577181600)

		insertDefaultScalesData(defaultName, 9, 2, { -- Demonology Warlock
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2901 - 4800 (avg 3479), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[463] = 0.08, -- Blessed Portents
			[157] = 4.56, -- Rezan's Fury
			[576] = 2.99, -- Loyal to the End
			[485] = 3.85, -- Laser Matrix
			[562] = 6.01, -- Treacherous Covenant
			[501] = 5.16, -- Relational Normalization Gizmo
			[560] = 1.94, -- Bonded Souls
			[156] = 2.71, -- Ruinous Bolt
			[192] = 4.86, -- Meticulous Scheming
			[504] = 4.28, -- Unstable Catalyst
			[208] = 0.1, -- Lifeblood
			[428] = 4.16, -- Demonic Meteor
			[498] = 2.82, -- Barrage Of Many Bombs
			[87] = 0.17, -- Self Reliance
			[494] = 3.03, -- Battlefield Precision
			[500] = 2.67, -- Synaptic Spark Capacitor
			[18] = 1.71, -- Blood Siphon
			[98] = 0.01, -- Crystalline Carapace
			[38] = 2.01, -- On My Way
			[461] = 1.57, -- Earthlink
			[483] = 4.53, -- Archive of the Titans
			[561] = 3.14, -- Seductive Power
			[84] = 0.11, -- Bulwark of the Masses
			[85] = 0.13, -- Gemhide
			[30] = 4.11, -- Overwhelming Power
			[569] = 5.29, -- Clockwork Heart
			[22] = 2.02, -- Heed My Call
			[462] = 1.34, -- Azerite Globules
			[89] = 0.16, -- Azerite Veins
			[193] = 6.02, -- Blightborne Infusion
			[15] = 0.05, -- Resounding Protection
			[459] = 2.04, -- Unstable Flames
			[531] = 0.02, -- Terror of the Mind
			[503] = 0.04, -- Auto-Self-Cauterizer
			[44] = 0.07, -- Vampiric Speed
			[526] = 6.26, -- Endless Hunger
			[196] = 4.97, -- Swirling Sands
			[481] = 4.12, -- Incite the Pack
			[43] = 0.02, -- Winds of War
			[458] = 3.53, -- Supreme Commander
			[482] = 3.76, -- Thunderous Blast
			[194] = 3.84, -- Filthy Transfusion
			[492] = 4.18, -- Liberator's Might
			[495] = 4.05, -- Anduin's Dedication
			[480] = 4.52, -- Blood Rite
			[522] = 6.29, -- Ancients' Bulwark
			[577] = 0.62, -- Arcane Heart
			[130] = 2.54, -- Shadow's Bite
			[20] = 1.6, -- Lifespeed
			[195] = 3.89, -- Secrets of the Deep
			[499] = 1.52, -- Ricocheting Inflatable Pyrosaw
			[99] = 0.23, -- Ablative Shielding
			[497] = 1.1, -- Stand As One
			[493] = 2.58, -- Last Gift
			[14] = 0.14, -- Longstrider
			[31] = 1.96, -- Gutripper
			[496] = 1.5, -- Stronger Together
			[502] = 0.08, -- Personal Absorb-o-Tron
			[478] = 4.69, -- Tidal Surge
			[505] = 4.57, -- Tradewinds
			[475] = 0.01, -- Desperate Power
			[523] = 3.69, -- Apothecary's Concoctions
			[521] = 4.54, -- Shadow of Elune
			[479] = 4.96, -- Dagger in the Back
			[21] = 2.19, -- Elemental Whirl
			[82] = 5.48, -- Champion of Azeroth
			[429] = 10, -- Baleful Invocation
			[575] = 6.63, -- Undulating Tides
			[190] = 3.46, -- Umbral Blaze
			[541] = 1.46, -- Fight or Flight
			[86] = 0.11, -- Azerite Fortification
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3000 - 4600 (avg 3481), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[14] = { 9.09, 3.13 }, -- Condensed Life-Force
			[4] = { 1.7, 1.53 }, -- Worldvein Resonance
			[12] = { 7.26, 3.71 }, -- The Crucible of Flame
			[6] = { 5.62, 2.68 }, -- Purification Protocol
			[23] = { 6.83, 0.58 }, -- Blood of the Enemy
			[5] = { 10, 3.81 }, -- Essence of the Focusing Iris
			[28] = { 3.32, 1.77 }, -- The Unbound Force
			[32] = { 2.75, 2.89 }, -- Conflict and Strife
			[15] = { 3.85, 0.02 }, -- Ripple in Space
			[22] = { 5.99, 2.18 }, -- Vision of Perfection
			[27] = { 4.84, 3.32 }, -- Memory of Lucid Dreams
		}, 1577181600)

		insertDefaultScalesData(defaultName, 9, 3, { -- Destruction Warlock
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 5600 - 6904 (avg 5948), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[502] = 0.32, -- Personal Absorb-o-Tron
			[522] = 8.58, -- Ancients' Bulwark
			[562] = 8.11, -- Treacherous Covenant
			[560] = 2.78, -- Bonded Souls
			[232] = 6.88, -- Flashpoint
			[496] = 1.65, -- Stronger Together
			[43] = 0.1, -- Winds of War
			[42] = 0.15, -- Savior
			[483] = 5.35, -- Archive of the Titans
			[83] = 0.06, -- Impassive Visage
			[84] = 0.08, -- Bulwark of the Masses
			[478] = 5.92, -- Tidal Surge
			[576] = 4.28, -- Loyal to the End
			[156] = 3.97, -- Ruinous Bolt
			[463] = 0.34, -- Blessed Portents
			[22] = 2.47, -- Heed My Call
			[575] = 10, -- Undulating Tides
			[521] = 5.89, -- Shadow of Elune
			[193] = 8.63, -- Blightborne Infusion
			[131] = 6.97, -- Chaos Shards
			[157] = 6.48, -- Rezan's Fury
			[481] = 5.92, -- Incite the Pack
			[38] = 2.47, -- On My Way
			[505] = 6.4, -- Tradewinds
			[208] = 0.2, -- Lifeblood
			[194] = 5.03, -- Filthy Transfusion
			[18] = 2.43, -- Blood Siphon
			[485] = 5.78, -- Laser Matrix
			[568] = 0.12, -- Person-Computer Interface
			[19] = 0.01, -- Woundbinder
			[493] = 3.3, -- Last Gift
			[100] = 0.11, -- Strength in Numbers
			[492] = 5.27, -- Liberator's Might
			[494] = 6, -- Battlefield Precision
			[497] = 1.47, -- Stand As One
			[85] = 0.17, -- Gemhide
			[523] = 5.09, -- Apothecary's Concoctions
			[462] = 1.72, -- Azerite Globules
			[475] = 0.18, -- Desperate Power
			[82] = 7.82, -- Champion of Azeroth
			[196] = 8.12, -- Swirling Sands
			[569] = 4.7, -- Clockwork Heart
			[482] = 5.17, -- Thunderous Blast
			[500] = 3.43, -- Synaptic Spark Capacitor
			[30] = 5.35, -- Overwhelming Power
			[461] = 1.63, -- Earthlink
			[495] = 5.11, -- Anduin's Dedication
			[444] = 6.07, -- Crashing Chaos
			[479] = 6.66, -- Dagger in the Back
			[31] = 3.13, -- Gutripper
			[460] = 6.52, -- Bursting Flare
			[20] = 1.98, -- Lifespeed
			[431] = 0.26, -- Rolling Havoc
			[498] = 3.99, -- Barrage Of Many Bombs
			[501] = 6.7, -- Relational Normalization Gizmo
			[104] = 0.02, -- Bracing Chill
			[504] = 5.77, -- Unstable Catalyst
			[480] = 5.68, -- Blood Rite
			[541] = 1.94, -- Fight or Flight
			[432] = 7.32, -- Chaotic Inferno
			[459] = 3.2, -- Unstable Flames
			[577] = 2.42, -- Arcane Heart
			[195] = 5.22, -- Secrets of the Deep
			[499] = 2.34, -- Ricocheting Inflatable Pyrosaw
			[561] = 4.54, -- Seductive Power
			[192] = 5.91, -- Meticulous Scheming
			[526] = 8.33, -- Endless Hunger
			[21] = 2.71, -- Elemental Whirl
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3701 - 7800 (avg 5866), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = { 2.88, 0.17 }, -- Ripple in Space
			[4] = { 0.4, 0.9 }, -- Worldvein Resonance
			[32] = { 2.09, 2.19 }, -- Conflict and Strife
			[14] = { 6.53, 2.75 }, -- Condensed Life-Force
			[23] = { 3.28, 0.55 }, -- Blood of the Enemy
			[12] = { 5.57, 2.89 }, -- The Crucible of Flame
			[27] = { 10, 2.43 }, -- Memory of Lucid Dreams
			[5] = { 7.65, 3.54 }, -- Essence of the Focusing Iris
			[22] = { 9.84, 3.86 }, -- Vision of Perfection
			[6] = { 4.1, 2.43 }, -- Purification Protocol
			[28] = { 1.98, 1.18 }, -- The Unbound Force
		}, 1577181600)

		insertDefaultScalesData(defaultName, 1, 1, { -- Arms Warrior
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3400 - 4101 (avg 3621), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[492] = 5.31, -- Liberator's Might
			[433] = 3.85, -- Seismic Wave
			[13] = 0.1, -- Azerite Empowered
			[500] = 2.96, -- Synaptic Spark Capacitor
			[495] = 4.26, -- Anduin's Dedication
			[174] = 5.05, -- Gathering Storm
			[194] = 4.75, -- Filthy Transfusion
			[121] = 5.52, -- Striking the Anvil
			[575] = 8.92, -- Undulating Tides
			[561] = 4.36, -- Seductive Power
			[576] = 4.15, -- Loyal to the End
			[499] = 2.2, -- Ricocheting Inflatable Pyrosaw
			[38] = 2.41, -- On My Way
			[498] = 3.72, -- Barrage Of Many Bombs
			[480] = 4.7, -- Blood Rite
			[83] = 0.1, -- Impassive Visage
			[459] = 3.45, -- Unstable Flames
			[485] = 5.03, -- Laser Matrix
			[193] = 9.17, -- Blightborne Infusion
			[504] = 5.13, -- Unstable Catalyst
			[496] = 1.87, -- Stronger Together
			[14] = 0.2, -- Longstrider
			[44] = 0.06, -- Vampiric Speed
			[523] = 4.21, -- Apothecary's Concoctions
			[501] = 5.67, -- Relational Normalization Gizmo
			[494] = 5.5, -- Battlefield Precision
			[98] = 0.47, -- Crystalline Carapace
			[105] = 0.27, -- Ephemeral Recovery
			[157] = 5.57, -- Rezan's Fury
			[562] = 7.29, -- Treacherous Covenant
			[505] = 5.77, -- Tradewinds
			[22] = 2.34, -- Heed My Call
			[526] = 8.55, -- Endless Hunger
			[85] = 0.01, -- Gemhide
			[195] = 4.42, -- Secrets of the Deep
			[18] = 2.14, -- Blood Siphon
			[483] = 5.16, -- Archive of the Titans
			[503] = 0.32, -- Auto-Self-Cauterizer
			[478] = 5.33, -- Tidal Surge
			[482] = 4.44, -- Thunderous Blast
			[462] = 1.43, -- Azerite Globules
			[156] = 3.06, -- Ruinous Bolt
			[192] = 6, -- Meticulous Scheming
			[30] = 4.88, -- Overwhelming Power
			[21] = 2.98, -- Elemental Whirl
			[541] = 1.93, -- Fight or Flight
			[434] = 8.25, -- Crushing Assault
			[476] = 0.02, -- Moment of Glory
			[577] = 2.76, -- Arcane Heart
			[99] = 0.04, -- Ablative Shielding
			[479] = 5.16, -- Dagger in the Back
			[435] = 4.54, -- Lord of War
			[87] = 0.14, -- Self Reliance
			[569] = 6.62, -- Clockwork Heart
			[481] = 5.4, -- Incite the Pack
			[493] = 3.23, -- Last Gift
			[196] = 8.44, -- Swirling Sands
			[560] = 2.6, -- Bonded Souls
			[20] = 2.11, -- Lifespeed
			[477] = 0.26, -- Bury the Hatchet
			[502] = 0.12, -- Personal Absorb-o-Tron
			[461] = 1.77, -- Earthlink
			[497] = 1.32, -- Stand As One
			[31] = 2.81, -- Gutripper
			[104] = 0.08, -- Bracing Chill
			[82] = 8.16, -- Champion of Azeroth
			[19] = 0.08, -- Woundbinder
			[226] = 10, -- Test of Might
			[522] = 8.49, -- Ancients' Bulwark
			[521] = 4.7, -- Shadow of Elune
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3302 - 4004 (avg 3569), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[4] = { 1.89, 1.22 }, -- Worldvein Resonance
			[5] = { 10, 4.01 }, -- Essence of the Focusing Iris
			[27] = { 7.9, 4.72 }, -- Memory of Lucid Dreams
			[6] = { 6.4, 2.92 }, -- Purification Protocol
			[23] = { 5.96, 1.15 }, -- Blood of the Enemy
			[12] = { 8.97, 3.41 }, -- The Crucible of Flame
			[15] = { 4.29, 0 }, -- Ripple in Space
			[32] = { 2.87, 2.92 }, -- Conflict and Strife
			[22] = { 0, 0.01 }, -- Vision of Perfection
			[14] = { 8.88, 3.3 }, -- Condensed Life-Force
			[28] = { 4.66, 2.58 }, -- The Unbound Force
		}, 1577181600)

		insertDefaultScalesData(defaultName, 1, 2, { -- Fury Warrior
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4600 - 5480 (avg 5007), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[156] = 3.22, -- Ruinous Bolt
			[569] = 6.89, -- Clockwork Heart
			[99] = 0.1, -- Ablative Shielding
			[541] = 1.53, -- Fight or Flight
			[105] = 0.04, -- Ephemeral Recovery
			[438] = 6.24, -- Reckless Flurry
			[83] = 0.08, -- Impassive Visage
			[82] = 8.54, -- Champion of Azeroth
			[21] = 2.41, -- Elemental Whirl
			[20] = 3.59, -- Lifespeed
			[499] = 2.65, -- Ricocheting Inflatable Pyrosaw
			[476] = 0.08, -- Moment of Glory
			[18] = 1.94, -- Blood Siphon
			[461] = 1.2, -- Earthlink
			[492] = 4.89, -- Liberator's Might
			[482] = 5.39, -- Thunderous Blast
			[479] = 5.15, -- Dagger in the Back
			[497] = 0.91, -- Stand As One
			[463] = 0.03, -- Blessed Portents
			[560] = 3.73, -- Bonded Souls
			[500] = 2.78, -- Synaptic Spark Capacitor
			[87] = 0.07, -- Self Reliance
			[84] = 0.23, -- Bulwark of the Masses
			[483] = 4.22, -- Archive of the Titans
			[505] = 5.17, -- Tradewinds
			[31] = 2.88, -- Gutripper
			[504] = 4, -- Unstable Catalyst
			[477] = 0.22, -- Bury the Hatchet
			[523] = 4.15, -- Apothecary's Concoctions
			[451] = 4.49, -- Infinite Fury
			[501] = 5.28, -- Relational Normalization Gizmo
			[119] = 7.6, -- Unbridled Ferocity
			[157] = 6.12, -- Rezan's Fury
			[174] = 0.05, -- Gathering Storm
			[503] = 0.07, -- Auto-Self-Cauterizer
			[481] = 4.65, -- Incite the Pack
			[495] = 3.39, -- Anduin's Dedication
			[192] = 6.89, -- Meticulous Scheming
			[577] = 2.56, -- Arcane Heart
			[561] = 3.47, -- Seductive Power
			[100] = 0.04, -- Strength in Numbers
			[480] = 5.35, -- Blood Rite
			[193] = 7.12, -- Blightborne Infusion
			[502] = 0.02, -- Personal Absorb-o-Tron
			[485] = 5.67, -- Laser Matrix
			[494] = 6.35, -- Battlefield Precision
			[493] = 2.75, -- Last Gift
			[498] = 3.81, -- Barrage Of Many Bombs
			[195] = 3.44, -- Secrets of the Deep
			[194] = 4.76, -- Filthy Transfusion
			[575] = 10, -- Undulating Tides
			[30] = 5.73, -- Overwhelming Power
			[38] = 1.91, -- On My Way
			[526] = 7.61, -- Endless Hunger
			[462] = 1.73, -- Azerite Globules
			[478] = 4.96, -- Tidal Surge
			[44] = 0.25, -- Vampiric Speed
			[196] = 6.81, -- Swirling Sands
			[459] = 2.64, -- Unstable Flames
			[437] = 6.12, -- Simmering Rage
			[229] = 4.67, -- Pulverizing Blows
			[562] = 5.44, -- Treacherous Covenant
			[496] = 1.84, -- Stronger Together
			[576] = 3.46, -- Loyal to the End
			[522] = 7.67, -- Ancients' Bulwark
			[101] = 0.12, -- Shimmering Haven
			[176] = 8.88, -- Cold Steel, Hot Blood
			[22] = 2.77, -- Heed My Call
			[521] = 5.28, -- Shadow of Elune
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4576 - 5402 (avg 4933), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = { 2.3, 0 }, -- Ripple in Space
			[22] = { 2.46, 0.76 }, -- Vision of Perfection
			[27] = { 8.31, 3.35 }, -- Memory of Lucid Dreams
			[6] = { 5.78, 3.41 }, -- Purification Protocol
			[12] = { 6.81, 4.13 }, -- The Crucible of Flame
			[14] = { 9.91, 3.74 }, -- Condensed Life-Force
			[32] = { 2.66, 2.52 }, -- Conflict and Strife
			[5] = { 10, 5.5 }, -- Essence of the Focusing Iris
			[23] = { 4.82, 1.82 }, -- Blood of the Enemy
			[28] = { 3.02, 1.89 }, -- The Unbound Force
			[4] = { 0, 1.19 }, -- Worldvein Resonance
		}, 1577181600)

		insertDefaultScalesData(offensiveName, 1, 3, { -- Protection Warrior
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4301 - 5201 (avg 4599), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[496] = 1.2, -- Stronger Together
			[441] = 2.37, -- Iron Fortress
			[481] = 3.41, -- Incite the Pack
			[22] = 2.91, -- Heed My Call
			[101] = 0.06, -- Shimmering Haven
			[554] = 0.13, -- Intimidating Presence
			[462] = 1.86, -- Azerite Globules
			[526] = 6.35, -- Endless Hunger
			[505] = 3.72, -- Tradewinds
			[501] = 4.42, -- Relational Normalization Gizmo
			[42] = 0.35, -- Savior
			[84] = 0.18, -- Bulwark of the Masses
			[193] = 6.63, -- Blightborne Infusion
			[492] = 3.8, -- Liberator's Might
			[38] = 1.99, -- On My Way
			[476] = 0.26, -- Moment of Glory
			[478] = 5.7, -- Tidal Surge
			[18] = 1.56, -- Blood Siphon
			[237] = 5.11, -- Bastion of Might
			[118] = 2.06, -- Deafening Crash
			[463] = 0.23, -- Blessed Portents
			[521] = 3.58, -- Shadow of Elune
			[82] = 5.42, -- Champion of Azeroth
			[31] = 3.1, -- Gutripper
			[440] = 1.38, -- Callous Reprisal
			[459] = 2.35, -- Unstable Flames
			[561] = 3.35, -- Seductive Power
			[560] = 1.84, -- Bonded Souls
			[196] = 5.91, -- Swirling Sands
			[85] = 0.25, -- Gemhide
			[568] = 0.12, -- Person-Computer Interface
			[83] = 0.22, -- Impassive Visage
			[461] = 1.26, -- Earthlink
			[479] = 4.06, -- Dagger in the Back
			[562] = 5.8, -- Treacherous Covenant
			[194] = 5.21, -- Filthy Transfusion
			[100] = 0.27, -- Strength in Numbers
			[157] = 6.36, -- Rezan's Fury
			[500] = 3.04, -- Synaptic Spark Capacitor
			[21] = 1.98, -- Elemental Whirl
			[523] = 4.77, -- Apothecary's Concoctions
			[15] = 0.03, -- Resounding Protection
			[482] = 5.3, -- Thunderous Blast
			[502] = 0.06, -- Personal Absorb-o-Tron
			[480] = 3.47, -- Blood Rite
			[43] = 0.26, -- Winds of War
			[569] = 4.77, -- Clockwork Heart
			[483] = 4.16, -- Archive of the Titans
			[99] = 0.3, -- Ablative Shielding
			[577] = 1.6, -- Arcane Heart
			[103] = 0.13, -- Concentrated Mending
			[195] = 3.91, -- Secrets of the Deep
			[20] = 1.55, -- Lifespeed
			[495] = 3.72, -- Anduin's Dedication
			[98] = 0.18, -- Crystalline Carapace
			[477] = 0.03, -- Bury the Hatchet
			[503] = 0.22, -- Auto-Self-Cauterizer
			[14] = 0.16, -- Longstrider
			[450] = 4.49, -- Brace for Impact
			[499] = 2.67, -- Ricocheting Inflatable Pyrosaw
			[13] = 0.03, -- Azerite Empowered
			[522] = 6.1, -- Ancients' Bulwark
			[497] = 0.98, -- Stand As One
			[104] = 0.09, -- Bracing Chill
			[541] = 1.4, -- Fight or Flight
			[576] = 2.58, -- Loyal to the End
			[494] = 5.91, -- Battlefield Precision
			[177] = 0.24, -- Bloodsport
			[575] = 10, -- Undulating Tides
			[493] = 2.01, -- Last Gift
			[504] = 4.08, -- Unstable Catalyst
			[192] = 4.54, -- Meticulous Scheming
			[498] = 4.42, -- Barrage Of Many Bombs
			[156] = 3.42, -- Ruinous Bolt
			[30] = 3.51, -- Overwhelming Power
			[485] = 5.59, -- Laser Matrix
			[89] = 0.06, -- Azerite Veins
			[44] = 0.03, -- Vampiric Speed
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4102 - 4802 (avg 4501), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[25] = { 1.14, 1.19 }, -- Aegis of the Deep
			[3] = { 4.58, 4.58 }, -- Sphere of Suppression
			[7] = { 3.07, 0.13 }, -- Anima of Life and Death
			[22] = { 5.18, 3.27 }, -- Vision of Perfection
			[27] = { 1.48, 0.72 }, -- Memory of Lucid Dreams
			[2] = { 0.07, 0 }, -- Azeroth's Undying Gift
			[13] = { 0.14, 0.11 }, -- Nullification Dynamo
			[4] = { 1.25, 1.05 }, -- Worldvein Resonance
			[12] = { 10, 4.17 }, -- The Crucible of Flame
			[15] = { 4.14, 0.03 }, -- Ripple in Space
			[32] = { 2.51, 2.31 }, -- Conflict and Strife
		}, 1577181600)

		insertDefaultScalesData(defensiveName, 12, 2, { -- Vengeance Demon Hunter (TMI)
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 1238 - 1516 (avg 1383), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[101] = 3.86, -- Shimmering Haven
			[43] = 2.27, -- Winds of War
			[44] = 0.83, -- Vampiric Speed
			[479] = 0.01, -- Dagger in the Back
			[87] = 6.35, -- Self Reliance
			[485] = 1.9, -- Laser Matrix
			[505] = 4.5, -- Tradewinds
			[481] = 4.32, -- Incite the Pack
			[354] = 3.87, -- Cycle of Binding
			[196] = 5.78, -- Swirling Sands
			[82] = 0.37, -- Champion of Azeroth
			[466] = 2.94, -- Burning Soul
			[478] = 3.37, -- Tidal Surge
			[83] = 3.01, -- Impassive Visage
			[160] = 2.14, -- Infernal Armor
			[86] = 2.07, -- Azerite Fortification
			[501] = 0.8, -- Relational Normalization Gizmo
			[482] = 3.86, -- Thunderous Blast
			[13] = 3.53, -- Azerite Empowered
			[134] = 0.43, -- Revel in Pain
			[522] = 6.39, -- Ancients' Bulwark
			[500] = 1.58, -- Synaptic Spark Capacitor
			[194] = 8.91, -- Filthy Transfusion
			[569] = 0.43, -- Clockwork Heart
			[497] = 2.62, -- Stand As One
			[19] = 1.77, -- Woundbinder
			[459] = 0.34, -- Unstable Flames
			[541] = 7.7, -- Fight or Flight
			[492] = 2.03, -- Liberator's Might
			[38] = 2.73, -- On My Way
			[105] = 5.21, -- Ephemeral Recovery
			[463] = 4.82, -- Blessed Portents
			[576] = 3.01, -- Loyal to the End
			[15] = 5.92, -- Resounding Protection
			[483] = 4.43, -- Archive of the Titans
			[575] = 3.09, -- Undulating Tides
			[480] = 0.39, -- Blood Rite
			[14] = 3.1, -- Longstrider
			[495] = 3.19, -- Anduin's Dedication
			[30] = 7.85, -- Overwhelming Power
			[462] = 2, -- Azerite Globules
			[502] = 4.83, -- Personal Absorb-o-Tron
			[494] = 8.43, -- Battlefield Precision
			[493] = 6.29, -- Last Gift
			[496] = 1.68, -- Stronger Together
			[31] = 8.12, -- Gutripper
			[193] = 5.77, -- Blightborne Infusion
			[42] = 2.24, -- Savior
			[577] = 1.65, -- Arcane Heart
			[246] = 5.26, -- Hour of Reaping
			[99] = 10, -- Ablative Shielding
			[560] = 2.16, -- Bonded Souls
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 1300 - 1502 (avg 1383), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[25] = { 0, 1.55 }, -- Aegis of the Deep
			[4] = { 4.27, 2.36 }, -- Worldvein Resonance
			[12] = { 2.22, 0 }, -- The Crucible of Flame
			[32] = { 0, 0.24 }, -- Conflict and Strife
			[2] = { 3.57, 0 }, -- Azeroth's Undying Gift
			[3] = { 0.53, 7.96 }, -- Sphere of Suppression
			[13] = { 8.6, 3.43 }, -- Nullification Dynamo
			[27] = { 1.75, 0 }, -- Memory of Lucid Dreams
			[22] = { 0, 10 }, -- Vision of Perfection
		}, 1577181600)

		insertDefaultScalesData(defensiveName, 11, 3, { -- Guardian Druid (TMI)
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 1100 - 1325 (avg 1178), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[561] = 3.02, -- Seductive Power
			[171] = 6.34, -- Masterful Instincts
			[478] = 10, -- Tidal Surge
			[30] = 0.57, -- Overwhelming Power
			[485] = 7.71, -- Laser Matrix
			[522] = 1.7, -- Ancients' Bulwark
			[504] = 6.54, -- Unstable Catalyst
			[101] = 1.56, -- Shimmering Haven
			[575] = 4.12, -- Undulating Tides
			[492] = 1.31, -- Liberator's Might
			[31] = 1.21, -- Gutripper
			[560] = 0.68, -- Bonded Souls
			[497] = 0.41, -- Stand As One
			[462] = 6.2, -- Azerite Globules
			[467] = 4.5, -- Ursoc's Endurance
			[194] = 0.55, -- Filthy Transfusion
			[100] = 2.94, -- Strength in Numbers
			[89] = 1.44, -- Azerite Veins
			[43] = 0.03, -- Winds of War
			[82] = 4.08, -- Champion of Azeroth
			[219] = 7.04, -- Reawakening
			[494] = 0.12, -- Battlefield Precision
			[44] = 2.25, -- Vampiric Speed
			[459] = 4.78, -- Unstable Flames
			[361] = 1.47, -- Guardian's Wrath
			[85] = 4.8, -- Gemhide
			[105] = 3.23, -- Ephemeral Recovery
			[42] = 2.89, -- Savior
			[156] = 1.15, -- Ruinous Bolt
			[540] = 8.04, -- Switch Hitter
			[241] = 0.01, -- Twisted Claws
			[523] = 5.43, -- Apothecary's Concoctions
			[493] = 0.17, -- Last Gift
			[500] = 0.25, -- Synaptic Spark Capacitor
			[576] = 3.77, -- Loyal to the End
			[359] = 1.5, -- Wild Fleshrending
			[482] = 3.73, -- Thunderous Blast
			[562] = 7.9, -- Treacherous Covenant
			[103] = 9.79, -- Concentrated Mending
			[99] = 0.03, -- Ablative Shielding
			[483] = 3.16, -- Archive of the Titans
			[98] = 1.48, -- Crystalline Carapace
			[568] = 9.86, -- Person-Computer Interface
			[496] = 0.87, -- Stronger Together
			[501] = 0.95, -- Relational Normalization Gizmo
			[84] = 2.37, -- Bulwark of the Masses
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 1100 - 1308 (avg 1176), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[32] = { 0.4, 3.18 }, -- Conflict and Strife
			[3] = { 7.58, 3.4 }, -- Sphere of Suppression
			[4] = { 0, 5.42 }, -- Worldvein Resonance
			[15] = { 1.33, 7.21 }, -- Ripple in Space
			[22] = { 3.52, 5.47 }, -- Vision of Perfection
			[2] = { 0, 3.24 }, -- Azeroth's Undying Gift
			[25] = { 3.19, 1.23 }, -- Aegis of the Deep
			[12] = { 5.58, 0.25 }, -- The Crucible of Flame
			[7] = { 10, 0.81 }, -- Anima of Life and Death
			[13] = { 8.28, 0.27 }, -- Nullification Dynamo
		}, 1577181600)

		insertDefaultScalesData(defensiveName, 10, 1, { -- Brewmaster Monk (TMI)
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2700 - 3002 (avg 2836), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[503] = 4.1, -- Auto-Self-Cauterizer
			[20] = 2.72, -- Lifespeed
			[382] = 4.47, -- Straight, No Chaser
			[521] = 4.97, -- Shadow of Elune
			[500] = 1.67, -- Synaptic Spark Capacitor
			[485] = 3.33, -- Laser Matrix
			[18] = 4.29, -- Blood Siphon
			[482] = 2.99, -- Thunderous Blast
			[483] = 3.75, -- Archive of the Titans
			[218] = 1.22, -- Strength of Spirit
			[498] = 2.25, -- Barrage Of Many Bombs
			[98] = 0.85, -- Crystalline Carapace
			[494] = 6.93, -- Battlefield Precision
			[14] = 5.31, -- Longstrider
			[116] = 7.81, -- Boiling Brew
			[492] = 0.09, -- Liberator's Might
			[82] = 8.14, -- Champion of Azeroth
			[19] = 3.65, -- Woundbinder
			[194] = 3.02, -- Filthy Transfusion
			[541] = 3.4, -- Fight or Flight
			[104] = 6.31, -- Bracing Chill
			[196] = 6.23, -- Swirling Sands
			[522] = 9.87, -- Ancients' Bulwark
			[480] = 7.75, -- Blood Rite
			[101] = 1.53, -- Shimmering Haven
			[44] = 6.07, -- Vampiric Speed
			[502] = 4.53, -- Personal Absorb-o-Tron
			[496] = 3.81, -- Stronger Together
			[497] = 7.26, -- Stand As One
			[462] = 6.85, -- Azerite Globules
			[87] = 5.71, -- Self Reliance
			[523] = 1.24, -- Apothecary's Concoctions
			[568] = 5.07, -- Person-Computer Interface
			[463] = 3.44, -- Blessed Portents
			[38] = 1.29, -- On My Way
			[461] = 7.36, -- Earthlink
			[192] = 5.21, -- Meticulous Scheming
			[193] = 2.46, -- Blightborne Infusion
			[156] = 5.63, -- Ruinous Bolt
			[84] = 1.99, -- Bulwark of the Masses
			[504] = 1.4, -- Unstable Catalyst
			[43] = 1.15, -- Winds of War
			[105] = 3.78, -- Ephemeral Recovery
			[470] = 9.32, -- Sweep the Leg
			[575] = 2.53, -- Undulating Tides
			[576] = 4.37, -- Loyal to the End
			[478] = 3.83, -- Tidal Surge
			[30] = 7.49, -- Overwhelming Power
			[15] = 3.78, -- Resounding Protection
			[157] = 8.08, -- Rezan's Fury
			[83] = 3.84, -- Impassive Visage
			[566] = 5.66, -- Exit Strategy
			[560] = 4.23, -- Bonded Souls
			[493] = 6.3, -- Last Gift
			[526] = 4.76, -- Endless Hunger
			[22] = 4.33, -- Heed My Call
			[505] = 3.88, -- Tradewinds
			[499] = 3.31, -- Ricocheting Inflatable Pyrosaw
			[495] = 1.02, -- Anduin's Dedication
			[99] = 0.92, -- Ablative Shielding
			[562] = 5.7, -- Treacherous Covenant
			[13] = 9.3, -- Azerite Empowered
			[21] = 4.28, -- Elemental Whirl
			[481] = 4.61, -- Incite the Pack
			[42] = 1.38, -- Savior
			[103] = 4.8, -- Concentrated Mending
			[195] = 3.56, -- Secrets of the Deep
			[577] = 8.94, -- Arcane Heart
			[501] = 5.07, -- Relational Normalization Gizmo
			[89] = 5.18, -- Azerite Veins
			[384] = 4.81, -- Elusive Footwork
			[86] = 10, -- Azerite Fortification
			[85] = 6.95, -- Gemhide
			[383] = 4.43, -- Training of Niuzao
			[238] = 5.99, -- Fit to Burst
			[100] = 4.51, -- Strength in Numbers
			[479] = 3.28, -- Dagger in the Back
			[561] = 1.23, -- Seductive Power
			[186] = 6.46, -- Staggering Strikes
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2700 - 3000 (avg 2840), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[3] = { 4.22, 8.47 }, -- Sphere of Suppression
			[12] = { 6.34, 2.35 }, -- The Crucible of Flame
			[27] = { 8.27, 4.67 }, -- Memory of Lucid Dreams
			[32] = { 3.61, 4.19 }, -- Conflict and Strife
			[2] = { 3.42, 3.98 }, -- Azeroth's Undying Gift
			[22] = { 2.38, 5.64 }, -- Vision of Perfection
			[7] = { 0, 3.28 }, -- Anima of Life and Death
			[13] = { 6.24, 10 }, -- Nullification Dynamo
			[15] = { 3.29, 2.41 }, -- Ripple in Space
			[25] = { 0.65, 1.88 }, -- Aegis of the Deep
			[4] = { 2.64, 6.11 }, -- Worldvein Resonance
		}, 1577181600)

		insertDefaultScalesData(defensiveName, 2, 2, { -- Protection Paladin (TMI)
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 5107 - 5604 (avg 5407), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[479] = 3.66, -- Dagger in the Back
			[575] = 2.85, -- Undulating Tides
			[463] = 5.56, -- Blessed Portents
			[523] = 0.23, -- Apothecary's Concoctions
			[189] = 5, -- Righteous Conviction
			[44] = 0.91, -- Vampiric Speed
			[20] = 0.51, -- Lifespeed
			[454] = 4.7, -- Judicious Defense
			[538] = 4.23, -- Empyreal Ward
			[395] = 3.7, -- Inspiring Vanguard
			[196] = 3.18, -- Swirling Sands
			[86] = 1.52, -- Azerite Fortification
			[156] = 0.02, -- Ruinous Bolt
			[193] = 1.76, -- Blightborne Infusion
			[99] = 10, -- Ablative Shielding
			[478] = 1.94, -- Tidal Surge
			[576] = 3.95, -- Loyal to the End
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 5203 - 5503 (avg 5400), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[12] = { 0, 3.1 }, -- The Crucible of Flame
			[15] = { 2.24, 0 }, -- Ripple in Space
			[2] = { 0, 10 }, -- Azeroth's Undying Gift
			[3] = { 1.25, 0 }, -- Sphere of Suppression
		}, 1577181600)

		insertDefaultScalesData(defensiveName, 1, 3, { -- Protection Warrior (TMI)
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4400 - 4804 (avg 4600), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[43] = 5.21, -- Winds of War
			[560] = 1.33, -- Bonded Souls
			[476] = 4.81, -- Moment of Glory
			[561] = 0.44, -- Seductive Power
			[31] = 2.49, -- Gutripper
			[237] = 5.39, -- Bastion of Might
			[86] = 4.4, -- Azerite Fortification
			[103] = 1.65, -- Concentrated Mending
			[101] = 5.55, -- Shimmering Haven
			[522] = 8.45, -- Ancients' Bulwark
			[82] = 6.84, -- Champion of Azeroth
			[569] = 4.18, -- Clockwork Heart
			[562] = 5.34, -- Treacherous Covenant
			[156] = 1.99, -- Ruinous Bolt
			[105] = 2.08, -- Ephemeral Recovery
			[493] = 0.44, -- Last Gift
			[83] = 3.75, -- Impassive Visage
			[84] = 2.37, -- Bulwark of the Masses
			[461] = 1.42, -- Earthlink
			[483] = 5.16, -- Archive of the Titans
			[480] = 7.24, -- Blood Rite
			[463] = 8.4, -- Blessed Portents
			[22] = 1.76, -- Heed My Call
			[100] = 3.49, -- Strength in Numbers
			[177] = 2.76, -- Bloodsport
			[89] = 4.84, -- Azerite Veins
			[15] = 7.89, -- Resounding Protection
			[441] = 1.97, -- Iron Fortress
			[196] = 6.9, -- Swirling Sands
			[495] = 6.56, -- Anduin's Dedication
			[193] = 4.82, -- Blightborne Infusion
			[13] = 1.62, -- Azerite Empowered
			[492] = 2.29, -- Liberator's Might
			[577] = 0.7, -- Arcane Heart
			[485] = 3.85, -- Laser Matrix
			[505] = 1.23, -- Tradewinds
			[459] = 0.21, -- Unstable Flames
			[479] = 3.73, -- Dagger in the Back
			[20] = 4.21, -- Lifespeed
			[576] = 0.97, -- Loyal to the End
			[482] = 3.2, -- Thunderous Blast
			[498] = 3.62, -- Barrage Of Many Bombs
			[440] = 8.31, -- Callous Reprisal
			[194] = 8.07, -- Filthy Transfusion
			[19] = 8.37, -- Woundbinder
			[541] = 4.54, -- Fight or Flight
			[462] = 8.4, -- Azerite Globules
			[21] = 4.24, -- Elemental Whirl
			[481] = 2.82, -- Incite the Pack
			[104] = 6.69, -- Bracing Chill
			[501] = 10, -- Relational Normalization Gizmo
			[118] = 0.01, -- Deafening Crash
			[554] = 2.21, -- Intimidating Presence
			[38] = 7.51, -- On My Way
			[18] = 4.95, -- Blood Siphon
			[523] = 8.01, -- Apothecary's Concoctions
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4501 - 4802 (avg 4601), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 24.12.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[3] = { 1.87, 0.15 }, -- Sphere of Suppression
			[4] = { 10, 2.05 }, -- Worldvein Resonance
			[22] = { 0, 0.47 }, -- Vision of Perfection
			[12] = { 4.45, 0 }, -- The Crucible of Flame
			[15] = { 1.81, 1.63 }, -- Ripple in Space
			[27] = { 0, 3.03 }, -- Memory of Lucid Dreams
			[13] = { 1.5, 5.28 }, -- Nullification Dynamo
			[25] = { 1.69, 8.44 }, -- Aegis of the Deep
			[7] = { 0, 2.73 }, -- Anima of Life and Death
			[2] = { 0, 3.01 }, -- Azeroth's Undying Gift
		}, 1577181600)

		insertDefaultScalesData(defaultName, 5, 3, { -- Shadow Priest
			-- Shadow Priest by WarcraftPriests (https://warcraftpriests.com/)
			-- https://github.com/WarcraftPriests/bfa-shadow-priest/blob/master/azerite-traits/AzeritePowerWeights_AS.md
			-- First Imported: 03.09.2018, Updated: 24.12.2019
			[405] = 5.94,
			[575] = 5.25,
			[193] = 4.33,
			[236] = 4.31,
			[82] = 3.95,
			[522] = 3.94,
			[526] = 3.92,
			[196] = 3.9,
			[562] = 3.56,
			[479] = 3.4,
			[488] = 3.34,
			[192] = 3.27,
			[157] = 3.18,
			[501] = 3.13,
			[569] = 3.13,
			[403] = 2.9,
			[30] = 2.85,
			[505] = 2.74,
			[482] = 2.74,
			[523] = 2.7,
			[194] = 2.67,
			[504] = 2.67,
			[486] = 2.6,
			[478] = 2.58,
			[521] = 2.56,
			[480] = 2.56,
			[481] = 2.53,
			[404] = 2.48,
			[195] = 2.38,
			[489] = 2.31,
			[561] = 2.3,
			[498] = 2.12,
			[577] = 1.86,
			[31] = 1.6,
			[560] = 1.59,
			[156] = 1.54,
			[459] = 1.52,
			[22] = 1.48,
			[487] = 1.45,
			[21] = 1.36,
			[500] = 1.35,
			[499] = 1.28,
			[38] = 1.12,
			[491] = 1.03,
			[166] = 1.02,
			[18] = 1,
			[462] = 0.97,
			[541] = 0.9,
			[490] = 0.86,
			[461] = 0.8,
			[13] = 0.31,
		}, {
		}, 1577181600)

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
		}, 1577181600)


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

		insertDefaultScalesData(defaultName, 2, 1, { -- Holy Paladin

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