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
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 3167 - 5584 (avg 4028), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[483] = 6.8, -- Archive of the Titans
			[156] = 4.62, -- Ruinous Bolt
			[526] = 7.92, -- Endless Hunger
			[494] = 8.77, -- Battlefield Precision
			[21] = 2.31, -- Elemental Whirl
			[498] = 5.56, -- Barrage Of Many Bombs
			[502] = 0.01, -- Personal Absorb-o-Tron
			[84] = 0.01, -- Bulwark of the Masses
			[523] = 6.86, -- Apothecary's Concoctions
			[461] = 2.17, -- Earthlink
			[193] = 7.31, -- Blightborne Infusion
			[352] = 9.33, -- Thirsting Blades
			[462] = 2.58, -- Azerite Globules
			[31] = 4.2, -- Gutripper
			[495] = 6.1, -- Anduin's Dedication
			[157] = 8.48, -- Rezan's Fury
			[500] = 4.25, -- Synaptic Spark Capacitor
			[562] = 10, -- Treacherous Covenant
			[501] = 6.45, -- Relational Normalization Gizmo
			[82] = 6.57, -- Champion of Azeroth
			[20] = 1.99, -- Lifespeed
			[560] = 2.56, -- Bonded Souls
			[479] = 8.82, -- Dagger in the Back
			[499] = 3, -- Ricocheting Inflatable Pyrosaw
			[14] = 0.06, -- Longstrider
			[353] = 4.93, -- Eyes of Rage
			[493] = 2.48, -- Last Gift
			[87] = 0.01, -- Self Reliance
			[521] = 4.48, -- Shadow of Elune
			[43] = 0.01, -- Winds of War
			[194] = 7.27, -- Filthy Transfusion
			[522] = 7.75, -- Ancients' Bulwark
			[485] = 7.67, -- Laser Matrix
			[480] = 4.52, -- Blood Rite
			[159] = 9.9, -- Furious Gaze
			[478] = 7.72, -- Tidal Surge
			[505] = 4.36, -- Tradewinds
			[496] = 1.44, -- Stronger Together
			[15] = 0.01, -- Resounding Protection
			[459] = 2.57, -- Unstable Flames
			[18] = 1.51, -- Blood Siphon
			[503] = 0.02, -- Auto-Self-Cauterizer
			[504] = 7.3, -- Unstable Catalyst
			[497] = 1.64, -- Stand As One
			[245] = 6.94, -- Seething Power
			[561] = 5.79, -- Seductive Power
			[482] = 7.18, -- Thunderous Blast
			[195] = 6.49, -- Secrets of the Deep
			[492] = 4.39, -- Liberator's Might
			[22] = 3.79, -- Heed My Call
			[192] = 3.49, -- Meticulous Scheming
			[481] = 4.03, -- Incite the Pack
			[196] = 6.54, -- Swirling Sands
			[220] = 7.25, -- Chaotic Transformation
			[126] = 8.05, -- Revolving Blades
			[30] = 4.64, -- Overwhelming Power
			[541] = 2.31, -- Fight or Flight
		}, 1552989600)

		insertDefaultScalesData(offensiveName, 12, 2, { -- Vengeance Demon Hunter
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 4899 - 7949 (avg 5398), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[482] = 8.29, -- Thunderous Blast
			[502] = 0.09, -- Personal Absorb-o-Tron
			[354] = 0.16, -- Cycle of Binding
			[195] = 5.32, -- Secrets of the Deep
			[478] = 10, -- Tidal Surge
			[495] = 5.11, -- Anduin's Dedication
			[156] = 5.98, -- Ruinous Bolt
			[196] = 6.66, -- Swirling Sands
			[497] = 1.49, -- Stand As One
			[134] = 0.06, -- Revel in Pain
			[157] = 9.93, -- Rezan's Fury
			[466] = 0.08, -- Burning Soul
			[221] = 0.08, -- Rigid Carapace
			[561] = 4.46, -- Seductive Power
			[100] = 0.08, -- Strength in Numbers
			[492] = 3.9, -- Liberator's Might
			[483] = 5.89, -- Archive of the Titans
			[193] = 7.35, -- Blightborne Infusion
			[30] = 3.11, -- Overwhelming Power
			[493] = 2.6, -- Last Gift
			[15] = 0.05, -- Resounding Protection
			[521] = 3.76, -- Shadow of Elune
			[461] = 1.78, -- Earthlink
			[459] = 2.71, -- Unstable Flames
			[560] = 1.51, -- Bonded Souls
			[500] = 7.76, -- Synaptic Spark Capacitor
			[98] = 0.01, -- Crystalline Carapace
			[14] = 0.02, -- Longstrider
			[501] = 5.45, -- Relational Normalization Gizmo
			[20] = 1.48, -- Lifespeed
			[564] = 0.02, -- Thrive in Chaos
			[43] = 0.13, -- Winds of War
			[21] = 2.11, -- Elemental Whirl
			[85] = 0.15, -- Gemhide
			[355] = 0.15, -- Essence Sever
			[82] = 6.1, -- Champion of Azeroth
			[481] = 4.37, -- Incite the Pack
			[485] = 8.64, -- Laser Matrix
			[505] = 4.68, -- Tradewinds
			[499] = 3.8, -- Ricocheting Inflatable Pyrosaw
			[99] = 0.02, -- Ablative Shielding
			[18] = 1.84, -- Blood Siphon
			[22] = 4.22, -- Heed My Call
			[479] = 7.13, -- Dagger in the Back
			[494] = 9.88, -- Battlefield Precision
			[86] = 0.09, -- Azerite Fortification
			[101] = 0.02, -- Shimmering Haven
			[522] = 6.25, -- Ancients' Bulwark
			[526] = 6.23, -- Endless Hunger
			[562] = 8.3, -- Treacherous Covenant
			[480] = 3.61, -- Blood Rite
			[194] = 9.02, -- Filthy Transfusion
			[541] = 2.01, -- Fight or Flight
			[87] = 0.24, -- Self Reliance
			[498] = 6.23, -- Barrage Of Many Bombs
			[31] = 4.61, -- Gutripper
			[160] = 0.05, -- Infernal Armor
			[462] = 2.8, -- Azerite Globules
			[503] = 0.03, -- Auto-Self-Cauterizer
			[84] = 0.07, -- Bulwark of the Masses
			[496] = 1.23, -- Stronger Together
			[89] = 0.06, -- Azerite Veins
			[192] = 4.91, -- Meticulous Scheming
			[504] = 6.23, -- Unstable Catalyst
			[523] = 6.5, -- Apothecary's Concoctions
		}, 1552989600)

		insertDefaultScalesData(offensiveName, 6, 1, { -- Blood Death Knight
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 7264 - 10240 (avg 7849), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[504] = 5.9, -- Unstable Catalyst
			[461] = 1.94, -- Earthlink
			[82] = 6.09, -- Champion of Azeroth
			[498] = 6.48, -- Barrage Of Many Bombs
			[497] = 1.38, -- Stand As One
			[349] = 0.43, -- Bones of the Damned
			[496] = 1.29, -- Stronger Together
			[192] = 4.6, -- Meticulous Scheming
			[348] = 4.87, -- Eternal Rune Weapon
			[21] = 2.14, -- Elemental Whirl
			[100] = 0.08, -- Strength in Numbers
			[99] = 0.13, -- Ablative Shielding
			[20] = 1.51, -- Lifespeed
			[85] = 0.1, -- Gemhide
			[89] = 0.01, -- Azerite Veins
			[499] = 3.95, -- Ricocheting Inflatable Pyrosaw
			[541] = 1.94, -- Fight or Flight
			[140] = 1.11, -- Bone Spike Graveyard
			[194] = 9.29, -- Filthy Transfusion
			[481] = 4.28, -- Incite the Pack
			[492] = 3.86, -- Liberator's Might
			[30] = 3.22, -- Overwhelming Power
			[502] = 0.07, -- Personal Absorb-o-Tron
			[482] = 8.76, -- Thunderous Blast
			[243] = 4.02, -- Bloody Runeblade
			[156] = 5.59, -- Ruinous Bolt
			[22] = 4.44, -- Heed My Call
			[15] = 0.05, -- Resounding Protection
			[521] = 3.52, -- Shadow of Elune
			[44] = 0.23, -- Vampiric Speed
			[560] = 1.65, -- Bonded Souls
			[494] = 10, -- Battlefield Precision
			[500] = 5.16, -- Synaptic Spark Capacitor
			[485] = 8.8, -- Laser Matrix
			[526] = 6.7, -- Endless Hunger
			[18] = 1.83, -- Blood Siphon
			[14] = 0.15, -- Longstrider
			[197] = 0.01, -- Marrowblood
			[523] = 8.16, -- Apothecary's Concoctions
			[86] = 0.08, -- Azerite Fortification
			[193] = 7.28, -- Blightborne Infusion
			[480] = 3.56, -- Blood Rite
			[101] = 0.16, -- Shimmering Haven
			[562] = 8.02, -- Treacherous Covenant
			[13] = 0.11, -- Azerite Empowered
			[462] = 2.97, -- Azerite Globules
			[43] = 0.2, -- Winds of War
			[522] = 6.73, -- Ancients' Bulwark
			[459] = 2.58, -- Unstable Flames
			[98] = 0.08, -- Crystalline Carapace
			[479] = 7.43, -- Dagger in the Back
			[31] = 5, -- Gutripper
			[465] = 0.06, -- March of the Damned
			[493] = 2.53, -- Last Gift
			[157] = 10, -- Rezan's Fury
			[505] = 4.59, -- Tradewinds
			[196] = 6.55, -- Swirling Sands
			[84] = 0.12, -- Bulwark of the Masses
			[106] = 2.84, -- Deep Cuts
			[478] = 9.18, -- Tidal Surge
			[503] = 0.12, -- Auto-Self-Cauterizer
			[483] = 5.69, -- Archive of the Titans
			[495] = 4.99, -- Anduin's Dedication
			[561] = 4.82, -- Seductive Power
			[549] = 0.05, -- Cold Hearted
			[501] = 5.17, -- Relational Normalization Gizmo
			[195] = 5.28, -- Secrets of the Deep
		}, 1552989600)

		insertDefaultScalesData(defaultName, 6, 2, { -- Frost Death Knight
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 15382 - 19563 (avg 16546), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[459] = 3.2, -- Unstable Flames
			[85] = 0.04, -- Gemhide
			[560] = 2.16, -- Bonded Souls
			[523] = 5.93, -- Apothecary's Concoctions
			[198] = 5.15, -- Frostwhelp's Indignation
			[485] = 6.44, -- Laser Matrix
			[242] = 4.72, -- Echoing Howl
			[195] = 6.59, -- Secrets of the Deep
			[493] = 3.74, -- Last Gift
			[526] = 8.37, -- Endless Hunger
			[522] = 8.51, -- Ancients' Bulwark
			[462] = 2.26, -- Azerite Globules
			[495] = 6.6, -- Anduin's Dedication
			[498] = 4.62, -- Barrage Of Many Bombs
			[89] = 0.1, -- Azerite Veins
			[496] = 1.65, -- Stronger Together
			[13] = 0.05, -- Azerite Empowered
			[30] = 4.05, -- Overwhelming Power
			[156] = 4.59, -- Ruinous Bolt
			[193] = 8.85, -- Blightborne Infusion
			[492] = 5.26, -- Liberator's Might
			[347] = 5.94, -- Frozen Tempest
			[84] = 0.02, -- Bulwark of the Masses
			[346] = 4.8, -- Killer Frost
			[562] = 10, -- Treacherous Covenant
			[20] = 2.19, -- Lifespeed
			[31] = 3.48, -- Gutripper
			[494] = 7.06, -- Battlefield Precision
			[480] = 4.56, -- Blood Rite
			[497] = 1.69, -- Stand As One
			[141] = 5.7, -- Latent Chill
			[499] = 2.89, -- Ricocheting Inflatable Pyrosaw
			[481] = 6.32, -- Incite the Pack
			[18] = 2.62, -- Blood Siphon
			[502] = 0.01, -- Personal Absorb-o-Tron
			[101] = 0.07, -- Shimmering Haven
			[461] = 2.26, -- Earthlink
			[99] = 0.03, -- Ablative Shielding
			[478] = 7.71, -- Tidal Surge
			[157] = 7.33, -- Rezan's Fury
			[521] = 4.58, -- Shadow of Elune
			[479] = 7.65, -- Dagger in the Back
			[22] = 3.21, -- Heed My Call
			[504] = 7.54, -- Unstable Catalyst
			[501] = 6.69, -- Relational Normalization Gizmo
			[505] = 6.75, -- Tradewinds
			[108] = 5.44, -- Icy Citadel
			[500] = 4.1, -- Synaptic Spark Capacitor
			[192] = 4.54, -- Meticulous Scheming
			[82] = 7.91, -- Champion of Azeroth
			[549] = 0.07, -- Cold Hearted
			[21] = 2.76, -- Elemental Whirl
			[541] = 2.39, -- Fight or Flight
			[482] = 6.32, -- Thunderous Blast
			[98] = 0.05, -- Crystalline Carapace
			[196] = 8, -- Swirling Sands
			[561] = 5.4, -- Seductive Power
			[14] = 0.08, -- Longstrider
			[483] = 7.01, -- Archive of the Titans
			[194] = 6.69, -- Filthy Transfusion
		}, 1552989600)

		insertDefaultScalesData(defaultName, 6, 3, { -- Unholy Death Knight
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 8433 - 11676 (avg 9130), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[31] = 3.29, -- Gutripper
			[13] = 0.07, -- Azerite Empowered
			[522] = 7.45, -- Ancients' Bulwark
			[140] = 0.01, -- Bone Spike Graveyard
			[504] = 6.44, -- Unstable Catalyst
			[560] = 2.21, -- Bonded Souls
			[87] = 0.05, -- Self Reliance
			[497] = 1.51, -- Stand As One
			[82] = 6.78, -- Champion of Azeroth
			[498] = 4.66, -- Barrage Of Many Bombs
			[501] = 5.87, -- Relational Normalization Gizmo
			[494] = 7.08, -- Battlefield Precision
			[101] = 0.04, -- Shimmering Haven
			[478] = 7.18, -- Tidal Surge
			[499] = 2.77, -- Ricocheting Inflatable Pyrosaw
			[156] = 4.29, -- Ruinous Bolt
			[495] = 5.62, -- Anduin's Dedication
			[496] = 1.25, -- Stronger Together
			[20] = 2.05, -- Lifespeed
			[521] = 4.41, -- Shadow of Elune
			[351] = 3.62, -- Last Surprise
			[483] = 5.8, -- Archive of the Titans
			[22] = 3, -- Heed My Call
			[562] = 8.94, -- Treacherous Covenant
			[201] = 0.07, -- Runic Barrier
			[561] = 4.62, -- Seductive Power
			[485] = 6.34, -- Laser Matrix
			[505] = 4.84, -- Tradewinds
			[196] = 6.83, -- Swirling Sands
			[482] = 6.08, -- Thunderous Blast
			[193] = 7.62, -- Blightborne Infusion
			[461] = 1.97, -- Earthlink
			[480] = 4.25, -- Blood Rite
			[492] = 4.56, -- Liberator's Might
			[109] = 8.6, -- Magus of the Dead
			[30] = 4.11, -- Overwhelming Power
			[523] = 5.9, -- Apothecary's Concoctions
			[541] = 1.99, -- Fight or Flight
			[18] = 1.82, -- Blood Siphon
			[142] = 6.47, -- Helchains
			[500] = 3.9, -- Synaptic Spark Capacitor
			[199] = 10, -- Festermight
			[481] = 4.46, -- Incite the Pack
			[462] = 2.05, -- Azerite Globules
			[195] = 5.59, -- Secrets of the Deep
			[14] = 0.04, -- Longstrider
			[192] = 5.02, -- Meticulous Scheming
			[85] = 0.05, -- Gemhide
			[21] = 2.46, -- Elemental Whirl
			[157] = 7.3, -- Rezan's Fury
			[350] = 4.34, -- Cankerous Wounds
			[479] = 7.52, -- Dagger in the Back
			[244] = 6.35, -- Harrowing Decay
			[99] = 0.04, -- Ablative Shielding
			[194] = 6.49, -- Filthy Transfusion
			[526] = 7.37, -- Endless Hunger
			[493] = 2.69, -- Last Gift
			[459] = 2.64, -- Unstable Flames
		}, 1552989600)

		insertDefaultScalesData(defaultName, 11, 1, { -- Balance Druid
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 10050 - 13013 (avg 10949), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[494] = 3.94, -- Battlefield Precision
			[38] = 1.2, -- On My Way
			[499] = 1.44, -- Ricocheting Inflatable Pyrosaw
			[356] = 1.7, -- High Noon
			[122] = 3.69, -- Streaking Stars
			[562] = 5.41, -- Treacherous Covenant
			[492] = 2.68, -- Liberator's Might
			[560] = 1.48, -- Bonded Souls
			[31] = 1.8, -- Gutripper
			[20] = 1.25, -- Lifespeed
			[495] = 3.4, -- Anduin's Dedication
			[462] = 1.07, -- Azerite Globules
			[196] = 3.85, -- Swirling Sands
			[459] = 1.47, -- Unstable Flames
			[364] = 2.57, -- Lively Spirit
			[496] = 0.82, -- Stronger Together
			[541] = 1.19, -- Fight or Flight
			[157] = 3.79, -- Rezan's Fury
			[523] = 3.22, -- Apothecary's Concoctions
			[193] = 4.37, -- Blightborne Infusion
			[493] = 2.15, -- Last Gift
			[195] = 3.55, -- Secrets of the Deep
			[505] = 4.02, -- Tradewinds
			[250] = 3.58, -- Dawning Sun
			[21] = 1.53, -- Elemental Whirl
			[82] = 4.5, -- Champion of Azeroth
			[497] = 0.79, -- Stand As One
			[483] = 3.73, -- Archive of the Titans
			[482] = 3.38, -- Thunderous Blast
			[479] = 3.97, -- Dagger in the Back
			[194] = 3.48, -- Filthy Transfusion
			[480] = 2.77, -- Blood Rite
			[500] = 1.92, -- Synaptic Spark Capacitor
			[485] = 3.45, -- Laser Matrix
			[501] = 3.67, -- Relational Normalization Gizmo
			[521] = 2.72, -- Shadow of Elune
			[526] = 4.34, -- Endless Hunger
			[478] = 3.6, -- Tidal Surge
			[18] = 1.47, -- Blood Siphon
			[522] = 4.29, -- Ancients' Bulwark
			[561] = 3.07, -- Seductive Power
			[200] = 10, -- Arcanic Pulsar
			[173] = 2.24, -- Power of the Moon
			[156] = 2.11, -- Ruinous Bolt
			[481] = 3.74, -- Incite the Pack
			[30] = 2.68, -- Overwhelming Power
			[192] = 3.61, -- Meticulous Scheming
			[461] = 1.1, -- Earthlink
			[504] = 4.02, -- Unstable Catalyst
			[22] = 1.7, -- Heed My Call
			[498] = 2.42, -- Barrage Of Many Bombs
		}, 1552989600)

		insertDefaultScalesData(defaultName, 11, 2, { -- Feral Druid
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 15079 - 18488 (avg 15934), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[38] = 1.96, -- On My Way
			[85] = 0.06, -- Gemhide
			[494] = 6.2, -- Battlefield Precision
			[171] = 0.03, -- Masterful Instincts
			[15] = 0.05, -- Resounding Protection
			[196] = 7.28, -- Swirling Sands
			[493] = 3.15, -- Last Gift
			[43] = 0.04, -- Winds of War
			[192] = 4.84, -- Meticulous Scheming
			[498] = 3.86, -- Barrage Of Many Bombs
			[247] = 1.4, -- Iron Jaws
			[19] = 0.15, -- Woundbinder
			[18] = 2.14, -- Blood Siphon
			[241] = 0.01, -- Twisted Claws
			[500] = 3.6, -- Synaptic Spark Capacitor
			[501] = 5.64, -- Relational Normalization Gizmo
			[480] = 4.26, -- Blood Rite
			[482] = 5, -- Thunderous Blast
			[82] = 7.06, -- Champion of Azeroth
			[502] = 0.07, -- Personal Absorb-o-Tron
			[13] = 0.01, -- Azerite Empowered
			[505] = 5.73, -- Tradewinds
			[467] = 0.09, -- Ursoc's Endurance
			[20] = 2.01, -- Lifespeed
			[492] = 4.66, -- Liberator's Might
			[101] = 0.02, -- Shimmering Haven
			[99] = 0.02, -- Ablative Shielding
			[44] = 0.05, -- Vampiric Speed
			[194] = 5.05, -- Filthy Transfusion
			[562] = 8.15, -- Treacherous Covenant
			[156] = 4.01, -- Ruinous Bolt
			[526] = 6.73, -- Endless Hunger
			[89] = 0.04, -- Azerite Veins
			[193] = 8.17, -- Blightborne Infusion
			[497] = 1.47, -- Stand As One
			[496] = 1.33, -- Stronger Together
			[504] = 5.79, -- Unstable Catalyst
			[521] = 4.3, -- Shadow of Elune
			[499] = 2.31, -- Ricocheting Inflatable Pyrosaw
			[21] = 2.45, -- Elemental Whirl
			[169] = 3.23, -- Untamed Ferocity
			[523] = 4.96, -- Apothecary's Concoctions
			[358] = 6.22, -- Gushing Lacerations
			[14] = 0.07, -- Longstrider
			[478] = 6.65, -- Tidal Surge
			[541] = 1.89, -- Fight or Flight
			[173] = 0.04, -- Power of the Moon
			[522] = 6.68, -- Ancients' Bulwark
			[459] = 2.63, -- Unstable Flames
			[495] = 5.17, -- Anduin's Dedication
			[30] = 3.41, -- Overwhelming Power
			[209] = 10, -- Jungle Fury
			[485] = 5.33, -- Laser Matrix
			[560] = 2.02, -- Bonded Souls
			[111] = 6.07, -- Blood Mist
			[84] = 0.07, -- Bulwark of the Masses
			[157] = 6.18, -- Rezan's Fury
			[86] = 0.04, -- Azerite Fortification
			[483] = 5.7, -- Archive of the Titans
			[104] = 0.01, -- Bracing Chill
			[31] = 2.85, -- Gutripper
			[22] = 2.75, -- Heed My Call
			[479] = 6.27, -- Dagger in the Back
			[359] = 6.72, -- Wild Fleshrending
			[103] = 0.11, -- Concentrated Mending
			[463] = 0.01, -- Blessed Portents
			[195] = 5.24, -- Secrets of the Deep
			[461] = 1.96, -- Earthlink
			[462] = 1.73, -- Azerite Globules
			[219] = 0.1, -- Reawakening
			[481] = 5.27, -- Incite the Pack
			[561] = 4.12, -- Seductive Power
		}, 1552989600)

		insertDefaultScalesData(offensiveName, 11, 3, { -- Guardian Druid
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 5681 - 8286 (avg 6196), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[481] = 4.23, -- Incite the Pack
			[478] = 10, -- Tidal Surge
			[156] = 5.97, -- Ruinous Bolt
			[361] = 4.94, -- Guardian's Wrath
			[541] = 1.81, -- Fight or Flight
			[521] = 4.51, -- Shadow of Elune
			[483] = 5.46, -- Archive of the Titans
			[479] = 6.99, -- Dagger in the Back
			[21] = 2.19, -- Elemental Whirl
			[192] = 5.9, -- Meticulous Scheming
			[105] = 0.08, -- Ephemeral Recovery
			[461] = 1.55, -- Earthlink
			[485] = 8.69, -- Laser Matrix
			[523] = 8.01, -- Apothecary's Concoctions
			[493] = 2.44, -- Last Gift
			[38] = 1.88, -- On My Way
			[241] = 6.09, -- Twisted Claws
			[462] = 2.94, -- Azerite Globules
			[499] = 3.74, -- Ricocheting Inflatable Pyrosaw
			[195] = 5.23, -- Secrets of the Deep
			[560] = 2.09, -- Bonded Souls
			[494] = 9.8, -- Battlefield Precision
			[504] = 5.77, -- Unstable Catalyst
			[522] = 6.87, -- Ancients' Bulwark
			[562] = 8.03, -- Treacherous Covenant
			[193] = 6.85, -- Blightborne Infusion
			[101] = 0.02, -- Shimmering Haven
			[459] = 2.37, -- Unstable Flames
			[496] = 1.21, -- Stronger Together
			[561] = 4.29, -- Seductive Power
			[196] = 6.1, -- Swirling Sands
			[20] = 2.07, -- Lifespeed
			[480] = 4.46, -- Blood Rite
			[492] = 4.22, -- Liberator's Might
			[526] = 6.78, -- Endless Hunger
			[251] = 5.44, -- Burst of Savagery
			[157] = 9.71, -- Rezan's Fury
			[82] = 6.47, -- Champion of Azeroth
			[505] = 4.75, -- Tradewinds
			[500] = 5.34, -- Synaptic Spark Capacitor
			[359] = 1.95, -- Wild Fleshrending
			[497] = 1.22, -- Stand As One
			[501] = 5.8, -- Relational Normalization Gizmo
			[22] = 4.2, -- Heed My Call
			[30] = 3.78, -- Overwhelming Power
			[31] = 4.65, -- Gutripper
			[18] = 1.79, -- Blood Siphon
			[495] = 4.92, -- Anduin's Dedication
			[498] = 6.29, -- Barrage Of Many Bombs
			[482] = 8.18, -- Thunderous Blast
			[194] = 8.57, -- Filthy Transfusion
		}, 1552989600)

		insertDefaultScalesData(defaultName, 3, 1, { -- Beast Mastery Hunter
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 8292 - 10691 (avg 9007), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[365] = 6.99, -- Dire Consequences
			[521] = 4.93, -- Shadow of Elune
			[480] = 4.83, -- Blood Rite
			[496] = 1.45, -- Stronger Together
			[495] = 5.61, -- Anduin's Dedication
			[482] = 5.38, -- Thunderous Blast
			[562] = 8.89, -- Treacherous Covenant
			[83] = 0.01, -- Impassive Visage
			[367] = 7.73, -- Feeding Frenzy
			[526] = 6.64, -- Endless Hunger
			[192] = 6.43, -- Meticulous Scheming
			[31] = 3.07, -- Gutripper
			[461] = 1.9, -- Earthlink
			[498] = 4.14, -- Barrage Of Many Bombs
			[21] = 2.45, -- Elemental Whirl
			[84] = 0.03, -- Bulwark of the Masses
			[523] = 5.22, -- Apothecary's Concoctions
			[499] = 2.46, -- Ricocheting Inflatable Pyrosaw
			[492] = 4.21, -- Liberator's Might
			[195] = 5.66, -- Secrets of the Deep
			[459] = 2.4, -- Unstable Flames
			[22] = 3.04, -- Heed My Call
			[481] = 5.07, -- Incite the Pack
			[504] = 6.4, -- Unstable Catalyst
			[157] = 6.62, -- Rezan's Fury
			[87] = 0.07, -- Self Reliance
			[483] = 6.29, -- Archive of the Titans
			[522] = 6.7, -- Ancients' Bulwark
			[107] = 4.49, -- Serrated Jaws
			[211] = 6.04, -- Dance of Death
			[366] = 10, -- Primal Instincts
			[194] = 5.48, -- Filthy Transfusion
			[497] = 1.52, -- Stand As One
			[193] = 6.99, -- Blightborne Infusion
			[82] = 6.78, -- Champion of Azeroth
			[561] = 4.62, -- Seductive Power
			[505] = 5.62, -- Tradewinds
			[485] = 5.68, -- Laser Matrix
			[500] = 3.82, -- Synaptic Spark Capacitor
			[494] = 6.31, -- Battlefield Precision
			[14] = 0.09, -- Longstrider
			[462] = 1.86, -- Azerite Globules
			[493] = 3.03, -- Last Gift
			[156] = 3.95, -- Ruinous Bolt
			[203] = 0.07, -- Shellshock
			[85] = 0.06, -- Gemhide
			[479] = 6.7, -- Dagger in the Back
			[503] = 0.14, -- Auto-Self-Cauterizer
			[501] = 6.14, -- Relational Normalization Gizmo
			[478] = 6.92, -- Tidal Surge
			[541] = 2.19, -- Fight or Flight
			[30] = 3.73, -- Overwhelming Power
			[560] = 2.15, -- Bonded Souls
			[161] = 6.68, -- Haze of Rage
			[18] = 2.06, -- Blood Siphon
			[196] = 5.81, -- Swirling Sands
		}, 1552989600)

		insertDefaultScalesData(defaultName, 3, 2, { -- Marksmanship Hunter
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 11154 - 14194 (avg 11967), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[459] = 2.43, -- Unstable Flames
			[36] = 10, -- In The Rhythm
			[482] = 5.13, -- Thunderous Blast
			[495] = 4.77, -- Anduin's Dedication
			[526] = 6.87, -- Endless Hunger
			[370] = 9.69, -- Focused Fire
			[22] = 2.7, -- Heed My Call
			[481] = 5.04, -- Incite the Pack
			[497] = 1.23, -- Stand As One
			[478] = 6.34, -- Tidal Surge
			[500] = 3.57, -- Synaptic Spark Capacitor
			[493] = 3.02, -- Last Gift
			[462] = 1.7, -- Azerite Globules
			[522] = 7.02, -- Ancients' Bulwark
			[562] = 7.87, -- Treacherous Covenant
			[31] = 2.9, -- Gutripper
			[162] = 7.68, -- Surging Shots
			[195] = 5.06, -- Secrets of the Deep
			[156] = 3.91, -- Ruinous Bolt
			[192] = 6.09, -- Meticulous Scheming
			[479] = 6.37, -- Dagger in the Back
			[196] = 6.22, -- Swirling Sands
			[501] = 5.79, -- Relational Normalization Gizmo
			[502] = 0.08, -- Personal Absorb-o-Tron
			[157] = 6.23, -- Rezan's Fury
			[21] = 2.33, -- Elemental Whirl
			[498] = 3.79, -- Barrage Of Many Bombs
			[212] = 7.56, -- Unerring Vision
			[561] = 4.01, -- Seductive Power
			[18] = 2.34, -- Blood Siphon
			[194] = 5.48, -- Filthy Transfusion
			[492] = 4.24, -- Liberator's Might
			[560] = 2.06, -- Bonded Souls
			[505] = 5.49, -- Tradewinds
			[496] = 1.36, -- Stronger Together
			[13] = 0.11, -- Azerite Empowered
			[480] = 4.89, -- Blood Rite
			[193] = 6.86, -- Blightborne Infusion
			[521] = 4.76, -- Shadow of Elune
			[485] = 5.36, -- Laser Matrix
			[483] = 5.41, -- Archive of the Titans
			[30] = 4.07, -- Overwhelming Power
			[504] = 5.38, -- Unstable Catalyst
			[523] = 4.9, -- Apothecary's Concoctions
			[499] = 2.22, -- Ricocheting Inflatable Pyrosaw
			[368] = 3.64, -- Steady Aim
			[494] = 5.92, -- Battlefield Precision
			[44] = 0.13, -- Vampiric Speed
			[461] = 1.72, -- Earthlink
			[82] = 6.72, -- Champion of Azeroth
			[541] = 1.85, -- Fight or Flight
		}, 1552989600)

		insertDefaultScalesData(defaultName, 3, 3, { -- Survival Hunter
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 7037 - 10183 (avg 8457), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[522] = 6.4, -- Ancients' Bulwark
			[372] = 10, -- Wilderness Survival
			[500] = 3.27, -- Synaptic Spark Capacitor
			[31] = 2.83, -- Gutripper
			[485] = 5.39, -- Laser Matrix
			[493] = 2.06, -- Last Gift
			[82] = 5.95, -- Champion of Azeroth
			[110] = 2.63, -- Wildfire Cluster
			[480] = 4.75, -- Blood Rite
			[497] = 1.32, -- Stand As One
			[192] = 5.32, -- Meticulous Scheming
			[21] = 1.96, -- Elemental Whirl
			[87] = 0.02, -- Self Reliance
			[459] = 2.21, -- Unstable Flames
			[492] = 4.11, -- Liberator's Might
			[196] = 5.57, -- Swirling Sands
			[523] = 4.97, -- Apothecary's Concoctions
			[371] = 8.63, -- Blur of Talons
			[462] = 1.76, -- Azerite Globules
			[156] = 3.52, -- Ruinous Bolt
			[373] = 6.92, -- Primeval Intuition
			[481] = 3.61, -- Incite the Pack
			[505] = 3.9, -- Tradewinds
			[469] = 0.02, -- Duck and Cover
			[541] = 1.76, -- Fight or Flight
			[107] = 3.91, -- Serrated Jaws
			[499] = 2.33, -- Ricocheting Inflatable Pyrosaw
			[498] = 3.94, -- Barrage Of Many Bombs
			[30] = 4.44, -- Overwhelming Power
			[561] = 4.39, -- Seductive Power
			[478] = 5.9, -- Tidal Surge
			[193] = 6.2, -- Blightborne Infusion
			[213] = 4.97, -- Venomous Fangs
			[483] = 5.36, -- Archive of the Titans
			[163] = 7.88, -- Latent Poison
			[195] = 5.13, -- Secrets of the Deep
			[495] = 5, -- Anduin's Dedication
			[521] = 4.8, -- Shadow of Elune
			[560] = 2.34, -- Bonded Souls
			[461] = 1.85, -- Earthlink
			[496] = 1.23, -- Stronger Together
			[494] = 6.07, -- Battlefield Precision
			[85] = 0.04, -- Gemhide
			[501] = 5.87, -- Relational Normalization Gizmo
			[22] = 2.65, -- Heed My Call
			[562] = 7.91, -- Treacherous Covenant
			[365] = 7.56, -- Dire Consequences
			[479] = 6.29, -- Dagger in the Back
			[504] = 5.72, -- Unstable Catalyst
			[482] = 5.12, -- Thunderous Blast
			[18] = 1.51, -- Blood Siphon
			[157] = 6.1, -- Rezan's Fury
			[194] = 5.33, -- Filthy Transfusion
			[526] = 6.43, -- Endless Hunger
		}, 1552989600)

		insertDefaultScalesData(defaultName, 8, 1, { -- Arcane Mage
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 19778 - 23362 (avg 20926), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[498] = 3.61, -- Barrage Of Many Bombs
			[492] = 3.4, -- Liberator's Might
			[497] = 1.28, -- Stand As One
			[462] = 1.55, -- Azerite Globules
			[482] = 4.63, -- Thunderous Blast
			[481] = 4.06, -- Incite the Pack
			[523] = 4.6, -- Apothecary's Concoctions
			[205] = 0.04, -- Eldritch Warding
			[157] = 5.64, -- Rezan's Fury
			[485] = 4.88, -- Laser Matrix
			[22] = 2.57, -- Heed My Call
			[493] = 2.3, -- Last Gift
			[195] = 5.02, -- Secrets of the Deep
			[468] = 0.02, -- Cauterizing Blink
			[500] = 3.44, -- Synaptic Spark Capacitor
			[501] = 4.88, -- Relational Normalization Gizmo
			[30] = 2.49, -- Overwhelming Power
			[494] = 4.78, -- Battlefield Precision
			[495] = 5, -- Anduin's Dedication
			[82] = 5.14, -- Champion of Azeroth
			[562] = 7.98, -- Treacherous Covenant
			[496] = 1.13, -- Stronger Together
			[196] = 4.91, -- Swirling Sands
			[167] = 3.17, -- Brain Storm
			[31] = 2.65, -- Gutripper
			[522] = 6.21, -- Ancients' Bulwark
			[483] = 5.45, -- Archive of the Titans
			[480] = 3.33, -- Blood Rite
			[88] = 6.22, -- Arcane Pummeling
			[546] = 0.04, -- Quick Thinking
			[14] = 0.05, -- Longstrider
			[499] = 2.11, -- Ricocheting Inflatable Pyrosaw
			[84] = 0.06, -- Bulwark of the Masses
			[192] = 2.29, -- Meticulous Scheming
			[478] = 6.04, -- Tidal Surge
			[13] = 0.04, -- Azerite Empowered
			[560] = 1.21, -- Bonded Souls
			[561] = 4.03, -- Seductive Power
			[127] = 10, -- Equipoise
			[18] = 1.71, -- Blood Siphon
			[374] = 6.71, -- Galvanizing Spark
			[479] = 5.79, -- Dagger in the Back
			[21] = 1.87, -- Elemental Whirl
			[156] = 3.64, -- Ruinous Bolt
			[526] = 6.22, -- Endless Hunger
			[505] = 4.6, -- Tradewinds
			[85] = 0.02, -- Gemhide
			[214] = 2.59, -- Arcane Pressure
			[459] = 2.14, -- Unstable Flames
			[194] = 5.14, -- Filthy Transfusion
			[504] = 5.5, -- Unstable Catalyst
			[541] = 1.67, -- Fight or Flight
			[193] = 6.21, -- Blightborne Infusion
			[461] = 1.75, -- Earthlink
			[521] = 3.43, -- Shadow of Elune
		}, 1552989600)

		insertDefaultScalesData(defaultName, 8, 2, { -- Fire Mage
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 27586 - 32675 (avg 29835), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[496] = 1.23, -- Stronger Together
			[498] = 4.57, -- Barrage Of Many Bombs
			[196] = 5.97, -- Swirling Sands
			[44] = 0.02, -- Vampiric Speed
			[215] = 1.61, -- Blaster Master
			[468] = 0.12, -- Cauterizing Blink
			[521] = 3.12, -- Shadow of Elune
			[85] = 0.09, -- Gemhide
			[86] = 0.12, -- Azerite Fortification
			[561] = 4.51, -- Seductive Power
			[87] = 0.04, -- Self Reliance
			[522] = 6.59, -- Ancients' Bulwark
			[31] = 3.38, -- Gutripper
			[128] = 2.71, -- Flames of Alacrity
			[168] = 10, -- Wildfire
			[494] = 6.95, -- Battlefield Precision
			[560] = 1.55, -- Bonded Souls
			[30] = 2.52, -- Overwhelming Power
			[503] = 0.12, -- Auto-Self-Cauterizer
			[378] = 6.79, -- Firemind
			[499] = 2.71, -- Ricocheting Inflatable Pyrosaw
			[481] = 4.65, -- Incite the Pack
			[459] = 2.24, -- Unstable Flames
			[377] = 6.67, -- Duplicative Incineration
			[523] = 5.8, -- Apothecary's Concoctions
			[562] = 8.35, -- Treacherous Covenant
			[376] = 4.38, -- Trailing Embers
			[14] = 0.19, -- Longstrider
			[195] = 5.23, -- Secrets of the Deep
			[82] = 5.82, -- Champion of Azeroth
			[495] = 5.27, -- Anduin's Dedication
			[500] = 4.08, -- Synaptic Spark Capacitor
			[485] = 6.23, -- Laser Matrix
			[482] = 5.89, -- Thunderous Blast
			[497] = 1.34, -- Stand As One
			[505] = 5, -- Tradewinds
			[22] = 3.19, -- Heed My Call
			[483] = 5.74, -- Archive of the Titans
			[546] = 0.13, -- Quick Thinking
			[501] = 4.75, -- Relational Normalization Gizmo
			[18] = 2.03, -- Blood Siphon
			[526] = 6.66, -- Endless Hunger
			[492] = 3.45, -- Liberator's Might
			[192] = 3.17, -- Meticulous Scheming
			[21] = 2.06, -- Elemental Whirl
			[480] = 3.21, -- Blood Rite
			[157] = 7.09, -- Rezan's Fury
			[15] = 0.01, -- Resounding Protection
			[479] = 7.15, -- Dagger in the Back
			[205] = 0.09, -- Eldritch Warding
			[504] = 5.92, -- Unstable Catalyst
			[462] = 2.04, -- Azerite Globules
			[13] = 0.12, -- Azerite Empowered
			[478] = 7.27, -- Tidal Surge
			[493] = 2.77, -- Last Gift
			[461] = 1.85, -- Earthlink
			[84] = 0.07, -- Bulwark of the Masses
			[541] = 2.04, -- Fight or Flight
			[83] = 0.1, -- Impassive Visage
			[194] = 5.65, -- Filthy Transfusion
			[193] = 6.86, -- Blightborne Infusion
			[156] = 4.37, -- Ruinous Bolt
			[502] = 0.02, -- Personal Absorb-o-Tron
		}, 1552989600)

		insertDefaultScalesData(defaultName, 8, 3, { -- Frost Mage
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 17352 - 20973 (avg 19293), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[18] = 1.39, -- Blood Siphon
			[14] = 0.02, -- Longstrider
			[192] = 3.49, -- Meticulous Scheming
			[500] = 3.07, -- Synaptic Spark Capacitor
			[82] = 5.34, -- Champion of Azeroth
			[561] = 4.06, -- Seductive Power
			[498] = 3.49, -- Barrage Of Many Bombs
			[497] = 1.31, -- Stand As One
			[560] = 1.69, -- Bonded Souls
			[170] = 10, -- Flash Freeze
			[381] = 4.62, -- Frigid Grasp
			[483] = 5.12, -- Archive of the Titans
			[492] = 3.74, -- Liberator's Might
			[462] = 1.61, -- Azerite Globules
			[481] = 3.65, -- Incite the Pack
			[31] = 2.49, -- Gutripper
			[157] = 5.53, -- Rezan's Fury
			[156] = 3.34, -- Ruinous Bolt
			[193] = 5.69, -- Blightborne Infusion
			[493] = 2.28, -- Last Gift
			[482] = 4.7, -- Thunderous Blast
			[461] = 1.68, -- Earthlink
			[523] = 4.5, -- Apothecary's Concoctions
			[132] = 4.67, -- Packed Ice
			[479] = 5.72, -- Dagger in the Back
			[380] = 5.03, -- Whiteout
			[480] = 3.51, -- Blood Rite
			[459] = 2.21, -- Unstable Flames
			[478] = 5.58, -- Tidal Surge
			[501] = 4.87, -- Relational Normalization Gizmo
			[379] = 5.24, -- Tunnel of Ice
			[195] = 4.95, -- Secrets of the Deep
			[194] = 5.17, -- Filthy Transfusion
			[494] = 5.15, -- Battlefield Precision
			[196] = 5.52, -- Swirling Sands
			[30] = 3.15, -- Overwhelming Power
			[562] = 7.39, -- Treacherous Covenant
			[503] = 0.03, -- Auto-Self-Cauterizer
			[22] = 2.41, -- Heed My Call
			[496] = 1.07, -- Stronger Together
			[521] = 3.48, -- Shadow of Elune
			[505] = 4.06, -- Tradewinds
			[21] = 1.98, -- Elemental Whirl
			[499] = 2.08, -- Ricocheting Inflatable Pyrosaw
			[495] = 4.95, -- Anduin's Dedication
			[541] = 1.83, -- Fight or Flight
			[504] = 5.69, -- Unstable Catalyst
			[485] = 4.96, -- Laser Matrix
			[225] = 5.05, -- Glacial Assault
			[522] = 5.67, -- Ancients' Bulwark
			[526] = 5.59, -- Endless Hunger
		}, 1552989600)

		insertDefaultScalesData(offensiveName, 10, 1, { -- Brewmaster Monk
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 5466 - 11494 (avg 6340), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[31] = 4.89, -- Gutripper
			[566] = 0.09, -- Exit Strategy
			[384] = 4.85, -- Elusive Footwork
			[500] = 5.37, -- Synaptic Spark Capacitor
			[505] = 4.16, -- Tradewinds
			[470] = 0.07, -- Sweep the Leg
			[383] = 2.27, -- Training of Niuzao
			[560] = 1.16, -- Bonded Souls
			[483] = 4.71, -- Archive of the Titans
			[13] = 0.03, -- Azerite Empowered
			[100] = 0.14, -- Strength in Numbers
			[238] = 0.08, -- Fit to Burst
			[101] = 0.18, -- Shimmering Haven
			[479] = 7.11, -- Dagger in the Back
			[19] = 0.09, -- Woundbinder
			[84] = 0.03, -- Bulwark of the Masses
			[459] = 1.95, -- Unstable Flames
			[522] = 5.67, -- Ancients' Bulwark
			[463] = 0.18, -- Blessed Portents
			[38] = 1.66, -- On My Way
			[195] = 4.25, -- Secrets of the Deep
			[382] = 0.16, -- Straight, No Chaser
			[85] = 0.07, -- Gemhide
			[82] = 4.53, -- Champion of Azeroth
			[30] = 2.33, -- Overwhelming Power
			[498] = 6.27, -- Barrage Of Many Bombs
			[89] = 0.08, -- Azerite Veins
			[495] = 4.17, -- Anduin's Dedication
			[541] = 1.73, -- Fight or Flight
			[42] = 0.19, -- Savior
			[478] = 9.7, -- Tidal Surge
			[526] = 5.63, -- Endless Hunger
			[22] = 4.2, -- Heed My Call
			[218] = 0.13, -- Strength of Spirit
			[481] = 3.83, -- Incite the Pack
			[43] = 0.13, -- Winds of War
			[103] = 0.03, -- Concentrated Mending
			[499] = 3.75, -- Ricocheting Inflatable Pyrosaw
			[493] = 2.19, -- Last Gift
			[116] = 1.83, -- Boiling Brew
			[86] = 0.08, -- Azerite Fortification
			[482] = 8.2, -- Thunderous Blast
			[44] = 0.05, -- Vampiric Speed
			[562] = 6.43, -- Treacherous Covenant
			[99] = 0.12, -- Ablative Shielding
			[523] = 7.85, -- Apothecary's Concoctions
			[492] = 2.87, -- Liberator's Might
			[87] = 0.05, -- Self Reliance
			[504] = 4.81, -- Unstable Catalyst
			[194] = 8.23, -- Filthy Transfusion
			[192] = 3.68, -- Meticulous Scheming
			[494] = 10, -- Battlefield Precision
			[496] = 1.04, -- Stronger Together
			[461] = 1.6, -- Earthlink
			[561] = 3.77, -- Seductive Power
			[501] = 3.92, -- Relational Normalization Gizmo
			[502] = 0.03, -- Personal Absorb-o-Tron
			[480] = 2.84, -- Blood Rite
			[21] = 1.61, -- Elemental Whirl
			[497] = 1.19, -- Stand As One
			[196] = 5.04, -- Swirling Sands
			[18] = 1.65, -- Blood Siphon
			[14] = 0.08, -- Longstrider
			[15] = 0.02, -- Resounding Protection
			[462] = 2.99, -- Azerite Globules
			[20] = 1.29, -- Lifespeed
			[156] = 5.89, -- Ruinous Bolt
			[193] = 5.63, -- Blightborne Infusion
			[104] = 0.07, -- Bracing Chill
			[83] = 0.02, -- Impassive Visage
			[98] = 0.13, -- Crystalline Carapace
			[105] = 0.12, -- Ephemeral Recovery
			[485] = 8.55, -- Laser Matrix
			[521] = 2.88, -- Shadow of Elune
			[157] = 9.8, -- Rezan's Fury
		}, 1552989600)

		insertDefaultScalesData(defaultName, 10, 3, { -- Windwalker Monk
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 9984 - 14530 (avg 10778), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[505] = 3.6, -- Tradewinds
			[193] = 4.8, -- Blightborne Infusion
			[500] = 0.42, -- Synaptic Spark Capacitor
			[481] = 3.36, -- Incite the Pack
			[389] = 7.35, -- Open Palm Strikes
			[496] = 0.84, -- Stronger Together
			[521] = 3.14, -- Shadow of Elune
			[42] = 0.06, -- Savior
			[492] = 2.93, -- Liberator's Might
			[504] = 4.55, -- Unstable Catalyst
			[478] = 5.9, -- Tidal Surge
			[30] = 2.56, -- Overwhelming Power
			[87] = 0.02, -- Self Reliance
			[459] = 1.76, -- Unstable Flames
			[541] = 1.37, -- Fight or Flight
			[479] = 5.43, -- Dagger in the Back
			[526] = 5.46, -- Endless Hunger
			[480] = 3.12, -- Blood Rite
			[20] = 1.4, -- Lifespeed
			[501] = 4.45, -- Relational Normalization Gizmo
			[18] = 1.36, -- Blood Siphon
			[19] = 0.08, -- Woundbinder
			[105] = 0.01, -- Ephemeral Recovery
			[523] = 1, -- Apothecary's Concoctions
			[562] = 6.17, -- Treacherous Covenant
			[157] = 5.15, -- Rezan's Fury
			[390] = 5.73, -- Pressure Point
			[560] = 1.35, -- Bonded Souls
			[498] = 3.32, -- Barrage Of Many Bombs
			[485] = 4.59, -- Laser Matrix
			[461] = 1.37, -- Earthlink
			[561] = 3.3, -- Seductive Power
			[493] = 2.01, -- Last Gift
			[388] = 7.46, -- Glory of the Dawn
			[192] = 3.45, -- Meticulous Scheming
			[522] = 5.3, -- Ancients' Bulwark
			[195] = 3.95, -- Secrets of the Deep
			[22] = 2.33, -- Heed My Call
			[184] = 4.73, -- Sunrise Technique
			[156] = 3.48, -- Ruinous Bolt
			[196] = 4.42, -- Swirling Sands
			[495] = 3.82, -- Anduin's Dedication
			[117] = 10, -- Fury of Xuen
			[482] = 4.31, -- Thunderous Blast
			[494] = 5.12, -- Battlefield Precision
			[14] = 0.13, -- Longstrider
			[38] = 1.51, -- On My Way
			[44] = 0.01, -- Vampiric Speed
			[194] = 4.37, -- Filthy Transfusion
			[391] = 5.71, -- Dance of Chi-Ji
			[13] = 0.08, -- Azerite Empowered
			[499] = 2.1, -- Ricocheting Inflatable Pyrosaw
			[497] = 1.09, -- Stand As One
			[86] = 0.02, -- Azerite Fortification
			[82] = 4.64, -- Champion of Azeroth
			[462] = 1.53, -- Azerite Globules
			[85] = 0.01, -- Gemhide
			[21] = 1.7, -- Elemental Whirl
			[31] = 2.43, -- Gutripper
			[98] = 0.05, -- Crystalline Carapace
			[483] = 4.21, -- Archive of the Titans
		}, 1552989600)

		insertDefaultScalesData(offensiveName, 2, 2, { -- Protection Paladin
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 11642 - 14095 (avg 12363), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[82] = 6.05, -- Champion of Azeroth
			[562] = 7.75, -- Treacherous Covenant
			[100] = 0.01, -- Strength in Numbers
			[495] = 4.9, -- Anduin's Dedication
			[541] = 1.72, -- Fight or Flight
			[234] = 1.93, -- Inner Light
			[461] = 1.66, -- Earthlink
			[393] = 0.09, -- Grace of the Justicar
			[195] = 4.98, -- Secrets of the Deep
			[194] = 7.93, -- Filthy Transfusion
			[21] = 2.06, -- Elemental Whirl
			[193] = 7.01, -- Blightborne Infusion
			[485] = 8.08, -- Laser Matrix
			[30] = 3.88, -- Overwhelming Power
			[478] = 8.75, -- Tidal Surge
			[22] = 3.96, -- Heed My Call
			[20] = 2.21, -- Lifespeed
			[14] = 0.03, -- Longstrider
			[105] = 0.02, -- Ephemeral Recovery
			[500] = 4.65, -- Synaptic Spark Capacitor
			[86] = 0.02, -- Azerite Fortification
			[494] = 9.31, -- Battlefield Precision
			[235] = 4.35, -- Indomitable Justice
			[192] = 5.4, -- Meticulous Scheming
			[498] = 5.94, -- Barrage Of Many Bombs
			[125] = 3.7, -- Avenger's Might
			[395] = 10, -- Inspiring Vanguard
			[462] = 2.56, -- Azerite Globules
			[101] = 0.01, -- Shimmering Haven
			[483] = 5.32, -- Archive of the Titans
			[560] = 2.19, -- Bonded Souls
			[523] = 7.41, -- Apothecary's Concoctions
			[493] = 2.27, -- Last Gift
			[479] = 6.65, -- Dagger in the Back
			[501] = 5.55, -- Relational Normalization Gizmo
			[492] = 4.21, -- Liberator's Might
			[156] = 5.33, -- Ruinous Bolt
			[98] = 0.07, -- Crystalline Carapace
			[505] = 4.3, -- Tradewinds
			[18] = 1.62, -- Blood Siphon
			[157] = 9.13, -- Rezan's Fury
			[504] = 5.66, -- Unstable Catalyst
			[83] = 0.01, -- Impassive Visage
			[144] = 0.09, -- Rejuvenating Grace
			[38] = 1.77, -- On My Way
			[497] = 1.38, -- Stand As One
			[149] = 0.07, -- Healing Hammer
			[459] = 2.42, -- Unstable Flames
			[499] = 3.45, -- Ricocheting Inflatable Pyrosaw
			[522] = 6.46, -- Ancients' Bulwark
			[526] = 6.58, -- Endless Hunger
			[481] = 3.87, -- Incite the Pack
			[561] = 4.24, -- Seductive Power
			[503] = 0.01, -- Auto-Self-Cauterizer
			[31] = 4.42, -- Gutripper
			[150] = 1.52, -- Soaring Shield
			[196] = 6.17, -- Swirling Sands
			[85] = 0.01, -- Gemhide
			[480] = 4.29, -- Blood Rite
			[496] = 1.28, -- Stronger Together
			[42] = 0.02, -- Savior
			[482] = 7.75, -- Thunderous Blast
			[521] = 4.3, -- Shadow of Elune
		}, 1552989600)

		insertDefaultScalesData(defaultName, 2, 3, { -- Retribution Paladin
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 10819 - 13539 (avg 11492), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[192] = 5.68, -- Meticulous Scheming
			[143] = 0.04, -- Inspiring Beacon
			[156] = 3.6, -- Ruinous Bolt
			[492] = 4.12, -- Liberator's Might
			[43] = 0.13, -- Winds of War
			[148] = 0.18, -- Righteous Flames
			[453] = 7.47, -- Empyrean Power
			[560] = 2.16, -- Bonded Souls
			[526] = 7.1, -- Endless Hunger
			[30] = 4.11, -- Overwhelming Power
			[393] = 0.15, -- Grace of the Justicar
			[493] = 2.84, -- Last Gift
			[18] = 2.06, -- Blood Siphon
			[85] = 0.04, -- Gemhide
			[87] = 0.14, -- Self Reliance
			[505] = 5.02, -- Tradewinds
			[235] = 5.48, -- Indomitable Justice
			[480] = 4.36, -- Blood Rite
			[89] = 0.11, -- Azerite Veins
			[99] = 0.03, -- Ablative Shielding
			[485] = 5.82, -- Laser Matrix
			[522] = 6.94, -- Ancients' Bulwark
			[502] = 0.08, -- Personal Absorb-o-Tron
			[20] = 2.16, -- Lifespeed
			[501] = 5.7, -- Relational Normalization Gizmo
			[101] = 0.16, -- Shimmering Haven
			[22] = 2.97, -- Heed My Call
			[149] = 0.12, -- Healing Hammer
			[44] = 0.24, -- Vampiric Speed
			[31] = 3.1, -- Gutripper
			[15] = 0.1, -- Resounding Protection
			[461] = 1.89, -- Earthlink
			[482] = 5.49, -- Thunderous Blast
			[84] = 0.12, -- Bulwark of the Masses
			[494] = 6.06, -- Battlefield Precision
			[206] = 0.12, -- Stalwart Protector
			[144] = 0.07, -- Rejuvenating Grace
			[194] = 5.96, -- Filthy Transfusion
			[562] = 8.3, -- Treacherous Covenant
			[193] = 6.65, -- Blightborne Infusion
			[561] = 4.9, -- Seductive Power
			[498] = 4.21, -- Barrage Of Many Bombs
			[495] = 5.22, -- Anduin's Dedication
			[483] = 5.75, -- Archive of the Titans
			[98] = 0.18, -- Crystalline Carapace
			[478] = 6.06, -- Tidal Surge
			[145] = 0.14, -- Fortifying Auras
			[83] = 0.12, -- Impassive Visage
			[82] = 6.43, -- Champion of Azeroth
			[195] = 5.39, -- Secrets of the Deep
			[462] = 1.92, -- Azerite Globules
			[503] = 0.17, -- Auto-Self-Cauterizer
			[463] = 0.22, -- Blessed Portents
			[454] = 0.23, -- Judicious Defense
			[538] = 0.22, -- Empyreal Ward
			[471] = 0.1, -- Gallant Steed
			[523] = 5.32, -- Apothecary's Concoctions
			[157] = 6.43, -- Rezan's Fury
			[496] = 1.36, -- Stronger Together
			[105] = 0.1, -- Ephemeral Recovery
			[196] = 5.52, -- Swirling Sands
			[396] = 10, -- Light's Decree
			[13] = 0.17, -- Azerite Empowered
			[125] = 5.74, -- Avenger's Might
			[154] = 6.82, -- Relentless Inquisitor
			[103] = 0.13, -- Concentrated Mending
			[100] = 0.14, -- Strength in Numbers
			[459] = 2.49, -- Unstable Flames
			[42] = 0.2, -- Savior
			[479] = 6.66, -- Dagger in the Back
			[86] = 0.18, -- Azerite Fortification
			[504] = 5.63, -- Unstable Catalyst
			[19] = 0.09, -- Woundbinder
			[500] = 3.4, -- Synaptic Spark Capacitor
			[104] = 0.02, -- Bracing Chill
			[499] = 2.7, -- Ricocheting Inflatable Pyrosaw
			[497] = 1.46, -- Stand As One
			[14] = 0.11, -- Longstrider
			[21] = 2.19, -- Elemental Whirl
			[541] = 1.75, -- Fight or Flight
			[521] = 4.44, -- Shadow of Elune
			[187] = 4.87, -- Expurgation
			[481] = 4.64, -- Incite the Pack
			[38] = 2.25, -- On My Way
		}, 1552989600)

		insertDefaultScalesData(defaultName, 4, 1, { -- Assassination Rogue
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 10549 - 13587 (avg 11229), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[192] = 4.05, -- Meticulous Scheming
			[22] = 2.68, -- Heed My Call
			[498] = 3.8, -- Barrage Of Many Bombs
			[459] = 2.4, -- Unstable Flames
			[181] = 5.97, -- Twist the Knife
			[14] = 0.13, -- Longstrider
			[156] = 3.61, -- Ruinous Bolt
			[504] = 5.59, -- Unstable Catalyst
			[194] = 5.08, -- Filthy Transfusion
			[13] = 0.02, -- Azerite Empowered
			[21] = 2.19, -- Elemental Whirl
			[136] = 8.05, -- Double Dose
			[87] = 0.01, -- Self Reliance
			[31] = 2.71, -- Gutripper
			[494] = 5.99, -- Battlefield Precision
			[495] = 4.81, -- Anduin's Dedication
			[560] = 2.04, -- Bonded Souls
			[499] = 2.29, -- Ricocheting Inflatable Pyrosaw
			[492] = 4.13, -- Liberator's Might
			[500] = 3.24, -- Synaptic Spark Capacitor
			[501] = 5.74, -- Relational Normalization Gizmo
			[157] = 6.06, -- Rezan's Fury
			[522] = 6.07, -- Ancients' Bulwark
			[83] = 0.03, -- Impassive Visage
			[44] = 0.09, -- Vampiric Speed
			[483] = 5.42, -- Archive of the Titans
			[407] = 0.06, -- Echoing Blades
			[478] = 5.91, -- Tidal Surge
			[18] = 1.78, -- Blood Siphon
			[485] = 5.16, -- Laser Matrix
			[193] = 6.88, -- Blightborne Infusion
			[526] = 5.99, -- Endless Hunger
			[481] = 4.43, -- Incite the Pack
			[408] = 0.93, -- Shrouded Suffocation
			[30] = 3.69, -- Overwhelming Power
			[479] = 5.95, -- Dagger in the Back
			[196] = 6.09, -- Swirling Sands
			[497] = 1.28, -- Stand As One
			[461] = 1.86, -- Earthlink
			[496] = 1.34, -- Stronger Together
			[562] = 7.89, -- Treacherous Covenant
			[561] = 4.24, -- Seductive Power
			[82] = 6.21, -- Champion of Azeroth
			[195] = 5.11, -- Secrets of the Deep
			[482] = 4.78, -- Thunderous Blast
			[473] = 0.03, -- Shrouded Mantle
			[505] = 4.8, -- Tradewinds
			[523] = 4.73, -- Apothecary's Concoctions
			[541] = 1.8, -- Fight or Flight
			[521] = 4.35, -- Shadow of Elune
			[493] = 2.65, -- Last Gift
			[406] = 3.53, -- Scent of Blood
			[480] = 4.28, -- Blood Rite
			[249] = 10, -- Nothing Personal
			[462] = 1.61, -- Azerite Globules
		}, 1552989600)

		insertDefaultScalesData(defaultName, 4, 2, { -- Outlaw Rogue
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 30518 - 44867 (avg 33753), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[459] = 2.56, -- Unstable Flames
			[31] = 4.19, -- Gutripper
			[485] = 7.74, -- Laser Matrix
			[239] = 5.29, -- Snake Eyes
			[446] = 9.53, -- Brigand's Blitz
			[493] = 2.66, -- Last Gift
			[481] = 4.55, -- Incite the Pack
			[180] = 5.97, -- Keep Your Wits About You
			[496] = 1.25, -- Stronger Together
			[562] = 10, -- Treacherous Covenant
			[541] = 2.29, -- Fight or Flight
			[461] = 2.31, -- Earthlink
			[411] = 7.61, -- Ace Up Your Sleeve
			[410] = 5.53, -- Paradise Lost
			[193] = 8, -- Blightborne Infusion
			[522] = 8.05, -- Ancients' Bulwark
			[21] = 2.62, -- Elemental Whirl
			[18] = 1.65, -- Blood Siphon
			[82] = 7.67, -- Champion of Azeroth
			[483] = 7.1, -- Archive of the Titans
			[498] = 5.73, -- Barrage Of Many Bombs
			[523] = 7.45, -- Apothecary's Concoctions
			[156] = 5.22, -- Ruinous Bolt
			[194] = 7.26, -- Filthy Transfusion
			[30] = 4.89, -- Overwhelming Power
			[494] = 9.04, -- Battlefield Precision
			[462] = 2.61, -- Azerite Globules
			[497] = 1.61, -- Stand As One
			[478] = 8.7, -- Tidal Surge
			[129] = 8.52, -- Deadshot
			[504] = 6.94, -- Unstable Catalyst
			[500] = 4.76, -- Synaptic Spark Capacitor
			[482] = 7.31, -- Thunderous Blast
			[492] = 4.91, -- Liberator's Might
			[195] = 6.32, -- Secrets of the Deep
			[501] = 7.1, -- Relational Normalization Gizmo
			[22] = 3.87, -- Heed My Call
			[526] = 7.93, -- Endless Hunger
			[561] = 5.54, -- Seductive Power
			[560] = 2.52, -- Bonded Souls
			[192] = 6.76, -- Meticulous Scheming
			[196] = 7.18, -- Swirling Sands
			[479] = 9.38, -- Dagger in the Back
			[157] = 8.91, -- Rezan's Fury
			[521] = 5.39, -- Shadow of Elune
			[495] = 6.38, -- Anduin's Dedication
			[505] = 5.01, -- Tradewinds
			[499] = 3.28, -- Ricocheting Inflatable Pyrosaw
			[480] = 5.48, -- Blood Rite
		}, 1552989600)

		insertDefaultScalesData(defaultName, 4, 3, { -- Subtlety Rogue
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 11134 - 15845 (avg 13861), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[485] = 3.06, -- Laser Matrix
			[459] = 1.11, -- Unstable Flames
			[495] = 2.67, -- Anduin's Dedication
			[414] = 5.31, -- Inevitability
			[192] = 2.15, -- Meticulous Scheming
			[493] = 1.32, -- Last Gift
			[175] = 3.11, -- Night's Vengeance
			[492] = 2.04, -- Liberator's Might
			[240] = 4.33, -- Blade In The Shadows
			[560] = 1.04, -- Bonded Souls
			[526] = 3.28, -- Endless Hunger
			[22] = 1.52, -- Heed My Call
			[30] = 1.83, -- Overwhelming Power
			[157] = 3.53, -- Rezan's Fury
			[462] = 0.98, -- Azerite Globules
			[479] = 3.67, -- Dagger in the Back
			[522] = 3.2, -- Ancients' Bulwark
			[482] = 2.91, -- Thunderous Blast
			[501] = 3.02, -- Relational Normalization Gizmo
			[562] = 4.29, -- Treacherous Covenant
			[483] = 2.97, -- Archive of the Titans
			[498] = 2.25, -- Barrage Of Many Bombs
			[496] = 0.62, -- Stronger Together
			[445] = 1.89, -- Perforate
			[196] = 3.1, -- Swirling Sands
			[500] = 1.99, -- Synaptic Spark Capacitor
			[461] = 1, -- Earthlink
			[31] = 1.73, -- Gutripper
			[504] = 3.02, -- Unstable Catalyst
			[18] = 0.87, -- Blood Siphon
			[193] = 3.37, -- Blightborne Infusion
			[521] = 2.25, -- Shadow of Elune
			[497] = 0.63, -- Stand As One
			[499] = 1.32, -- Ricocheting Inflatable Pyrosaw
			[195] = 2.84, -- Secrets of the Deep
			[503] = 0.03, -- Auto-Self-Cauterizer
			[523] = 2.84, -- Apothecary's Concoctions
			[494] = 3.57, -- Battlefield Precision
			[478] = 3.89, -- Tidal Surge
			[561] = 2.15, -- Seductive Power
			[84] = 0.02, -- Bulwark of the Masses
			[124] = 1.76, -- Replicating Shadows
			[413] = 10, -- The First Dance
			[505] = 2.36, -- Tradewinds
			[481] = 2.26, -- Incite the Pack
			[194] = 2.96, -- Filthy Transfusion
			[82] = 3.2, -- Champion of Azeroth
			[541] = 0.94, -- Fight or Flight
			[480] = 2.26, -- Blood Rite
			[21] = 1.09, -- Elemental Whirl
			[83] = 0.01, -- Impassive Visage
			[156] = 2.35, -- Ruinous Bolt
		}, 1552989600)

		insertDefaultScalesData(defaultName, 7, 1, { -- Elemental Shaman
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 15567 - 18672 (avg 16507), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[457] = 10, -- Igneous Potential
			[562] = 5.66, -- Treacherous Covenant
			[482] = 3.45, -- Thunderous Blast
			[31] = 1.96, -- Gutripper
			[21] = 1.33, -- Elemental Whirl
			[30] = 2.15, -- Overwhelming Power
			[156] = 2.56, -- Ruinous Bolt
			[499] = 1.62, -- Ricocheting Inflatable Pyrosaw
			[38] = 1.29, -- On My Way
			[497] = 0.93, -- Stand As One
			[521] = 2.48, -- Shadow of Elune
			[502] = 0.08, -- Personal Absorb-o-Tron
			[207] = 0.04, -- Serene Spirit
			[478] = 4.22, -- Tidal Surge
			[494] = 3.74, -- Battlefield Precision
			[448] = 3.29, -- Synapse Shock
			[14] = 0.04, -- Longstrider
			[461] = 1.34, -- Earthlink
			[13] = 0.06, -- Azerite Empowered
			[193] = 4.67, -- Blightborne Infusion
			[498] = 2.65, -- Barrage Of Many Bombs
			[447] = 3.34, -- Ancestral Resonance
			[462] = 1.3, -- Azerite Globules
			[192] = 3.01, -- Meticulous Scheming
			[417] = 0.07, -- Tectonic Thunder
			[22] = 1.71, -- Heed My Call
			[105] = 0.02, -- Ephemeral Recovery
			[86] = 0.02, -- Azerite Fortification
			[104] = 0.1, -- Bracing Chill
			[83] = 0.12, -- Impassive Visage
			[474] = 0.04, -- Pack Spirit
			[504] = 4.09, -- Unstable Catalyst
			[480] = 2.53, -- Blood Rite
			[495] = 3.54, -- Anduin's Dedication
			[479] = 4.26, -- Dagger in the Back
			[493] = 1.19, -- Last Gift
			[416] = 4.77, -- Natural Harmony
			[157] = 4.13, -- Rezan's Fury
			[561] = 3.08, -- Seductive Power
			[178] = 3.55, -- Lava Shock
			[195] = 3.68, -- Secrets of the Deep
			[85] = 0.05, -- Gemhide
			[481] = 1.89, -- Incite the Pack
			[196] = 4.19, -- Swirling Sands
			[522] = 4.38, -- Ancients' Bulwark
			[501] = 3.62, -- Relational Normalization Gizmo
			[42] = 0.06, -- Savior
			[82] = 3.78, -- Champion of Azeroth
			[539] = 0.05, -- Ancient Ankh Talisman
			[496] = 0.82, -- Stronger Together
			[560] = 1.21, -- Bonded Souls
			[222] = 2.52, -- Echo of the Elementals
			[459] = 1.66, -- Unstable Flames
			[483] = 3.94, -- Archive of the Titans
			[485] = 3.65, -- Laser Matrix
			[500] = 2.3, -- Synaptic Spark Capacitor
			[541] = 1.23, -- Fight or Flight
			[505] = 2.07, -- Tradewinds
			[523] = 3.31, -- Apothecary's Concoctions
			[18] = 0.81, -- Blood Siphon
			[103] = 0.09, -- Concentrated Mending
			[526] = 4.31, -- Endless Hunger
			[194] = 3.58, -- Filthy Transfusion
			[87] = 0.1, -- Self Reliance
			[44] = 0.08, -- Vampiric Speed
			[492] = 2.74, -- Liberator's Might
			[84] = 0.1, -- Bulwark of the Masses
		}, 1552989600)

		insertDefaultScalesData(defaultName, 7, 2, { -- Enhancement Shaman
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 15583 - 20249 (avg 17652), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[192] = 5.29, -- Meticulous Scheming
			[498] = 4.21, -- Barrage Of Many Bombs
			[503] = 0.05, -- Auto-Self-Cauterizer
			[496] = 1.4, -- Stronger Together
			[522] = 6.73, -- Ancients' Bulwark
			[483] = 6.08, -- Archive of the Titans
			[44] = 0.05, -- Vampiric Speed
			[38] = 1.93, -- On My Way
			[104] = 0.01, -- Bracing Chill
			[492] = 4.25, -- Liberator's Might
			[497] = 1.49, -- Stand As One
			[207] = 0.03, -- Serene Spirit
			[493] = 2.84, -- Last Gift
			[157] = 6.12, -- Rezan's Fury
			[459] = 2.42, -- Unstable Flames
			[15] = 0.08, -- Resounding Protection
			[485] = 5.51, -- Laser Matrix
			[474] = 0.08, -- Pack Spirit
			[505] = 5, -- Tradewinds
			[137] = 9.45, -- Primal Primer
			[19] = 0.13, -- Woundbinder
			[223] = 3.58, -- Lightning Conduit
			[499] = 2.5, -- Ricocheting Inflatable Pyrosaw
			[82] = 6.46, -- Champion of Azeroth
			[31] = 3.03, -- Gutripper
			[561] = 4.74, -- Seductive Power
			[482] = 5.23, -- Thunderous Blast
			[83] = 0.1, -- Impassive Visage
			[478] = 6.15, -- Tidal Surge
			[463] = 0.05, -- Blessed Portents
			[103] = 0.03, -- Concentrated Mending
			[530] = 5.63, -- Thunderaan's Fury
			[13] = 0.15, -- Azerite Empowered
			[541] = 2.02, -- Fight or Flight
			[501] = 5.89, -- Relational Normalization Gizmo
			[18] = 1.9, -- Blood Siphon
			[86] = 0.02, -- Azerite Fortification
			[462] = 1.86, -- Azerite Globules
			[526] = 6.67, -- Endless Hunger
			[156] = 3.66, -- Ruinous Bolt
			[479] = 6.37, -- Dagger in the Back
			[179] = 5.92, -- Strength of Earth
			[494] = 6.11, -- Battlefield Precision
			[22] = 2.72, -- Heed My Call
			[481] = 4.64, -- Incite the Pack
			[495] = 5.41, -- Anduin's Dedication
			[84] = 0.06, -- Bulwark of the Masses
			[194] = 5.56, -- Filthy Transfusion
			[480] = 4.35, -- Blood Rite
			[447] = 7.74, -- Ancestral Resonance
			[42] = 0.05, -- Savior
			[196] = 6.27, -- Swirling Sands
			[193] = 6.87, -- Blightborne Infusion
			[560] = 2.15, -- Bonded Souls
			[21] = 2.27, -- Elemental Whirl
			[195] = 5.56, -- Secrets of the Deep
			[521] = 4.2, -- Shadow of Elune
			[562] = 8.5, -- Treacherous Covenant
			[416] = 8.95, -- Natural Harmony
			[504] = 6.33, -- Unstable Catalyst
			[523] = 5, -- Apothecary's Concoctions
			[461] = 1.98, -- Earthlink
			[500] = 3.37, -- Synaptic Spark Capacitor
			[420] = 10, -- Roiling Storm
			[30] = 3.84, -- Overwhelming Power
		}, 1552989600)

		insertDefaultScalesData(defaultName, 9, 1, { -- Affliction Warlock
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 10611 - 14036 (avg 11625), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[425] = 7.51, -- Sudden Onset
			[194] = 7.71, -- Filthy Transfusion
			[521] = 5.54, -- Shadow of Elune
			[498] = 5.6, -- Barrage Of Many Bombs
			[485] = 7.69, -- Laser Matrix
			[482] = 7.4, -- Thunderous Blast
			[560] = 2.88, -- Bonded Souls
			[483] = 6.71, -- Archive of the Titans
			[561] = 5.66, -- Seductive Power
			[495] = 6.46, -- Anduin's Dedication
			[193] = 8.13, -- Blightborne Infusion
			[501] = 7.2, -- Relational Normalization Gizmo
			[82] = 7.78, -- Champion of Azeroth
			[481] = 6.79, -- Incite the Pack
			[30] = 5.25, -- Overwhelming Power
			[31] = 4.14, -- Gutripper
			[21] = 2.89, -- Elemental Whirl
			[83] = 0.01, -- Impassive Visage
			[87] = 0.06, -- Self Reliance
			[156] = 5.24, -- Ruinous Bolt
			[526] = 8.16, -- Endless Hunger
			[84] = 0.06, -- Bulwark of the Masses
			[459] = 2.67, -- Unstable Flames
			[22] = 3.89, -- Heed My Call
			[480] = 5.55, -- Blood Rite
			[18] = 2.82, -- Blood Siphon
			[522] = 8.4, -- Ancients' Bulwark
			[541] = 2.41, -- Fight or Flight
			[479] = 8.84, -- Dagger in the Back
			[497] = 1.73, -- Stand As One
			[494] = 9, -- Battlefield Precision
			[461] = 2.45, -- Earthlink
			[426] = 5.53, -- Dreadful Calling
			[183] = 8.55, -- Inevitable Demise
			[195] = 6.59, -- Secrets of the Deep
			[562] = 10, -- Treacherous Covenant
			[442] = 8.48, -- Pandemic Invocation
			[192] = 6.32, -- Meticulous Scheming
			[504] = 7.4, -- Unstable Catalyst
			[492] = 5.02, -- Liberator's Might
			[505] = 7.23, -- Tradewinds
			[157] = 8.66, -- Rezan's Fury
			[478] = 8.55, -- Tidal Surge
			[123] = 8.88, -- Wracking Brilliance
			[499] = 3.4, -- Ricocheting Inflatable Pyrosaw
			[196] = 7.03, -- Swirling Sands
			[475] = 0.06, -- Desperate Power
			[523] = 6.9, -- Apothecary's Concoctions
			[44] = 0.09, -- Vampiric Speed
			[85] = 0.12, -- Gemhide
			[462] = 2.55, -- Azerite Globules
			[493] = 3.96, -- Last Gift
			[208] = 0.01, -- Lifeblood
			[500] = 4.65, -- Synaptic Spark Capacitor
			[13] = 0.21, -- Azerite Empowered
			[503] = 0.14, -- Auto-Self-Cauterizer
			[496] = 1.59, -- Stronger Together
			[230] = 7.22, -- Cascading Calamity
		}, 1552989600)

		insertDefaultScalesData(defaultName, 9, 2, { -- Demonology Warlock
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 10005 - 12889 (avg 10918), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[479] = 4.38, -- Dagger in the Back
			[157] = 4.29, -- Rezan's Fury
			[541] = 1.46, -- Fight or Flight
			[192] = 4.09, -- Meticulous Scheming
			[429] = 10, -- Baleful Invocation
			[196] = 3.61, -- Swirling Sands
			[521] = 3.99, -- Shadow of Elune
			[195] = 4.03, -- Secrets of the Deep
			[462] = 1.14, -- Azerite Globules
			[531] = 0.03, -- Terror of the Mind
			[495] = 3.91, -- Anduin's Dedication
			[482] = 3.47, -- Thunderous Blast
			[22] = 1.88, -- Heed My Call
			[130] = 3.1, -- Shadow's Bite
			[194] = 3.76, -- Filthy Transfusion
			[504] = 4.45, -- Unstable Catalyst
			[523] = 3.38, -- Apothecary's Concoctions
			[459] = 1.75, -- Unstable Flames
			[500] = 2.43, -- Synaptic Spark Capacitor
			[496] = 1.03, -- Stronger Together
			[480] = 4.05, -- Blood Rite
			[461] = 1.4, -- Earthlink
			[44] = 0.09, -- Vampiric Speed
			[497] = 1.05, -- Stand As One
			[481] = 3.29, -- Incite the Pack
			[485] = 3.68, -- Laser Matrix
			[501] = 5.1, -- Relational Normalization Gizmo
			[483] = 4.4, -- Archive of the Titans
			[494] = 2.92, -- Battlefield Precision
			[193] = 4.94, -- Blightborne Infusion
			[87] = 0.05, -- Self Reliance
			[231] = 7.09, -- Explosive Potential
			[31] = 1.86, -- Gutripper
			[560] = 2.35, -- Bonded Souls
			[561] = 3.19, -- Seductive Power
			[522] = 5.09, -- Ancients' Bulwark
			[505] = 3.61, -- Tradewinds
			[493] = 2.07, -- Last Gift
			[21] = 1.99, -- Elemental Whirl
			[83] = 0.01, -- Impassive Visage
			[190] = 3.05, -- Umbral Blaze
			[498] = 2.68, -- Barrage Of Many Bombs
			[30] = 3.63, -- Overwhelming Power
			[499] = 1.58, -- Ricocheting Inflatable Pyrosaw
			[84] = 0.02, -- Bulwark of the Masses
			[82] = 5.59, -- Champion of Azeroth
			[562] = 6.38, -- Treacherous Covenant
			[428] = 4.08, -- Demonic Meteor
			[156] = 2.58, -- Ruinous Bolt
			[492] = 3.79, -- Liberator's Might
			[18] = 1.34, -- Blood Siphon
			[458] = 3.37, -- Supreme Commander
			[526] = 5.14, -- Endless Hunger
			[478] = 4.21, -- Tidal Surge
		}, 1552989600)

		insertDefaultScalesData(defaultName, 9, 3, { -- Destruction Warlock
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 12521 - 15934 (avg 13699), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[501] = 7.09, -- Relational Normalization Gizmo
			[562] = 10, -- Treacherous Covenant
			[432] = 7.63, -- Chaotic Inferno
			[503] = 0.34, -- Auto-Self-Cauterizer
			[193] = 8.26, -- Blightborne Infusion
			[482] = 6.06, -- Thunderous Blast
			[444] = 9.21, -- Crashing Chaos
			[505] = 6.48, -- Tradewinds
			[504] = 7.09, -- Unstable Catalyst
			[479] = 7.39, -- Dagger in the Back
			[526] = 8.93, -- Endless Hunger
			[502] = 0.13, -- Personal Absorb-o-Tron
			[431] = 0.34, -- Rolling Havoc
			[131] = 7.87, -- Chaos Shards
			[208] = 0.31, -- Lifeblood
			[498] = 4.69, -- Barrage Of Many Bombs
			[499] = 2.89, -- Ricocheting Inflatable Pyrosaw
			[18] = 2.6, -- Blood Siphon
			[156] = 4.25, -- Ruinous Bolt
			[86] = 0.35, -- Azerite Fortification
			[475] = 0.23, -- Desperate Power
			[15] = 0.28, -- Resounding Protection
			[500] = 4.2, -- Synaptic Spark Capacitor
			[485] = 6.44, -- Laser Matrix
			[561] = 5.34, -- Seductive Power
			[541] = 2.42, -- Fight or Flight
			[30] = 4.95, -- Overwhelming Power
			[21] = 3.32, -- Elemental Whirl
			[157] = 7.33, -- Rezan's Fury
			[460] = 6.54, -- Bursting Flare
			[194] = 6.21, -- Filthy Transfusion
			[44] = 0.07, -- Vampiric Speed
			[497] = 1.78, -- Stand As One
			[495] = 6.05, -- Anduin's Dedication
			[496] = 1.9, -- Stronger Together
			[531] = 0.18, -- Terror of the Mind
			[232] = 5.05, -- Flashpoint
			[560] = 3.06, -- Bonded Souls
			[14] = 0.24, -- Longstrider
			[84] = 0.14, -- Bulwark of the Masses
			[483] = 6.85, -- Archive of the Titans
			[494] = 6.75, -- Battlefield Precision
			[523] = 6.01, -- Apothecary's Concoctions
			[481] = 6.11, -- Incite the Pack
			[196] = 7.14, -- Swirling Sands
			[87] = 0.31, -- Self Reliance
			[195] = 6.5, -- Secrets of the Deep
			[462] = 2.25, -- Azerite Globules
			[493] = 3.88, -- Last Gift
			[492] = 5.41, -- Liberator's Might
			[31] = 3.55, -- Gutripper
			[13] = 0.3, -- Azerite Empowered
			[22] = 3.47, -- Heed My Call
			[478] = 7.38, -- Tidal Surge
			[480] = 5.41, -- Blood Rite
			[192] = 5.34, -- Meticulous Scheming
			[83] = 0.2, -- Impassive Visage
			[85] = 0.28, -- Gemhide
			[82] = 8.08, -- Champion of Azeroth
			[522] = 8.92, -- Ancients' Bulwark
			[521] = 5.31, -- Shadow of Elune
			[459] = 2.93, -- Unstable Flames
			[461] = 2.42, -- Earthlink
		}, 1552989600)

		insertDefaultScalesData(defaultName, 1, 1, { -- Arms Warrior
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 7329 - 10625 (avg 7980), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[89] = 0.13, -- Azerite Veins
			[86] = 0.12, -- Azerite Fortification
			[434] = 9.56, -- Crushing Assault
			[485] = 6.09, -- Laser Matrix
			[18] = 2.05, -- Blood Siphon
			[500] = 3.7, -- Synaptic Spark Capacitor
			[503] = 0.11, -- Auto-Self-Cauterizer
			[85] = 0.12, -- Gemhide
			[479] = 7.01, -- Dagger in the Back
			[481] = 5.08, -- Incite the Pack
			[497] = 1.4, -- Stand As One
			[20] = 2.28, -- Lifespeed
			[495] = 5.23, -- Anduin's Dedication
			[31] = 3.32, -- Gutripper
			[501] = 6.01, -- Relational Normalization Gizmo
			[44] = 0.07, -- Vampiric Speed
			[499] = 2.66, -- Ricocheting Inflatable Pyrosaw
			[494] = 6.94, -- Battlefield Precision
			[496] = 1.44, -- Stronger Together
			[521] = 4.72, -- Shadow of Elune
			[560] = 2.43, -- Bonded Souls
			[502] = 0.06, -- Personal Absorb-o-Tron
			[480] = 4.77, -- Blood Rite
			[498] = 4.51, -- Barrage Of Many Bombs
			[195] = 5.41, -- Secrets of the Deep
			[483] = 5.84, -- Archive of the Titans
			[478] = 6.96, -- Tidal Surge
			[561] = 4.69, -- Seductive Power
			[482] = 5.94, -- Thunderous Blast
			[526] = 6.97, -- Endless Hunger
			[462] = 2.09, -- Azerite Globules
			[30] = 4.24, -- Overwhelming Power
			[477] = 0.07, -- Bury the Hatchet
			[121] = 6.31, -- Striking the Anvil
			[192] = 5.99, -- Meticulous Scheming
			[492] = 4.96, -- Liberator's Might
			[156] = 4.23, -- Ruinous Bolt
			[226] = 10, -- Test of Might
			[554] = 0.03, -- Intimidating Presence
			[13] = 0.03, -- Azerite Empowered
			[193] = 8.07, -- Blightborne Infusion
			[174] = 6.79, -- Gathering Storm
			[196] = 7.25, -- Swirling Sands
			[22] = 3.16, -- Heed My Call
			[435] = 5.37, -- Lord of War
			[523] = 5.54, -- Apothecary's Concoctions
			[562] = 8.38, -- Treacherous Covenant
			[541] = 2.07, -- Fight or Flight
			[100] = 0.14, -- Strength in Numbers
			[82] = 7.28, -- Champion of Azeroth
			[21] = 2.54, -- Elemental Whirl
			[461] = 1.79, -- Earthlink
			[433] = 4.31, -- Seismic Wave
			[84] = 0.05, -- Bulwark of the Masses
			[98] = 0.03, -- Crystalline Carapace
			[476] = 0.06, -- Moment of Glory
			[43] = 0.03, -- Winds of War
			[522] = 6.93, -- Ancients' Bulwark
			[493] = 2.86, -- Last Gift
			[157] = 7.02, -- Rezan's Fury
			[459] = 2.8, -- Unstable Flames
			[194] = 6.52, -- Filthy Transfusion
			[504] = 5.95, -- Unstable Catalyst
			[505] = 5.45, -- Tradewinds
			[14] = 0.15, -- Longstrider
		}, 1552989600)

		insertDefaultScalesData(defaultName, 1, 2, { -- Fury Warrior
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 10116 - 14175 (avg 10883), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[481] = 5.11, -- Incite the Pack
			[84] = 0.1, -- Bulwark of the Masses
			[21] = 2.41, -- Elemental Whirl
			[462] = 2.09, -- Azerite Globules
			[192] = 6.25, -- Meticulous Scheming
			[100] = 0.14, -- Strength in Numbers
			[14] = 0.12, -- Longstrider
			[482] = 5.83, -- Thunderous Blast
			[43] = 0.11, -- Winds of War
			[31] = 3.34, -- Gutripper
			[485] = 6.1, -- Laser Matrix
			[505] = 5.43, -- Tradewinds
			[194] = 6.3, -- Filthy Transfusion
			[89] = 0.1, -- Azerite Veins
			[476] = 0.15, -- Moment of Glory
			[497] = 1.36, -- Stand As One
			[461] = 1.68, -- Earthlink
			[30] = 4.9, -- Overwhelming Power
			[502] = 0.16, -- Personal Absorb-o-Tron
			[495] = 4.5, -- Anduin's Dedication
			[85] = 0.24, -- Gemhide
			[119] = 10, -- Unbridled Ferocity
			[526] = 6.4, -- Endless Hunger
			[500] = 3.22, -- Synaptic Spark Capacitor
			[554] = 0.07, -- Intimidating Presence
			[437] = 7.9, -- Simmering Rage
			[493] = 3.07, -- Last Gift
			[22] = 3.21, -- Heed My Call
			[87] = 0.12, -- Self Reliance
			[492] = 4.31, -- Liberator's Might
			[522] = 6.4, -- Ancients' Bulwark
			[438] = 7.76, -- Reckless Flurry
			[478] = 5.83, -- Tidal Surge
			[504] = 5.41, -- Unstable Catalyst
			[83] = 0.17, -- Impassive Visage
			[13] = 0.07, -- Azerite Empowered
			[503] = 0.15, -- Auto-Self-Cauterizer
			[176] = 6.23, -- Cold Steel, Hot Blood
			[496] = 1.46, -- Stronger Together
			[498] = 4.44, -- Barrage Of Many Bombs
			[193] = 6.56, -- Blightborne Infusion
			[157] = 6.85, -- Rezan's Fury
			[562] = 7.12, -- Treacherous Covenant
			[82] = 7.09, -- Champion of Azeroth
			[521] = 4.7, -- Shadow of Elune
			[477] = 0.2, -- Bury the Hatchet
			[499] = 2.86, -- Ricocheting Inflatable Pyrosaw
			[156] = 3.45, -- Ruinous Bolt
			[101] = 0.13, -- Shimmering Haven
			[480] = 4.78, -- Blood Rite
			[196] = 6, -- Swirling Sands
			[195] = 4.61, -- Secrets of the Deep
			[20] = 2.7, -- Lifespeed
			[44] = 0.11, -- Vampiric Speed
			[459] = 2.44, -- Unstable Flames
			[541] = 2.04, -- Fight or Flight
			[174] = 0.07, -- Gathering Storm
			[229] = 5.76, -- Pulverizing Blows
			[99] = 0.16, -- Ablative Shielding
			[560] = 2.96, -- Bonded Souls
			[494] = 6.98, -- Battlefield Precision
			[501] = 5.67, -- Relational Normalization Gizmo
			[18] = 2.24, -- Blood Siphon
			[561] = 4.65, -- Seductive Power
			[451] = 5.37, -- Infinite Fury
			[523] = 4.72, -- Apothecary's Concoctions
			[86] = 0.18, -- Azerite Fortification
			[15] = 0.22, -- Resounding Protection
			[98] = 0.16, -- Crystalline Carapace
			[483] = 5.13, -- Archive of the Titans
			[479] = 6.05, -- Dagger in the Back
		}, 1552989600)

		insertDefaultScalesData(offensiveName, 1, 3, { -- Protection Warrior
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 5711 - 8319 (avg 6240), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[450] = 3.46, -- Brace for Impact
			[459] = 2.15, -- Unstable Flames
			[498] = 5.52, -- Barrage Of Many Bombs
			[483] = 4.92, -- Archive of the Titans
			[89] = 0.06, -- Azerite Veins
			[441] = 3.53, -- Iron Fortress
			[118] = 10, -- Deafening Crash
			[541] = 1.65, -- Fight or Flight
			[98] = 0.03, -- Crystalline Carapace
			[21] = 1.92, -- Elemental Whirl
			[43] = 0.05, -- Winds of War
			[480] = 3.84, -- Blood Rite
			[20] = 1.89, -- Lifespeed
			[501] = 5.02, -- Relational Normalization Gizmo
			[497] = 1.11, -- Stand As One
			[30] = 3.85, -- Overwhelming Power
			[462] = 2.35, -- Azerite Globules
			[477] = 0.06, -- Bury the Hatchet
			[523] = 5.58, -- Apothecary's Concoctions
			[505] = 4.13, -- Tradewinds
			[157] = 8.01, -- Rezan's Fury
			[85] = 0.04, -- Gemhide
			[192] = 4.94, -- Meticulous Scheming
			[86] = 0.07, -- Azerite Fortification
			[492] = 3.53, -- Liberator's Might
			[478] = 7.09, -- Tidal Surge
			[522] = 5.92, -- Ancients' Bulwark
			[496] = 1.11, -- Stronger Together
			[561] = 4.31, -- Seductive Power
			[562] = 7.11, -- Treacherous Covenant
			[560] = 2.12, -- Bonded Souls
			[101] = 0.03, -- Shimmering Haven
			[503] = 0.09, -- Auto-Self-Cauterizer
			[31] = 3.75, -- Gutripper
			[521] = 3.76, -- Shadow of Elune
			[196] = 5.34, -- Swirling Sands
			[526] = 5.76, -- Endless Hunger
			[82] = 5.42, -- Champion of Azeroth
			[485] = 7.31, -- Laser Matrix
			[14] = 0.04, -- Longstrider
			[22] = 3.68, -- Heed My Call
			[495] = 4.42, -- Anduin's Dedication
			[87] = 0.02, -- Self Reliance
			[493] = 2.26, -- Last Gift
			[18] = 1.62, -- Blood Siphon
			[554] = 0.06, -- Intimidating Presence
			[494] = 5.66, -- Battlefield Precision
			[500] = 3.96, -- Synaptic Spark Capacitor
			[482] = 6.95, -- Thunderous Blast
			[195] = 4.55, -- Secrets of the Deep
			[194] = 7.19, -- Filthy Transfusion
			[481] = 3.86, -- Incite the Pack
			[504] = 5.18, -- Unstable Catalyst
			[156] = 4.27, -- Ruinous Bolt
			[499] = 3.43, -- Ricocheting Inflatable Pyrosaw
			[83] = 0.1, -- Impassive Visage
			[479] = 4.99, -- Dagger in the Back
			[237] = 6.24, -- Bastion of Might
			[440] = 1.73, -- Callous Reprisal
			[461] = 1.6, -- Earthlink
			[177] = 0.06, -- Bloodsport
			[44] = 0.07, -- Vampiric Speed
			[193] = 5.98, -- Blightborne Infusion
			[502] = 0.01, -- Personal Absorb-o-Tron
		}, 1552989600)

		insertDefaultScalesData(defensiveName, 12, 2, { -- Vengeance Demon Hunter (TMI)
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 4803 - 7957 (avg 5406), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[87] = 0.1, -- Self Reliance
			[496] = 0.51, -- Stronger Together
			[85] = 0.13, -- Gemhide
			[194] = 0.11, -- Filthy Transfusion
			[560] = 1.19, -- Bonded Souls
			[479] = 0.02, -- Dagger in the Back
			[497] = 0.38, -- Stand As One
			[462] = 0.11, -- Azerite Globules
			[196] = 1.84, -- Swirling Sands
			[193] = 2.1, -- Blightborne Infusion
			[494] = 0.07, -- Battlefield Precision
			[541] = 0.69, -- Fight or Flight
			[562] = 2.7, -- Treacherous Covenant
			[44] = 0.06, -- Vampiric Speed
			[156] = 0.06, -- Ruinous Bolt
			[561] = 0.25, -- Seductive Power
			[31] = 0.08, -- Gutripper
			[100] = 0.08, -- Strength in Numbers
			[482] = 0.12, -- Thunderous Blast
			[98] = 0.03, -- Crystalline Carapace
			[82] = 2.61, -- Champion of Azeroth
			[22] = 0.09, -- Heed My Call
			[495] = 1.75, -- Anduin's Dedication
			[221] = 0.08, -- Rigid Carapace
			[481] = 1.45, -- Incite the Pack
			[157] = 0.08, -- Rezan's Fury
			[521] = 2.6, -- Shadow of Elune
			[84] = 0.05, -- Bulwark of the Masses
			[492] = 1.8, -- Liberator's Might
			[202] = 0.07, -- Soulmonger
			[504] = 1.98, -- Unstable Catalyst
			[99] = 0.08, -- Ablative Shielding
			[466] = 0.15, -- Burning Soul
			[86] = 0.11, -- Azerite Fortification
			[89] = 0.1, -- Azerite Veins
			[30] = 2.28, -- Overwhelming Power
			[502] = 0.07, -- Personal Absorb-o-Tron
			[459] = 0.79, -- Unstable Flames
			[14] = 0.11, -- Longstrider
			[564] = 0.02, -- Thrive in Chaos
			[354] = 0.06, -- Cycle of Binding
			[522] = 2, -- Ancients' Bulwark
			[493] = 0.82, -- Last Gift
			[18] = 3.05, -- Blood Siphon
			[483] = 1.86, -- Archive of the Titans
			[20] = 1.34, -- Lifespeed
			[526] = 2, -- Endless Hunger
			[21] = 0.97, -- Elemental Whirl
			[498] = 0.09, -- Barrage Of Many Bombs
			[160] = 0.1, -- Infernal Armor
			[505] = 1.63, -- Tradewinds
			[461] = 0.64, -- Earthlink
			[134] = 0.04, -- Revel in Pain
			[480] = 2.67, -- Blood Rite
			[195] = 1.76, -- Secrets of the Deep
			[499] = 0.01, -- Ricocheting Inflatable Pyrosaw
			[101] = 0.08, -- Shimmering Haven
			[43] = 0.06, -- Winds of War
			[503] = 0.05, -- Auto-Self-Cauterizer
			[355] = 0.06, -- Essence Sever
			[478] = 0.05, -- Tidal Surge
			[13] = 0.12, -- Azerite Empowered
			[246] = 0.01, -- Hour of Reaping
			[485] = 0.08, -- Laser Matrix
			[83] = 0.03, -- Impassive Visage
			[192] = 3.58, -- Meticulous Scheming
			[501] = 2.39, -- Relational Normalization Gizmo
			[15] = 10, -- Resounding Protection
		}, 1552989600)

		insertDefaultScalesData(defensiveName, 6, 1, { -- Blood Death Knight (TMI)
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 7296 - 10277 (avg 7842), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[348] = 0.84, -- Eternal Rune Weapon
			[480] = 2.45, -- Blood Rite
			[106] = 2.86, -- Deep Cuts
			[243] = 5.15, -- Bloody Runeblade
			[15] = 10, -- Resounding Protection
			[140] = 1.99, -- Bone Spike Graveyard
			[501] = 2.08, -- Relational Normalization Gizmo
			[98] = 0.02, -- Crystalline Carapace
			[503] = 0.06, -- Auto-Self-Cauterizer
			[523] = 0.02, -- Apothecary's Concoctions
			[560] = 1.3, -- Bonded Souls
			[478] = 0.14, -- Tidal Surge
			[44] = 0.05, -- Vampiric Speed
			[13] = 0.06, -- Azerite Empowered
			[82] = 1.47, -- Champion of Azeroth
			[100] = 0.05, -- Strength in Numbers
			[505] = 0.55, -- Tradewinds
			[157] = 0.09, -- Rezan's Fury
			[526] = 0.79, -- Endless Hunger
			[497] = 0.06, -- Stand As One
			[481] = 0.49, -- Incite the Pack
			[18] = 2.06, -- Blood Siphon
			[20] = 1.3, -- Lifespeed
			[549] = 0.07, -- Cold Hearted
			[349] = 0.65, -- Bones of the Damned
			[541] = 0.25, -- Fight or Flight
			[521] = 2.33, -- Shadow of Elune
			[195] = 0.61, -- Secrets of the Deep
			[459] = 0.27, -- Unstable Flames
			[21] = 0.6, -- Elemental Whirl
			[465] = 0.02, -- March of the Damned
			[14] = 0.05, -- Longstrider
			[522] = 0.72, -- Ancients' Bulwark
			[461] = 0.3, -- Earthlink
			[495] = 0.61, -- Anduin's Dedication
			[101] = 0.05, -- Shimmering Haven
			[43] = 0.08, -- Winds of War
			[502] = 0.08, -- Personal Absorb-o-Tron
			[85] = 0.04, -- Gemhide
			[192] = 3.2, -- Meticulous Scheming
			[193] = 0.85, -- Blightborne Infusion
			[89] = 0.08, -- Azerite Veins
			[500] = 0.07, -- Synaptic Spark Capacitor
			[561] = 0.22, -- Seductive Power
			[496] = 0.41, -- Stronger Together
			[197] = 4.38, -- Marrowblood
			[196] = 0.84, -- Swirling Sands
			[492] = 1.27, -- Liberator's Might
			[562] = 1, -- Treacherous Covenant
			[30] = 2.31, -- Overwhelming Power
			[498] = 0.18, -- Barrage Of Many Bombs
			[485] = 0.2, -- Laser Matrix
			[483] = 0.56, -- Archive of the Titans
			[493] = 0.37, -- Last Gift
			[86] = 0.07, -- Azerite Fortification
			[194] = 0.01, -- Filthy Transfusion
			[494] = 0.17, -- Battlefield Precision
			[462] = 0.11, -- Azerite Globules
			[479] = 0.05, -- Dagger in the Back
			[504] = 0.64, -- Unstable Catalyst
		}, 1552989600)

		insertDefaultScalesData(defensiveName, 11, 3, { -- Guardian Druid (TMI)
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 5594 - 8184 (avg 6163), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[463] = 0.03, -- Blessed Portents
			[44] = 0.01, -- Vampiric Speed
			[20] = 0.02, -- Lifespeed
			[461] = 0.03, -- Earthlink
			[103] = 0.02, -- Concentrated Mending
			[541] = 0.02, -- Fight or Flight
			[18] = 10, -- Blood Siphon
			[89] = 0.01, -- Azerite Veins
			[43] = 0.01, -- Winds of War
			[478] = 0.01, -- Tidal Surge
			[19] = 0.01, -- Woundbinder
			[192] = 0.01, -- Meticulous Scheming
			[219] = 0.01, -- Reawakening
			[100] = 0.01, -- Strength in Numbers
			[15] = 0.01, -- Resounding Protection
		}, 1552989600)

		insertDefaultScalesData(defensiveName, 10, 1, { -- Brewmaster Monk (TMI)
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 5336 - 11375 (avg 6338), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[196] = 0.33, -- Swirling Sands
			[461] = 0.07, -- Earthlink
			[15] = 6.13, -- Resounding Protection
			[101] = 0.01, -- Shimmering Haven
			[192] = 0.02, -- Meticulous Scheming
			[499] = 0.01, -- Ricocheting Inflatable Pyrosaw
			[38] = 0.09, -- On My Way
			[496] = 0.05, -- Stronger Together
			[21] = 0.08, -- Elemental Whirl
			[566] = 0.01, -- Exit Strategy
			[478] = 0.01, -- Tidal Surge
			[560] = 0.01, -- Bonded Souls
			[541] = 0.08, -- Fight or Flight
			[238] = 0.01, -- Fit to Burst
			[19] = 0.01, -- Woundbinder
			[562] = 0.33, -- Treacherous Covenant
			[481] = 0.22, -- Incite the Pack
			[493] = 0.13, -- Last Gift
			[85] = 0.02, -- Gemhide
			[18] = 1.82, -- Blood Siphon
			[195] = 0.22, -- Secrets of the Deep
			[384] = 0.01, -- Elusive Footwork
			[492] = 0.15, -- Liberator's Might
			[31] = 0.01, -- Gutripper
			[30] = 0.01, -- Overwhelming Power
			[193] = 0.38, -- Blightborne Infusion
			[504] = 0.25, -- Unstable Catalyst
			[480] = 0.02, -- Blood Rite
			[483] = 0.24, -- Archive of the Titans
			[89] = 0.01, -- Azerite Veins
			[521] = 0.02, -- Shadow of Elune
			[44] = 0.01, -- Vampiric Speed
			[82] = 0.24, -- Champion of Azeroth
			[98] = 0.01, -- Crystalline Carapace
			[526] = 0.28, -- Endless Hunger
			[470] = 0.01, -- Sweep the Leg
			[459] = 0.13, -- Unstable Flames
			[503] = 0.01, -- Auto-Self-Cauterizer
			[505] = 0.25, -- Tradewinds
			[494] = 0.01, -- Battlefield Precision
			[186] = 0.29, -- Staggering Strikes
			[116] = 10, -- Boiling Brew
			[100] = 0.01, -- Strength in Numbers
			[522] = 0.29, -- Ancients' Bulwark
			[485] = 0.01, -- Laser Matrix
			[523] = 0.01, -- Apothecary's Concoctions
			[99] = 0.01, -- Ablative Shielding
			[561] = 0.14, -- Seductive Power
			[383] = 0.13, -- Training of Niuzao
			[382] = 0.01, -- Straight, No Chaser
			[42] = 0.02, -- Savior
			[495] = 0.22, -- Anduin's Dedication
		}, 1552989600)

		insertDefaultScalesData(defensiveName, 2, 2, { -- Protection Paladin (TMI)
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 11487 - 14346 (avg 12353), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[196] = 0.01, -- Swirling Sands
			[526] = 0.04, -- Endless Hunger
			[150] = 0.01, -- Soaring Shield
			[522] = 0.04, -- Ancients' Bulwark
			[18] = 3.06, -- Blood Siphon
			[501] = 0.02, -- Relational Normalization Gizmo
			[82] = 0.02, -- Champion of Azeroth
			[15] = 10, -- Resounding Protection
			[38] = 0.01, -- On My Way
			[125] = 0.02, -- Avenger's Might
			[193] = 0.01, -- Blightborne Infusion
			[561] = 0.05, -- Seductive Power
			[521] = 0.01, -- Shadow of Elune
			[493] = 0.02, -- Last Gift
			[481] = 0.03, -- Incite the Pack
			[505] = 0.03, -- Tradewinds
			[497] = 0.01, -- Stand As One
		}, 1552989600)

		insertDefaultScalesData(defensiveName, 1, 3, { -- Protection Warrior (TMI)
			-- SimulationCraft 815-01 for World of Warcraft 8.1.5 Live (wow build 29683)
			-- Iterations: 5612 - 8421 (avg 6263), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 19.03.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[156] = 0.03, -- Ruinous Bolt
			[18] = 3.91, -- Blood Siphon
			[493] = 0.03, -- Last Gift
			[504] = 0.02, -- Unstable Catalyst
			[477] = 0.02, -- Bury the Hatchet
			[82] = 0.02, -- Champion of Azeroth
			[44] = 0.01, -- Vampiric Speed
			[523] = 0.2, -- Apothecary's Concoctions
			[196] = 0.13, -- Swirling Sands
			[101] = 0.02, -- Shimmering Haven
			[505] = 0.02, -- Tradewinds
			[483] = 0.03, -- Archive of the Titans
			[15] = 10, -- Resounding Protection
			[13] = 0.02, -- Azerite Empowered
			[237] = 0.72, -- Bastion of Might
			[85] = 0.02, -- Gemhide
			[502] = 0.02, -- Personal Absorb-o-Tron
			[84] = 0.02, -- Bulwark of the Masses
			[157] = 0.32, -- Rezan's Fury
			[83] = 0.02, -- Impassive Visage
			[476] = 0.01, -- Moment of Glory
			[541] = 0.01, -- Fight or Flight
			[562] = 0.04, -- Treacherous Covenant
			[86] = 0.01, -- Azerite Fortification
			[481] = 0.03, -- Incite the Pack
			[459] = 0.06, -- Unstable Flames
			[480] = 0.01, -- Blood Rite
			[177] = 3.74, -- Bloodsport
			[195] = 0.05, -- Secrets of the Deep
			[193] = 0.12, -- Blightborne Infusion
			[554] = 0.01, -- Intimidating Presence
			[21] = 0.02, -- Elemental Whirl
			[14] = 0.02, -- Longstrider
			[440] = 0.08, -- Callous Reprisal
			[521] = 0.01, -- Shadow of Elune
			[479] = 0.29, -- Dagger in the Back
			[99] = 0.03, -- Ablative Shielding
			[100] = 0.01, -- Strength in Numbers
			[503] = 0.03, -- Auto-Self-Cauterizer
			[89] = 0.01, -- Azerite Veins
			[461] = 0.03, -- Earthlink
			[98] = 0.01, -- Crystalline Carapace
			[87] = 0.01, -- Self Reliance
			[441] = 0.03, -- Iron Fortress
			[194] = 0.59, -- Filthy Transfusion
			[496] = 0.03, -- Stronger Together
			[495] = 0.05, -- Anduin's Dedication
			[497] = 0.01, -- Stand As One
			[492] = 0.05, -- Liberator's Might
		}, 1552989600)

		insertDefaultScalesData(defaultName, 5, 3, { -- Shadow Priest
			-- Shadow Priest by WarcraftPriests (https://warcraftpriests.com/)
			-- https://github.com/WarcraftPriests/bfa-shadow-priest/blob/master/azerite-traits/AzeritePowerWeights_DA.md
			-- First Imported: 03.09.2018, Updated: 19.03.2019
			[405] = 4.6,
			[193] = 4.43,
			[236] = 4.34,
			[562] = 4.33,
			[196] = 3.97,
			[82] = 3.91,
			[479] = 3.7,
			[488] = 3.66,
			[157] = 3.57,
			[522] = 3.54,
			[526] = 3.54,
			[501] = 3.44,
			[192] = 3.32,
			[194] = 3.21,
			[478] = 3.21,
			[485] = 3.2,
			[504] = 3.19,
			[483] = 3.13,
			[482] = 3.11,
			[403] = 3.06,
			[523] = 2.94,
			[195] = 2.87,
			[404] = 2.84,
			[505] = 2.78,
			[489] = 2.74,
			[30] = 2.69,
			[480] = 2.66,
			[521] = 2.64,
			[561] = 2.61,
			[481] = 2.59,
			[486] = 2.58,
			[498] = 2.33,
			[156] = 1.92,
			[31] = 1.74,
			[500] = 1.73,
			[22] = 1.59,
			[459] = 1.53,
			[487] = 1.48,
			[499] = 1.42,
			[560] = 1.38,
			[21] = 1.31,
			[166] = 1.24,
			[491] = 1.05,
			[462] = 1.04,
			[18] = 1.03,
			[38] = 1.03,
			[461] = 0.96,
			[490] = 0.79,
			[13] = 0.44,
			[115] = 0.01,
			[541] = 0,
		}, 1552989600)

		insertDefaultScalesData(defaultName, 2, 1, { -- Holy Paladin

		})

		insertDefaultScalesData(defaultName, 5, 1, { -- Discipline Priest

		})
		insertDefaultScalesData(offensiveName, 5, 1, { -- Discipline Priest

		})

		insertDefaultScalesData(defaultName, 5, 2, { -- Holy Priest

		})

		insertDefaultScalesData(defaultName, 7, 3, { -- Restoration Shaman

		})

		insertDefaultScalesData(defaultName, 10, 2, { -- Mistweaver Monk

		})

		insertDefaultScalesData(defaultName, 11, 4, { -- Restoration Druid

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