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
			-- Iterations: 3179 - 4010 (avg 3423), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[560] = 1.75, -- Bonded Souls
			[498] = 4.06, -- Barrage Of Many Bombs
			[494] = 6.43, -- Battlefield Precision
			[485] = 5.79, -- Laser Matrix
			[459] = 2.78, -- Unstable Flames
			[245] = 5.33, -- Seething Power
			[353] = 6.93, -- Eyes of Rage
			[479] = 6.25, -- Dagger in the Back
			[20] = 1.69, -- Lifespeed
			[30] = 4.41, -- Overwhelming Power
			[483] = 5.42, -- Archive of the Titans
			[195] = 4.74, -- Secrets of the Deep
			[463] = 0.09, -- Blessed Portents
			[481] = 3.3, -- Incite the Pack
			[44] = 0.04, -- Vampiric Speed
			[521] = 4.09, -- Shadow of Elune
			[495] = 4.79, -- Anduin's Dedication
			[193] = 7.6, -- Blightborne Infusion
			[194] = 4.93, -- Filthy Transfusion
			[462] = 1.66, -- Azerite Globules
			[493] = 2.06, -- Last Gift
			[482] = 5.2, -- Thunderous Blast
			[126] = 5.95, -- Revolving Blades
			[31] = 3.16, -- Gutripper
			[18] = 1.66, -- Blood Siphon
			[220] = 4.26, -- Chaotic Transformation
			[159] = 9.56, -- Furious Gaze
			[461] = 1.3, -- Earthlink
			[492] = 4.56, -- Liberator's Might
			[577] = 2.63, -- Arcane Heart
			[523] = 5.18, -- Apothecary's Concoctions
			[569] = 5.56, -- Clockwork Heart
			[196] = 6.89, -- Swirling Sands
			[105] = 0.12, -- Ephemeral Recovery
			[576] = 2.64, -- Loyal to the End
			[82] = 6.9, -- Champion of Azeroth
			[21] = 1.95, -- Elemental Whirl
			[157] = 6.18, -- Rezan's Fury
			[526] = 7.84, -- Endless Hunger
			[562] = 7.37, -- Treacherous Covenant
			[22] = 2.61, -- Heed My Call
			[575] = 10, -- Undulating Tides
			[541] = 1.7, -- Fight or Flight
			[500] = 3.17, -- Synaptic Spark Capacitor
			[505] = 3.7, -- Tradewinds
			[501] = 5.46, -- Relational Normalization Gizmo
			[480] = 4.25, -- Blood Rite
			[497] = 0.83, -- Stand As One
			[496] = 1.25, -- Stronger Together
			[561] = 4.4, -- Seductive Power
			[156] = 3.57, -- Ruinous Bolt
			[522] = 7.92, -- Ancients' Bulwark
			[478] = 5.72, -- Tidal Surge
			[504] = 5.58, -- Unstable Catalyst
			[192] = 3.37, -- Meticulous Scheming
			[499] = 2.23, -- Ricocheting Inflatable Pyrosaw
			[352] = 7.72, -- Thirsting Blades
			[38] = 1.79, -- On My Way
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3182 - 4405 (avg 3434), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[23] = { 6.38, 1.76 }, -- Blood of the Enemy
			[12] = { 8.14, 3.56 }, -- The Crucible of Flame
			[15] = { 3.73, 0 }, -- Ripple in Space
			[4] = { 0.36, 1.31 }, -- Worldvein Resonance
			[5] = { 8.47, 3.41 }, -- Essence of the Focusing Iris
			[6] = { 5.84, 2.98 }, -- Purification Protocol
			[22] = { 6.84, 1.22 }, -- Vision of Perfection
			[27] = { 2.96, 1.56 }, -- Memory of Lucid Dreams
			[32] = { 0, 2.67 }, -- Conflict and Strife
			[28] = { 3.62, 1.76 }, -- The Unbound Force
			[14] = { 10, 3.57 }, -- Condensed Life-Force
		}, 1571389200)

		insertDefaultScalesData(offensiveName, 12, 2, { -- Vengeance Demon Hunter
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 1167 - 2953 (avg 1421), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[246] = 0.03, -- Hour of Reaping
			[22] = 2.74, -- Heed My Call
			[500] = 3.46, -- Synaptic Spark Capacitor
			[15] = 0.03, -- Resounding Protection
			[502] = 0.12, -- Personal Absorb-o-Tron
			[493] = 1.84, -- Last Gift
			[101] = 0.02, -- Shimmering Haven
			[87] = 0.08, -- Self Reliance
			[541] = 1.33, -- Fight or Flight
			[196] = 4.54, -- Swirling Sands
			[195] = 3.57, -- Secrets of the Deep
			[478] = 6.3, -- Tidal Surge
			[560] = 1.14, -- Bonded Souls
			[501] = 3.62, -- Relational Normalization Gizmo
			[504] = 4.08, -- Unstable Catalyst
			[21] = 1.42, -- Elemental Whirl
			[84] = 0.08, -- Bulwark of the Masses
			[160] = 0.08, -- Infernal Armor
			[496] = 0.97, -- Stronger Together
			[30] = 2.35, -- Overwhelming Power
			[481] = 2.98, -- Incite the Pack
			[193] = 4.84, -- Blightborne Infusion
			[568] = 0.09, -- Person-Computer Interface
			[192] = 3.41, -- Meticulous Scheming
			[104] = 0.03, -- Bracing Chill
			[105] = 0.15, -- Ephemeral Recovery
			[483] = 4.05, -- Archive of the Titans
			[480] = 2.61, -- Blood Rite
			[561] = 2.93, -- Seductive Power
			[31] = 2.88, -- Gutripper
			[83] = 0.07, -- Impassive Visage
			[156] = 3.74, -- Ruinous Bolt
			[569] = 3.56, -- Clockwork Heart
			[194] = 5.76, -- Filthy Transfusion
			[89] = 0.08, -- Azerite Veins
			[13] = 0.04, -- Azerite Empowered
			[462] = 1.8, -- Azerite Globules
			[498] = 4.17, -- Barrage Of Many Bombs
			[19] = 0.04, -- Woundbinder
			[461] = 1.3, -- Earthlink
			[43] = 0.02, -- Winds of War
			[479] = 4.53, -- Dagger in the Back
			[495] = 3.45, -- Anduin's Dedication
			[522] = 4.19, -- Ancients' Bulwark
			[497] = 0.9, -- Stand As One
			[562] = 5.65, -- Treacherous Covenant
			[503] = 0.01, -- Auto-Self-Cauterizer
			[485] = 5.52, -- Laser Matrix
			[576] = 2.22, -- Loyal to the End
			[564] = 0.08, -- Thrive in Chaos
			[521] = 2.43, -- Shadow of Elune
			[575] = 10, -- Undulating Tides
			[18] = 1.26, -- Blood Siphon
			[354] = 0.08, -- Cycle of Binding
			[577] = 0.61, -- Arcane Heart
			[82] = 4.1, -- Champion of Azeroth
			[494] = 6.39, -- Battlefield Precision
			[499] = 2.51, -- Ricocheting Inflatable Pyrosaw
			[459] = 1.9, -- Unstable Flames
			[492] = 2.93, -- Liberator's Might
			[14] = 0.08, -- Longstrider
			[20] = 1.14, -- Lifespeed
			[482] = 5.34, -- Thunderous Blast
			[100] = 0.06, -- Strength in Numbers
			[38] = 1.3, -- On My Way
			[523] = 5.11, -- Apothecary's Concoctions
			[463] = 0.16, -- Blessed Portents
			[526] = 4.34, -- Endless Hunger
			[157] = 6.19, -- Rezan's Fury
			[466] = 0.03, -- Burning Soul
			[505] = 3.24, -- Tradewinds
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 1186 - 1459 (avg 1303), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[12] = { 10, 3.54 }, -- The Crucible of Flame
			[15] = { 3.83, 0.08 }, -- Ripple in Space
			[22] = { 0.86, 0.21 }, -- Vision of Perfection
			[2] = { 0.04, 0.01 }, -- Azeroth's Undying Gift
			[3] = { 2.4, 2.45 }, -- Sphere of Suppression
			[7] = { 2.5, 0.02 }, -- Anima of Life and Death
			[13] = { 0.04, 0 }, -- Nullification Dynamo
			[4] = { 1.15, 0.87 }, -- Worldvein Resonance
			[25] = { 0.52, 0.55 }, -- Aegis of the Deep
			[27] = { 1.05, 0.97 }, -- Memory of Lucid Dreams
			[32] = { 1.09, 1.06 }, -- Conflict and Strife
		}, 1571389200)

		insertDefaultScalesData(offensiveName, 6, 1, { -- Blood Death Knight
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2130 - 3009 (avg 2339), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[82] = 4.44, -- Champion of Azeroth
			[494] = 6.23, -- Battlefield Precision
			[500] = 3.05, -- Synaptic Spark Capacitor
			[561] = 2.87, -- Seductive Power
			[496] = 0.86, -- Stronger Together
			[461] = 1.06, -- Earthlink
			[21] = 1.49, -- Elemental Whirl
			[521] = 3.2, -- Shadow of Elune
			[523] = 5.34, -- Apothecary's Concoctions
			[192] = 4.02, -- Meticulous Scheming
			[157] = 6.29, -- Rezan's Fury
			[526] = 4.63, -- Endless Hunger
			[243] = 3.56, -- Bloody Runeblade
			[140] = 0.75, -- Bone Spike Graveyard
			[31] = 3, -- Gutripper
			[480] = 3.26, -- Blood Rite
			[485] = 5.49, -- Laser Matrix
			[541] = 1.07, -- Fight or Flight
			[497] = 0.81, -- Stand As One
			[495] = 3.09, -- Anduin's Dedication
			[483] = 3.58, -- Archive of the Titans
			[38] = 1.29, -- On My Way
			[195] = 3.05, -- Secrets of the Deep
			[22] = 2.81, -- Heed My Call
			[492] = 3.16, -- Liberator's Might
			[156] = 3.71, -- Ruinous Bolt
			[577] = 0.44, -- Arcane Heart
			[575] = 10, -- Undulating Tides
			[482] = 5.47, -- Thunderous Blast
			[499] = 2.48, -- Ricocheting Inflatable Pyrosaw
			[101] = 0.03, -- Shimmering Haven
			[560] = 1.66, -- Bonded Souls
			[44] = 0.06, -- Vampiric Speed
			[493] = 1.48, -- Last Gift
			[462] = 1.75, -- Azerite Globules
			[505] = 2.83, -- Tradewinds
			[196] = 4.83, -- Swirling Sands
			[576] = 1.91, -- Loyal to the End
			[106] = 1.54, -- Deep Cuts
			[194] = 5.45, -- Filthy Transfusion
			[193] = 5.37, -- Blightborne Infusion
			[30] = 3.38, -- Overwhelming Power
			[349] = 0.3, -- Bones of the Damned
			[104] = 0.05, -- Bracing Chill
			[498] = 3.97, -- Barrage Of Many Bombs
			[569] = 4.14, -- Clockwork Heart
			[20] = 1.11, -- Lifespeed
			[348] = 3.13, -- Eternal Rune Weapon
			[501] = 3.77, -- Relational Normalization Gizmo
			[562] = 4.93, -- Treacherous Covenant
			[18] = 0.92, -- Blood Siphon
			[481] = 2.62, -- Incite the Pack
			[504] = 3.57, -- Unstable Catalyst
			[479] = 4.66, -- Dagger in the Back
			[522] = 4.81, -- Ancients' Bulwark
			[478] = 5.93, -- Tidal Surge
			[459] = 1.78, -- Unstable Flames
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 1836 - 2430 (avg 2255), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[25] = { 0.55, 0.53 }, -- Aegis of the Deep
			[4] = { 1.19, 0.75 }, -- Worldvein Resonance
			[15] = { 3.73, 0 }, -- Ripple in Space
			[12] = { 10, 3.69 }, -- The Crucible of Flame
			[32] = { 1.35, 1.28 }, -- Conflict and Strife
			[7] = { 2.06, 0 }, -- Anima of Life and Death
			[27] = { 0, 1.3 }, -- Memory of Lucid Dreams
			[3] = { 3.2, 3.15 }, -- Sphere of Suppression
		}, 1571389200)

		insertDefaultScalesData(defaultName, 6, 2, { -- Frost Death Knight
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3938 - 5083 (avg 4276), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[89] = 0.18, -- Azerite Veins
			[31] = 2.92, -- Gutripper
			[194] = 5.07, -- Filthy Transfusion
			[462] = 1.6, -- Azerite Globules
			[347] = 6.05, -- Frozen Tempest
			[569] = 5.38, -- Clockwork Heart
			[101] = 0.09, -- Shimmering Haven
			[499] = 2.04, -- Ricocheting Inflatable Pyrosaw
			[493] = 3.61, -- Last Gift
			[156] = 3.58, -- Ruinous Bolt
			[575] = 9.57, -- Undulating Tides
			[496] = 1.31, -- Stronger Together
			[192] = 5.07, -- Meticulous Scheming
			[346] = 4.89, -- Killer Frost
			[108] = 6.1, -- Icy Citadel
			[43] = 0.15, -- Winds of War
			[103] = 0.05, -- Concentrated Mending
			[461] = 2.12, -- Earthlink
			[459] = 2.91, -- Unstable Flames
			[576] = 4.85, -- Loyal to the End
			[87] = 0.09, -- Self Reliance
			[157] = 6.11, -- Rezan's Fury
			[193] = 8.72, -- Blightborne Infusion
			[526] = 9.93, -- Endless Hunger
			[521] = 5.2, -- Shadow of Elune
			[20] = 2.22, -- Lifespeed
			[196] = 8.01, -- Swirling Sands
			[523] = 5.18, -- Apothecary's Concoctions
			[141] = 5.27, -- Latent Chill
			[198] = 4.28, -- Frostwhelp's Indignation
			[494] = 5.96, -- Battlefield Precision
			[501] = 6.33, -- Relational Normalization Gizmo
			[541] = 2.07, -- Fight or Flight
			[561] = 5.21, -- Seductive Power
			[483] = 6.23, -- Archive of the Titans
			[485] = 5.49, -- Laser Matrix
			[560] = 2.1, -- Bonded Souls
			[21] = 3, -- Elemental Whirl
			[479] = 6.35, -- Dagger in the Back
			[38] = 2.5, -- On My Way
			[18] = 2.54, -- Blood Siphon
			[498] = 3.64, -- Barrage Of Many Bombs
			[22] = 2.42, -- Heed My Call
			[85] = 0.18, -- Gemhide
			[522] = 10, -- Ancients' Bulwark
			[500] = 3.03, -- Synaptic Spark Capacitor
			[105] = 0.03, -- Ephemeral Recovery
			[482] = 4.97, -- Thunderous Blast
			[30] = 4.9, -- Overwhelming Power
			[83] = 0.11, -- Impassive Visage
			[478] = 5.73, -- Tidal Surge
			[502] = 0.02, -- Personal Absorb-o-Tron
			[104] = 0.16, -- Bracing Chill
			[86] = 0.08, -- Azerite Fortification
			[242] = 4.8, -- Echoing Howl
			[505] = 7.21, -- Tradewinds
			[480] = 5.04, -- Blood Rite
			[44] = 0.14, -- Vampiric Speed
			[504] = 6.34, -- Unstable Catalyst
			[577] = 3.47, -- Arcane Heart
			[481] = 6.44, -- Incite the Pack
			[562] = 8.89, -- Treacherous Covenant
			[82] = 8.21, -- Champion of Azeroth
			[492] = 5.1, -- Liberator's Might
			[497] = 1.29, -- Stand As One
			[42] = 0.21, -- Savior
			[495] = 5.7, -- Anduin's Dedication
			[195] = 6.11, -- Secrets of the Deep
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3616 - 4468 (avg 4114), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[23] = { 9.1, 1.55 }, -- Blood of the Enemy
			[15] = { 4.1, 0.12 }, -- Ripple in Space
			[5] = { 8.95, 3.36 }, -- Essence of the Focusing Iris
			[22] = { 4.1, 0 }, -- Vision of Perfection
			[14] = { 8.17, 2.9 }, -- Condensed Life-Force
			[4] = { 1.58, 1.45 }, -- Worldvein Resonance
			[32] = { 6.47, 2.6 }, -- Conflict and Strife
			[28] = { 3.87, 1.68 }, -- The Unbound Force
			[12] = { 7.75, 3.21 }, -- The Crucible of Flame
			[27] = { 10, 5.83 }, -- Memory of Lucid Dreams
			[6] = { 6.09, 2.45 }, -- Purification Protocol
		}, 1571389200)

		insertDefaultScalesData(defaultName, 6, 3, { -- Unholy Death Knight
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2492 - 3365 (avg 2694), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[195] = 5.38, -- Secrets of the Deep
			[15] = 0.08, -- Resounding Protection
			[505] = 5.28, -- Tradewinds
			[575] = 10, -- Undulating Tides
			[18] = 1.91, -- Blood Siphon
			[351] = 2.97, -- Last Surprise
			[576] = 3.44, -- Loyal to the End
			[196] = 7.44, -- Swirling Sands
			[485] = 5.56, -- Laser Matrix
			[498] = 3.99, -- Barrage Of Many Bombs
			[504] = 6.25, -- Unstable Catalyst
			[569] = 5.9, -- Clockwork Heart
			[481] = 4.73, -- Incite the Pack
			[199] = 9.53, -- Festermight
			[501] = 5.83, -- Relational Normalization Gizmo
			[30] = 4.45, -- Overwhelming Power
			[480] = 4.52, -- Blood Rite
			[350] = 4.27, -- Cankerous Wounds
			[157] = 6.27, -- Rezan's Fury
			[478] = 6.32, -- Tidal Surge
			[142] = 5.63, -- Helchains
			[493] = 3, -- Last Gift
			[560] = 2.17, -- Bonded Souls
			[541] = 1.8, -- Fight or Flight
			[521] = 4.82, -- Shadow of Elune
			[194] = 4.87, -- Filthy Transfusion
			[462] = 1.77, -- Azerite Globules
			[482] = 4.98, -- Thunderous Blast
			[21] = 2.5, -- Elemental Whirl
			[31] = 2.99, -- Gutripper
			[38] = 2.68, -- On My Way
			[495] = 5.19, -- Anduin's Dedication
			[192] = 5.61, -- Meticulous Scheming
			[82] = 7.42, -- Champion of Azeroth
			[461] = 1.52, -- Earthlink
			[494] = 6.08, -- Battlefield Precision
			[20] = 2.51, -- Lifespeed
			[496] = 1.74, -- Stronger Together
			[497] = 1.17, -- Stand As One
			[459] = 2.74, -- Unstable Flames
			[244] = 5.67, -- Harrowing Decay
			[561] = 4.59, -- Seductive Power
			[492] = 5.02, -- Liberator's Might
			[503] = 0.19, -- Auto-Self-Cauterizer
			[193] = 8.39, -- Blightborne Infusion
			[22] = 2.47, -- Heed My Call
			[523] = 4.82, -- Apothecary's Concoctions
			[499] = 2.21, -- Ricocheting Inflatable Pyrosaw
			[526] = 8.97, -- Endless Hunger
			[101] = 0.05, -- Shimmering Haven
			[109] = 6.67, -- Magus of the Dead
			[562] = 8.4, -- Treacherous Covenant
			[483] = 5.66, -- Archive of the Titans
			[500] = 3.22, -- Synaptic Spark Capacitor
			[465] = 0.19, -- March of the Damned
			[84] = 0.12, -- Bulwark of the Masses
			[479] = 6.68, -- Dagger in the Back
			[156] = 3.6, -- Ruinous Bolt
			[577] = 1.61, -- Arcane Heart
			[522] = 9.31, -- Ancients' Bulwark
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2386 - 3545 (avg 2702), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[23] = { 6.85, 0.76 }, -- Blood of the Enemy
			[4] = { 1.42, 0.9 }, -- Worldvein Resonance
			[12] = { 7.84, 2.95 }, -- The Crucible of Flame
			[28] = { 3.54, 1.65 }, -- The Unbound Force
			[22] = { 6.47, 2.24 }, -- Vision of Perfection
			[32] = { 2.2, 2.06 }, -- Conflict and Strife
			[6] = { 5.5, 2.41 }, -- Purification Protocol
			[14] = { 8.16, 2.84 }, -- Condensed Life-Force
			[15] = { 3.97, 0 }, -- Ripple in Space
			[27] = { 4.68, 2.95 }, -- Memory of Lucid Dreams
			[5] = { 10, 3.17 }, -- Essence of the Focusing Iris
		}, 1571389200)

		insertDefaultScalesData(defaultName, 11, 1, { -- Balance Druid
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2758 - 3703 (avg 3019), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[502] = 0.01, -- Personal Absorb-o-Tron
			[462] = 1.17, -- Azerite Globules
			[569] = 4.47, -- Clockwork Heart
			[84] = 0.16, -- Bulwark of the Masses
			[497] = 0.89, -- Stand As One
			[157] = 3.83, -- Rezan's Fury
			[38] = 1.57, -- On My Way
			[173] = 2.29, -- Power of the Moon
			[99] = 0.01, -- Ablative Shielding
			[357] = 0.02, -- Lunar Shrapnel
			[485] = 3.6, -- Laser Matrix
			[501] = 4.18, -- Relational Normalization Gizmo
			[22] = 1.65, -- Heed My Call
			[98] = 0.12, -- Crystalline Carapace
			[85] = 0.09, -- Gemhide
			[364] = 2.77, -- Lively Spirit
			[478] = 3.75, -- Tidal Surge
			[562] = 5.41, -- Treacherous Covenant
			[526] = 5.35, -- Endless Hunger
			[250] = 3.67, -- Dawning Sun
			[492] = 3.36, -- Liberator's Might
			[200] = 10, -- Arcanic Pulsar
			[103] = 0.18, -- Concentrated Mending
			[479] = 4.08, -- Dagger in the Back
			[575] = 6.45, -- Undulating Tides
			[482] = 3.33, -- Thunderous Blast
			[30] = 3.44, -- Overwhelming Power
			[496] = 1.14, -- Stronger Together
			[500] = 2, -- Synaptic Spark Capacitor
			[192] = 4.46, -- Meticulous Scheming
			[459] = 2.13, -- Unstable Flames
			[494] = 3.9, -- Battlefield Precision
			[156] = 2.38, -- Ruinous Bolt
			[499] = 1.43, -- Ricocheting Inflatable Pyrosaw
			[18] = 1.59, -- Blood Siphon
			[356] = 1.67, -- High Noon
			[576] = 2.92, -- Loyal to the End
			[523] = 3.19, -- Apothecary's Concoctions
			[495] = 3.42, -- Anduin's Dedication
			[541] = 1.13, -- Fight or Flight
			[21] = 1.81, -- Elemental Whirl
			[100] = 0.06, -- Strength in Numbers
			[219] = 0.05, -- Reawakening
			[521] = 3.21, -- Shadow of Elune
			[122] = 3.9, -- Streaking Stars
			[561] = 2.78, -- Seductive Power
			[463] = 0.01, -- Blessed Portents
			[560] = 1.54, -- Bonded Souls
			[82] = 5.36, -- Champion of Azeroth
			[493] = 2.35, -- Last Gift
			[505] = 4.41, -- Tradewinds
			[20] = 1.73, -- Lifespeed
			[193] = 5.8, -- Blightborne Infusion
			[194] = 3.44, -- Filthy Transfusion
			[503] = 0.04, -- Auto-Self-Cauterizer
			[577] = 2.02, -- Arcane Heart
			[31] = 1.7, -- Gutripper
			[461] = 1.1, -- Earthlink
			[480] = 3.41, -- Blood Rite
			[540] = 0.17, -- Switch Hitter
			[481] = 4, -- Incite the Pack
			[195] = 3.41, -- Secrets of the Deep
			[14] = 0.22, -- Longstrider
			[483] = 3.59, -- Archive of the Titans
			[467] = 0.06, -- Ursoc's Endurance
			[504] = 3.79, -- Unstable Catalyst
			[196] = 5.06, -- Swirling Sands
			[498] = 2.48, -- Barrage Of Many Bombs
			[42] = 0.06, -- Savior
			[522] = 5.32, -- Ancients' Bulwark
			[101] = 0.18, -- Shimmering Haven
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2408 - 3248 (avg 2931), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[5] = { 7.12, 3.65 }, -- Essence of the Focusing Iris
			[32] = { 10, 2.14 }, -- Conflict and Strife
			[6] = { 4.12, 2.41 }, -- Purification Protocol
			[4] = { 0.29, 1.12 }, -- Worldvein Resonance
			[12] = { 5.1, 2.83 }, -- The Crucible of Flame
			[23] = { 5.11, 0.99 }, -- Blood of the Enemy
			[15] = { 2.48, 0.12 }, -- Ripple in Space
			[22] = { 4.45, 1.23 }, -- Vision of Perfection
			[27] = { 4.39, 2.67 }, -- Memory of Lucid Dreams
			[14] = { 7.52, 2.72 }, -- Condensed Life-Force
			[28] = { 2.96, 2.02 }, -- The Unbound Force
		}, 1571389200)

		insertDefaultScalesData(defaultName, 11, 2, { -- Feral Druid
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4334 - 5301 (avg 4763), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[502] = 0.47, -- Personal Absorb-o-Tron
			[462] = 1.78, -- Azerite Globules
			[241] = 0.15, -- Twisted Claws
			[101] = 0.45, -- Shimmering Haven
			[504] = 4.88, -- Unstable Catalyst
			[540] = 0.14, -- Switch Hitter
			[14] = 0.29, -- Longstrider
			[195] = 4.25, -- Secrets of the Deep
			[575] = 8.38, -- Undulating Tides
			[18] = 2.22, -- Blood Siphon
			[467] = 0.26, -- Ursoc's Endurance
			[89] = 0.26, -- Azerite Veins
			[522] = 7.6, -- Ancients' Bulwark
			[526] = 7.37, -- Endless Hunger
			[31] = 3.02, -- Gutripper
			[480] = 3.71, -- Blood Rite
			[499] = 2.35, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.08, -- Synaptic Spark Capacitor
			[493] = 3.32, -- Last Gift
			[98] = 0.18, -- Crystalline Carapace
			[485] = 5, -- Laser Matrix
			[358] = 5.19, -- Gushing Lacerations
			[523] = 4.38, -- Apothecary's Concoctions
			[22] = 2.59, -- Heed My Call
			[561] = 3.82, -- Seductive Power
			[568] = 0.47, -- Person-Computer Interface
			[497] = 1.3, -- Stand As One
			[562] = 6.69, -- Treacherous Covenant
			[496] = 1.78, -- Stronger Together
			[569] = 6.27, -- Clockwork Heart
			[478] = 5.51, -- Tidal Surge
			[171] = 0.36, -- Masterful Instincts
			[15] = 0.19, -- Resounding Protection
			[19] = 0.16, -- Woundbinder
			[100] = 0.46, -- Strength in Numbers
			[99] = 0.24, -- Ablative Shielding
			[43] = 0.24, -- Winds of War
			[521] = 3.82, -- Shadow of Elune
			[194] = 4.3, -- Filthy Transfusion
			[577] = 2.62, -- Arcane Heart
			[459] = 3.21, -- Unstable Flames
			[541] = 1.83, -- Fight or Flight
			[193] = 8.16, -- Blightborne Infusion
			[13] = 0.14, -- Azerite Empowered
			[169] = 2.76, -- Untamed Ferocity
			[156] = 3.52, -- Ruinous Bolt
			[479] = 5.72, -- Dagger in the Back
			[111] = 4.79, -- Blood Mist
			[44] = 0.4, -- Vampiric Speed
			[86] = 0.3, -- Azerite Fortification
			[21] = 2.49, -- Elemental Whirl
			[463] = 0.31, -- Blessed Portents
			[495] = 4.21, -- Anduin's Dedication
			[494] = 5.54, -- Battlefield Precision
			[83] = 0.27, -- Impassive Visage
			[492] = 4.7, -- Liberator's Might
			[157] = 5.34, -- Rezan's Fury
			[173] = 0.36, -- Power of the Moon
			[82] = 7.1, -- Champion of Azeroth
			[105] = 0.37, -- Ephemeral Recovery
			[247] = 1.54, -- Iron Jaws
			[482] = 4.77, -- Thunderous Blast
			[219] = 0.35, -- Reawakening
			[87] = 0.48, -- Self Reliance
			[461] = 1.85, -- Earthlink
			[359] = 6.37, -- Wild Fleshrending
			[20] = 1.72, -- Lifespeed
			[30] = 3.55, -- Overwhelming Power
			[38] = 2.42, -- On My Way
			[481] = 5.36, -- Incite the Pack
			[501] = 4.89, -- Relational Normalization Gizmo
			[85] = 0.35, -- Gemhide
			[192] = 4.63, -- Meticulous Scheming
			[483] = 5.16, -- Archive of the Titans
			[576] = 4.16, -- Loyal to the End
			[84] = 0.41, -- Bulwark of the Masses
			[209] = 10, -- Jungle Fury
			[103] = 0.43, -- Concentrated Mending
			[560] = 2.1, -- Bonded Souls
			[196] = 7.31, -- Swirling Sands
			[498] = 3.56, -- Barrage Of Many Bombs
			[42] = 0.16, -- Savior
			[104] = 0.33, -- Bracing Chill
			[505] = 5.79, -- Tradewinds
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4256 - 4879 (avg 4669), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[14] = { 6.11, 2.37 }, -- Condensed Life-Force
			[28] = { 2.43, 1.4 }, -- The Unbound Force
			[15] = { 2.68, 0.11 }, -- Ripple in Space
			[27] = { 2.71, 2.4 }, -- Memory of Lucid Dreams
			[4] = { 0.93, 1.1 }, -- Worldvein Resonance
			[12] = { 6.01, 2.51 }, -- The Crucible of Flame
			[23] = { 4.74, 0.83 }, -- Blood of the Enemy
			[22] = { 2.04, 0.66 }, -- Vision of Perfection
			[32] = { 10, 1.86 }, -- Conflict and Strife
			[5] = { 6.05, 2.34 }, -- Essence of the Focusing Iris
			[6] = { 4.46, 2.06 }, -- Purification Protocol
		}, 1571389200)

		insertDefaultScalesData(offensiveName, 11, 3, { -- Guardian Druid
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 997 - 1656 (avg 1187), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[496] = 1.04, -- Stronger Together
			[569] = 4.19, -- Clockwork Heart
			[497] = 1.03, -- Stand As One
			[156] = 3.79, -- Ruinous Bolt
			[194] = 5.39, -- Filthy Transfusion
			[503] = 0.09, -- Auto-Self-Cauterizer
			[18] = 1.61, -- Blood Siphon
			[85] = 0.16, -- Gemhide
			[479] = 4.56, -- Dagger in the Back
			[38] = 1.48, -- On My Way
			[523] = 5.14, -- Apothecary's Concoctions
			[485] = 5.58, -- Laser Matrix
			[459] = 1.69, -- Unstable Flames
			[498] = 3.92, -- Barrage Of Many Bombs
			[501] = 4.25, -- Relational Normalization Gizmo
			[561] = 3.16, -- Seductive Power
			[493] = 2.15, -- Last Gift
			[562] = 6.04, -- Treacherous Covenant
			[521] = 3.25, -- Shadow of Elune
			[360] = 0.11, -- Gory Regeneration
			[82] = 5.09, -- Champion of Azeroth
			[192] = 4.4, -- Meticulous Scheming
			[22] = 2.7, -- Heed My Call
			[575] = 10, -- Undulating Tides
			[560] = 1.66, -- Bonded Souls
			[526] = 5.12, -- Endless Hunger
			[577] = 0.98, -- Arcane Heart
			[482] = 5.42, -- Thunderous Blast
			[495] = 3.88, -- Anduin's Dedication
			[31] = 3.2, -- Gutripper
			[15] = 0.01, -- Resounding Protection
			[241] = 4.52, -- Twisted Claws
			[359] = 1.6, -- Wild Fleshrending
			[20] = 1.8, -- Lifespeed
			[42] = 0.05, -- Savior
			[478] = 6.47, -- Tidal Surge
			[19] = 0.08, -- Woundbinder
			[30] = 3.16, -- Overwhelming Power
			[500] = 3.31, -- Synaptic Spark Capacitor
			[196] = 4.5, -- Swirling Sands
			[157] = 6.24, -- Rezan's Fury
			[492] = 3.18, -- Liberator's Might
			[251] = 4.53, -- Burst of Savagery
			[522] = 5.36, -- Ancients' Bulwark
			[87] = 0.02, -- Self Reliance
			[195] = 3.91, -- Secrets of the Deep
			[21] = 1.85, -- Elemental Whirl
			[504] = 4.38, -- Unstable Catalyst
			[499] = 2.27, -- Ricocheting Inflatable Pyrosaw
			[361] = 4.13, -- Guardian's Wrath
			[480] = 3.4, -- Blood Rite
			[89] = 0.02, -- Azerite Veins
			[576] = 2.41, -- Loyal to the End
			[541] = 1.4, -- Fight or Flight
			[481] = 3.59, -- Incite the Pack
			[505] = 3.76, -- Tradewinds
			[483] = 4.54, -- Archive of the Titans
			[462] = 1.89, -- Azerite Globules
			[43] = 0.07, -- Winds of War
			[494] = 6.41, -- Battlefield Precision
			[193] = 5.06, -- Blightborne Infusion
			[461] = 1.17, -- Earthlink
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 1057 - 1372 (avg 1145), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[22] = { 1.56, 0.04 }, -- Vision of Perfection
			[32] = { 6.67, 1.55 }, -- Conflict and Strife
			[12] = { 10, 3.95 }, -- The Crucible of Flame
			[13] = { 0.02, 0.03 }, -- Nullification Dynamo
			[7] = { 2.1, 0.03 }, -- Anima of Life and Death
			[25] = { 0.71, 0.67 }, -- Aegis of the Deep
			[15] = { 3.97, 0 }, -- Ripple in Space
			[2] = { 0, 0.05 }, -- Azeroth's Undying Gift
			[3] = { 3.44, 3.48 }, -- Sphere of Suppression
			[27] = { 1.4, 0.63 }, -- Memory of Lucid Dreams
			[4] = { 0.89, 1.16 }, -- Worldvein Resonance
		}, 1571389200)

		insertDefaultScalesData(defaultName, 11, 4, { -- Restoration Druid
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 1959 - 2617 (avg 2174), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[526] = 7.19, -- Endless Hunger
			[492] = 4.79, -- Liberator's Might
			[14] = 0.01, -- Longstrider
			[499] = 2.32, -- Ricocheting Inflatable Pyrosaw
			[569] = 5.36, -- Clockwork Heart
			[493] = 0.1, -- Last Gift
			[22] = 2.65, -- Heed My Call
			[575] = 10, -- Undulating Tides
			[496] = 1.4, -- Stronger Together
			[480] = 4.9, -- Blood Rite
			[541] = 1.46, -- Fight or Flight
			[99] = 0.06, -- Ablative Shielding
			[194] = 5.34, -- Filthy Transfusion
			[192] = 5.65, -- Meticulous Scheming
			[500] = 3.29, -- Synaptic Spark Capacitor
			[461] = 1.4, -- Earthlink
			[462] = 1.76, -- Azerite Globules
			[87] = 0.14, -- Self Reliance
			[30] = 4.36, -- Overwhelming Power
			[363] = 0.11, -- Waking Dream
			[497] = 1.11, -- Stand As One
			[521] = 4.82, -- Shadow of Elune
			[568] = 0.22, -- Person-Computer Interface
			[467] = 0.25, -- Ursoc's Endurance
			[482] = 5.26, -- Thunderous Blast
			[479] = 6.42, -- Dagger in the Back
			[495] = 4.03, -- Anduin's Dedication
			[15] = 0.18, -- Resounding Protection
			[102] = 0.04, -- Synergistic Growth
			[13] = 0.13, -- Azerite Empowered
			[86] = 0.14, -- Azerite Fortification
			[82] = 5.84, -- Champion of Azeroth
			[20] = 2.69, -- Lifespeed
			[98] = 0.09, -- Crystalline Carapace
			[494] = 6.63, -- Battlefield Precision
			[156] = 3.71, -- Ruinous Bolt
			[562] = 6.44, -- Treacherous Covenant
			[193] = 6.95, -- Blightborne Infusion
			[523] = 4.99, -- Apothecary's Concoctions
			[502] = 0.13, -- Personal Absorb-o-Tron
			[483] = 4.64, -- Archive of the Titans
			[100] = 0.13, -- Strength in Numbers
			[83] = 0.09, -- Impassive Visage
			[540] = 0.25, -- Switch Hitter
			[31] = 3.32, -- Gutripper
			[459] = 2.38, -- Unstable Flames
			[356] = 2.86, -- High Noon
			[21] = 2.45, -- Elemental Whirl
			[498] = 4.28, -- Barrage Of Many Bombs
			[196] = 6.25, -- Swirling Sands
			[577] = 1.59, -- Arcane Heart
			[576] = 0.06, -- Loyal to the End
			[104] = 0.18, -- Bracing Chill
			[560] = 2.78, -- Bonded Souls
			[522] = 7.04, -- Ancients' Bulwark
			[561] = 3.35, -- Seductive Power
			[18] = 0.22, -- Blood Siphon
			[105] = 0.25, -- Ephemeral Recovery
			[101] = 0.01, -- Shimmering Haven
			[157] = 6.37, -- Rezan's Fury
			[195] = 4.1, -- Secrets of the Deep
			[362] = 0.04, -- Rampant Growth
			[478] = 6.27, -- Tidal Surge
			[481] = 0.03, -- Incite the Pack
			[210] = 0.11, -- Autumn Leaves
			[501] = 5.65, -- Relational Normalization Gizmo
			[364] = 0.21, -- Lively Spirit
			[38] = 1.92, -- On My Way
			[505] = 0.39, -- Tradewinds
			[485] = 5.45, -- Laser Matrix
			[19] = 0.08, -- Woundbinder
			[43] = 0.08, -- Winds of War
			[504] = 4.74, -- Unstable Catalyst
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 1917 - 2292 (avg 2132), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[32] = { 1.92, 2.1 }, -- Conflict and Strife
			[14] = { 3.06, 2.98 }, -- Condensed Life-Force
			[27] = { 1.01, 0.06 }, -- Memory of Lucid Dreams
			[15] = { 0.08, 0 }, -- Ripple in Space
			[23] = { 1.88, 1.77 }, -- Blood of the Enemy
			[12] = { 10, 4.07 }, -- The Crucible of Flame
			[28] = { 1.68, 1.6 }, -- The Unbound Force
			[4] = { 1.1, 0.95 }, -- Worldvein Resonance
			[22] = { 0.13, 0 }, -- Vision of Perfection
			[5] = { 2.99, 3.05 }, -- Essence of the Focusing Iris
			[6] = { 2.67, 2.77 }, -- Purification Protocol
		}, 1571389200)

		insertDefaultScalesData(defaultName, 3, 1, { -- Beast Mastery Hunter
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2925 - 3643 (avg 3204), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[98] = 0.11, -- Crystalline Carapace
			[480] = 4.77, -- Blood Rite
			[20] = 1.9, -- Lifespeed
			[504] = 5.12, -- Unstable Catalyst
			[483] = 5.15, -- Archive of the Titans
			[459] = 2.53, -- Unstable Flames
			[100] = 0.05, -- Strength in Numbers
			[500] = 3.11, -- Synaptic Spark Capacitor
			[38] = 2.18, -- On My Way
			[99] = 0.04, -- Ablative Shielding
			[576] = 3.46, -- Loyal to the End
			[501] = 5.74, -- Relational Normalization Gizmo
			[211] = 9.4, -- Dance of Death
			[523] = 4.53, -- Apothecary's Concoctions
			[575] = 8.27, -- Undulating Tides
			[541] = 1.65, -- Fight or Flight
			[461] = 1.85, -- Earthlink
			[194] = 3.89, -- Filthy Transfusion
			[478] = 5.92, -- Tidal Surge
			[481] = 4.88, -- Incite the Pack
			[561] = 3.72, -- Seductive Power
			[86] = 0.06, -- Azerite Fortification
			[192] = 5.89, -- Meticulous Scheming
			[85] = 0.05, -- Gemhide
			[462] = 1.43, -- Azerite Globules
			[505] = 5.08, -- Tradewinds
			[522] = 7.4, -- Ancients' Bulwark
			[493] = 2.87, -- Last Gift
			[30] = 3.89, -- Overwhelming Power
			[366] = 10, -- Primal Instincts
			[42] = 0.22, -- Savior
			[157] = 5.51, -- Rezan's Fury
			[562] = 7.08, -- Treacherous Covenant
			[196] = 6.05, -- Swirling Sands
			[492] = 3.86, -- Liberator's Might
			[499] = 2.12, -- Ricocheting Inflatable Pyrosaw
			[103] = 0.01, -- Concentrated Mending
			[485] = 4.65, -- Laser Matrix
			[479] = 5.4, -- Dagger in the Back
			[82] = 6.74, -- Champion of Azeroth
			[495] = 4.45, -- Anduin's Dedication
			[161] = 5.63, -- Haze of Rage
			[569] = 6.02, -- Clockwork Heart
			[89] = 0.23, -- Azerite Veins
			[101] = 0.02, -- Shimmering Haven
			[521] = 4.55, -- Shadow of Elune
			[365] = 5.15, -- Dire Consequences
			[22] = 2.55, -- Heed My Call
			[496] = 1.06, -- Stronger Together
			[44] = 0.08, -- Vampiric Speed
			[31] = 2.6, -- Gutripper
			[560] = 1.76, -- Bonded Souls
			[107] = 3.53, -- Serrated Jaws
			[367] = 5.85, -- Feeding Frenzy
			[193] = 6.98, -- Blightborne Infusion
			[18] = 1.99, -- Blood Siphon
			[482] = 4.17, -- Thunderous Blast
			[498] = 3.15, -- Barrage Of Many Bombs
			[156] = 3.69, -- Ruinous Bolt
			[21] = 2.17, -- Elemental Whirl
			[526] = 7.09, -- Endless Hunger
			[494] = 5.3, -- Battlefield Precision
			[577] = 0.92, -- Arcane Heart
			[497] = 1.21, -- Stand As One
			[195] = 4.43, -- Secrets of the Deep
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2703 - 3326 (avg 3075), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[28] = { 3.71, 1.48 }, -- The Unbound Force
			[23] = { 5.04, 0.59 }, -- Blood of the Enemy
			[4] = { 1.64, 0.9 }, -- Worldvein Resonance
			[22] = { 0.46, 0 }, -- Vision of Perfection
			[27] = { 0.67, 0.88 }, -- Memory of Lucid Dreams
			[14] = { 7.39, 2.66 }, -- Condensed Life-Force
			[12] = { 8.15, 2.97 }, -- The Crucible of Flame
			[5] = { 10, 2.99 }, -- Essence of the Focusing Iris
			[6] = { 5.8, 2.22 }, -- Purification Protocol
			[15] = { 3.9, 0 }, -- Ripple in Space
			[32] = { 2.19, 1.95 }, -- Conflict and Strife
		}, 1571389200)

		insertDefaultScalesData(defaultName, 3, 2, { -- Marksmanship Hunter
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3008 - 3888 (avg 3330), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[502] = 0.18, -- Personal Absorb-o-Tron
			[22] = 2.37, -- Heed My Call
			[481] = 4.71, -- Incite the Pack
			[500] = 3.05, -- Synaptic Spark Capacitor
			[569] = 4.96, -- Clockwork Heart
			[501] = 5.29, -- Relational Normalization Gizmo
			[212] = 7.71, -- Unerring Vision
			[561] = 3.49, -- Seductive Power
			[104] = 0.09, -- Bracing Chill
			[495] = 3.88, -- Anduin's Dedication
			[504] = 4.65, -- Unstable Catalyst
			[485] = 4.78, -- Laser Matrix
			[192] = 5.96, -- Meticulous Scheming
			[18] = 1.8, -- Blood Siphon
			[494] = 5.04, -- Battlefield Precision
			[497] = 1.11, -- Stand As One
			[156] = 3.37, -- Ruinous Bolt
			[496] = 1.47, -- Stronger Together
			[82] = 6.53, -- Champion of Azeroth
			[461] = 1.47, -- Earthlink
			[521] = 4.7, -- Shadow of Elune
			[482] = 4.5, -- Thunderous Blast
			[499] = 2.03, -- Ricocheting Inflatable Pyrosaw
			[157] = 5.53, -- Rezan's Fury
			[462] = 1.44, -- Azerite Globules
			[459] = 2.24, -- Unstable Flames
			[480] = 4.65, -- Blood Rite
			[541] = 1.52, -- Fight or Flight
			[526] = 7.06, -- Endless Hunger
			[478] = 5.52, -- Tidal Surge
			[38] = 1.91, -- On My Way
			[522] = 6.95, -- Ancients' Bulwark
			[20] = 2.36, -- Lifespeed
			[483] = 4.55, -- Archive of the Titans
			[505] = 5.34, -- Tradewinds
			[31] = 2.74, -- Gutripper
			[370] = 8.52, -- Focused Fire
			[560] = 2.08, -- Bonded Souls
			[105] = 0.01, -- Ephemeral Recovery
			[368] = 2.95, -- Steady Aim
			[36] = 10, -- In The Rhythm
			[162] = 6.36, -- Surging Shots
			[195] = 4.07, -- Secrets of the Deep
			[196] = 6.18, -- Swirling Sands
			[577] = 2.11, -- Arcane Heart
			[492] = 4.43, -- Liberator's Might
			[498] = 3.14, -- Barrage Of Many Bombs
			[562] = 6.55, -- Treacherous Covenant
			[493] = 2.76, -- Last Gift
			[30] = 4.16, -- Overwhelming Power
			[576] = 3.62, -- Loyal to the End
			[523] = 4.36, -- Apothecary's Concoctions
			[194] = 4.61, -- Filthy Transfusion
			[479] = 5.69, -- Dagger in the Back
			[100] = 0.11, -- Strength in Numbers
			[193] = 7.36, -- Blightborne Infusion
			[543] = 0.05, -- Nature's Salve
			[84] = 0.14, -- Bulwark of the Masses
			[21] = 2.28, -- Elemental Whirl
			[575] = 8.17, -- Undulating Tides
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3008 - 3622 (avg 3321), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[5] = { 10, 4.66 }, -- Essence of the Focusing Iris
			[6] = { 5.61, 3.01 }, -- Purification Protocol
			[14] = { 8.23, 3.13 }, -- Condensed Life-Force
			[23] = { 5, 1.17 }, -- Blood of the Enemy
			[27] = { 1.73, 0.77 }, -- Memory of Lucid Dreams
			[4] = { 1, 1.22 }, -- Worldvein Resonance
			[12] = { 7.32, 4.24 }, -- The Crucible of Flame
			[15] = { 3.12, 0 }, -- Ripple in Space
			[22] = { 5, 1.89 }, -- Vision of Perfection
			[32] = { 2.57, 2.7 }, -- Conflict and Strife
			[28] = { 2.54, 1.66 }, -- The Unbound Force
		}, 1571389200)

		insertDefaultScalesData(defaultName, 3, 3, { -- Survival Hunter
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2559 - 6567 (avg 2896), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[575] = 10, -- Undulating Tides
			[526] = 8.26, -- Endless Hunger
			[100] = 0.13, -- Strength in Numbers
			[568] = 0.13, -- Person-Computer Interface
			[523] = 5.11, -- Apothecary's Concoctions
			[18] = 2.42, -- Blood Siphon
			[101] = 0.09, -- Shimmering Haven
			[84] = 0.26, -- Bulwark of the Masses
			[86] = 0.29, -- Azerite Fortification
			[365] = 5.75, -- Dire Consequences
			[21] = 2.41, -- Elemental Whirl
			[499] = 2.51, -- Ricocheting Inflatable Pyrosaw
			[43] = 0.29, -- Winds of War
			[14] = 0.14, -- Longstrider
			[196] = 7.24, -- Swirling Sands
			[98] = 0.45, -- Crystalline Carapace
			[521] = 6.12, -- Shadow of Elune
			[213] = 4.96, -- Venomous Fangs
			[479] = 6.4, -- Dagger in the Back
			[372] = 9.19, -- Wilderness Survival
			[110] = 2.76, -- Wildfire Cluster
			[495] = 5.05, -- Anduin's Dedication
			[560] = 2.86, -- Bonded Souls
			[163] = 7.37, -- Latent Poison
			[478] = 6.02, -- Tidal Surge
			[493] = 3.06, -- Last Gift
			[496] = 1.82, -- Stronger Together
			[42] = 0.3, -- Savior
			[156] = 3.62, -- Ruinous Bolt
			[480] = 5.81, -- Blood Rite
			[459] = 3.01, -- Unstable Flames
			[192] = 6.6, -- Meticulous Scheming
			[461] = 1.91, -- Earthlink
			[463] = 0.19, -- Blessed Portents
			[500] = 3.65, -- Synaptic Spark Capacitor
			[105] = 0.53, -- Ephemeral Recovery
			[194] = 4.91, -- Filthy Transfusion
			[501] = 6.67, -- Relational Normalization Gizmo
			[193] = 7.95, -- Blightborne Infusion
			[562] = 7.77, -- Treacherous Covenant
			[543] = 0.29, -- Nature's Salve
			[498] = 3.97, -- Barrage Of Many Bombs
			[22] = 2.81, -- Heed My Call
			[494] = 6.2, -- Battlefield Precision
			[104] = 0.46, -- Bracing Chill
			[19] = 0.32, -- Woundbinder
			[483] = 5.67, -- Archive of the Titans
			[482] = 5.08, -- Thunderous Blast
			[522] = 8.18, -- Ancients' Bulwark
			[371] = 8.87, -- Blur of Talons
			[502] = 0.18, -- Personal Absorb-o-Tron
			[157] = 6.26, -- Rezan's Fury
			[203] = 0.16, -- Shellshock
			[82] = 7.59, -- Champion of Azeroth
			[485] = 5.7, -- Laser Matrix
			[505] = 5.31, -- Tradewinds
			[469] = 0.12, -- Duck and Cover
			[504] = 5.88, -- Unstable Catalyst
			[497] = 1.43, -- Stand As One
			[503] = 0.06, -- Auto-Self-Cauterizer
			[107] = 3.9, -- Serrated Jaws
			[481] = 5.2, -- Incite the Pack
			[89] = 0.29, -- Azerite Veins
			[462] = 1.71, -- Azerite Globules
			[569] = 6.21, -- Clockwork Heart
			[87] = 0.08, -- Self Reliance
			[85] = 0.52, -- Gemhide
			[15] = 0.15, -- Resounding Protection
			[373] = 8.17, -- Primeval Intuition
			[44] = 0.02, -- Vampiric Speed
			[492] = 5.23, -- Liberator's Might
			[30] = 5.71, -- Overwhelming Power
			[576] = 3.95, -- Loyal to the End
			[31] = 3.32, -- Gutripper
			[195] = 5.17, -- Secrets of the Deep
			[577] = 2.71, -- Arcane Heart
			[20] = 2.73, -- Lifespeed
			[38] = 2.29, -- On My Way
			[99] = 0.34, -- Ablative Shielding
			[541] = 1.99, -- Fight or Flight
			[561] = 4.55, -- Seductive Power
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2448 - 3120 (avg 2750), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[4] = { 1.21, 1.36 }, -- Worldvein Resonance
			[15] = { 3.75, 0.11 }, -- Ripple in Space
			[22] = { 3.52, 0.32 }, -- Vision of Perfection
			[32] = { 2.3, 2.37 }, -- Conflict and Strife
			[6] = { 5.63, 2.76 }, -- Purification Protocol
			[28] = { 3.35, 1.75 }, -- The Unbound Force
			[27] = { 7.19, 2.4 }, -- Memory of Lucid Dreams
			[5] = { 10, 4.19 }, -- Essence of the Focusing Iris
			[14] = { 7.15, 3.16 }, -- Condensed Life-Force
			[23] = { 5.34, 1.08 }, -- Blood of the Enemy
			[12] = { 7.76, 3.49 }, -- The Crucible of Flame
		}, 1571389200)

		insertDefaultScalesData(defaultName, 8, 1, { -- Arcane Mage
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 5698 - 6874 (avg 6054), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[459] = 1.92, -- Unstable Flames
			[480] = 2.63, -- Blood Rite
			[21] = 2.09, -- Elemental Whirl
			[193] = 6.72, -- Blightborne Infusion
			[194] = 3.66, -- Filthy Transfusion
			[504] = 4.87, -- Unstable Catalyst
			[493] = 2.61, -- Last Gift
			[496] = 0.98, -- Stronger Together
			[31] = 2.11, -- Gutripper
			[82] = 5.39, -- Champion of Azeroth
			[479] = 4.58, -- Dagger in the Back
			[495] = 4.51, -- Anduin's Dedication
			[167] = 2.73, -- Brain Storm
			[497] = 0.79, -- Stand As One
			[214] = 2.46, -- Arcane Pressure
			[575] = 7.03, -- Undulating Tides
			[461] = 1.34, -- Earthlink
			[521] = 2.85, -- Shadow of Elune
			[481] = 4.16, -- Incite the Pack
			[499] = 1.69, -- Ricocheting Inflatable Pyrosaw
			[195] = 4.25, -- Secrets of the Deep
			[576] = 3.49, -- Loyal to the End
			[505] = 4.61, -- Tradewinds
			[500] = 2.47, -- Synaptic Spark Capacitor
			[526] = 7.07, -- Endless Hunger
			[485] = 3.65, -- Laser Matrix
			[20] = 1.04, -- Lifespeed
			[18] = 1.76, -- Blood Siphon
			[501] = 4.66, -- Relational Normalization Gizmo
			[562] = 6.9, -- Treacherous Covenant
			[482] = 3.5, -- Thunderous Blast
			[522] = 7.17, -- Ancients' Bulwark
			[577] = 2.12, -- Arcane Heart
			[374] = 6.05, -- Galvanizing Spark
			[498] = 2.67, -- Barrage Of Many Bombs
			[38] = 1.94, -- On My Way
			[494] = 3.54, -- Battlefield Precision
			[483] = 4.87, -- Archive of the Titans
			[196] = 5.58, -- Swirling Sands
			[30] = 2.61, -- Overwhelming Power
			[569] = 3.23, -- Clockwork Heart
			[492] = 3.68, -- Liberator's Might
			[523] = 3.54, -- Apothecary's Concoctions
			[462] = 0.94, -- Azerite Globules
			[541] = 1.19, -- Fight or Flight
			[561] = 3.47, -- Seductive Power
			[127] = 10, -- Equipoise
			[88] = 5.16, -- Arcane Pummeling
			[22] = 1.68, -- Heed My Call
			[478] = 4.31, -- Tidal Surge
			[192] = 1.79, -- Meticulous Scheming
			[560] = 1.17, -- Bonded Souls
			[157] = 4.1, -- Rezan's Fury
			[156] = 2.57, -- Ruinous Bolt
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 5687 - 8043 (avg 6366), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[27] = { 4.89, 3.42 }, -- Memory of Lucid Dreams
			[32] = { 2.49, 2.84 }, -- Conflict and Strife
			[28] = { 0.08, 1.31 }, -- The Unbound Force
			[23] = { 3.28, 0 }, -- Blood of the Enemy
			[4] = { 1.56, 1.23 }, -- Worldvein Resonance
			[6] = { 3.42, 2.69 }, -- Purification Protocol
			[15] = { 2.24, 0 }, -- Ripple in Space
			[22] = { 0.34, 0 }, -- Vision of Perfection
			[12] = { 7.35, 3.41 }, -- The Crucible of Flame
			[5] = { 9.11, 3.6 }, -- Essence of the Focusing Iris
			[14] = { 10, 3.22 }, -- Condensed Life-Force
		}, 1571389200)

		insertDefaultScalesData(defaultName, 8, 2, { -- Fire Mage
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 6911 - 8450 (avg 7608), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[526] = 7.65, -- Endless Hunger
			[82] = 6.96, -- Champion of Azeroth
			[523] = 5.27, -- Apothecary's Concoctions
			[43] = 0.05, -- Winds of War
			[157] = 6.16, -- Rezan's Fury
			[99] = 0.28, -- Ablative Shielding
			[479] = 6.49, -- Dagger in the Back
			[83] = 0.65, -- Impassive Visage
			[576] = 3.66, -- Loyal to the End
			[378] = 6.26, -- Firemind
			[569] = 7.32, -- Clockwork Heart
			[21] = 2.46, -- Elemental Whirl
			[20] = 2.34, -- Lifespeed
			[496] = 1.59, -- Stronger Together
			[38] = 2.35, -- On My Way
			[196] = 7.09, -- Swirling Sands
			[42] = 0.04, -- Savior
			[13] = 0.22, -- Azerite Empowered
			[31] = 3.31, -- Gutripper
			[522] = 7.77, -- Ancients' Bulwark
			[481] = 4.74, -- Incite the Pack
			[560] = 2.35, -- Bonded Souls
			[89] = 0.28, -- Azerite Veins
			[104] = 0.17, -- Bracing Chill
			[505] = 5.29, -- Tradewinds
			[494] = 6.42, -- Battlefield Precision
			[502] = 0.2, -- Personal Absorb-o-Tron
			[478] = 6.44, -- Tidal Surge
			[85] = 0.25, -- Gemhide
			[192] = 4.18, -- Meticulous Scheming
			[483] = 5.05, -- Archive of the Titans
			[497] = 1.52, -- Stand As One
			[577] = 3.21, -- Arcane Heart
			[499] = 2.62, -- Ricocheting Inflatable Pyrosaw
			[575] = 10, -- Undulating Tides
			[568] = 0.29, -- Person-Computer Interface
			[84] = 0.2, -- Bulwark of the Masses
			[498] = 4.12, -- Barrage Of Many Bombs
			[98] = 0.21, -- Crystalline Carapace
			[30] = 4.46, -- Overwhelming Power
			[503] = 0.28, -- Auto-Self-Cauterizer
			[100] = 0.31, -- Strength in Numbers
			[482] = 5.33, -- Thunderous Blast
			[215] = 7.08, -- Blaster Master
			[480] = 4.58, -- Blood Rite
			[500] = 3.77, -- Synaptic Spark Capacitor
			[44] = 0.22, -- Vampiric Speed
			[485] = 5.86, -- Laser Matrix
			[468] = 0.12, -- Cauterizing Blink
			[377] = 5.3, -- Duplicative Incineration
			[156] = 3.95, -- Ruinous Bolt
			[194] = 4.96, -- Filthy Transfusion
			[128] = 3.47, -- Flames of Alacrity
			[195] = 4.45, -- Secrets of the Deep
			[87] = 0.1, -- Self Reliance
			[193] = 8.31, -- Blightborne Infusion
			[562] = 7.07, -- Treacherous Covenant
			[18] = 2.36, -- Blood Siphon
			[14] = 0.03, -- Longstrider
			[86] = 0.12, -- Azerite Fortification
			[15] = 0.3, -- Resounding Protection
			[101] = 0.09, -- Shimmering Haven
			[493] = 3.18, -- Last Gift
			[561] = 4.13, -- Seductive Power
			[459] = 2.69, -- Unstable Flames
			[103] = 0.26, -- Concentrated Mending
			[541] = 2.02, -- Fight or Flight
			[376] = 4.01, -- Trailing Embers
			[504] = 5.37, -- Unstable Catalyst
			[492] = 4.58, -- Liberator's Might
			[168] = 9.39, -- Wildfire
			[462] = 2.38, -- Azerite Globules
			[461] = 1.67, -- Earthlink
			[205] = 0.25, -- Eldritch Warding
			[463] = 0.15, -- Blessed Portents
			[501] = 5.56, -- Relational Normalization Gizmo
			[22] = 2.91, -- Heed My Call
			[495] = 4.42, -- Anduin's Dedication
			[521] = 4.7, -- Shadow of Elune
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 6802 - 7823 (avg 7421), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[12] = { 4.17, 2.1 }, -- The Crucible of Flame
			[27] = { 10, 4.88 }, -- Memory of Lucid Dreams
			[32] = { 1.17, 1.1 }, -- Conflict and Strife
			[6] = { 3.3, 1.65 }, -- Purification Protocol
			[4] = { 0.77, 0.73 }, -- Worldvein Resonance
			[23] = { 1.68, 0.89 }, -- Blood of the Enemy
			[5] = { 5.27, 1.74 }, -- Essence of the Focusing Iris
			[14] = { 5.47, 2.02 }, -- Condensed Life-Force
			[28] = { 1.68, 1 }, -- The Unbound Force
			[15] = { 2.33, 0.01 }, -- Ripple in Space
		}, 1571389200)

		insertDefaultScalesData(defaultName, 8, 3, { -- Frost Mage
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3960 - 4727 (avg 4309), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[504] = 4.47, -- Unstable Catalyst
			[569] = 4.89, -- Clockwork Heart
			[98] = 0.07, -- Crystalline Carapace
			[461] = 1.06, -- Earthlink
			[577] = 1.23, -- Arcane Heart
			[18] = 1.55, -- Blood Siphon
			[20] = 1.55, -- Lifespeed
			[495] = 3.7, -- Anduin's Dedication
			[43] = 0.09, -- Winds of War
			[44] = 0.13, -- Vampiric Speed
			[497] = 0.92, -- Stand As One
			[14] = 0.09, -- Longstrider
			[196] = 6.03, -- Swirling Sands
			[156] = 2.45, -- Ruinous Bolt
			[468] = 0.07, -- Cauterizing Blink
			[478] = 4.06, -- Tidal Surge
			[492] = 3.92, -- Liberator's Might
			[19] = 0.08, -- Woundbinder
			[193] = 5.53, -- Blightborne Infusion
			[84] = 0.12, -- Bulwark of the Masses
			[132] = 3.61, -- Packed Ice
			[501] = 4.55, -- Relational Normalization Gizmo
			[521] = 3.62, -- Shadow of Elune
			[195] = 3.79, -- Secrets of the Deep
			[31] = 1.91, -- Gutripper
			[481] = 3.68, -- Incite the Pack
			[379] = 4.11, -- Tunnel of Ice
			[30] = 3.29, -- Overwhelming Power
			[496] = 1.32, -- Stronger Together
			[21] = 1.85, -- Elemental Whirl
			[380] = 3.68, -- Whiteout
			[22] = 1.71, -- Heed My Call
			[482] = 3.36, -- Thunderous Blast
			[523] = 3.26, -- Apothecary's Concoctions
			[576] = 2.6, -- Loyal to the End
			[561] = 3.32, -- Seductive Power
			[463] = 0.3, -- Blessed Portents
			[462] = 1.26, -- Azerite Globules
			[494] = 3.9, -- Battlefield Precision
			[526] = 5.91, -- Endless Hunger
			[500] = 2.13, -- Synaptic Spark Capacitor
			[560] = 1.88, -- Bonded Souls
			[498] = 2.62, -- Barrage Of Many Bombs
			[541] = 1.43, -- Fight or Flight
			[192] = 3.22, -- Meticulous Scheming
			[493] = 2.09, -- Last Gift
			[85] = 0.02, -- Gemhide
			[225] = 3.82, -- Glacial Assault
			[575] = 6.36, -- Undulating Tides
			[499] = 1.27, -- Ricocheting Inflatable Pyrosaw
			[82] = 5.7, -- Champion of Azeroth
			[522] = 6.04, -- Ancients' Bulwark
			[485] = 3.35, -- Laser Matrix
			[381] = 3.61, -- Frigid Grasp
			[562] = 5.8, -- Treacherous Covenant
			[104] = 0.18, -- Bracing Chill
			[479] = 4.37, -- Dagger in the Back
			[89] = 0.11, -- Azerite Veins
			[38] = 1.72, -- On My Way
			[505] = 3.89, -- Tradewinds
			[502] = 0.11, -- Personal Absorb-o-Tron
			[170] = 10, -- Flash Freeze
			[480] = 3.52, -- Blood Rite
			[483] = 4.26, -- Archive of the Titans
			[194] = 3.71, -- Filthy Transfusion
			[105] = 0.04, -- Ephemeral Recovery
			[459] = 2.25, -- Unstable Flames
			[157] = 4, -- Rezan's Fury
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3901 - 4513 (avg 4198), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[27] = { 5.8, 3.66 }, -- Memory of Lucid Dreams
			[32] = { 3.22, 3.17 }, -- Conflict and Strife
			[14] = { 10, 3.49 }, -- Condensed Life-Force
			[4] = { 0.09, 1.62 }, -- Worldvein Resonance
			[15] = { 3.49, 0 }, -- Ripple in Space
			[5] = { 8.39, 4.32 }, -- Essence of the Focusing Iris
			[6] = { 5.1, 3.14 }, -- Purification Protocol
			[22] = { 3.84, 0.86 }, -- Vision of Perfection
			[28] = { 3.22, 1.97 }, -- The Unbound Force
			[23] = { 4.56, 0.98 }, -- Blood of the Enemy
			[12] = { 6.1, 3.81 }, -- The Crucible of Flame
		}, 1571389200)

		insertDefaultScalesData(offensiveName, 10, 1, { -- Brewmaster Monk
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2709 - 3630 (avg 2905), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[561] = 2.26, -- Seductive Power
			[83] = 0.02, -- Impassive Visage
			[15] = 0.01, -- Resounding Protection
			[44] = 0.01, -- Vampiric Speed
			[13] = 0.05, -- Azerite Empowered
			[499] = 2.37, -- Ricocheting Inflatable Pyrosaw
			[497] = 0.74, -- Stand As One
			[505] = 2.6, -- Tradewinds
			[480] = 2.12, -- Blood Rite
			[462] = 1.92, -- Azerite Globules
			[384] = 3.05, -- Elusive Footwork
			[38] = 1.32, -- On My Way
			[577] = 1.08, -- Arcane Heart
			[18] = 1.06, -- Blood Siphon
			[492] = 2.47, -- Liberator's Might
			[31] = 2.96, -- Gutripper
			[196] = 4.74, -- Swirling Sands
			[195] = 2.69, -- Secrets of the Deep
			[522] = 4.73, -- Ancients' Bulwark
			[494] = 6.36, -- Battlefield Precision
			[560] = 1, -- Bonded Souls
			[483] = 2.92, -- Archive of the Titans
			[478] = 6.41, -- Tidal Surge
			[157] = 6.31, -- Rezan's Fury
			[383] = 4.45, -- Training of Niuzao
			[30] = 1.89, -- Overwhelming Power
			[562] = 3.95, -- Treacherous Covenant
			[459] = 1.56, -- Unstable Flames
			[21] = 1.22, -- Elemental Whirl
			[479] = 4.56, -- Dagger in the Back
			[500] = 3.58, -- Synaptic Spark Capacitor
			[482] = 5.18, -- Thunderous Blast
			[493] = 1.2, -- Last Gift
			[461] = 0.84, -- Earthlink
			[100] = 0.07, -- Strength in Numbers
			[504] = 2.8, -- Unstable Catalyst
			[569] = 3.6, -- Clockwork Heart
			[496] = 0.78, -- Stronger Together
			[82] = 4.07, -- Champion of Azeroth
			[194] = 5.07, -- Filthy Transfusion
			[105] = 0.1, -- Ephemeral Recovery
			[498] = 3.94, -- Barrage Of Many Bombs
			[84] = 0.12, -- Bulwark of the Masses
			[575] = 10, -- Undulating Tides
			[192] = 2.71, -- Meticulous Scheming
			[501] = 3, -- Relational Normalization Gizmo
			[568] = 3.43, -- Person-Computer Interface
			[193] = 5.1, -- Blightborne Infusion
			[521] = 2.1, -- Shadow of Elune
			[495] = 2.46, -- Anduin's Dedication
			[87] = 0.04, -- Self Reliance
			[20] = 0.93, -- Lifespeed
			[481] = 2.5, -- Incite the Pack
			[116] = 1.58, -- Boiling Brew
			[541] = 0.91, -- Fight or Flight
			[22] = 2.72, -- Heed My Call
			[156] = 3.8, -- Ruinous Bolt
			[485] = 5.48, -- Laser Matrix
			[523] = 5.08, -- Apothecary's Concoctions
			[576] = 1.82, -- Loyal to the End
			[526] = 4.72, -- Endless Hunger
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2721 - 2979 (avg 2830), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[7] = { 1.81, 0 }, -- Anima of Life and Death
			[4] = { 0.86, 0.68 }, -- Worldvein Resonance
			[12] = { 10, 3.33 }, -- The Crucible of Flame
			[13] = { 0.03, 0 }, -- Nullification Dynamo
			[32] = { 1.28, 1.26 }, -- Conflict and Strife
			[3] = { 1.96, 1.97 }, -- Sphere of Suppression
			[15] = { 3.44, 0 }, -- Ripple in Space
			[25] = { 0.65, 0.56 }, -- Aegis of the Deep
			[22] = { 0.01, 0 }, -- Vision of Perfection
		}, 1571389200)

		insertDefaultScalesData(defaultName, 10, 3, { -- Windwalker Monk
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4750 - 5347 (avg 4968), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[156] = 3.63, -- Ruinous Bolt
			[522] = 7.39, -- Ancients' Bulwark
			[500] = 3.36, -- Synaptic Spark Capacitor
			[462] = 1.57, -- Azerite Globules
			[569] = 5.42, -- Clockwork Heart
			[459] = 2.1, -- Unstable Flames
			[492] = 3.7, -- Liberator's Might
			[461] = 1.33, -- Earthlink
			[481] = 3.9, -- Incite the Pack
			[575] = 9.25, -- Undulating Tides
			[495] = 3.91, -- Anduin's Dedication
			[496] = 1.26, -- Stronger Together
			[499] = 2.35, -- Ricocheting Inflatable Pyrosaw
			[194] = 4.75, -- Filthy Transfusion
			[497] = 1.08, -- Stand As One
			[576] = 2.93, -- Loyal to the End
			[526] = 7.47, -- Endless Hunger
			[523] = 5.11, -- Apothecary's Concoctions
			[117] = 10, -- Fury of Xuen
			[18] = 1.5, -- Blood Siphon
			[501] = 4.78, -- Relational Normalization Gizmo
			[562] = 6.65, -- Treacherous Covenant
			[561] = 3.68, -- Seductive Power
			[504] = 4.63, -- Unstable Catalyst
			[560] = 1.7, -- Bonded Souls
			[483] = 4.64, -- Archive of the Titans
			[577] = 1.41, -- Arcane Heart
			[485] = 5.24, -- Laser Matrix
			[99] = 0.08, -- Ablative Shielding
			[505] = 4.22, -- Tradewinds
			[479] = 6.31, -- Dagger in the Back
			[391] = 6.52, -- Dance of Chi-Ji
			[541] = 1.05, -- Fight or Flight
			[480] = 3.95, -- Blood Rite
			[390] = 6.03, -- Pressure Point
			[157] = 6.06, -- Rezan's Fury
			[493] = 2.41, -- Last Gift
			[184] = 5.11, -- Sunrise Technique
			[43] = 0.04, -- Winds of War
			[19] = 0.02, -- Woundbinder
			[388] = 6.19, -- Glory of the Dawn
			[192] = 4.46, -- Meticulous Scheming
			[193] = 6.75, -- Blightborne Infusion
			[389] = 7.86, -- Open Palm Strikes
			[22] = 2.52, -- Heed My Call
			[38] = 1.93, -- On My Way
			[494] = 5.63, -- Battlefield Precision
			[31] = 2.88, -- Gutripper
			[521] = 3.84, -- Shadow of Elune
			[478] = 6.37, -- Tidal Surge
			[482] = 4.9, -- Thunderous Blast
			[195] = 4.03, -- Secrets of the Deep
			[30] = 3.41, -- Overwhelming Power
			[196] = 6.12, -- Swirling Sands
			[21] = 1.98, -- Elemental Whirl
			[20] = 1.18, -- Lifespeed
			[82] = 6.05, -- Champion of Azeroth
			[498] = 3.58, -- Barrage Of Many Bombs
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4404 - 5650 (avg 5006), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[6] = { 4.05, 1.48 }, -- Purification Protocol
			[4] = { 0.91, 0.57 }, -- Worldvein Resonance
			[12] = { 5.6, 1.95 }, -- The Crucible of Flame
			[22] = { 0.55, 0.54 }, -- Vision of Perfection
			[32] = { 10, 1.33 }, -- Conflict and Strife
			[28] = { 1.97, 0.78 }, -- The Unbound Force
			[23] = { 3.29, 0.15 }, -- Blood of the Enemy
			[14] = { 5.32, 1.83 }, -- Condensed Life-Force
			[5] = { 6.25, 1.75 }, -- Essence of the Focusing Iris
			[15] = { 2.53, 0 }, -- Ripple in Space
		}, 1571389200)

		insertDefaultScalesData(offensiveName, 2, 2, { -- Protection Paladin
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4979 - 6046 (avg 5366), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[461] = 1.57, -- Earthlink
			[480] = 3.66, -- Blood Rite
			[560] = 2.12, -- Bonded Souls
			[503] = 0.18, -- Auto-Self-Cauterizer
			[31] = 3.12, -- Gutripper
			[479] = 4.67, -- Dagger in the Back
			[21] = 2.05, -- Elemental Whirl
			[99] = 0.19, -- Ablative Shielding
			[541] = 1.43, -- Fight or Flight
			[234] = 1.85, -- Inner Light
			[125] = 3.18, -- Avenger's Might
			[30] = 3.44, -- Overwhelming Power
			[482] = 5.14, -- Thunderous Blast
			[150] = 1.6, -- Soaring Shield
			[196] = 5.71, -- Swirling Sands
			[569] = 4.69, -- Clockwork Heart
			[575] = 10, -- Undulating Tides
			[18] = 1.45, -- Blood Siphon
			[44] = 0.29, -- Vampiric Speed
			[395] = 8.78, -- Inspiring Vanguard
			[15] = 0.31, -- Resounding Protection
			[82] = 5.68, -- Champion of Azeroth
			[42] = 0.02, -- Savior
			[485] = 5.63, -- Laser Matrix
			[521] = 3.69, -- Shadow of Elune
			[104] = 0.24, -- Bracing Chill
			[494] = 6.54, -- Battlefield Precision
			[495] = 3.86, -- Anduin's Dedication
			[13] = 0.2, -- Azerite Empowered
			[157] = 6.45, -- Rezan's Fury
			[504] = 4.09, -- Unstable Catalyst
			[193] = 6.59, -- Blightborne Infusion
			[500] = 3.46, -- Synaptic Spark Capacitor
			[471] = 0.18, -- Gallant Steed
			[496] = 1.35, -- Stronger Together
			[156] = 3.78, -- Ruinous Bolt
			[498] = 4.1, -- Barrage Of Many Bombs
			[101] = 0.19, -- Shimmering Haven
			[98] = 0.25, -- Crystalline Carapace
			[43] = 0.28, -- Winds of War
			[502] = 0.19, -- Personal Absorb-o-Tron
			[133] = 0.3, -- Bulwark of Light
			[463] = 0.06, -- Blessed Portents
			[576] = 2.38, -- Loyal to the End
			[497] = 1.25, -- Stand As One
			[14] = 0.08, -- Longstrider
			[526] = 5.99, -- Endless Hunger
			[85] = 0.24, -- Gemhide
			[195] = 3.82, -- Secrets of the Deep
			[492] = 3.86, -- Liberator's Might
			[206] = 0.33, -- Stalwart Protector
			[393] = 0.22, -- Grace of the Justicar
			[459] = 2.21, -- Unstable Flames
			[478] = 6.31, -- Tidal Surge
			[194] = 5.08, -- Filthy Transfusion
			[501] = 4.74, -- Relational Normalization Gizmo
			[84] = 0.24, -- Bulwark of the Masses
			[22] = 2.77, -- Heed My Call
			[462] = 2.11, -- Azerite Globules
			[89] = 0.11, -- Azerite Veins
			[38] = 1.85, -- On My Way
			[577] = 1.96, -- Arcane Heart
			[562] = 5.67, -- Treacherous Covenant
			[86] = 0.08, -- Azerite Fortification
			[493] = 1.95, -- Last Gift
			[235] = 3.36, -- Indomitable Justice
			[568] = 0.19, -- Person-Computer Interface
			[103] = 0.26, -- Concentrated Mending
			[20] = 1.76, -- Lifespeed
			[481] = 3.12, -- Incite the Pack
			[522] = 6.05, -- Ancients' Bulwark
			[189] = 0.15, -- Righteous Conviction
			[105] = 0.2, -- Ephemeral Recovery
			[523] = 5.19, -- Apothecary's Concoctions
			[192] = 5.09, -- Meticulous Scheming
			[83] = 0.29, -- Impassive Visage
			[499] = 2.59, -- Ricocheting Inflatable Pyrosaw
			[483] = 4.18, -- Archive of the Titans
			[454] = 0.24, -- Judicious Defense
			[538] = 0.14, -- Empyreal Ward
			[19] = 0.08, -- Woundbinder
			[505] = 3.52, -- Tradewinds
			[100] = 0.24, -- Strength in Numbers
			[561] = 3.1, -- Seductive Power
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4759 - 5932 (avg 5309), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[22] = { 3.11, 1.08 }, -- Vision of Perfection
			[3] = { 4.13, 4.2 }, -- Sphere of Suppression
			[12] = { 10, 3.9 }, -- The Crucible of Flame
			[7] = { 2.11, 0.11 }, -- Anima of Life and Death
			[13] = { 0.17, 0.11 }, -- Nullification Dynamo
			[2] = { 0.14, 0.01 }, -- Azeroth's Undying Gift
			[4] = { 1.51, 1.09 }, -- Worldvein Resonance
			[15] = { 3.01, 0.29 }, -- Ripple in Space
			[25] = { 1.06, 1.13 }, -- Aegis of the Deep
			[27] = { 1.17, 0.71 }, -- Memory of Lucid Dreams
			[32] = { 2.01, 1.93 }, -- Conflict and Strife
		}, 1571389200)

		insertDefaultScalesData(defaultName, 2, 3, { -- Retribution Paladin
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3759 - 4675 (avg 4186), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[396] = 10, -- Light's Decree
			[479] = 4.16, -- Dagger in the Back
			[485] = 3.77, -- Laser Matrix
			[478] = 4.09, -- Tidal Surge
			[84] = 0.21, -- Bulwark of the Masses
			[561] = 2.87, -- Seductive Power
			[575] = 6.62, -- Undulating Tides
			[44] = 0.11, -- Vampiric Speed
			[192] = 4.2, -- Meticulous Scheming
			[194] = 3.32, -- Filthy Transfusion
			[480] = 3.39, -- Blood Rite
			[82] = 5.03, -- Champion of Azeroth
			[235] = 3.5, -- Indomitable Justice
			[453] = 5.13, -- Empyrean Power
			[193] = 4.87, -- Blightborne Infusion
			[125] = 4.14, -- Avenger's Might
			[195] = 3.12, -- Secrets of the Deep
			[492] = 3.08, -- Liberator's Might
			[496] = 1.1, -- Stronger Together
			[483] = 3.66, -- Archive of the Titans
			[493] = 1.87, -- Last Gift
			[501] = 3.91, -- Relational Normalization Gizmo
			[31] = 2.03, -- Gutripper
			[18] = 1.32, -- Blood Siphon
			[103] = 0.14, -- Concentrated Mending
			[494] = 3.73, -- Battlefield Precision
			[459] = 1.72, -- Unstable Flames
			[454] = 0.13, -- Judicious Defense
			[463] = 0.12, -- Blessed Portents
			[500] = 2.43, -- Synaptic Spark Capacitor
			[462] = 1.31, -- Azerite Globules
			[21] = 1.65, -- Elemental Whirl
			[156] = 2.53, -- Ruinous Bolt
			[505] = 3.4, -- Tradewinds
			[576] = 2.47, -- Loyal to the End
			[30] = 3.06, -- Overwhelming Power
			[471] = 0.03, -- Gallant Steed
			[502] = 0.12, -- Personal Absorb-o-Tron
			[196] = 4.27, -- Swirling Sands
			[20] = 1.78, -- Lifespeed
			[499] = 1.7, -- Ricocheting Inflatable Pyrosaw
			[105] = 0.05, -- Ephemeral Recovery
			[187] = 5.27, -- Expurgation
			[206] = 0.04, -- Stalwart Protector
			[42] = 0.05, -- Savior
			[157] = 4.21, -- Rezan's Fury
			[526] = 5.17, -- Endless Hunger
			[482] = 3.44, -- Thunderous Blast
			[562] = 4.74, -- Treacherous Covenant
			[504] = 3.26, -- Unstable Catalyst
			[498] = 2.66, -- Barrage Of Many Bombs
			[523] = 3.34, -- Apothecary's Concoctions
			[495] = 3.1, -- Anduin's Dedication
			[19] = 0.07, -- Woundbinder
			[461] = 1.06, -- Earthlink
			[521] = 3.22, -- Shadow of Elune
			[560] = 1.71, -- Bonded Souls
			[481] = 3.08, -- Incite the Pack
			[522] = 5.18, -- Ancients' Bulwark
			[22] = 1.74, -- Heed My Call
			[577] = 1.57, -- Arcane Heart
			[569] = 3.83, -- Clockwork Heart
			[38] = 1.51, -- On My Way
			[154] = 5.49, -- Relentless Inquisitor
			[497] = 0.93, -- Stand As One
			[541] = 1.08, -- Fight or Flight
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3591 - 4727 (avg 4120), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[4] = { 1.32, 1.05 }, -- Worldvein Resonance
			[14] = { 8.69, 3.15 }, -- Condensed Life-Force
			[28] = { 2.74, 1.25 }, -- The Unbound Force
			[12] = { 8.62, 3.41 }, -- The Crucible of Flame
			[22] = { 9.67, 3.49 }, -- Vision of Perfection
			[5] = { 10, 3.79 }, -- Essence of the Focusing Iris
			[23] = { 3.98, 0.5 }, -- Blood of the Enemy
			[27] = { 4.79, 3.38 }, -- Memory of Lucid Dreams
			[15] = { 0.13, 0.09 }, -- Ripple in Space
			[32] = { 2.36, 2.3 }, -- Conflict and Strife
			[6] = { 6.01, 2.73 }, -- Purification Protocol
		}, 1571389200)

		insertDefaultScalesData(defaultName, 4, 1, { -- Assassination Rogue
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3180 - 5527 (avg 3469), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[575] = 9.81, -- Undulating Tides
			[541] = 1.76, -- Fight or Flight
			[499] = 2.54, -- Ricocheting Inflatable Pyrosaw
			[136] = 8.58, -- Double Dose
			[15] = 0.01, -- Resounding Protection
			[84] = 0.02, -- Bulwark of the Masses
			[85] = 0.01, -- Gemhide
			[192] = 5.19, -- Meticulous Scheming
			[30] = 4.86, -- Overwhelming Power
			[86] = 0.07, -- Azerite Fortification
			[193] = 9.23, -- Blightborne Infusion
			[181] = 6.76, -- Twist the Knife
			[483] = 5.84, -- Archive of the Titans
			[478] = 6.16, -- Tidal Surge
			[560] = 2.93, -- Bonded Souls
			[44] = 0.22, -- Vampiric Speed
			[101] = 0.03, -- Shimmering Haven
			[492] = 5.37, -- Liberator's Might
			[21] = 2.86, -- Elemental Whirl
			[498] = 4.18, -- Barrage Of Many Bombs
			[504] = 6.19, -- Unstable Catalyst
			[494] = 6.41, -- Battlefield Precision
			[526] = 8.8, -- Endless Hunger
			[521] = 5.55, -- Shadow of Elune
			[100] = 0.13, -- Strength in Numbers
			[18] = 2.47, -- Blood Siphon
			[462] = 1.78, -- Azerite Globules
			[522] = 8.67, -- Ancients' Bulwark
			[548] = 0.14, -- Lying In Wait
			[249] = 10, -- Nothing Personal
			[569] = 6.26, -- Clockwork Heart
			[461] = 2.01, -- Earthlink
			[103] = 0.16, -- Concentrated Mending
			[13] = 0.05, -- Azerite Empowered
			[194] = 5.22, -- Filthy Transfusion
			[20] = 2.17, -- Lifespeed
			[19] = 0.19, -- Woundbinder
			[481] = 5.14, -- Incite the Pack
			[479] = 6.65, -- Dagger in the Back
			[500] = 3.4, -- Synaptic Spark Capacitor
			[485] = 5.35, -- Laser Matrix
			[496] = 2.04, -- Stronger Together
			[195] = 5.49, -- Secrets of the Deep
			[497] = 1.41, -- Stand As One
			[576] = 3.94, -- Loyal to the End
			[561] = 4.69, -- Seductive Power
			[156] = 3.51, -- Ruinous Bolt
			[568] = 0.09, -- Person-Computer Interface
			[482] = 5.32, -- Thunderous Blast
			[105] = 0.14, -- Ephemeral Recovery
			[43] = 0.33, -- Winds of War
			[473] = 0.08, -- Shrouded Mantle
			[31] = 2.91, -- Gutripper
			[501] = 6.55, -- Relational Normalization Gizmo
			[502] = 0.06, -- Personal Absorb-o-Tron
			[38] = 2.57, -- On My Way
			[406] = 3.99, -- Scent of Blood
			[523] = 5.18, -- Apothecary's Concoctions
			[22] = 2.84, -- Heed My Call
			[157] = 6.37, -- Rezan's Fury
			[196] = 8.28, -- Swirling Sands
			[463] = 0.28, -- Blessed Portents
			[82] = 8.12, -- Champion of Azeroth
			[577] = 3.35, -- Arcane Heart
			[407] = 0.22, -- Echoing Blades
			[459] = 3.01, -- Unstable Flames
			[480] = 5.21, -- Blood Rite
			[493] = 2.99, -- Last Gift
			[562] = 8.41, -- Treacherous Covenant
			[505] = 5.9, -- Tradewinds
			[495] = 5.19, -- Anduin's Dedication
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2269 - 3850 (avg 3291), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[32] = { 1.82, 1.73 }, -- Conflict and Strife
			[6] = { 4.84, 1.92 }, -- Purification Protocol
			[5] = { 7.81, 2.97 }, -- Essence of the Focusing Iris
			[27] = { 10, 3.95 }, -- Memory of Lucid Dreams
			[15] = { 3.62, 0 }, -- Ripple in Space
			[28] = { 3.69, 1.72 }, -- The Unbound Force
			[23] = { 6.47, 1.37 }, -- Blood of the Enemy
			[14] = { 6.56, 2.39 }, -- Condensed Life-Force
			[4] = { 1.49, 0.92 }, -- Worldvein Resonance
			[12] = { 6.84, 2.31 }, -- The Crucible of Flame
		}, 1571389200)

		insertDefaultScalesData(defaultName, 4, 2, { -- Outlaw Rogue
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 9018 - 12399 (avg 10013), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[195] = 4.34, -- Secrets of the Deep
			[493] = 1.87, -- Last Gift
			[548] = 0.26, -- Lying In Wait
			[482] = 5.04, -- Thunderous Blast
			[446] = 7.36, -- Brigand's Blitz
			[411] = 8.27, -- Ace Up Your Sleeve
			[485] = 5.57, -- Laser Matrix
			[495] = 4.36, -- Anduin's Dedication
			[101] = 0.05, -- Shimmering Haven
			[31] = 2.73, -- Gutripper
			[196] = 5.34, -- Swirling Sands
			[180] = 4.02, -- Keep Your Wits About You
			[504] = 4.7, -- Unstable Catalyst
			[192] = 5.35, -- Meticulous Scheming
			[410] = 3.41, -- Paradise Lost
			[461] = 1.47, -- Earthlink
			[99] = 0.11, -- Ablative Shielding
			[505] = 3.48, -- Tradewinds
			[523] = 5.34, -- Apothecary's Concoctions
			[492] = 4.02, -- Liberator's Might
			[494] = 6.1, -- Battlefield Precision
			[526] = 7.04, -- Endless Hunger
			[22] = 2.69, -- Heed My Call
			[498] = 3.78, -- Barrage Of Many Bombs
			[42] = 0.03, -- Savior
			[129] = 6.45, -- Deadshot
			[104] = 0.1, -- Bracing Chill
			[21] = 2.14, -- Elemental Whirl
			[560] = 2.17, -- Bonded Souls
			[463] = 0.07, -- Blessed Portents
			[20] = 2.07, -- Lifespeed
			[239] = 3.7, -- Snake Eyes
			[575] = 10, -- Undulating Tides
			[480] = 4.16, -- Blood Rite
			[30] = 4.24, -- Overwhelming Power
			[462] = 1.89, -- Azerite Globules
			[541] = 1.58, -- Fight or Flight
			[478] = 5.97, -- Tidal Surge
			[501] = 5.29, -- Relational Normalization Gizmo
			[83] = 0.24, -- Impassive Visage
			[156] = 3.74, -- Ruinous Bolt
			[562] = 6.58, -- Treacherous Covenant
			[522] = 7.11, -- Ancients' Bulwark
			[496] = 1.23, -- Stronger Together
			[521] = 4.55, -- Shadow of Elune
			[157] = 6.22, -- Rezan's Fury
			[569] = 5.21, -- Clockwork Heart
			[561] = 3.65, -- Seductive Power
			[479] = 6.47, -- Dagger in the Back
			[577] = 2.02, -- Arcane Heart
			[459] = 2.33, -- Unstable Flames
			[500] = 3.28, -- Synaptic Spark Capacitor
			[497] = 1.26, -- Stand As One
			[193] = 6.01, -- Blightborne Infusion
			[576] = 2.42, -- Loyal to the End
			[18] = 1.32, -- Blood Siphon
			[38] = 1.78, -- On My Way
			[483] = 5.17, -- Archive of the Titans
			[499] = 2.44, -- Ricocheting Inflatable Pyrosaw
			[85] = 0.18, -- Gemhide
			[194] = 4.78, -- Filthy Transfusion
			[481] = 2.97, -- Incite the Pack
			[82] = 6, -- Champion of Azeroth
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 8675 - 10432 (avg 9585), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = { 4.29, 0 }, -- Ripple in Space
			[27] = { 8.16, 6.22 }, -- Memory of Lucid Dreams
			[32] = { 2.18, 2.27 }, -- Conflict and Strife
			[5] = { 9.42, 3.59 }, -- Essence of the Focusing Iris
			[28] = { 3.36, 0.99 }, -- The Unbound Force
			[12] = { 10, 3.73 }, -- The Crucible of Flame
			[4] = { 1.5, 1.04 }, -- Worldvein Resonance
			[22] = { 5.58, 2.52 }, -- Vision of Perfection
			[14] = { 9.62, 3.4 }, -- Condensed Life-Force
			[23] = { 3.39, 1.02 }, -- Blood of the Enemy
			[6] = { 6.93, 2.89 }, -- Purification Protocol
		}, 1571389200)

		insertDefaultScalesData(defaultName, 4, 3, { -- Subtlety Rogue
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4975 - 6171 (avg 5623), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[85] = 0.08, -- Gemhide
			[499] = 1.18, -- Ricocheting Inflatable Pyrosaw
			[562] = 3.71, -- Treacherous Covenant
			[502] = 0.12, -- Personal Absorb-o-Tron
			[569] = 3.68, -- Clockwork Heart
			[414] = 3.73, -- Inevitability
			[83] = 0.11, -- Impassive Visage
			[43] = 0.01, -- Winds of War
			[501] = 3.05, -- Relational Normalization Gizmo
			[463] = 0.04, -- Blessed Portents
			[479] = 3.28, -- Dagger in the Back
			[98] = 0.1, -- Crystalline Carapace
			[461] = 1.25, -- Earthlink
			[481] = 2.01, -- Incite the Pack
			[38] = 1.17, -- On My Way
			[500] = 1.83, -- Synaptic Spark Capacitor
			[15] = 0.1, -- Resounding Protection
			[478] = 3.25, -- Tidal Surge
			[194] = 2.61, -- Filthy Transfusion
			[31] = 1.41, -- Gutripper
			[480] = 2.62, -- Blood Rite
			[20] = 1.1, -- Lifespeed
			[459] = 1.52, -- Unstable Flames
			[22] = 1.41, -- Heed My Call
			[19] = 0.1, -- Woundbinder
			[156] = 2.12, -- Ruinous Bolt
			[577] = 0.87, -- Arcane Heart
			[82] = 3.45, -- Champion of Azeroth
			[42] = 0.01, -- Savior
			[101] = 0.07, -- Shimmering Haven
			[30] = 2.24, -- Overwhelming Power
			[100] = 0.03, -- Strength in Numbers
			[485] = 2.69, -- Laser Matrix
			[193] = 3.98, -- Blightborne Infusion
			[483] = 2.85, -- Archive of the Titans
			[575] = 4.84, -- Undulating Tides
			[492] = 2.53, -- Liberator's Might
			[105] = 0.16, -- Ephemeral Recovery
			[195] = 2.53, -- Secrets of the Deep
			[157] = 3.17, -- Rezan's Fury
			[240] = 3.95, -- Blade In The Shadows
			[44] = 0.09, -- Vampiric Speed
			[541] = 0.86, -- Fight or Flight
			[505] = 2.23, -- Tradewinds
			[192] = 2.61, -- Meticulous Scheming
			[576] = 1.49, -- Loyal to the End
			[522] = 3.78, -- Ancients' Bulwark
			[495] = 2.37, -- Anduin's Dedication
			[504] = 2.87, -- Unstable Catalyst
			[196] = 3.6, -- Swirling Sands
			[86] = 0.1, -- Azerite Fortification
			[18] = 0.9, -- Blood Siphon
			[445] = 1.67, -- Perforate
			[496] = 0.89, -- Stronger Together
			[523] = 2.5, -- Apothecary's Concoctions
			[526] = 3.9, -- Endless Hunger
			[560] = 1.34, -- Bonded Souls
			[497] = 0.76, -- Stand As One
			[561] = 2.04, -- Seductive Power
			[103] = 0.05, -- Concentrated Mending
			[14] = 0.11, -- Longstrider
			[413] = 10, -- The First Dance
			[494] = 3.11, -- Battlefield Precision
			[568] = 0.1, -- Person-Computer Interface
			[175] = 4, -- Night's Vengeance
			[521] = 2.68, -- Shadow of Elune
			[104] = 0.14, -- Bracing Chill
			[493] = 1.18, -- Last Gift
			[89] = 0.11, -- Azerite Veins
			[84] = 0.03, -- Bulwark of the Masses
			[21] = 1.27, -- Elemental Whirl
			[548] = 0.15, -- Lying In Wait
			[87] = 0.1, -- Self Reliance
			[462] = 0.86, -- Azerite Globules
			[482] = 2.66, -- Thunderous Blast
			[124] = 1.43, -- Replicating Shadows
			[498] = 1.99, -- Barrage Of Many Bombs
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4702 - 6149 (avg 5480), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = { 3.63, 0 }, -- Ripple in Space
			[28] = { 3.44, 1.39 }, -- The Unbound Force
			[4] = { 1.58, 1.01 }, -- Worldvein Resonance
			[27] = { 10, 6.46 }, -- Memory of Lucid Dreams
			[14] = { 6.43, 2.47 }, -- Condensed Life-Force
			[12] = { 7.59, 2.71 }, -- The Crucible of Flame
			[22] = { 3.66, 0.97 }, -- Vision of Perfection
			[32] = { 1.9, 2.08 }, -- Conflict and Strife
			[5] = { 8.6, 3.38 }, -- Essence of the Focusing Iris
			[6] = { 5.15, 2.12 }, -- Purification Protocol
			[23] = { 4.77, 0.64 }, -- Blood of the Enemy
		}, 1571389200)

		insertDefaultScalesData(defaultName, 7, 1, { -- Elemental Shaman
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3386 - 4464 (avg 3676), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[497] = 0.77, -- Stand As One
			[481] = 1.81, -- Incite the Pack
			[485] = 3.64, -- Laser Matrix
			[562] = 5.44, -- Treacherous Covenant
			[22] = 1.49, -- Heed My Call
			[178] = 3.36, -- Lava Shock
			[577] = 1.56, -- Arcane Heart
			[18] = 0.37, -- Blood Siphon
			[21] = 1.54, -- Elemental Whirl
			[505] = 2.09, -- Tradewinds
			[447] = 3.41, -- Ancestral Resonance
			[561] = 2.93, -- Seductive Power
			[84] = 0.06, -- Bulwark of the Masses
			[575] = 6.38, -- Undulating Tides
			[104] = 0.04, -- Bracing Chill
			[82] = 4.95, -- Champion of Azeroth
			[523] = 3.14, -- Apothecary's Concoctions
			[482] = 3.26, -- Thunderous Blast
			[498] = 2.42, -- Barrage Of Many Bombs
			[38] = 1.52, -- On My Way
			[222] = 2.54, -- Echo of the Elementals
			[459] = 1.96, -- Unstable Flames
			[193] = 6.16, -- Blightborne Infusion
			[496] = 0.97, -- Stronger Together
			[480] = 3.01, -- Blood Rite
			[478] = 4.14, -- Tidal Surge
			[560] = 1.47, -- Bonded Souls
			[461] = 1.22, -- Earthlink
			[522] = 5.05, -- Ancients' Bulwark
			[521] = 3.09, -- Shadow of Elune
			[493] = 1.12, -- Last Gift
			[20] = 1.55, -- Lifespeed
			[462] = 0.87, -- Azerite Globules
			[500] = 2.23, -- Synaptic Spark Capacitor
			[156] = 2.42, -- Ruinous Bolt
			[85] = 0.04, -- Gemhide
			[479] = 4.23, -- Dagger in the Back
			[99] = 0.04, -- Ablative Shielding
			[526] = 5.22, -- Endless Hunger
			[416] = 5.87, -- Natural Harmony
			[448] = 3.24, -- Synapse Shock
			[501] = 3.86, -- Relational Normalization Gizmo
			[492] = 3.57, -- Liberator's Might
			[30] = 2.59, -- Overwhelming Power
			[499] = 1.46, -- Ricocheting Inflatable Pyrosaw
			[192] = 3.63, -- Meticulous Scheming
			[576] = 1.32, -- Loyal to the End
			[569] = 3.85, -- Clockwork Heart
			[31] = 1.69, -- Gutripper
			[504] = 4.07, -- Unstable Catalyst
			[157] = 3.88, -- Rezan's Fury
			[195] = 3.6, -- Secrets of the Deep
			[196] = 5.48, -- Swirling Sands
			[495] = 3.35, -- Anduin's Dedication
			[494] = 3.86, -- Battlefield Precision
			[194] = 3.14, -- Filthy Transfusion
			[483] = 3.78, -- Archive of the Titans
			[457] = 10, -- Igneous Potential
			[541] = 1.13, -- Fight or Flight
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3115 - 3879 (avg 3589), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = { 2.89, 0 }, -- Ripple in Space
			[32] = { 10, 1.85 }, -- Conflict and Strife
			[28] = { 2.45, 2.33 }, -- The Unbound Force
			[22] = { 2.2, 0 }, -- Vision of Perfection
			[27] = { 1.25, 1.1 }, -- Memory of Lucid Dreams
			[12] = { 5.66, 2.77 }, -- The Crucible of Flame
			[4] = { 0.23, 1 }, -- Worldvein Resonance
			[5] = { 7.12, 3.01 }, -- Essence of the Focusing Iris
			[6] = { 4.26, 2.21 }, -- Purification Protocol
			[14] = { 6.63, 2.64 }, -- Condensed Life-Force
			[23] = { 5.09, 0.56 }, -- Blood of the Enemy
		}, 1571389200)

		insertDefaultScalesData(defaultName, 7, 2, { -- Enhancement Shaman
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 7313 - 9045 (avg 8435), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[505] = 3.64, -- Tradewinds
			[13] = 0.07, -- Azerite Empowered
			[157] = 4.05, -- Rezan's Fury
			[462] = 1.21, -- Azerite Globules
			[461] = 1.17, -- Earthlink
			[493] = 1.79, -- Last Gift
			[474] = 0.07, -- Pack Spirit
			[420] = 10, -- Roiling Storm
			[416] = 6.66, -- Natural Harmony
			[561] = 2.82, -- Seductive Power
			[497] = 0.9, -- Stand As One
			[480] = 3.07, -- Blood Rite
			[89] = 0.15, -- Azerite Veins
			[22] = 1.76, -- Heed My Call
			[541] = 1.1, -- Fight or Flight
			[99] = 0.06, -- Ablative Shielding
			[15] = 0.03, -- Resounding Protection
			[193] = 5.05, -- Blightborne Infusion
			[18] = 1.4, -- Blood Siphon
			[498] = 2.64, -- Barrage Of Many Bombs
			[156] = 2.3, -- Ruinous Bolt
			[481] = 3.32, -- Incite the Pack
			[463] = 0.03, -- Blessed Portents
			[569] = 3.85, -- Clockwork Heart
			[494] = 3.68, -- Battlefield Precision
			[560] = 1.42, -- Bonded Souls
			[195] = 3.03, -- Secrets of the Deep
			[479] = 4.1, -- Dagger in the Back
			[522] = 5.15, -- Ancients' Bulwark
			[526] = 5.1, -- Endless Hunger
			[104] = 0.08, -- Bracing Chill
			[495] = 3.16, -- Anduin's Dedication
			[196] = 4.64, -- Swirling Sands
			[521] = 3.28, -- Shadow of Elune
			[577] = 1.62, -- Arcane Heart
			[485] = 3.6, -- Laser Matrix
			[179] = 3.59, -- Strength of Earth
			[207] = 0.1, -- Serene Spirit
			[459] = 1.89, -- Unstable Flames
			[82] = 4.69, -- Champion of Azeroth
			[21] = 1.7, -- Elemental Whirl
			[223] = 1.98, -- Lightning Conduit
			[19] = 0.02, -- Woundbinder
			[38] = 1.5, -- On My Way
			[31] = 1.97, -- Gutripper
			[447] = 5.53, -- Ancestral Resonance
			[504] = 3.69, -- Unstable Catalyst
			[87] = 0.05, -- Self Reliance
			[14] = 0.02, -- Longstrider
			[483] = 3.51, -- Archive of the Titans
			[20] = 1.5, -- Lifespeed
			[575] = 6.1, -- Undulating Tides
			[562] = 5.06, -- Treacherous Covenant
			[192] = 3.87, -- Meticulous Scheming
			[501] = 4.04, -- Relational Normalization Gizmo
			[448] = 0.03, -- Synapse Shock
			[496] = 1.07, -- Stronger Together
			[530] = 5.42, -- Thunderaan's Fury
			[30] = 2.89, -- Overwhelming Power
			[499] = 1.48, -- Ricocheting Inflatable Pyrosaw
			[137] = 2.79, -- Primal Primer
			[523] = 3.2, -- Apothecary's Concoctions
			[482] = 3.13, -- Thunderous Blast
			[492] = 3.26, -- Liberator's Might
			[103] = 0.15, -- Concentrated Mending
			[568] = 0.09, -- Person-Computer Interface
			[500] = 2.13, -- Synaptic Spark Capacitor
			[576] = 2.44, -- Loyal to the End
			[194] = 3.18, -- Filthy Transfusion
			[478] = 3.89, -- Tidal Surge
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 6460 - 8784 (avg 8073), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[5] = { 10, 4.36 }, -- Essence of the Focusing Iris
			[4] = { 2.03, 1.39 }, -- Worldvein Resonance
			[14] = { 9.32, 3.48 }, -- Condensed Life-Force
			[12] = { 8.87, 3.7 }, -- The Crucible of Flame
			[15] = { 4.21, 0 }, -- Ripple in Space
			[32] = { 7.11, 2.77 }, -- Conflict and Strife
			[28] = { 4.2, 2.3 }, -- The Unbound Force
			[22] = { 1.75, 0.26 }, -- Vision of Perfection
			[27] = { 2.37, 1.62 }, -- Memory of Lucid Dreams
			[6] = { 6.76, 3.1 }, -- Purification Protocol
			[23] = { 8.2, 2.61 }, -- Blood of the Enemy
		}, 1571389200)

		insertDefaultScalesData(offensiveName, 7, 3, { -- Restoration Shaman
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2211 - 2799 (avg 2423), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[18] = 0.12, -- Blood Siphon
			[560] = 1.3, -- Bonded Souls
			[102] = 0.04, -- Synergistic Growth
			[100] = 0.11, -- Strength in Numbers
			[494] = 3.81, -- Battlefield Precision
			[562] = 4.01, -- Treacherous Covenant
			[447] = 1.08, -- Ancestral Resonance
			[207] = 0.05, -- Serene Spirit
			[195] = 2.54, -- Secrets of the Deep
			[21] = 0.98, -- Elemental Whirl
			[577] = 1.13, -- Arcane Heart
			[483] = 2.91, -- Archive of the Titans
			[478] = 4.05, -- Tidal Surge
			[194] = 3.44, -- Filthy Transfusion
			[192] = 1.53, -- Meticulous Scheming
			[85] = 0.16, -- Gemhide
			[500] = 2.17, -- Synaptic Spark Capacitor
			[498] = 2.69, -- Barrage Of Many Bombs
			[99] = 0.04, -- Ablative Shielding
			[30] = 2.25, -- Overwhelming Power
			[98] = 0.09, -- Crystalline Carapace
			[576] = 0.07, -- Loyal to the End
			[19] = 0.04, -- Woundbinder
			[42] = 0.07, -- Savior
			[522] = 3.91, -- Ancients' Bulwark
			[103] = 0.18, -- Concentrated Mending
			[157] = 3.92, -- Rezan's Fury
			[492] = 2.33, -- Liberator's Might
			[191] = 0.01, -- Turn of the Tide
			[156] = 2.58, -- Ruinous Bolt
			[20] = 1.37, -- Lifespeed
			[14] = 0.13, -- Longstrider
			[479] = 4.21, -- Dagger in the Back
			[474] = 0.03, -- Pack Spirit
			[44] = 0.03, -- Vampiric Speed
			[496] = 0.59, -- Stronger Together
			[457] = 10, -- Igneous Potential
			[501] = 3.09, -- Relational Normalization Gizmo
			[502] = 0.05, -- Personal Absorb-o-Tron
			[448] = 2.69, -- Synapse Shock
			[504] = 2.81, -- Unstable Catalyst
			[497] = 0.7, -- Stand As One
			[84] = 0.25, -- Bulwark of the Masses
			[526] = 3.98, -- Endless Hunger
			[561] = 2.27, -- Seductive Power
			[105] = 0.15, -- Ephemeral Recovery
			[459] = 1.24, -- Unstable Flames
			[38] = 1.2, -- On My Way
			[485] = 3.6, -- Laser Matrix
			[31] = 1.97, -- Gutripper
			[575] = 6.18, -- Undulating Tides
			[13] = 0.13, -- Azerite Empowered
			[569] = 2.27, -- Clockwork Heart
			[523] = 3.18, -- Apothecary's Concoctions
			[422] = 0.19, -- Surging Tides
			[481] = 0.12, -- Incite the Pack
			[89] = 0.16, -- Azerite Veins
			[461] = 0.97, -- Earthlink
			[521] = 2.52, -- Shadow of Elune
			[423] = 0.17, -- Spouting Spirits
			[138] = 0.01, -- Soothing Waters
			[480] = 2.69, -- Blood Rite
			[495] = 2.48, -- Anduin's Dedication
			[503] = 0.13, -- Auto-Self-Cauterizer
			[22] = 1.85, -- Heed My Call
			[539] = 0.08, -- Ancient Ankh Talisman
			[499] = 1.42, -- Ricocheting Inflatable Pyrosaw
			[193] = 3.47, -- Blightborne Infusion
			[416] = 3.28, -- Natural Harmony
			[104] = 0.04, -- Bracing Chill
			[482] = 3.3, -- Thunderous Blast
			[196] = 3.12, -- Swirling Sands
			[82] = 2.8, -- Champion of Azeroth
			[462] = 1.26, -- Azerite Globules
			[449] = 0.11, -- Overflowing Shores
			[541] = 0.96, -- Fight or Flight
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2225 - 2527 (avg 2419), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[28] = { 1.73, 1.74 }, -- The Unbound Force
			[15] = { 3.4, 0.15 }, -- Ripple in Space
			[27] = { 0.14, 0.26 }, -- Memory of Lucid Dreams
			[5] = { 3.75, 3.68 }, -- Essence of the Focusing Iris
			[23] = { 0.95, 0.88 }, -- Blood of the Enemy
			[32] = { 2.57, 2.31 }, -- Conflict and Strife
			[6] = { 3.32, 3.39 }, -- Purification Protocol
			[14] = { 3.96, 3.95 }, -- Condensed Life-Force
			[22] = { 0.15, 0.09 }, -- Vision of Perfection
			[4] = { 0.11, 1.31 }, -- Worldvein Resonance
			[12] = { 10, 5.28 }, -- The Crucible of Flame
		}, 1571389200)

		insertDefaultScalesData(defaultName, 9, 1, { -- Affliction Warlock
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3925 - 5448 (avg 4510), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[483] = 4.93, -- Archive of the Titans
			[541] = 1.46, -- Fight or Flight
			[461] = 1.35, -- Earthlink
			[82] = 7.39, -- Champion of Azeroth
			[21] = 2.45, -- Elemental Whirl
			[495] = 4.46, -- Anduin's Dedication
			[183] = 7.26, -- Inevitable Demise
			[20] = 2.61, -- Lifespeed
			[576] = 3.88, -- Loyal to the End
			[101] = 0.26, -- Shimmering Haven
			[577] = 2.17, -- Arcane Heart
			[459] = 2.68, -- Unstable Flames
			[31] = 3.06, -- Gutripper
			[482] = 5.33, -- Thunderous Blast
			[496] = 1.71, -- Stronger Together
			[156] = 3.83, -- Ruinous Bolt
			[123] = 6.33, -- Wracking Brilliance
			[562] = 6.95, -- Treacherous Covenant
			[561] = 3.71, -- Seductive Power
			[560] = 2.56, -- Bonded Souls
			[494] = 6.41, -- Battlefield Precision
			[14] = 0.1, -- Longstrider
			[497] = 1.04, -- Stand As One
			[442] = 5.89, -- Pandemic Invocation
			[521] = 4.85, -- Shadow of Elune
			[42] = 0.12, -- Savior
			[493] = 2.92, -- Last Gift
			[480] = 4.48, -- Blood Rite
			[569] = 4.66, -- Clockwork Heart
			[230] = 7.41, -- Cascading Calamity
			[492] = 5.08, -- Liberator's Might
			[18] = 2.19, -- Blood Siphon
			[479] = 6.6, -- Dagger in the Back
			[499] = 2.42, -- Ricocheting Inflatable Pyrosaw
			[575] = 10, -- Undulating Tides
			[523] = 5.16, -- Apothecary's Concoctions
			[522] = 7.47, -- Ancients' Bulwark
			[498] = 3.86, -- Barrage Of Many Bombs
			[505] = 5.84, -- Tradewinds
			[500] = 3.36, -- Synaptic Spark Capacitor
			[22] = 2.8, -- Heed My Call
			[195] = 4.63, -- Secrets of the Deep
			[30] = 4.87, -- Overwhelming Power
			[485] = 5.59, -- Laser Matrix
			[157] = 6.36, -- Rezan's Fury
			[501] = 5.67, -- Relational Normalization Gizmo
			[38] = 2, -- On My Way
			[502] = 0.04, -- Personal Absorb-o-Tron
			[425] = 4.97, -- Sudden Onset
			[84] = 0.05, -- Bulwark of the Masses
			[478] = 6.19, -- Tidal Surge
			[504] = 5.29, -- Unstable Catalyst
			[192] = 5.52, -- Meticulous Scheming
			[426] = 6.59, -- Dreadful Calling
			[196] = 7.13, -- Swirling Sands
			[194] = 5.42, -- Filthy Transfusion
			[526] = 7.52, -- Endless Hunger
			[481] = 4.94, -- Incite the Pack
			[462] = 1.71, -- Azerite Globules
			[193] = 7.7, -- Blightborne Infusion
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2638 - 5500 (avg 4458), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[32] = { 1.74, 1.88 }, -- Conflict and Strife
			[4] = { 0.65, 0.94 }, -- Worldvein Resonance
			[12] = { 7.34, 2.76 }, -- The Crucible of Flame
			[27] = { 2.95, 1.28 }, -- Memory of Lucid Dreams
			[5] = { 10, 3.36 }, -- Essence of the Focusing Iris
			[23] = { 6.63, 0.97 }, -- Blood of the Enemy
			[28] = { 3.72, 1.72 }, -- The Unbound Force
			[22] = { 0.55, 2.63 }, -- Vision of Perfection
			[6] = { 5.57, 2.42 }, -- Purification Protocol
			[15] = { 3.34, 0 }, -- Ripple in Space
			[14] = { 7.62, 2.94 }, -- Condensed Life-Force
		}, 1571389200)

		insertDefaultScalesData(defaultName, 9, 2, { -- Demonology Warlock
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2857 - 4726 (avg 3418), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[22] = 1.92, -- Heed My Call
			[482] = 3.89, -- Thunderous Blast
			[576] = 3.09, -- Loyal to the End
			[478] = 4.8, -- Tidal Surge
			[461] = 1.58, -- Earthlink
			[568] = 0.08, -- Person-Computer Interface
			[496] = 1.41, -- Stronger Together
			[192] = 4.72, -- Meticulous Scheming
			[193] = 6.09, -- Blightborne Infusion
			[521] = 4.82, -- Shadow of Elune
			[459] = 2.33, -- Unstable Flames
			[495] = 4.07, -- Anduin's Dedication
			[577] = 0.49, -- Arcane Heart
			[504] = 4.37, -- Unstable Catalyst
			[98] = 0.01, -- Crystalline Carapace
			[13] = 0.05, -- Azerite Empowered
			[483] = 4.28, -- Archive of the Titans
			[87] = 0.11, -- Self Reliance
			[575] = 7.04, -- Undulating Tides
			[31] = 2.17, -- Gutripper
			[84] = 0.02, -- Bulwark of the Masses
			[89] = 0.02, -- Azerite Veins
			[130] = 2.49, -- Shadow's Bite
			[99] = 0.06, -- Ablative Shielding
			[21] = 2.21, -- Elemental Whirl
			[522] = 6.27, -- Ancients' Bulwark
			[38] = 1.86, -- On My Way
			[15] = 0.17, -- Resounding Protection
			[569] = 5.42, -- Clockwork Heart
			[494] = 3.04, -- Battlefield Precision
			[458] = 3.72, -- Supreme Commander
			[156] = 3.14, -- Ruinous Bolt
			[523] = 3.78, -- Apothecary's Concoctions
			[561] = 3.26, -- Seductive Power
			[44] = 0.07, -- Vampiric Speed
			[42] = 0.22, -- Savior
			[196] = 4.94, -- Swirling Sands
			[501] = 5.35, -- Relational Normalization Gizmo
			[497] = 1.24, -- Stand As One
			[462] = 1.1, -- Azerite Globules
			[526] = 6.22, -- Endless Hunger
			[560] = 2.05, -- Bonded Souls
			[85] = 0.22, -- Gemhide
			[82] = 5.44, -- Champion of Azeroth
			[475] = 0.1, -- Desperate Power
			[505] = 4.47, -- Tradewinds
			[428] = 4.21, -- Demonic Meteor
			[83] = 0.02, -- Impassive Visage
			[429] = 10, -- Baleful Invocation
			[562] = 6.27, -- Treacherous Covenant
			[493] = 2.57, -- Last Gift
			[208] = 0.06, -- Lifeblood
			[492] = 4.13, -- Liberator's Might
			[86] = 0.07, -- Azerite Fortification
			[485] = 3.99, -- Laser Matrix
			[157] = 4.6, -- Rezan's Fury
			[500] = 2.72, -- Synaptic Spark Capacitor
			[101] = 0.07, -- Shimmering Haven
			[480] = 4.52, -- Blood Rite
			[499] = 1.71, -- Ricocheting Inflatable Pyrosaw
			[541] = 1.28, -- Fight or Flight
			[190] = 3.63, -- Umbral Blaze
			[30] = 4.04, -- Overwhelming Power
			[498] = 2.95, -- Barrage Of Many Bombs
			[481] = 4.09, -- Incite the Pack
			[195] = 4.32, -- Secrets of the Deep
			[194] = 4.2, -- Filthy Transfusion
			[503] = 0.07, -- Auto-Self-Cauterizer
			[479] = 5, -- Dagger in the Back
			[18] = 1.76, -- Blood Siphon
			[20] = 1.41, -- Lifespeed
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2985 - 4598 (avg 3434), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[23] = { 6.73, 0.48 }, -- Blood of the Enemy
			[4] = { 1.66, 1.32 }, -- Worldvein Resonance
			[15] = { 3.82, 0 }, -- Ripple in Space
			[22] = { 5.94, 2.05 }, -- Vision of Perfection
			[5] = { 10, 3.69 }, -- Essence of the Focusing Iris
			[12] = { 7.07, 3.73 }, -- The Crucible of Flame
			[32] = { 2.91, 2.92 }, -- Conflict and Strife
			[6] = { 5.39, 2.8 }, -- Purification Protocol
			[27] = { 4.85, 3.17 }, -- Memory of Lucid Dreams
			[14] = { 8.81, 3.35 }, -- Condensed Life-Force
			[28] = { 3.35, 1.52 }, -- The Unbound Force
		}, 1571389200)

		insertDefaultScalesData(defaultName, 9, 3, { -- Destruction Warlock
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 5398 - 6766 (avg 5890), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[31] = 2.82, -- Gutripper
			[562] = 8.41, -- Treacherous Covenant
			[531] = 0.1, -- Terror of the Mind
			[196] = 7.83, -- Swirling Sands
			[522] = 8.48, -- Ancients' Bulwark
			[444] = 5.81, -- Crashing Chaos
			[480] = 5.73, -- Blood Rite
			[100] = 0.15, -- Strength in Numbers
			[495] = 5.15, -- Anduin's Dedication
			[493] = 3.22, -- Last Gift
			[500] = 3.41, -- Synaptic Spark Capacitor
			[19] = 0.19, -- Woundbinder
			[232] = 6.92, -- Flashpoint
			[21] = 2.7, -- Elemental Whirl
			[463] = 0.35, -- Blessed Portents
			[460] = 6.19, -- Bursting Flare
			[501] = 6.74, -- Relational Normalization Gizmo
			[492] = 5.25, -- Liberator's Might
			[195] = 4.94, -- Secrets of the Deep
			[560] = 2.82, -- Bonded Souls
			[521] = 5.63, -- Shadow of Elune
			[483] = 5.35, -- Archive of the Titans
			[478] = 5.92, -- Tidal Surge
			[504] = 5.8, -- Unstable Catalyst
			[461] = 1.5, -- Earthlink
			[432] = 7.03, -- Chaotic Inferno
			[14] = 0.11, -- Longstrider
			[20] = 2.36, -- Lifespeed
			[194] = 4.95, -- Filthy Transfusion
			[482] = 5.47, -- Thunderous Blast
			[86] = 0.19, -- Azerite Fortification
			[479] = 6.64, -- Dagger in the Back
			[462] = 2.15, -- Azerite Globules
			[575] = 10, -- Undulating Tides
			[523] = 5.13, -- Apothecary's Concoctions
			[30] = 5.24, -- Overwhelming Power
			[561] = 4.38, -- Seductive Power
			[496] = 1.93, -- Stronger Together
			[18] = 2.42, -- Blood Siphon
			[157] = 6.27, -- Rezan's Fury
			[577] = 2.37, -- Arcane Heart
			[42] = 0.25, -- Savior
			[505] = 6.29, -- Tradewinds
			[499] = 2.54, -- Ricocheting Inflatable Pyrosaw
			[526] = 8.74, -- Endless Hunger
			[156] = 3.74, -- Ruinous Bolt
			[497] = 1.41, -- Stand As One
			[193] = 9.16, -- Blightborne Infusion
			[22] = 2.78, -- Heed My Call
			[541] = 2.06, -- Fight or Flight
			[85] = 0.27, -- Gemhide
			[82] = 7.81, -- Champion of Azeroth
			[131] = 6.84, -- Chaos Shards
			[431] = 0.04, -- Rolling Havoc
			[38] = 2.55, -- On My Way
			[192] = 5.97, -- Meticulous Scheming
			[208] = 0.01, -- Lifeblood
			[494] = 5.65, -- Battlefield Precision
			[576] = 4.43, -- Loyal to the End
			[98] = 0.07, -- Crystalline Carapace
			[485] = 5.71, -- Laser Matrix
			[503] = 0.02, -- Auto-Self-Cauterizer
			[459] = 3.28, -- Unstable Flames
			[569] = 4.76, -- Clockwork Heart
			[99] = 0.09, -- Ablative Shielding
			[481] = 6.15, -- Incite the Pack
			[498] = 3.89, -- Barrage Of Many Bombs
			[568] = 0.22, -- Person-Computer Interface
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3558 - 7880 (avg 5771), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[6] = { 4.23, 2.15 }, -- Purification Protocol
			[14] = { 6.51, 2.65 }, -- Condensed Life-Force
			[12] = { 5.56, 2.9 }, -- The Crucible of Flame
			[27] = { 10, 2.54 }, -- Memory of Lucid Dreams
			[5] = { 7.55, 3.36 }, -- Essence of the Focusing Iris
			[28] = { 1.87, 1.21 }, -- The Unbound Force
			[15] = { 2.64, 0.17 }, -- Ripple in Space
			[23] = { 3.3, 0.7 }, -- Blood of the Enemy
			[22] = { 9.74, 3.8 }, -- Vision of Perfection
			[4] = { 0.51, 1.05 }, -- Worldvein Resonance
			[32] = { 2.26, 2.12 }, -- Conflict and Strife
		}, 1571389200)

		insertDefaultScalesData(defaultName, 1, 1, { -- Arms Warrior
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3316 - 4315 (avg 3562), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[99] = 0.27, -- Ablative Shielding
			[493] = 3.14, -- Last Gift
			[38] = 2.32, -- On My Way
			[560] = 2.38, -- Bonded Souls
			[501] = 6.1, -- Relational Normalization Gizmo
			[576] = 4.31, -- Loyal to the End
			[103] = 0.02, -- Concentrated Mending
			[461] = 1.76, -- Earthlink
			[477] = 0.15, -- Bury the Hatchet
			[13] = 0.16, -- Azerite Empowered
			[14] = 0.02, -- Longstrider
			[19] = 0.01, -- Woundbinder
			[434] = 8.52, -- Crushing Assault
			[504] = 5.34, -- Unstable Catalyst
			[459] = 3.46, -- Unstable Flames
			[156] = 3.49, -- Ruinous Bolt
			[105] = 0.31, -- Ephemeral Recovery
			[502] = 0.02, -- Personal Absorb-o-Tron
			[554] = 0.15, -- Intimidating Presence
			[104] = 0.38, -- Bracing Chill
			[523] = 4.42, -- Apothecary's Concoctions
			[84] = 0.2, -- Bulwark of the Masses
			[575] = 8.85, -- Undulating Tides
			[483] = 4.99, -- Archive of the Titans
			[121] = 5.96, -- Striking the Anvil
			[476] = 0.11, -- Moment of Glory
			[561] = 4.19, -- Seductive Power
			[463] = 0.23, -- Blessed Portents
			[194] = 4.63, -- Filthy Transfusion
			[569] = 6.65, -- Clockwork Heart
			[478] = 5.32, -- Tidal Surge
			[435] = 4.54, -- Lord of War
			[82] = 8.09, -- Champion of Azeroth
			[522] = 8.33, -- Ancients' Bulwark
			[541] = 2.18, -- Fight or Flight
			[503] = 0.12, -- Auto-Self-Cauterizer
			[193] = 9.49, -- Blightborne Infusion
			[497] = 0.93, -- Stand As One
			[15] = 0.3, -- Resounding Protection
			[500] = 2.7, -- Synaptic Spark Capacitor
			[101] = 0.16, -- Shimmering Haven
			[30] = 5.23, -- Overwhelming Power
			[83] = 0.33, -- Impassive Visage
			[100] = 0.2, -- Strength in Numbers
			[87] = 0.17, -- Self Reliance
			[21] = 2.99, -- Elemental Whirl
			[499] = 2.31, -- Ricocheting Inflatable Pyrosaw
			[157] = 5.4, -- Rezan's Fury
			[85] = 0.12, -- Gemhide
			[98] = 0.35, -- Crystalline Carapace
			[86] = 0.21, -- Azerite Fortification
			[494] = 5.62, -- Battlefield Precision
			[174] = 5.17, -- Gathering Storm
			[521] = 5.24, -- Shadow of Elune
			[433] = 4.03, -- Seismic Wave
			[482] = 4.55, -- Thunderous Blast
			[479] = 5.73, -- Dagger in the Back
			[18] = 2.24, -- Blood Siphon
			[462] = 1.5, -- Azerite Globules
			[43] = 0.13, -- Winds of War
			[492] = 5.34, -- Liberator's Might
			[196] = 8.75, -- Swirling Sands
			[562] = 7.18, -- Treacherous Covenant
			[42] = 0.53, -- Savior
			[22] = 2.55, -- Heed My Call
			[481] = 5.51, -- Incite the Pack
			[31] = 2.64, -- Gutripper
			[480] = 5.09, -- Blood Rite
			[498] = 3.77, -- Barrage Of Many Bombs
			[505] = 5.77, -- Tradewinds
			[195] = 4.53, -- Secrets of the Deep
			[577] = 3.04, -- Arcane Heart
			[496] = 2.02, -- Stronger Together
			[192] = 5.97, -- Meticulous Scheming
			[526] = 8.5, -- Endless Hunger
			[485] = 5.12, -- Laser Matrix
			[89] = 0.07, -- Azerite Veins
			[495] = 4.92, -- Anduin's Dedication
			[20] = 2.23, -- Lifespeed
			[226] = 10, -- Test of Might
			[568] = 0.32, -- Person-Computer Interface
			[44] = 0.18, -- Vampiric Speed
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 3235 - 3892 (avg 3519), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[14] = { 8.84, 3.26 }, -- Condensed Life-Force
			[32] = { 2.7, 2.91 }, -- Conflict and Strife
			[5] = { 10, 4.06 }, -- Essence of the Focusing Iris
			[23] = { 6.16, 1.14 }, -- Blood of the Enemy
			[12] = { 9.04, 3.17 }, -- The Crucible of Flame
			[15] = { 4.19, 0.28 }, -- Ripple in Space
			[4] = { 1.67, 1.36 }, -- Worldvein Resonance
			[22] = { 0.07, 0 }, -- Vision of Perfection
			[27] = { 7.55, 4.47 }, -- Memory of Lucid Dreams
			[28] = { 4.68, 2.58 }, -- The Unbound Force
			[6] = { 6.31, 2.76 }, -- Purification Protocol
		}, 1571389200)

		insertDefaultScalesData(defaultName, 1, 2, { -- Fury Warrior
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4623 - 5582 (avg 4930), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[18] = 2.03, -- Blood Siphon
			[30] = 6.04, -- Overwhelming Power
			[495] = 3.68, -- Anduin's Dedication
			[498] = 4.11, -- Barrage Of Many Bombs
			[229] = 4.6, -- Pulverizing Blows
			[15] = 0.19, -- Resounding Protection
			[541] = 1.4, -- Fight or Flight
			[576] = 3.6, -- Loyal to the End
			[504] = 3.97, -- Unstable Catalyst
			[42] = 0.17, -- Savior
			[496] = 1.58, -- Stronger Together
			[99] = 0.22, -- Ablative Shielding
			[485] = 5.73, -- Laser Matrix
			[437] = 6.05, -- Simmering Rage
			[481] = 4.61, -- Incite the Pack
			[196] = 6.62, -- Swirling Sands
			[89] = 0.36, -- Azerite Veins
			[478] = 5.06, -- Tidal Surge
			[193] = 7.36, -- Blightborne Infusion
			[482] = 5.13, -- Thunderous Blast
			[462] = 1.87, -- Azerite Globules
			[526] = 7.53, -- Endless Hunger
			[577] = 2.49, -- Arcane Heart
			[502] = 0.12, -- Personal Absorb-o-Tron
			[21] = 2.79, -- Elemental Whirl
			[459] = 2.75, -- Unstable Flames
			[14] = 0.28, -- Longstrider
			[463] = 0.32, -- Blessed Portents
			[568] = 0.21, -- Person-Computer Interface
			[101] = 0.21, -- Shimmering Haven
			[156] = 3.32, -- Ruinous Bolt
			[87] = 0.29, -- Self Reliance
			[195] = 3.49, -- Secrets of the Deep
			[493] = 2.66, -- Last Gift
			[176] = 8.84, -- Cold Steel, Hot Blood
			[43] = 0.34, -- Winds of War
			[501] = 5.49, -- Relational Normalization Gizmo
			[22] = 2.91, -- Heed My Call
			[479] = 5.37, -- Dagger in the Back
			[554] = 0.25, -- Intimidating Presence
			[100] = 0.11, -- Strength in Numbers
			[157] = 6.21, -- Rezan's Fury
			[83] = 0.47, -- Impassive Visage
			[103] = 0.35, -- Concentrated Mending
			[497] = 1.23, -- Stand As One
			[569] = 6.83, -- Clockwork Heart
			[561] = 3.94, -- Seductive Power
			[192] = 6.67, -- Meticulous Scheming
			[499] = 2.39, -- Ricocheting Inflatable Pyrosaw
			[505] = 5.43, -- Tradewinds
			[31] = 3.07, -- Gutripper
			[438] = 6.36, -- Reckless Flurry
			[104] = 0.18, -- Bracing Chill
			[86] = 0.3, -- Azerite Fortification
			[38] = 2.25, -- On My Way
			[477] = 0.34, -- Bury the Hatchet
			[13] = 0.12, -- Azerite Empowered
			[194] = 5.12, -- Filthy Transfusion
			[174] = 0.32, -- Gathering Storm
			[84] = 0.33, -- Bulwark of the Masses
			[500] = 2.96, -- Synaptic Spark Capacitor
			[521] = 5.34, -- Shadow of Elune
			[119] = 7.73, -- Unbridled Ferocity
			[461] = 1.42, -- Earthlink
			[451] = 4.49, -- Infinite Fury
			[44] = 0.23, -- Vampiric Speed
			[19] = 0.33, -- Woundbinder
			[82] = 8.63, -- Champion of Azeroth
			[483] = 4.21, -- Archive of the Titans
			[480] = 5.13, -- Blood Rite
			[522] = 7.49, -- Ancients' Bulwark
			[20] = 3.59, -- Lifespeed
			[560] = 3.41, -- Bonded Souls
			[492] = 5.37, -- Liberator's Might
			[523] = 4.18, -- Apothecary's Concoctions
			[494] = 6.21, -- Battlefield Precision
			[105] = 0.36, -- Ephemeral Recovery
			[98] = 0.11, -- Crystalline Carapace
			[562] = 5.63, -- Treacherous Covenant
			[575] = 10, -- Undulating Tides
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4564 - 5311 (avg 4865), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[22] = { 2.68, 0.76 }, -- Vision of Perfection
			[14] = { 10, 4.1 }, -- Condensed Life-Force
			[12] = { 6.81, 4.07 }, -- The Crucible of Flame
			[15] = { 2.24, 0.15 }, -- Ripple in Space
			[27] = { 8.23, 2.98 }, -- Memory of Lucid Dreams
			[6] = { 5.78, 3.31 }, -- Purification Protocol
			[28] = { 3.11, 1.67 }, -- The Unbound Force
			[4] = { 0, 1.33 }, -- Worldvein Resonance
			[32] = { 2.68, 2.56 }, -- Conflict and Strife
			[23] = { 4.68, 1.94 }, -- Blood of the Enemy
			[5] = { 9.83, 5.32 }, -- Essence of the Focusing Iris
		}, 1571389200)

		insertDefaultScalesData(offensiveName, 1, 3, { -- Protection Warrior
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4104 - 5262 (avg 4477), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[13] = 0.04, -- Azerite Empowered
			[526] = 6.01, -- Endless Hunger
			[577] = 1.41, -- Arcane Heart
			[505] = 3.66, -- Tradewinds
			[521] = 3.56, -- Shadow of Elune
			[98] = 0.04, -- Crystalline Carapace
			[462] = 1.95, -- Azerite Globules
			[496] = 1.36, -- Stronger Together
			[459] = 2.4, -- Unstable Flames
			[493] = 1.76, -- Last Gift
			[541] = 1.42, -- Fight or Flight
			[569] = 4.72, -- Clockwork Heart
			[500] = 2.98, -- Synaptic Spark Capacitor
			[576] = 2.71, -- Loyal to the End
			[502] = 0.21, -- Personal Absorb-o-Tron
			[463] = 0.12, -- Blessed Portents
			[83] = 0.18, -- Impassive Visage
			[193] = 6.57, -- Blightborne Infusion
			[14] = 0.07, -- Longstrider
			[19] = 0.13, -- Woundbinder
			[504] = 4.17, -- Unstable Catalyst
			[192] = 4.39, -- Meticulous Scheming
			[492] = 3.71, -- Liberator's Might
			[485] = 5.38, -- Laser Matrix
			[85] = 0.03, -- Gemhide
			[450] = 4.48, -- Brace for Impact
			[105] = 0.06, -- Ephemeral Recovery
			[157] = 6.45, -- Rezan's Fury
			[568] = 0.23, -- Person-Computer Interface
			[440] = 1.39, -- Callous Reprisal
			[503] = 0.15, -- Auto-Self-Cauterizer
			[38] = 1.89, -- On My Way
			[499] = 2.48, -- Ricocheting Inflatable Pyrosaw
			[523] = 4.39, -- Apothecary's Concoctions
			[476] = 0.17, -- Moment of Glory
			[501] = 4.3, -- Relational Normalization Gizmo
			[22] = 2.89, -- Heed My Call
			[99] = 0.1, -- Ablative Shielding
			[522] = 6.09, -- Ancients' Bulwark
			[30] = 3.72, -- Overwhelming Power
			[195] = 3.78, -- Secrets of the Deep
			[43] = 0.27, -- Winds of War
			[461] = 1.33, -- Earthlink
			[103] = 0.14, -- Concentrated Mending
			[89] = 0.26, -- Azerite Veins
			[478] = 5.5, -- Tidal Surge
			[441] = 2.48, -- Iron Fortress
			[18] = 1.47, -- Blood Siphon
			[479] = 3.85, -- Dagger in the Back
			[156] = 3.51, -- Ruinous Bolt
			[562] = 5.46, -- Treacherous Covenant
			[196] = 5.84, -- Swirling Sands
			[480] = 3.57, -- Blood Rite
			[194] = 5.28, -- Filthy Transfusion
			[42] = 0.29, -- Savior
			[118] = 1.86, -- Deafening Crash
			[560] = 1.71, -- Bonded Souls
			[84] = 0.08, -- Bulwark of the Masses
			[575] = 10, -- Undulating Tides
			[86] = 0.07, -- Azerite Fortification
			[82] = 5.73, -- Champion of Azeroth
			[561] = 3.44, -- Seductive Power
			[554] = 0.08, -- Intimidating Presence
			[15] = 0.07, -- Resounding Protection
			[100] = 0.24, -- Strength in Numbers
			[481] = 3.29, -- Incite the Pack
			[494] = 6.08, -- Battlefield Precision
			[31] = 3.07, -- Gutripper
			[495] = 3.52, -- Anduin's Dedication
			[497] = 0.98, -- Stand As One
			[104] = 0.01, -- Bracing Chill
			[483] = 4, -- Archive of the Titans
			[482] = 5.28, -- Thunderous Blast
			[21] = 1.94, -- Elemental Whirl
			[498] = 4.33, -- Barrage Of Many Bombs
			[20] = 1.78, -- Lifespeed
			[237] = 4.93, -- Bastion of Might
			[44] = 0.02, -- Vampiric Speed
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4077 - 4727 (avg 4451), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[3] = { 4.54, 4.54 }, -- Sphere of Suppression
			[22] = { 5.14, 3.05 }, -- Vision of Perfection
			[2] = { 0.18, 0.13 }, -- Azeroth's Undying Gift
			[13] = { 0.02, 0.11 }, -- Nullification Dynamo
			[25] = { 1.07, 1.21 }, -- Aegis of the Deep
			[4] = { 1.35, 1.18 }, -- Worldvein Resonance
			[15] = { 4.08, 0.1 }, -- Ripple in Space
			[12] = { 10, 4.32 }, -- The Crucible of Flame
			[27] = { 1.59, 0.69 }, -- Memory of Lucid Dreams
			[32] = { 2.43, 2.29 }, -- Conflict and Strife
			[7] = { 3.07, 0 }, -- Anima of Life and Death
		}, 1571389200)

		insertDefaultScalesData(defensiveName, 12, 2, { -- Vengeance Demon Hunter (TMI)
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 1149 - 1411 (avg 1324), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[496] = 3.12, -- Stronger Together
			[104] = 6.81, -- Bracing Chill
			[84] = 7.13, -- Bulwark of the Masses
			[160] = 3.7, -- Infernal Armor
			[355] = 4.62, -- Essence Sever
			[354] = 5.92, -- Cycle of Binding
			[498] = 5.59, -- Barrage Of Many Bombs
			[18] = 2.75, -- Blood Siphon
			[495] = 4.83, -- Anduin's Dedication
			[564] = 5.8, -- Thrive in Chaos
			[157] = 2.07, -- Rezan's Fury
			[15] = 6.13, -- Resounding Protection
			[466] = 10, -- Burning Soul
			[492] = 1.88, -- Liberator's Might
			[481] = 1.21, -- Incite the Pack
			[100] = 3.6, -- Strength in Numbers
			[196] = 2.84, -- Swirling Sands
			[156] = 4.61, -- Ruinous Bolt
			[494] = 8.21, -- Battlefield Precision
			[462] = 4.91, -- Azerite Globules
			[103] = 6.56, -- Concentrated Mending
			[575] = 0.74, -- Undulating Tides
			[192] = 6.85, -- Meticulous Scheming
			[30] = 2.75, -- Overwhelming Power
			[195] = 7.14, -- Secrets of the Deep
			[500] = 2.85, -- Synaptic Spark Capacitor
			[526] = 0.95, -- Endless Hunger
			[479] = 1.82, -- Dagger in the Back
			[44] = 0.81, -- Vampiric Speed
			[38] = 2.88, -- On My Way
			[503] = 4.69, -- Auto-Self-Cauterizer
			[98] = 4.41, -- Crystalline Carapace
			[105] = 8.37, -- Ephemeral Recovery
			[13] = 0.14, -- Azerite Empowered
			[42] = 5.18, -- Savior
			[576] = 2.11, -- Loyal to the End
			[562] = 3.96, -- Treacherous Covenant
			[221] = 6.52, -- Rigid Carapace
			[501] = 2.55, -- Relational Normalization Gizmo
			[86] = 2.49, -- Azerite Fortification
			[246] = 2.76, -- Hour of Reaping
			[541] = 3.19, -- Fight or Flight
			[83] = 1.47, -- Impassive Visage
			[101] = 1.27, -- Shimmering Haven
			[497] = 1.31, -- Stand As One
			[193] = 4.6, -- Blightborne Infusion
			[21] = 6.23, -- Elemental Whirl
			[482] = 2.23, -- Thunderous Blast
			[22] = 3.08, -- Heed My Call
			[522] = 3.98, -- Ancients' Bulwark
			[478] = 5.15, -- Tidal Surge
			[569] = 3.92, -- Clockwork Heart
			[568] = 7.76, -- Person-Computer Interface
			[499] = 8.08, -- Ricocheting Inflatable Pyrosaw
			[99] = 5.7, -- Ablative Shielding
			[202] = 2.96, -- Soulmonger
			[480] = 3.92, -- Blood Rite
			[459] = 8.6, -- Unstable Flames
			[461] = 7.27, -- Earthlink
			[523] = 2.31, -- Apothecary's Concoctions
			[504] = 7.15, -- Unstable Catalyst
			[82] = 7.47, -- Champion of Azeroth
			[493] = 6.91, -- Last Gift
			[194] = 5.08, -- Filthy Transfusion
			[87] = 7.18, -- Self Reliance
			[505] = 1.98, -- Tradewinds
			[85] = 4.15, -- Gemhide
			[14] = 8.33, -- Longstrider
			[521] = 4.64, -- Shadow of Elune
			[561] = 3.5, -- Seductive Power
			[485] = 2.96, -- Laser Matrix
			[502] = 6.96, -- Personal Absorb-o-Tron
			[577] = 6.34, -- Arcane Heart
			[483] = 5.23, -- Archive of the Titans
			[20] = 9.39, -- Lifespeed
			[31] = 5.64, -- Gutripper
			[560] = 2.73, -- Bonded Souls
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 1220 - 1459 (avg 1335), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[25] = { 3.27, 10 }, -- Aegis of the Deep
			[4] = { 1.72, 0.36 }, -- Worldvein Resonance
			[32] = { 0.22, 5.79 }, -- Conflict and Strife
			[12] = { 3.31, 4.73 }, -- The Crucible of Flame
			[15] = { 3.23, 0.71 }, -- Ripple in Space
			[27] = { 8.24, 0 }, -- Memory of Lucid Dreams
			[2] = { 3.43, 0.91 }, -- Azeroth's Undying Gift
			[13] = { 5.99, 0 }, -- Nullification Dynamo
			[22] = { 8.23, 5.75 }, -- Vision of Perfection
			[7] = { 6.13, 0 }, -- Anima of Life and Death
			[3] = { 5.07, 2.04 }, -- Sphere of Suppression
		}, 1571389200)

		insertDefaultScalesData(defensiveName, 11, 3, { -- Guardian Druid (TMI)
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 1011 - 2566 (avg 1159), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[18] = 5.13, -- Blood Siphon
			[482] = 2.88, -- Thunderous Blast
			[105] = 0.18, -- Ephemeral Recovery
			[196] = 3.76, -- Swirling Sands
			[44] = 7.7, -- Vampiric Speed
			[526] = 4.5, -- Endless Hunger
			[30] = 1.46, -- Overwhelming Power
			[540] = 2.04, -- Switch Hitter
			[84] = 2.95, -- Bulwark of the Masses
			[480] = 2.17, -- Blood Rite
			[479] = 8.23, -- Dagger in the Back
			[101] = 1.51, -- Shimmering Haven
			[19] = 7.71, -- Woundbinder
			[541] = 10, -- Fight or Flight
			[83] = 0.67, -- Impassive Visage
			[492] = 2.08, -- Liberator's Might
			[112] = 1.78, -- Layered Mane
			[13] = 7.18, -- Azerite Empowered
			[467] = 1.52, -- Ursoc's Endurance
			[82] = 7.01, -- Champion of Azeroth
			[501] = 3.24, -- Relational Normalization Gizmo
			[576] = 4.25, -- Loyal to the End
			[577] = 1.77, -- Arcane Heart
			[192] = 2.65, -- Meticulous Scheming
			[502] = 2.94, -- Personal Absorb-o-Tron
			[156] = 6.06, -- Ruinous Bolt
			[495] = 5.28, -- Anduin's Dedication
			[481] = 4.98, -- Incite the Pack
			[523] = 3.11, -- Apothecary's Concoctions
			[560] = 5.35, -- Bonded Souls
			[462] = 6.11, -- Azerite Globules
			[504] = 1.99, -- Unstable Catalyst
			[575] = 5.48, -- Undulating Tides
			[493] = 8.25, -- Last Gift
			[195] = 3.23, -- Secrets of the Deep
			[505] = 4.81, -- Tradewinds
			[361] = 6.61, -- Guardian's Wrath
			[499] = 4.64, -- Ricocheting Inflatable Pyrosaw
			[496] = 2.88, -- Stronger Together
			[15] = 8.53, -- Resounding Protection
			[104] = 7.69, -- Bracing Chill
			[494] = 2.27, -- Battlefield Precision
			[100] = 0.73, -- Strength in Numbers
			[251] = 4.7, -- Burst of Savagery
			[498] = 1.78, -- Barrage Of Many Bombs
			[99] = 5.32, -- Ablative Shielding
			[485] = 2.07, -- Laser Matrix
			[459] = 0.44, -- Unstable Flames
			[42] = 3.66, -- Savior
			[359] = 1.1, -- Wild Fleshrending
			[241] = 1.96, -- Twisted Claws
			[157] = 5.47, -- Rezan's Fury
			[103] = 3.64, -- Concentrated Mending
			[500] = 4.36, -- Synaptic Spark Capacitor
			[360] = 0.33, -- Gory Regeneration
			[503] = 1.45, -- Auto-Self-Cauterizer
			[193] = 2.49, -- Blightborne Infusion
			[483] = 3.19, -- Archive of the Titans
			[43] = 0.88, -- Winds of War
			[562] = 1.25, -- Treacherous Covenant
			[561] = 9.24, -- Seductive Power
			[98] = 3.62, -- Crystalline Carapace
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 1057 - 1224 (avg 1119), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[4] = { 0, 2.53 }, -- Worldvein Resonance
			[22] = { 4.32, 10 }, -- Vision of Perfection
			[27] = { 5.64, 4.38 }, -- Memory of Lucid Dreams
			[3] = { 4.69, 2.6 }, -- Sphere of Suppression
			[15] = { 0, 0.35 }, -- Ripple in Space
			[13] = { 2.9, 7.14 }, -- Nullification Dynamo
			[7] = { 0, 4.17 }, -- Anima of Life and Death
			[25] = { 6.47, 0 }, -- Aegis of the Deep
			[12] = { 7.06, 3.87 }, -- The Crucible of Flame
			[32] = { 3.47, 1.46 }, -- Conflict and Strife
		}, 1571389200)

		insertDefaultScalesData(defensiveName, 10, 1, { -- Brewmaster Monk (TMI)
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2565 - 2986 (avg 2778), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[89] = 0.45, -- Azerite Veins
			[496] = 0.74, -- Stronger Together
			[485] = 3, -- Laser Matrix
			[44] = 9.13, -- Vampiric Speed
			[30] = 7.99, -- Overwhelming Power
			[84] = 1.41, -- Bulwark of the Masses
			[501] = 2.37, -- Relational Normalization Gizmo
			[38] = 6.09, -- On My Way
			[14] = 2.13, -- Longstrider
			[104] = 1.22, -- Bracing Chill
			[483] = 6.59, -- Archive of the Titans
			[569] = 4.43, -- Clockwork Heart
			[194] = 6.37, -- Filthy Transfusion
			[482] = 2.75, -- Thunderous Blast
			[541] = 8.29, -- Fight or Flight
			[479] = 5.17, -- Dagger in the Back
			[13] = 9.01, -- Azerite Empowered
			[383] = 0.26, -- Training of Niuzao
			[463] = 10, -- Blessed Portents
			[384] = 2, -- Elusive Footwork
			[575] = 2.51, -- Undulating Tides
			[522] = 0.58, -- Ancients' Bulwark
			[481] = 7.39, -- Incite the Pack
			[462] = 3.11, -- Azerite Globules
			[19] = 8.91, -- Woundbinder
			[218] = 0.64, -- Strength of Spirit
			[18] = 8.38, -- Blood Siphon
			[499] = 4.86, -- Ricocheting Inflatable Pyrosaw
			[502] = 2.3, -- Personal Absorb-o-Tron
			[560] = 7.05, -- Bonded Souls
			[470] = 2.91, -- Sweep the Leg
			[83] = 1.79, -- Impassive Visage
			[492] = 6.18, -- Liberator's Might
			[568] = 2.76, -- Person-Computer Interface
			[500] = 5.87, -- Synaptic Spark Capacitor
			[497] = 6.25, -- Stand As One
			[238] = 6.07, -- Fit to Burst
			[98] = 0.1, -- Crystalline Carapace
			[480] = 1.31, -- Blood Rite
			[156] = 2.87, -- Ruinous Bolt
			[503] = 4.26, -- Auto-Self-Cauterizer
			[196] = 5.77, -- Swirling Sands
			[116] = 5.16, -- Boiling Brew
			[82] = 6.89, -- Champion of Azeroth
			[498] = 7.67, -- Barrage Of Many Bombs
			[186] = 2.45, -- Staggering Strikes
			[157] = 3.44, -- Rezan's Fury
			[494] = 6.98, -- Battlefield Precision
			[562] = 7.47, -- Treacherous Covenant
			[526] = 1.36, -- Endless Hunger
			[459] = 0.07, -- Unstable Flames
			[493] = 2.81, -- Last Gift
			[87] = 9.43, -- Self Reliance
			[382] = 6.65, -- Straight, No Chaser
			[101] = 5.7, -- Shimmering Haven
			[20] = 5.86, -- Lifespeed
			[85] = 7.42, -- Gemhide
			[105] = 6.41, -- Ephemeral Recovery
			[521] = 5.7, -- Shadow of Elune
			[22] = 7.83, -- Heed My Call
			[99] = 3.25, -- Ablative Shielding
			[561] = 0.51, -- Seductive Power
			[193] = 5.25, -- Blightborne Infusion
			[15] = 3.37, -- Resounding Protection
			[523] = 0.07, -- Apothecary's Concoctions
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 2672 - 2961 (avg 2772), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[13] = { 0, 4.17 }, -- Nullification Dynamo
			[22] = { 0.14, 3.22 }, -- Vision of Perfection
			[27] = { 7.9, 8.93 }, -- Memory of Lucid Dreams
			[3] = { 6.97, 2.21 }, -- Sphere of Suppression
			[12] = { 2.77, 5.58 }, -- The Crucible of Flame
			[32] = { 2.83, 3.26 }, -- Conflict and Strife
			[7] = { 5.89, 8.01 }, -- Anima of Life and Death
			[25] = { 6.94, 1.01 }, -- Aegis of the Deep
			[4] = { 10, 0.12 }, -- Worldvein Resonance
			[15] = { 9.87, 2.52 }, -- Ripple in Space
		}, 1571389200)

		insertDefaultScalesData(defensiveName, 2, 2, { -- Protection Paladin (TMI)
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 5115 - 5564 (avg 5364), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[501] = 1.73, -- Relational Normalization Gizmo
			[30] = 1.77, -- Overwhelming Power
			[560] = 5.35, -- Bonded Souls
			[157] = 0.28, -- Rezan's Fury
			[192] = 3.84, -- Meticulous Scheming
			[523] = 1.66, -- Apothecary's Concoctions
			[485] = 3.09, -- Laser Matrix
			[538] = 3.8, -- Empyreal Ward
			[13] = 6.24, -- Azerite Empowered
			[462] = 2.22, -- Azerite Globules
			[493] = 0.53, -- Last Gift
			[494] = 5.42, -- Battlefield Precision
			[499] = 1.27, -- Ricocheting Inflatable Pyrosaw
			[82] = 0.47, -- Champion of Azeroth
			[43] = 5.56, -- Winds of War
			[526] = 4.55, -- Endless Hunger
			[461] = 1.85, -- Earthlink
			[522] = 4.07, -- Ancients' Bulwark
			[497] = 3.28, -- Stand As One
			[521] = 3.06, -- Shadow of Elune
			[500] = 1.05, -- Synaptic Spark Capacitor
			[505] = 0.77, -- Tradewinds
			[133] = 0.5, -- Bulwark of Light
			[125] = 2.4, -- Avenger's Might
			[150] = 0.63, -- Soaring Shield
			[98] = 4.97, -- Crystalline Carapace
			[103] = 0.44, -- Concentrated Mending
			[194] = 1.67, -- Filthy Transfusion
			[482] = 2.4, -- Thunderous Blast
			[89] = 3.72, -- Azerite Veins
			[454] = 0.59, -- Judicious Defense
			[21] = 2.82, -- Elemental Whirl
			[480] = 5.45, -- Blood Rite
			[483] = 0.15, -- Archive of the Titans
			[99] = 6.06, -- Ablative Shielding
			[18] = 5.75, -- Blood Siphon
			[234] = 3.26, -- Inner Light
			[19] = 3.35, -- Woundbinder
			[393] = 0.29, -- Grace of the Justicar
			[502] = 1.73, -- Personal Absorb-o-Tron
			[101] = 5.76, -- Shimmering Haven
			[105] = 2.9, -- Ephemeral Recovery
			[86] = 1.38, -- Azerite Fortification
			[463] = 0.36, -- Blessed Portents
			[193] = 5.48, -- Blightborne Infusion
			[498] = 6.6, -- Barrage Of Many Bombs
			[459] = 1.13, -- Unstable Flames
			[503] = 2.02, -- Auto-Self-Cauterizer
			[22] = 10, -- Heed My Call
			[85] = 1.96, -- Gemhide
			[100] = 2.98, -- Strength in Numbers
			[38] = 0.29, -- On My Way
			[496] = 1.21, -- Stronger Together
			[31] = 2.33, -- Gutripper
			[569] = 3.99, -- Clockwork Heart
			[575] = 2.63, -- Undulating Tides
			[541] = 1.72, -- Fight or Flight
			[87] = 4.42, -- Self Reliance
			[104] = 0.76, -- Bracing Chill
			[83] = 0.32, -- Impassive Visage
			[84] = 2.99, -- Bulwark of the Masses
			[568] = 3.23, -- Person-Computer Interface
			[492] = 3.26, -- Liberator's Might
			[561] = 1.2, -- Seductive Power
			[576] = 2.46, -- Loyal to the End
			[395] = 1.13, -- Inspiring Vanguard
			[471] = 1.69, -- Gallant Steed
			[195] = 3.26, -- Secrets of the Deep
			[577] = 0.74, -- Arcane Heart
			[156] = 1.13, -- Ruinous Bolt
			[20] = 0.94, -- Lifespeed
			[479] = 5.02, -- Dagger in the Back
			[189] = 1.43, -- Righteous Conviction
			[14] = 2.81, -- Longstrider
			[196] = 4.14, -- Swirling Sands
			[44] = 4.88, -- Vampiric Speed
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 5143 - 5560 (avg 5385), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[32] = { 1.12, 7.35 }, -- Conflict and Strife
			[13] = { 4.58, 8.29 }, -- Nullification Dynamo
			[2] = { 6.24, 10 }, -- Azeroth's Undying Gift
			[12] = { 0, 1.67 }, -- The Crucible of Flame
			[22] = { 7.82, 0 }, -- Vision of Perfection
			[4] = { 0.56, 6.62 }, -- Worldvein Resonance
			[15] = { 0, 4.44 }, -- Ripple in Space
			[27] = { 5.58, 1.82 }, -- Memory of Lucid Dreams
			[3] = { 2.18, 0 }, -- Sphere of Suppression
			[7] = { 6.93, 4.43 }, -- Anima of Life and Death
			[25] = { 8.63, 7.79 }, -- Aegis of the Deep
		}, 1571389200)

		insertDefaultScalesData(defensiveName, 1, 3, { -- Protection Warrior (TMI)
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4317 - 4710 (avg 4498), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[192] = 4.76, -- Meticulous Scheming
			[450] = 3.76, -- Brace for Impact
			[19] = 4.24, -- Woundbinder
			[100] = 9.39, -- Strength in Numbers
			[194] = 5.25, -- Filthy Transfusion
			[463] = 5.95, -- Blessed Portents
			[101] = 6.25, -- Shimmering Haven
			[21] = 1.59, -- Elemental Whirl
			[237] = 1.78, -- Bastion of Might
			[38] = 3.82, -- On My Way
			[500] = 2.45, -- Synaptic Spark Capacitor
			[31] = 7.88, -- Gutripper
			[195] = 2.72, -- Secrets of the Deep
			[501] = 0.05, -- Relational Normalization Gizmo
			[462] = 5.99, -- Azerite Globules
			[493] = 0.72, -- Last Gift
			[477] = 5.63, -- Bury the Hatchet
			[498] = 1.1, -- Barrage Of Many Bombs
			[504] = 10, -- Unstable Catalyst
			[86] = 5.76, -- Azerite Fortification
			[476] = 8.87, -- Moment of Glory
			[30] = 0.99, -- Overwhelming Power
			[562] = 6.39, -- Treacherous Covenant
			[85] = 2.49, -- Gemhide
			[502] = 1.79, -- Personal Absorb-o-Tron
			[196] = 0.33, -- Swirling Sands
			[560] = 4.6, -- Bonded Souls
			[18] = 1.77, -- Blood Siphon
			[87] = 5.88, -- Self Reliance
			[15] = 0.31, -- Resounding Protection
			[481] = 6.1, -- Incite the Pack
			[177] = 3.95, -- Bloodsport
			[193] = 1.43, -- Blightborne Infusion
			[14] = 8.54, -- Longstrider
			[104] = 2.58, -- Bracing Chill
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31478)
			-- Iterations: 4338 - 4664 (avg 4482), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 18.10.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[25] = { 1.68, 0.03 }, -- Aegis of the Deep
			[15] = { 0, 5.46 }, -- Ripple in Space
			[27] = { 0, 3.84 }, -- Memory of Lucid Dreams
			[2] = { 0, 0.71 }, -- Azeroth's Undying Gift
			[7] = { 1.87, 0 }, -- Anima of Life and Death
			[13] = { 1.53, 1.32 }, -- Nullification Dynamo
			[4] = { 0, 4.76 }, -- Worldvein Resonance
			[22] = { 0, 0.34 }, -- Vision of Perfection
			[3] = { 10, 0 }, -- Sphere of Suppression
			[12] = { 5.05, 0 }, -- The Crucible of Flame
		}, 1571389200)

		insertDefaultScalesData(defaultName, 5, 3, { -- Shadow Priest
			-- Shadow Priest by WarcraftPriests (https://warcraftpriests.com/)
			-- https://github.com/WarcraftPriests/bfa-shadow-priest/blob/master/azerite-traits/AzeritePowerWeights_AS.md
			-- First Imported: 03.09.2018, Updated: 18.10.2019
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
		}, 1571389200)

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
		}, 1571389200)


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