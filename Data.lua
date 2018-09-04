--[[----------------------------------------------------------------------------
	AzeritePowerWeights

	Helps you pick the best Azerite powers on your gear for your class and spec.

	(c) 2018 -
	Sanex @ EU-Arathor / ahak @ Curseforge
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
					["spellID"] = 275860,
					["icon"] = 134952,
					["name"] = "Reinforced Plating",
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
					["spellID"] = 272866,
					["icon"] = 132355,
					["name"] = "Executioner's Precision",
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
					["spellID"] = 272836,
					["icon"] = 136088,
					["name"] = "Trample the Weak",
					["azeritePowerID"] = 119,
				}, -- [1]
				{
					["spellID"] = 273409,
					["icon"] = 236303,
					["name"] = "Gathering Storm",
					["azeritePowerID"] = 174,
				}, -- [2]
				{
					["spellID"] = 273420,
					["icon"] = 136012,
					["name"] = "Bloodcraze",
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
					["spellID"] = 278615,
					["icon"] = 135986,
					["name"] = "Zealotry",
					["azeritePowerID"] = 396,
				}, -- [6]
				{
					["spellID"] = 277678,
					["icon"] = 236250,
					["name"] = "Divine Right",
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
					["spellID"] = 273027,
					["icon"] = 1360762,
					["name"] = "Martyr's Breath",
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
					["spellID"] = 278615,
					["icon"] = 135986,
					["name"] = "Zealotry",
					["azeritePowerID"] = 396,
				}, -- [9]
				{
					["spellID"] = 277674,
					["icon"] = 135972,
					["name"] = "Radiant Incandescence",
					["azeritePowerID"] = 452,
				}, -- [10]
				{
					["spellID"] = 277675,
					["icon"] = 1603010,
					["name"] = "Judicious Defense",
					["azeritePowerID"] = 454,
				}, -- [11]
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
					["spellID"] = 273553,
					["icon"] = 135919,
					["name"] = "Dauntless Divinity",
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
					["spellID"] = 277653,
					["icon"] = 2065565,
					["name"] = "Blur of Talons",
					["azeritePowerID"] = 371,
				}, -- [5]
				{
					["spellID"] = 278532,
					["icon"] = 132214,
					["name"] = "Wilderness Survival",
					["azeritePowerID"] = 372,
				}, -- [6]
				{
					["spellID"] = 278533,
					["icon"] = 135134,
					["name"] = "Up Close And Personal",
					["azeritePowerID"] = 373,
				}, -- [7]
			},
			[254] = {
				{
					["spellID"] = 264198,
					["icon"] = 461115,
					["name"] = "In The Rhythm",
					["azeritePowerID"] = 36,
				}, -- [1]
				{
					["spellID"] = 273265,
					["icon"] = 132218,
					["name"] = "Arcane Flurry",
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
					["spellID"] = 278528,
					["icon"] = 132203,
					["name"] = "Pack Alpha",
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
					["spellID"] = 273452,
					["icon"] = 1373911,
					["name"] = "Storm of Steel",
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
					["spellID"] = 272911,
					["icon"] = 135431,
					["name"] = "Sharpened Blades",
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
					["icon"] = 136181,
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
					["spellID"] = 272911,
					["icon"] = 135431,
					["name"] = "Sharpened Blades",
					["azeritePowerID"] = 124,
				}, -- [1]
				{
					["spellID"] = 273007,
					["icon"] = 132304,
					["name"] = "Double Dose",
					["azeritePowerID"] = 136,
				}, -- [2]
				{
					["spellID"] = 273488,
					["icon"] = 132287,
					["name"] = "Twist the Knife",
					["azeritePowerID"] = 181,
				}, -- [3]
				{
					["spellID"] = 276072,
					["icon"] = 463899,
					["name"] = "Poisoned Wire",
					["azeritePowerID"] = 249,
				}, -- [4]
				{
					["spellID"] = 277679,
					["icon"] = 132302,
					["name"] = "Scent of Blood",
					["azeritePowerID"] = 406,
				}, -- [5]
				{
					["spellID"] = 278664,
					["icon"] = 236273,
					["name"] = "Fan of Blades",
					["azeritePowerID"] = 407,
				}, -- [6]
				{
					["spellID"] = 278666,
					["icon"] = 132297,
					["name"] = "Shrouded Suffocation",
					["azeritePowerID"] = 408,
				}, -- [7]
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
					["spellID"] = 278655,
					["icon"] = 135972,
					["name"] = "Sacred Flame",
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
					["spellID"] = 273319,
					["icon"] = 136224,
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
					["spellID"] = 277680,
					["icon"] = 135924,
					["name"] = "Gift of Forgiveness",
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
					["spellID"] = 272738,
					["icon"] = 237519,
					["name"] = "Festering Doom",
					["azeritePowerID"] = 109,
				}, -- [1]
				{
					["spellID"] = 273088,
					["icon"] = 136144,
					["name"] = "Bone Spike Graveyard",
					["azeritePowerID"] = 140,
				}, -- [2]
				{
					["spellID"] = 273095,
					["icon"] = 342913,
					["name"] = "Horrid Experimentation",
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
					["spellID"] = 274070,
					["icon"] = 236227,
					["name"] = "Glacial Contagion",
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
					["spellID"] = 275924,
					["icon"] = 136168,
					["name"] = "Embrace of the Darkfallen",
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
					["spellID"] = 278709,
					["icon"] = 136024,
					["name"] = "Rumbling Tremors",
					["azeritePowerID"] = 417,
				}, -- [6]
				{
					["spellID"] = 278719,
					["icon"] = 132314,
					["name"] = "Roiling Storm",
					["azeritePowerID"] = 420,
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
					["spellID"] = 273597,
					["icon"] = 538569,
					["name"] = "Ebb and Flow",
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
					["spellID"] = 278709,
					["icon"] = 136024,
					["name"] = "Rumbling Tremors",
					["azeritePowerID"] = 417,
				}, -- [9]
				{
					["spellID"] = 278713,
					["icon"] = 252995,
					["name"] = "Surging Tides",
					["azeritePowerID"] = 422,
				}, -- [10]
				{
					["spellID"] = 278715,
					["icon"] = 237586,
					["name"] = "Spouting Spirits",
					["azeritePowerID"] = 423,
				}, -- [11]
				{
					["spellID"] = 277666,
					["icon"] = 451167,
					["name"] = "Ancestral Resonance",
					["azeritePowerID"] = 447,
				}, -- [12]
				{
					["spellID"] = 277671,
					["icon"] = 136048,
					["name"] = "Synapse Shock",
					["azeritePowerID"] = 448,
				}, -- [13]
				{
					["spellID"] = 277658,
					["icon"] = 136037,
					["name"] = "Overflowing Shores",
					["azeritePowerID"] = 449,
				}, -- [14]
				{
					["spellID"] = 279829,
					["icon"] = 451169,
					["name"] = "Igneous Potential",
					["azeritePowerID"] = 457,
				}, -- [15]
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
					["spellID"] = 278709,
					["icon"] = 136024,
					["name"] = "Rumbling Tremors",
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
					["spellID"] = 273346,
					["icon"] = 1506795,
					["name"] = "Winter's Reach",
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
					["spellID"] = 273331,
					["icon"] = 135827,
					["name"] = "Preheat",
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
					["spellID"] = 279867,
					["icon"] = 1041233,
					["name"] = "Anomalous Impact",
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
					["spellID"] = 278738,
					["icon"] = 134544,
					["name"] = "Forbidden Knowledge",
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
					["spellID"] = 272955,
					["icon"] = 136186,
					["name"] = "Accelerant",
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
					["icon"] = 136118,
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
					["spellID"] = 275974,
					["icon"] = 136193,
					["name"] = "Deathbloom",
					["azeritePowerID"] = 442,
				}, -- [6]
			},
		}, -- [9]
		{
			[269] = {
				{
					["spellID"] = 272804,
					["icon"] = 135906,
					["name"] = "Iron Fists",
					["azeritePowerID"] = 117,
				}, -- [1]
				{
					["spellID"] = 273291,
					["icon"] = 642415,
					["name"] = "Sunrise Technique",
					["azeritePowerID"] = 184,
				}, -- [2]
				{
					["spellID"] = 277669,
					["icon"] = 574575,
					["name"] = "Swift Roundhouse",
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
					["spellID"] = 278580,
					["icon"] = 606552,
					["name"] = "Meridian Strikes",
					["azeritePowerID"] = 391,
				}, -- [6]
			},
			[270] = {
				{
					["spellID"] = 269621,
					["icon"] = 1360980,
					["name"] = "Invigorating Brew",
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
					["spellID"] = 277669,
					["icon"] = 574575,
					["name"] = "Swift Roundhouse",
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
					["spellID"] = 277665,
					["icon"] = 627486,
					["name"] = "Niuzao's Blessing",
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
					["name"] = "Raking Ferocity",
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
					["name"] = "Shredding Fury",
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
					["spellID"] = 276155,
					["icon"] = 136097,
					["name"] = "Craggy Bark",
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
					["spellID"] = 274397,
					["icon"] = 535045,
					["name"] = "Sunblaze",
					["azeritePowerID"] = 200,
				}, -- [4]
				{
					["spellID"] = 276152,
					["icon"] = 135753,
					["name"] = "Dawning Sun",
					["azeritePowerID"] = 250,
				}, -- [5]
				{
					["spellID"] = 276155,
					["icon"] = 136097,
					["name"] = "Craggy Bark",
					["azeritePowerID"] = 251,
				}, -- [6]
				{
					["spellID"] = 278505,
					["icon"] = 236216,
					["name"] = "High Noon",
					["azeritePowerID"] = 356,
				}, -- [7]
				{
					["spellID"] = 278507,
					["icon"] = 236168,
					["name"] = "Lunar Shrapnel",
					["azeritePowerID"] = 357,
				}, -- [8]
				{
					["spellID"] = 279642,
					["icon"] = 136048,
					["name"] = "Lively Spirit",
					["azeritePowerID"] = 364,
				}, -- [9]
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
					["spellID"] = 272802,
					["icon"] = 134222,
					["name"] = "Fungal Essence",
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
					["spellID"] = 276155,
					["icon"] = 136097,
					["name"] = "Craggy Bark",
					["azeritePowerID"] = 251,
				}, -- [6]
				{
					["spellID"] = 278505,
					["icon"] = 236216,
					["name"] = "High Noon",
					["azeritePowerID"] = 356,
				}, -- [7]
				{
					["spellID"] = 278515,
					["icon"] = 136085,
					["name"] = "Rampant Growth",
					["azeritePowerID"] = 362,
				}, -- [8]
				{
					["spellID"] = 278513,
					["icon"] = 134157,
					["name"] = "Waking Dream",
					["azeritePowerID"] = 363,
				}, -- [9]
				{
					["spellID"] = 279642,
					["icon"] = 136048,
					["name"] = "Lively Spirit",
					["azeritePowerID"] = 364,
				}, -- [10]
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
					["spellID"] = 275144,
					["icon"] = 1247261,
					["name"] = "Unbound Chaos",
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
					["spellID"] = 275968,
					["icon"] = 1344653,
					["name"] = "Gaping Maw",
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
	["defensiveData"] = {
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
	},
}
n.sourceData = sourceData

-- Default Scales Data
local defaultName = L.DefaultScaleName_Default
local defensiveName = L.DefaultScaleName_Defensive
local offensiveName = L.DefaultScaleName_Offensive
local defaultNameTable = {
	--[defaultName] = true,
	[defensiveName] = true,
	[offensiveName] = true

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
			[14] = 0.03, -- Longstrider
			[18] = 1.79, -- Blood Siphon
			[20] = 1.66, -- Lifespeed
			[21] = 1.96, -- Elemental Whirl
			[22] = 2.9, -- Heed My Call
			[30] = 2.6, -- Overwhelming Power
			[31] = 2.69, -- Gutripper
			[38] = 1.57, -- On My Way
			[82] = 6.38, -- Champion of Azeroth
			[87] = 0.05, -- Self Reliance
			[100] = 0.05, -- Strength in Numbers
			[101] = 0.07, -- Shimmering Haven
			[121] = 0.88, -- Executioner's Precision
			[156] = 3.76, -- Ruinous Bolt
			[157] = 6.66, -- Rezan's Fury
			[174] = 3.03, -- Gathering Storm
			[192] = 4.58, -- Meticulous Scheming
			[193] = 6.34, -- Blightborne Infusion
			[194] = 5.82, -- Filthy Transfusion
			[195] = 4.98, -- Secrets of the Deep
			[196] = 5.56, -- Swirling Sands
			[226] = 10, -- Test of Might
			[433] = 3.95, -- Seismic Wave
			[434] = 5.63, -- Crushing Assault
			[435] = 8.59, -- Lord of War
			[459] = 2.13, -- Unstable Flames
			[462] = 2, -- Azerite Globules
			[476] = 0.07, -- Moment of Glory
			[478] = 6.25, -- Tidal Surge
			[479] = 7.41, -- Dagger in the Back
			[480] = 3.72, -- Blood Rite
			[481] = 4.34, -- Incite the Pack
			[482] = 9.38, -- Thunderous Blast
			[483] = 4.83, -- Archive of the Titans
			[485] = 8.46, -- Laser Matrix
			[504] = 5.33, -- Unstable Catalyst
			[505] = 4.7, -- Tradewinds
		})

		-- Fury
		insertDefaultScalesData(defaultName, 1, 2, {
			[15] = 0.16, -- Resounding Protection
			[18] = 1.59, -- Blood Siphon
			[20] = 2.5, -- Lifespeed
			[21] = 2.14, -- Elemental Whirl
			[22] = 2.98, -- Heed My Call
			[30] = 3.94, -- Overwhelming Power
			[31] = 2.83, -- Gutripper
			[38] = 1.79, -- On My Way
			[44] = 0.07, -- Vampiric Speed
			[82] = 7.14, -- Champion of Azeroth
			[83] = 0.07, -- Impassive Visage
			[98] = 0.05, -- Crystalline Carapace
			[99] = 0.03, -- Ablative Shielding
			[119] = 4.27, -- Trample the Weak
			[156] = 3.59, -- Ruinous Bolt
			[157] = 6.83, -- Rezan's Fury
			[176] = 3.92, -- Bloodcraze
			[192] = 6.2, -- Meticulous Scheming
			[193] = 6.11, -- Blightborne Infusion
			[194] = 6.59, -- Filthy Transfusion
			[195] = 3.98, -- Secrets of the Deep
			[196] = 5.27, -- Swirling Sands
			[229] = 4.81, -- Pulverizing Blows
			[437] = 7.11, -- Simmering Rage
			[438] = 9.35, -- Reckless Flurry
			[459] = 1.96, -- Unstable Flames
			[462] = 2.14, -- Azerite Globules
			[477] = 0.07, -- Bury the Hatchet
			[478] = 5.77, -- Tidal Surge
			[479] = 6.7, -- Dagger in the Back
			[480] = 4.81, -- Blood Rite
			[481] = 4.05, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 3.98, -- Archive of the Titans
			[485] = 8.83, -- Laser Matrix
			[504] = 4.61, -- Unstable Catalyst
			[505] = 4.4, -- Tradewinds
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
			[18] = 1.05, -- Blood Siphon
			[20] = 1.05, -- Lifespeed
			[21] = 1.1, -- Elemental Whirl
			[22] = 3.14, -- Heed My Call
			[30] = 1.56, -- Overwhelming Power
			[31] = 2.97, -- Gutripper
			[38] = 1.02, -- On My Way
			[82] = 3.74, -- Champion of Azeroth
			[84] = 0.03, -- Bulwark of the Masses
			[99] = 0.05, -- Ablative Shielding
			[100] = 0.03, -- Strength in Numbers
			[101] = 0.08, -- Shimmering Haven
			[103] = 0.03, -- Concentrated Mending
			[105] = 0.03, -- Ephemeral Recovery
			[125] = 2.84, -- Avenger's Might
			[133] = 0.08, -- Bulwark of Light
			[150] = 1.56, -- Soaring Shield
			[156] = 4.25, -- Ruinous Bolt
			[157] = 7.19, -- Rezan's Fury
			[189] = 0.03, -- Dauntless Divinity
			[192] = 2.55, -- Meticulous Scheming
			[193] = 3.62, -- Blightborne Infusion
			[194] = 6.34, -- Filthy Transfusion
			[195] = 3.28, -- Secrets of the Deep
			[196] = 3.16, -- Swirling Sands
			[234] = 1.36, -- Inner Light
			[235] = 5.56, -- Indomitable Justice
			[393] = 0.03, -- Grace of the Justicar
			[395] = 6.34, -- Inspiring Vanguard
			[454] = 0.05, -- Judicious Defense
			[459] = 1.12, -- Unstable Flames
			[462] = 2.12, -- Azerite Globules
			[463] = 0.03, -- Blessed Portents
			[471] = 0.03, -- Gallant Steed
			[478] = 7.09, -- Tidal Surge
			[479] = 5.73, -- Dagger in the Back
			[480] = 2, -- Blood Rite
			[481] = 2.38, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 3.16, -- Archive of the Titans
			[485] = 9.06, -- Laser Matrix
			[504] = 3.84, -- Unstable Catalyst
			[505] = 2.63, -- Tradewinds
		})
		insertDefaultScalesData(defensiveName, 2, 2, {
			[15] = 10, -- Resounding Protection
			[18] = 0.86, -- Blood Siphon
			[21] = 0.01, -- Elemental Whirl
			[38] = 0.01, -- On My Way
			[82] = 0.02, -- Champion of Azeroth
			[125] = 0.02, -- Avenger's Might
			[150] = 0.02, -- Soaring Shield
			[193] = 0.01, -- Blightborne Infusion
			[196] = 0.01, -- Swirling Sands
			[234] = 0.01, -- Inner Light
			[481] = 0.03, -- Incite the Pack
			[505] = 0.03, -- Tradewinds
		})

		-- Retribution
		insertDefaultScalesData(defaultName, 2, 3, {
			[13] = 0.03, -- Azerite Empowered
			[18] = 1.74, -- Blood Siphon
			[20] = 2.3, -- Lifespeed
			[21] = 2.02, -- Elemental Whirl
			[22] = 3.05, -- Heed My Call
			[30] = 3.28, -- Overwhelming Power
			[31] = 2.82, -- Gutripper
			[38] = 1.9, -- On My Way
			[42] = 0.03, -- Savior
			[82] = 6.96, -- Champion of Azeroth
			[84] = 0.03, -- Bulwark of the Masses
			[85] = 0.05, -- Gemhide
			[100] = 0.03, -- Strength in Numbers
			[103] = 0.03, -- Concentrated Mending
			[125] = 4.81, -- Avenger's Might
			[154] = 6.33, -- Relentless Inquisitor
			[156] = 3.92, -- Ruinous Bolt
			[157] = 6.98, -- Rezan's Fury
			[187] = 4.27, -- Expurgation
			[192] = 5.39, -- Meticulous Scheming
			[193] = 6.21, -- Blightborne Infusion
			[194] = 6.35, -- Filthy Transfusion
			[195] = 4.92, -- Secrets of the Deep
			[196] = 5.09, -- Swirling Sands
			[235] = 4.15, -- Indomitable Justice
			[396] = 3.8, -- Zealotry
			[459] = 2.14, -- Unstable Flames
			[462] = 2.04, -- Azerite Globules
			[478] = 6.8, -- Tidal Surge
			[479] = 8.15, -- Dagger in the Back
			[480] = 4.15, -- Blood Rite
			[481] = 4.48, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 4.92, -- Archive of the Titans
			[485] = 8.83, -- Laser Matrix
			[504] = 5.32, -- Unstable Catalyst
			[505] = 4.64, -- Tradewinds
		})

	-- Hunter
		-- Beast Mastery
		insertDefaultScalesData(defaultName, 3, 1, {
			[18] = 1.98, -- Blood Siphon
			[20] = 2.03, -- Lifespeed
			[21] = 2.29, -- Elemental Whirl
			[22] = 3.08, -- Heed My Call
			[30] = 2.83, -- Overwhelming Power
			[31] = 2.9, -- Gutripper
			[38] = 1.95, -- On My Way
			[44] = 0.06, -- Vampiric Speed
			[82] = 7.26, -- Champion of Azeroth
			[84] = 0.03, -- Bulwark of the Masses
			[107] = 5, -- Serrated Jaws
			[156] = 4.44, -- Ruinous Bolt
			[157] = 7.42, -- Rezan's Fury
			[161] = 6.83, -- Haze of Rage
			[193] = 7.16, -- Blightborne Infusion
			[194] = 6.57, -- Filthy Transfusion
			[195] = 6.21, -- Secrets of the Deep
			[196] = 5.67, -- Swirling Sands
			[211] = 3.29, -- Dance of Death
			[366] = 8.67, -- Primal Instincts
			[367] = 4.49, -- Feeding Frenzy
			[459] = 2.42, -- Unstable Flames
			[462] = 2.13, -- Azerite Globules
			[469] = 0.03, -- Duck and Cover
			[478] = 7.42, -- Tidal Surge
			[479] = 8.21, -- Dagger in the Back
			[480] = 4.13, -- Blood Rite
			[481] = 5.03, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 6.03, -- Archive of the Titans
			[485] = 9.11, -- Laser Matrix
			[504] = 6.95, -- Unstable Catalyst
			[505] = 5.49, -- Tradewinds
		})

		-- Marksmanship
		insertDefaultScalesData(defaultName, 3, 2, {
			[13] = 0.1, -- Azerite Empowered
			[14] = 0.21, -- Longstrider
			[15] = 0.14, -- Resounding Protection
			[18] = 1.89, -- Blood Siphon
			[20] = 1.66, -- Lifespeed
			[21] = 1.92, -- Elemental Whirl
			[22] = 3.15, -- Heed My Call
			[30] = 2.94, -- Overwhelming Power
			[31] = 2.87, -- Gutripper
			[36] = 2.03, -- In The Rhythm
			[38] = 1.92, -- On My Way
			[44] = 0.14, -- Vampiric Speed
			[82] = 5.88, -- Champion of Azeroth
			[85] = 0.03, -- Gemhide
			[86] = 0.05, -- Azerite Fortification
			[87] = 0.1, -- Self Reliance
			[156] = 4.32, -- Ruinous Bolt
			[157] = 7.21, -- Rezan's Fury
			[162] = 1.64, -- Arcane Flurry
			[192] = 4.78, -- Meticulous Scheming
			[193] = 4.69, -- Blightborne Infusion
			[194] = 6.3, -- Filthy Transfusion
			[195] = 5.44, -- Secrets of the Deep
			[196] = 4.25, -- Swirling Sands
			[203] = 0.03, -- Shellshock
			[212] = 2.94, -- Unerring Vision
			[368] = 8.68, -- Steady Aim
			[369] = 0.19, -- Rapid Reload
			[370] = 2.8, -- Focused Fire
			[459] = 1.45, -- Unstable Flames
			[462] = 2.08, -- Azerite Globules
			[469] = 0.1, -- Duck and Cover
			[478] = 7.09, -- Tidal Surge
			[479] = 8.23, -- Dagger in the Back
			[480] = 4.04, -- Blood Rite
			[481] = 4.18, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 5.04, -- Archive of the Titans
			[485] = 9.12, -- Laser Matrix
			[504] = 5.9, -- Unstable Catalyst
			[505] = 4.55, -- Tradewinds
		})

		-- Survival
		insertDefaultScalesData(defaultName, 3, 3, {
			[18] = 1.31, -- Blood Siphon
			[20] = 1.83, -- Lifespeed
			[21] = 1.65, -- Elemental Whirl
			[22] = 2.64, -- Heed My Call
			[30] = 2.68, -- Overwhelming Power
			[31] = 2.42, -- Gutripper
			[38] = 1.55, -- On My Way
			[82] = 5.55, -- Champion of Azeroth
			[107] = 3.85, -- Serrated Jaws
			[110] = 2.52, -- Wildfire Cluster
			[156] = 3.51, -- Ruinous Bolt
			[157] = 6.12, -- Rezan's Fury
			[163] = 7.79, -- Latent Poison
			[192] = 1.83, -- Meticulous Scheming
			[193] = 5.21, -- Blightborne Infusion
			[194] = 5.33, -- Filthy Transfusion
			[195] = 4.94, -- Secrets of the Deep
			[196] = 4.66, -- Swirling Sands
			[213] = 4, -- Venomous Fangs
			[371] = 6.8, -- Blur of Talons
			[372] = 10, -- Wilderness Survival
			[373] = 3.39, -- Up Close And Personal
			[459] = 1.71, -- Unstable Flames
			[462] = 1.79, -- Azerite Globules
			[478] = 5.97, -- Tidal Surge
			[479] = 6.98, -- Dagger in the Back
			[480] = 3.81, -- Blood Rite
			[481] = 3.13, -- Incite the Pack
			[482] = 8.58, -- Thunderous Blast
			[483] = 4.76, -- Archive of the Titans
			[485] = 7.71, -- Laser Matrix
			[504] = 5.55, -- Unstable Catalyst
			[505] = 3.37, -- Tradewinds
		})

	-- Rogue
		-- Assassination
		insertDefaultScalesData(defaultName, 4, 1, {
			[13] = 0.12, -- Azerite Empowered
			[14] = 0.14, -- Longstrider
			[15] = 0.16, -- Resounding Protection
			[18] = 2.03, -- Blood Siphon
			[20] = 1.92, -- Lifespeed
			[21] = 2.27, -- Elemental Whirl
			[22] = 3.22, -- Heed My Call
			[30] = 3.04, -- Overwhelming Power
			[31] = 2.93, -- Gutripper
			[38] = 1.78, -- On My Way
			[44] = 0.12, -- Vampiric Speed
			[82] = 6.84, -- Champion of Azeroth
			[83] = 0.12, -- Impassive Visage
			[84] = 0.09, -- Bulwark of the Masses
			[85] = 0.05, -- Gemhide
			[86] = 0.09, -- Azerite Fortification
			[87] = 0.03, -- Self Reliance
			[124] = 7.08, -- Sharpened Blades
			[136] = 8.12, -- Double Dose
			[156] = 4.21, -- Ruinous Bolt
			[157] = 7.22, -- Rezan's Fury
			[181] = 6.12, -- Twist the Knife
			[192] = 3.8, -- Meticulous Scheming
			[193] = 6.61, -- Blightborne Infusion
			[194] = 5.94, -- Filthy Transfusion
			[195] = 5.49, -- Secrets of the Deep
			[196] = 5.83, -- Swirling Sands
			[217] = 0.12, -- Footpad
			[249] = 3.08, -- Poisoned Wire
			[406] = 3.83, -- Scent of Blood
			[408] = 10, -- Shrouded Suffocation
			[459] = 2.16, -- Unstable Flames
			[462] = 2.12, -- Azerite Globules
			[473] = 0.03, -- Shrouded Mantle
			[478] = 6.93, -- Tidal Surge
			[479] = 8.23, -- Dagger in the Back
			[480] = 4.3, -- Blood Rite
			[481] = 4.95, -- Incite the Pack
			[482] = 9.78, -- Thunderous Blast
			[483] = 5.22, -- Archive of the Titans
			[485] = 9.11, -- Laser Matrix
			[504] = 6.12, -- Unstable Catalyst
			[505] = 5.38, -- Tradewinds
		})

		-- Outlaw
		insertDefaultScalesData(defaultName, 4, 2, {
			[18] = 1.13, -- Blood Siphon
			[20] = 1.11, -- Lifespeed
			[21] = 1.44, -- Elemental Whirl
			[22] = 2.97, -- Heed My Call
			[30] = 2.12, -- Overwhelming Power
			[31] = 2.72, -- Gutripper
			[38] = 1.25, -- On My Way
			[82] = 4.93, -- Champion of Azeroth
			[129] = 7.52, -- Deadshot
			[156] = 3.69, -- Ruinous Bolt
			[157] = 6.98, -- Rezan's Fury
			[180] = 5.94, -- Storm of Steel
			[192] = 3.03, -- Meticulous Scheming
			[193] = 5.35, -- Blightborne Infusion
			[194] = 6.26, -- Filthy Transfusion
			[195] = 4.75, -- Secrets of the Deep
			[196] = 4.87, -- Swirling Sands
			[239] = 4.77, -- Snake Eyes
			[410] = 3.78, -- Paradise Lost
			[411] = 0.47, -- Ace Up Your Sleeve
			[446] = 3.11, -- Brigand's Blitz
			[459] = 1.77, -- Unstable Flames
			[462] = 1.92, -- Azerite Globules
			[478] = 6.34, -- Tidal Surge
			[479] = 8.13, -- Dagger in the Back
			[480] = 2.52, -- Blood Rite
			[481] = 3.24, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 4.62, -- Archive of the Titans
			[485] = 9, -- Laser Matrix
			[504] = 5.2, -- Unstable Catalyst
			[505] = 3.59, -- Tradewinds
		})

		-- Subtley
		insertDefaultScalesData(defaultName, 4, 3, {
			[15] = 0.03, -- Resounding Protection
			[18] = 1.58, -- Blood Siphon
			[20] = 1.73, -- Lifespeed
			[21] = 1.83, -- Elemental Whirl
			[22] = 2.45, -- Heed My Call
			[30] = 2.39, -- Overwhelming Power
			[31] = 2.06, -- Gutripper
			[38] = 1.64, -- On My Way
			[82] = 6.02, -- Champion of Azeroth
			[83] = 0.05, -- Impassive Visage
			[84] = 0.03, -- Bulwark of the Masses
			[85] = 0.03, -- Gemhide
			[124] = 3.78, -- Sharpened Blades
			[156] = 3.8, -- Ruinous Bolt
			[157] = 5.81, -- Rezan's Fury
			[175] = 3.88, -- Night's Vengeance
			[192] = 3.01, -- Meticulous Scheming
			[193] = 5.4, -- Blightborne Infusion
			[194] = 4.57, -- Filthy Transfusion
			[195] = 5.11, -- Secrets of the Deep
			[196] = 4.9, -- Swirling Sands
			[217] = 0.03, -- Footpad
			[240] = 10, -- Blade In The Shadows
			[413] = 3.84, -- The First Dance
			[414] = 8.26, -- Inevitability
			[445] = 2.99, -- Perforate
			[459] = 1.66, -- Unstable Flames
			[462] = 1.54, -- Azerite Globules
			[473] = 0.05, -- Shrouded Mantle
			[478] = 6.46, -- Tidal Surge
			[479] = 6.5, -- Dagger in the Back
			[480] = 3.76, -- Blood Rite
			[481] = 3.76, -- Incite the Pack
			[482] = 7.6, -- Thunderous Blast
			[483] = 4.88, -- Archive of the Titans
			[485] = 7.06, -- Laser Matrix
			[504] = 5.59, -- Unstable Catalyst
			[505] = 4.01, -- Tradewinds
		})

	-- Priest
		-- Discipline
		insertDefaultScalesData(defaultName, 5, 1, {

		})

		-- Holy
		insertDefaultScalesData(defaultName, 5, 2, {

		})

		-- Shadow
		insertDefaultScalesData(defaultName, 5, 3, {
			-- https://github.com/WarcraftPriests/bfa-shadow-priest/blob/master/azerite-traits/AzeritePowerWeights_DA.md
			[13] = 0.82,
			[18] = 0.86,
			[21] = 1.08,
			[22] = 1.49,
			[30] = 1.97,
			[31] = 1.37,
			[38] = 0.93,
			[82] = 3.53,
			[115] = -0.02,
			[156] = 2.01,
			[157] = 3.37,
			[166] = 1.18,
			[192] = 2.82,
			[193] = 3.76,
			[194] = 2.95,
			[195] = 2.57,
			[196] = 3.34,
			[236] = 3.12,
			[403] = 1.79,
			[404] = 2.46,
			[405] = 1.71,
			[459] = 1.33,
			[461] = 1.06,
			[462] = 1,
			[478] = 3.38,
			[479] = 3.89,
			[480] = 2.28,
			[481] = 2.18,
			[482] = 4.74,
			[483] = 2.34,
			[485] = 4.29,
			[486] = 2.1,
			[487] = 1.25,
			[488] = 3.43,
			[489] = 2.44,
			[490] = 0.6,
			[491] = 0.86,
			[498] = 2.15,
			[499] = 1.3,
			[500] = 2.5,
			[501] = 3.01,
			[504] = 2.85,
			[505] = 2.38,
		})

	-- Death Knight
		-- Blood
		insertDefaultScalesData(offensiveName, 6, 1, {
			[18] = 1.07, -- Blood Siphon
			[20] = 0.81, -- Lifespeed
			[21] = 1.07, -- Elemental Whirl
			[22] = 3.04, -- Heed My Call
			[30] = 1.42, -- Overwhelming Power
			[31] = 2.78, -- Gutripper
			[38] = 0.9, -- On My Way
			[82] = 3.52, -- Champion of Azeroth
			[85] = 0.03, -- Gemhide
			[86] = 0.03, -- Azerite Fortification
			[106] = 1.8, -- Deep Cuts
			[140] = 0.38, -- Bone Spike Graveyard
			[156] = 3.78, -- Ruinous Bolt
			[157] = 6.88, -- Rezan's Fury
			[192] = 2.43, -- Meticulous Scheming
			[193] = 3.78, -- Blightborne Infusion
			[194] = 6.6, -- Filthy Transfusion
			[195] = 3, -- Secrets of the Deep
			[196] = 3.24, -- Swirling Sands
			[348] = 3.59, -- Eternal Rune Weapon
			[349] = 0.38, -- Bones of the Damned
			[459] = 1.21, -- Unstable Flames
			[462] = 1.99, -- Azerite Globules
			[478] = 6.27, -- Tidal Surge
			[479] = 5.51, -- Dagger in the Back
			[480] = 1.88, -- Blood Rite
			[481] = 2.41, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 2.93, -- Archive of the Titans
			[485] = 8.76, -- Laser Matrix
			[504] = 3.32, -- Unstable Catalyst
			[505] = 2.63, -- Tradewinds
		})
		insertDefaultScalesData(defensiveName, 6, 1, {
			[13] = 0.03, -- Azerite Empowered
			[15] = 10, -- Resounding Protection
			[18] = 0.89, -- Blood Siphon
			[20] = 0.49, -- Lifespeed
			[21] = 0.14, -- Elemental Whirl
			[30] = 0.86, -- Overwhelming Power
			[82] = 0.54, -- Champion of Azeroth
			[86] = 0.01, -- Azerite Fortification
			[100] = 0.01, -- Strength in Numbers
			[140] = 1.22, -- Bone Spike Graveyard
			[157] = 0.02, -- Rezan's Fury
			[192] = 1.4, -- Meticulous Scheming
			[193] = 0.03, -- Blightborne Infusion
			[196] = 0.08, -- Swirling Sands
			[197] = 2.71, -- Marrowblood
			[348] = 0.25, -- Eternal Rune Weapon
			[349] = 0.3, -- Bones of the Damned
			[459] = 0.03, -- Unstable Flames
			[480] = 1.08, -- Blood Rite
			[481] = 0.03, -- Incite the Pack
			[483] = 0.05, -- Archive of the Titans
		})

		-- Frost
		insertDefaultScalesData(defaultName, 6, 2, {
			[15] = 0.17, -- Resounding Protection
			[18] = 2.48, -- Blood Siphon
			[20] = 2.34, -- Lifespeed
			[21] = 2.65, -- Elemental Whirl
			[22] = 3.21, -- Heed My Call
			[30] = 3.12, -- Overwhelming Power
			[31] = 2.81, -- Gutripper
			[38] = 2.2, -- On My Way
			[43] = 0.15, -- Winds of War
			[44] = 0.03, -- Vampiric Speed
			[82] = 8.43, -- Champion of Azeroth
			[83] = 0.09, -- Impassive Visage
			[84] = 0.03, -- Bulwark of the Masses
			[85] = 0.12, -- Gemhide
			[86] = 0.03, -- Azerite Fortification
			[87] = 0.15, -- Self Reliance
			[99] = 0.09, -- Ablative Shielding
			[100] = 0.12, -- Strength in Numbers
			[101] = 0.06, -- Shimmering Haven
			[108] = 6.55, -- Icy Citadel
			[141] = 4.86, -- Latent Chill
			[156] = 4.89, -- Ruinous Bolt
			[157] = 7.45, -- Rezan's Fury
			[192] = 3.74, -- Meticulous Scheming
			[193] = 7.84, -- Blightborne Infusion
			[194] = 6.38, -- Filthy Transfusion
			[195] = 6.97, -- Secrets of the Deep
			[196] = 7.11, -- Swirling Sands
			[198] = 9.19, -- Glacial Contagion
			[201] = 0.06, -- Runic Barrier
			[242] = 5.03, -- Echoing Howl
			[346] = 4.13, -- Killer Frost
			[347] = 2.98, -- Frozen Tempest
			[459] = 2.59, -- Unstable Flames
			[462] = 2.36, -- Azerite Globules
			[465] = 0.03, -- March of the Damned
			[478] = 9.64, -- Tidal Surge
			[479] = 8.21, -- Dagger in the Back
			[480] = 4.67, -- Blood Rite
			[481] = 6.13, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 6.49, -- Archive of the Titans
			[485] = 9.39, -- Laser Matrix
			[504] = 7.87, -- Unstable Catalyst
			[505] = 6.33, -- Tradewinds
		})

		-- Unholy
		insertDefaultScalesData(defaultName, 6, 3, {
			[18] = 1.56, -- Blood Siphon
			[20] = 1.7, -- Lifespeed
			[21] = 2, -- Elemental Whirl
			[22] = 3.01, -- Heed My Call
			[30] = 2.91, -- Overwhelming Power
			[31] = 2.71, -- Gutripper
			[38] = 1.7, -- On My Way
			[82] = 5.99, -- Champion of Azeroth
			[83] = 0.05, -- Impassive Visage
			[86] = 0.05, -- Azerite Fortification
			[101] = 0.1, -- Shimmering Haven
			[109] = 2.1, -- Festering Doom
			[140] = 0.37, -- Bone Spike Graveyard
			[142] = 3.08, -- Horrid Experimentation
			[156] = 4.24, -- Ruinous Bolt
			[157] = 7.02, -- Rezan's Fury
			[192] = 4.44, -- Meticulous Scheming
			[193] = 6.29, -- Blightborne Infusion
			[194] = 6.61, -- Filthy Transfusion
			[195] = 4.78, -- Secrets of the Deep
			[196] = 5.5, -- Swirling Sands
			[199] = 7.81, -- Festermight
			[244] = 5.08, -- Harrowing Decay
			[350] = 3.6, -- Cankerous Wounds
			[351] = 3.11, -- Last Surprise
			[459] = 1.98, -- Unstable Flames
			[462] = 1.95, -- Azerite Globules
			[478] = 7.05, -- Tidal Surge
			[479] = 7.96, -- Dagger in the Back
			[480] = 3.87, -- Blood Rite
			[481] = 3.8, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 4.56, -- Archive of the Titans
			[485] = 8.87, -- Laser Matrix
			[504] = 5.57, -- Unstable Catalyst
			[505] = 4.09, -- Tradewinds
		})

	-- Shaman
		-- Elemental
		insertDefaultScalesData(defaultName, 7, 1, {
			[18] = 1.45, -- Blood Siphon
			[19] = 0.03, -- Woundbinder
			[20] = 1.72, -- Lifespeed
			[21] = 1.91, -- Elemental Whirl
			[22] = 3.16, -- Heed My Call
			[30] = 2.52, -- Overwhelming Power
			[31] = 2.87, -- Gutripper
			[38] = 1.89, -- On My Way
			[82] = 5.82, -- Champion of Azeroth
			[84] = 0.05, -- Bulwark of the Masses
			[86] = 0.03, -- Azerite Fortification
			[105] = 0.1, -- Ephemeral Recovery
			[135] = 0.03, -- Volcanic Lightning
			[156] = 4.16, -- Ruinous Bolt
			[157] = 6.97, -- Rezan's Fury
			[178] = 5.14, -- Lava Shock
			[192] = 3.7, -- Meticulous Scheming
			[193] = 6.7, -- Blightborne Infusion
			[194] = 6.56, -- Filthy Transfusion
			[195] = 5.36, -- Secrets of the Deep
			[196] = 5.9, -- Swirling Sands
			[222] = 6.92, -- Echo of the Elementals
			[416] = 3.77, -- Natural Harmony
			[417] = 4.36, -- Rumbling Tremors
			[447] = 5.07, -- Ancestral Resonance
			[448] = 4.65, -- Synapse Shock
			[457] = 10, -- Igneous Potential
			[459] = 2.35, -- Unstable Flames
			[462] = 2.11, -- Azerite Globules
			[474] = 0.1, -- Pack Spirit
			[478] = 6.7, -- Tidal Surge
			[479] = 8.24, -- Dagger in the Back
			[480] = 3.5, -- Blood Rite
			[481] = 3.5, -- Incite the Pack
			[482] = 9.93, -- Thunderous Blast
			[483] = 4.94, -- Archive of the Titans
			[485] = 8.83, -- Laser Matrix
			[504] = 6.09, -- Unstable Catalyst
			[505] = 3.67, -- Tradewinds
		})

		-- Enhancement
		insertDefaultScalesData(defaultName, 7, 2, {
			[13] = 0.12, -- Azerite Empowered
			[15] = 0.03, -- Resounding Protection
			[17] = 0.03, -- Astral Shift
			[18] = 1.7, -- Blood Siphon
			[20] = 1.84, -- Lifespeed
			[21] = 1.8, -- Elemental Whirl
			[22] = 3.03, -- Heed My Call
			[30] = 2.56, -- Overwhelming Power
			[31] = 2.89, -- Gutripper
			[38] = 1.89, -- On My Way
			[82] = 6.28, -- Champion of Azeroth
			[87] = 0.05, -- Self Reliance
			[137] = 4.89, -- Primal Primer
			[156] = 4.19, -- Ruinous Bolt
			[157] = 7.28, -- Rezan's Fury
			[179] = 4.59, -- Strength of Earth
			[192] = 4.45, -- Meticulous Scheming
			[193] = 6.03, -- Blightborne Infusion
			[194] = 6.24, -- Filthy Transfusion
			[195] = 5.21, -- Secrets of the Deep
			[196] = 5.28, -- Swirling Sands
			[223] = 2.87, -- Lightning Conduit
			[416] = 4.07, -- Natural Harmony
			[417] = 3, -- Rumbling Tremors
			[420] = 4.56, -- Roiling Storm
			[447] = 5.12, -- Ancestral Resonance
			[459] = 1.89, -- Unstable Flames
			[462] = 2.03, -- Azerite Globules
			[478] = 7.03, -- Tidal Surge
			[479] = 8.21, -- Dagger in the Back
			[480] = 3.68, -- Blood Rite
			[481] = 3.91, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 5.03, -- Archive of the Titans
			[485] = 8.96, -- Laser Matrix
			[504] = 6.1, -- Unstable Catalyst
			[505] = 4.4, -- Tradewinds
		})

		-- Restoration
		insertDefaultScalesData(defaultName, 7, 3, {

		})

	-- Mage
		-- Arcane
		insertDefaultScalesData(defaultName, 8, 1, {
			[15] = 0.03, -- Resounding Protection
			[18] = 2.14, -- Blood Siphon
			[20] = 0.57, -- Lifespeed
			[21] = 1.73, -- Elemental Whirl
			[22] = 2.87, -- Heed My Call
			[30] = 1.37, -- Overwhelming Power
			[31] = 2.67, -- Gutripper
			[38] = 1.66, -- On My Way
			[44] = 0.05, -- Vampiric Speed
			[82] = 5.3, -- Champion of Azeroth
			[83] = 0.05, -- Impassive Visage
			[84] = 0.03, -- Bulwark of the Masses
			[85] = 0.09, -- Gemhide
			[86] = 0.14, -- Azerite Fortification
			[88] = 2.7, -- Arcane Pummeling
			[127] = 1.78, -- Anomalous Impact
			[156] = 4.31, -- Ruinous Bolt
			[157] = 6.62, -- Rezan's Fury
			[167] = 3.5, -- Brain Storm
			[192] = 0.52, -- Meticulous Scheming
			[193] = 6.04, -- Blightborne Infusion
			[194] = 5.97, -- Filthy Transfusion
			[195] = 5.25, -- Secrets of the Deep
			[196] = 4.4, -- Swirling Sands
			[205] = 0.07, -- Eldritch Warding
			[214] = 3.57, -- Arcane Pressure
			[374] = 10, -- Galvanizing Spark
			[375] = 0.05, -- Explosive Echo
			[459] = 1.91, -- Unstable Flames
			[462] = 1.93, -- Azerite Globules
			[478] = 7.09, -- Tidal Surge
			[479] = 7.72, -- Dagger in the Back
			[480] = 2.43, -- Blood Rite
			[481] = 4.24, -- Incite the Pack
			[482] = 9.09, -- Thunderous Blast
			[483] = 4.94, -- Archive of the Titans
			[485] = 8.21, -- Laser Matrix
			[504] = 5.72, -- Unstable Catalyst
			[505] = 4.47, -- Tradewinds
		})

		-- Fire
		insertDefaultScalesData(defaultName, 8, 2, {
			[14] = 0.03, -- Longstrider
			[18] = 1.64, -- Blood Siphon
			[20] = 1.43, -- Lifespeed
			[21] = 1.6, -- Elemental Whirl
			[22] = 3.23, -- Heed My Call
			[30] = 2.05, -- Overwhelming Power
			[31] = 2.99, -- Gutripper
			[38] = 1.67, -- On My Way
			[82] = 5.04, -- Champion of Azeroth
			[83] = 0.03, -- Impassive Visage
			[85] = 0.05, -- Gemhide
			[86] = 0.08, -- Azerite Fortification
			[128] = 4.85, -- Flames of Alacrity
			[156] = 4.75, -- Ruinous Bolt
			[157] = 7.23, -- Rezan's Fury
			[168] = 3.35, -- Preheat
			[192] = 2.56, -- Meticulous Scheming
			[193] = 4.85, -- Blightborne Infusion
			[194] = 6.29, -- Filthy Transfusion
			[195] = 4.7, -- Secrets of the Deep
			[196] = 4.25, -- Swirling Sands
			[205] = 0.05, -- Eldritch Warding
			[215] = 6.41, -- Blaster Master
			[376] = 3.5, -- Trailing Embers
			[377] = 9.64, -- Duplicative Incineration
			[378] = 3.98, -- Firemind
			[459] = 1.5, -- Unstable Flames
			[462] = 2.15, -- Azerite Globules
			[478] = 8.05, -- Tidal Surge
			[479] = 8.22, -- Dagger in the Back
			[480] = 2.97, -- Blood Rite
			[481] = 3.76, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 4.37, -- Archive of the Titans
			[485] = 9.35, -- Laser Matrix
			[504] = 5.52, -- Unstable Catalyst
			[505] = 4.17, -- Tradewinds
		})

		-- Frost
		insertDefaultScalesData(defaultName, 8, 3, {
			[13] = 0.05, -- Azerite Empowered
			[14] = 0.08, -- Longstrider
			[15] = 0.03, -- Resounding Protection
			[18] = 1.62, -- Blood Siphon
			[20] = 1.96, -- Lifespeed
			[21] = 2.32, -- Elemental Whirl
			[22] = 3.24, -- Heed My Call
			[30] = 2.86, -- Overwhelming Power
			[31] = 2.76, -- Gutripper
			[38] = 1.79, -- On My Way
			[44] = 0.1, -- Vampiric Speed
			[82] = 6.48, -- Champion of Azeroth
			[83] = 0.15, -- Impassive Visage
			[84] = 0.17, -- Bulwark of the Masses
			[85] = 0.1, -- Gemhide
			[86] = 0.03, -- Azerite Fortification
			[87] = 0.13, -- Self Reliance
			[132] = 2.66, -- Packed Ice
			[156] = 4.76, -- Ruinous Bolt
			[157] = 7.11, -- Rezan's Fury
			[170] = 4.55, -- Winter's Reach
			[192] = 3.85, -- Meticulous Scheming
			[193] = 6.67, -- Blightborne Infusion
			[194] = 6.48, -- Filthy Transfusion
			[195] = 5.49, -- Secrets of the Deep
			[196] = 5.8, -- Swirling Sands
			[205] = 0.15, -- Eldritch Warding
			[225] = 2.71, -- Glacial Assault
			[379] = 6.33, -- Tunnel of Ice
			[380] = 6.12, -- Whiteout
			[381] = 3.07, -- Frigid Grasp
			[459] = 2.42, -- Unstable Flames
			[462] = 2.18, -- Azerite Globules
			[478] = 7.54, -- Tidal Surge
			[479] = 8.22, -- Dagger in the Back
			[480] = 4.11, -- Blood Rite
			[481] = 4.01, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 5.44, -- Archive of the Titans
			[485] = 9.14, -- Laser Matrix
			[504] = 6.48, -- Unstable Catalyst
			[505] = 4.59, -- Tradewinds
		})

	-- Warlock
		-- Affliction
		insertDefaultScalesData(defaultName, 9, 1, {
			[18] = 1.99, -- Blood Siphon
			[20] = 1.95, -- Lifespeed
			[21] = 2.14, -- Elemental Whirl
			[22] = 2.99, -- Heed My Call
			[30] = 3.03, -- Overwhelming Power
			[31] = 2.82, -- Gutripper
			[38] = 1.88, -- On My Way
			[82] = 6.57, -- Champion of Azeroth
			[83] = 0.03, -- Impassive Visage
			[123] = 7.04, -- Wracking Brilliance
			[156] = 3.99, -- Ruinous Bolt
			[157] = 6.81, -- Rezan's Fury
			[183] = 5.02, -- Inevitable Demise
			[192] = 4.44, -- Meticulous Scheming
			[193] = 6.04, -- Blightborne Infusion
			[194] = 6.64, -- Filthy Transfusion
			[195] = 5.1, -- Secrets of the Deep
			[196] = 5.29, -- Swirling Sands
			[230] = 5.27, -- Cascading Calamity
			[425] = 1.77, -- Sudden Onset
			[426] = 1.82, -- Dreadful Calling
			[459] = 1.8, -- Unstable Flames
			[462] = 2.03, -- Azerite Globules
			[478] = 6.7, -- Tidal Surge
			[479] = 7.83, -- Dagger in the Back
			[480] = 4.03, -- Blood Rite
			[481] = 4.99, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 4.76, -- Archive of the Titans
			[485] = 8.7, -- Laser Matrix
			[504] = 5.76, -- Unstable Catalyst
			[505] = 5.27, -- Tradewinds
		})

		-- Demonology
		insertDefaultScalesData(defaultName, 9, 2, {
			[18] = 1.69, -- Blood Siphon
			[20] = 1.49, -- Lifespeed
			[21] = 1.91, -- Elemental Whirl
			[22] = 3.15, -- Heed My Call
			[30] = 2.52, -- Overwhelming Power
			[31] = 2.74, -- Gutripper
			[38] = 1.69, -- On My Way
			[82] = 6.19, -- Champion of Azeroth
			[86] = 0.03, -- Azerite Fortification
			[130] = 2.97, -- Shadow's Bite
			[156] = 4.4, -- Ruinous Bolt
			[157] = 7.29, -- Rezan's Fury
			[190] = 3.4, -- Umbral Blaze
			[192] = 3.05, -- Meticulous Scheming
			[193] = 5.86, -- Blightborne Infusion
			[194] = 6.41, -- Filthy Transfusion
			[195] = 5.41, -- Secrets of the Deep
			[196] = 4.23, -- Swirling Sands
			[428] = 3.92, -- Demonic Meteor
			[429] = 2.19, -- Forbidden Knowledge
			[458] = 7.44, -- Supreme Commander
			[459] = 2.02, -- Unstable Flames
			[462] = 2.02, -- Azerite Globules
			[478] = 7.04, -- Tidal Surge
			[479] = 8.37, -- Dagger in the Back
			[480] = 3.5, -- Blood Rite
			[481] = 4.2, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 5.18, -- Archive of the Titans
			[485] = 9.03, -- Laser Matrix
			[504] = 5.81, -- Unstable Catalyst
			[505] = 4.65, -- Tradewinds
		})

		-- Destruction
		insertDefaultScalesData(defaultName, 9, 3, {
			[14] = 0.08, -- Longstrider
			[18] = 1.87, -- Blood Siphon
			[20] = 2.43, -- Lifespeed
			[21] = 2.33, -- Elemental Whirl
			[22] = 3.07, -- Heed My Call
			[30] = 3.56, -- Overwhelming Power
			[31] = 2.87, -- Gutripper
			[38] = 1.95, -- On My Way
			[44] = 0.03, -- Vampiric Speed
			[82] = 7.04, -- Champion of Azeroth
			[84] = 0.03, -- Bulwark of the Masses
			[85] = 0.06, -- Gemhide
			[87] = 0.08, -- Self Reliance
			[131] = 0.03, -- Accelerant
			[156] = 4.33, -- Ruinous Bolt
			[157] = 7.04, -- Rezan's Fury
			[192] = 5.12, -- Meticulous Scheming
			[193] = 6.78, -- Blightborne Infusion
			[194] = 6.6, -- Filthy Transfusion
			[195] = 5.35, -- Secrets of the Deep
			[196] = 5.61, -- Swirling Sands
			[208] = 0.06, -- Lifeblood
			[232] = 4.56, -- Flashpoint
			[431] = 0.03, -- Rolling Havoc
			[432] = 6.19, -- Chaotic Inferno
			[444] = 9.24, -- Crashing Chaos
			[459] = 2.2, -- Unstable Flames
			[460] = 5.07, -- Bursting Flare
			[462] = 2.08, -- Azerite Globules
			[475] = 0.08, -- Desperate Power
			[478] = 7.22, -- Tidal Surge
			[479] = 8.09, -- Dagger in the Back
			[480] = 4.97, -- Blood Rite
			[481] = 4.51, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 4.92, -- Archive of the Titans
			[485] = 8.96, -- Laser Matrix
			[504] = 5.91, -- Unstable Catalyst
			[505] = 4.97, -- Tradewinds
		})

	-- Monk
		-- Brewmaster
		insertDefaultScalesData(offensiveName, 10, 1, {
			[13] = 0.06, -- Azerite Empowered
			[14] = 0.11, -- Longstrider
			[15] = 0.09, -- Resounding Protection
			[18] = 1.27, -- Blood Siphon
			[19] = 0.06, -- Woundbinder
			[20] = 1.02, -- Lifespeed
			[21] = 1.29, -- Elemental Whirl
			[22] = 3.2, -- Heed My Call
			[30] = 1.4, -- Overwhelming Power
			[31] = 3.01, -- Gutripper
			[38] = 1.29, -- On My Way
			[43] = 0.03, -- Winds of War
			[44] = 0.11, -- Vampiric Speed
			[82] = 4.03, -- Champion of Azeroth
			[83] = 0.11, -- Impassive Visage
			[84] = 0.11, -- Bulwark of the Masses
			[85] = 0.03, -- Gemhide
			[86] = 0.11, -- Azerite Fortification
			[87] = 0.11, -- Self Reliance
			[89] = 0.09, -- Azerite Veins
			[98] = 0.09, -- Crystalline Carapace
			[99] = 0.03, -- Ablative Shielding
			[100] = 0.11, -- Strength in Numbers
			[101] = 0.14, -- Shimmering Haven
			[103] = 0.09, -- Concentrated Mending
			[104] = 0.06, -- Bracing Chill
			[105] = 0.09, -- Ephemeral Recovery
			[116] = 1.96, -- Boiling Brew
			[156] = 5.13, -- Ruinous Bolt
			[157] = 7.43, -- Rezan's Fury
			[186] = 0.11, -- Staggering Strikes
			[192] = 2.31, -- Meticulous Scheming
			[193] = 4.13, -- Blightborne Infusion
			[194] = 6.2, -- Filthy Transfusion
			[195] = 3.89, -- Secrets of the Deep
			[196] = 3.7, -- Swirling Sands
			[218] = 0.03, -- Strength of Spirit
			[238] = 0.09, -- Fit to Burst
			[382] = 0.09, -- Niuzao's Blessing
			[383] = 1.72, -- Training of Niuzao
			[384] = 4.24, -- Elusive Footwork
			[459] = 1.4, -- Unstable Flames
			[462] = 2.18, -- Azerite Globules
			[470] = 0.09, -- Sweep the Leg
			[478] = 8.53, -- Tidal Surge
			[479] = 5.93, -- Dagger in the Back
			[480] = 1.99, -- Blood Rite
			[481] = 2.98, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 3.73, -- Archive of the Titans
			[485] = 8.99, -- Laser Matrix
			[504] = 4.35, -- Unstable Catalyst
			[505] = 3.17, -- Tradewinds
		})
		insertDefaultScalesData(defensiveName, 10, 1, {
			[13] = 0.02, -- Azerite Empowered
			[14] = 0.01, -- Longstrider
			[15] = 10, -- Resounding Protection
			[18] = 1.28, -- Blood Siphon
			[21] = 0.06, -- Elemental Whirl
			[22] = 0.02, -- Heed My Call
			[38] = 0.11, -- On My Way
			[43] = 0.02, -- Winds of War
			[44] = 0.02, -- Vampiric Speed
			[82] = 0.15, -- Champion of Azeroth
			[84] = 0.03, -- Bulwark of the Masses
			[86] = 0.02, -- Azerite Fortification
			[87] = 0.01, -- Self Reliance
			[89] = 0.02, -- Azerite Veins
			[98] = 0.03, -- Crystalline Carapace
			[104] = 0.01, -- Bracing Chill
			[116] = 8.16, -- Boiling Brew
			[156] = 0.03, -- Ruinous Bolt
			[157] = 0.03, -- Rezan's Fury
			[186] = 0.77, -- Staggering Strikes
			[193] = 0.43, -- Blightborne Infusion
			[195] = 0.35, -- Secrets of the Deep
			[196] = 0.39, -- Swirling Sands
			[238] = 0.02, -- Fit to Burst
			[383] = 0.17, -- Training of Niuzao
			[384] = 0.03, -- Elusive Footwork
			[459] = 0.14, -- Unstable Flames
			[462] = 0.01, -- Azerite Globules
			[463] = 0.01, -- Blessed Portents
			[470] = 0.02, -- Sweep the Leg
			[481] = 0.3, -- Incite the Pack
			[482] = 0.03, -- Thunderous Blast
			[483] = 0.35, -- Archive of the Titans
			[504] = 0.38, -- Unstable Catalyst
			[505] = 0.3, -- Tradewinds
		})

		-- Mistweaver
		insertDefaultScalesData(defaultName, 10, 2, {

		})

		-- Windwalker
		insertDefaultScalesData(defaultName, 10, 3, {
			[13] = 0.08, -- Azerite Empowered
			[15] = 0.11, -- Resounding Protection
			[18] = 1.79, -- Blood Siphon
			[20] = 1.09, -- Lifespeed
			[21] = 2.05, -- Elemental Whirl
			[22] = 3.2, -- Heed My Call
			[30] = 1.64, -- Overwhelming Power
			[31] = 2.9, -- Gutripper
			[38] = 1.99, -- On My Way
			[42] = 0.06, -- Savior
			[43] = 0.03, -- Winds of War
			[82] = 5.87, -- Champion of Azeroth
			[83] = 0.03, -- Impassive Visage
			[84] = 0.06, -- Bulwark of the Masses
			[85] = 0.11, -- Gemhide
			[86] = 0.08, -- Azerite Fortification
			[87] = 0.08, -- Self Reliance
			[89] = 0.13, -- Azerite Veins
			[98] = 0.08, -- Crystalline Carapace
			[99] = 0.06, -- Ablative Shielding
			[100] = 0.13, -- Strength in Numbers
			[101] = 0.13, -- Shimmering Haven
			[103] = 0.18, -- Concentrated Mending
			[104] = 0.11, -- Bracing Chill
			[105] = 0.13, -- Ephemeral Recovery
			[117] = 0.03, -- Iron Fists
			[156] = 5.04, -- Ruinous Bolt
			[157] = 7.44, -- Rezan's Fury
			[184] = 6.35, -- Sunrise Technique
			[192] = 3.2, -- Meticulous Scheming
			[193] = 5.85, -- Blightborne Infusion
			[194] = 6.35, -- Filthy Transfusion
			[195] = 4.92, -- Secrets of the Deep
			[196] = 5.19, -- Swirling Sands
			[218] = 0.11, -- Strength of Spirit
			[388] = 3.48, -- Swift Roundhouse
			[389] = 4.01, -- Open Palm Strikes
			[390] = 5.8, -- Pressure Point
			[391] = 7.94, -- Meridian Strikes
			[459] = 1.99, -- Unstable Flames
			[462] = 2.2, -- Azerite Globules
			[463] = 0.18, -- Blessed Portents
			[470] = 0.21, -- Sweep the Leg
			[478] = 8.34, -- Tidal Surge
			[479] = 8.57, -- Dagger in the Back
			[480] = 2.85, -- Blood Rite
			[481] = 4.01, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 4.64, -- Archive of the Titans
			[485] = 9.3, -- Laser Matrix
			[504] = 5.75, -- Unstable Catalyst
			[505] = 4.39, -- Tradewinds
		})

	-- Druid
		-- Balance
		insertDefaultScalesData(defaultName, 11, 1, {
			[14] = 0.05, -- Longstrider
			[15] = 0.12, -- Resounding Protection
			[18] = 1.51, -- Blood Siphon
			[19] = 0.07, -- Woundbinder
			[20] = 1.7, -- Lifespeed
			[21] = 1.79, -- Elemental Whirl
			[22] = 3.12, -- Heed My Call
			[30] = 2.63, -- Overwhelming Power
			[31] = 2.87, -- Gutripper
			[38] = 1.66, -- On My Way
			[82] = 5.83, -- Champion of Azeroth
			[89] = 0.09, -- Azerite Veins
			[98] = 0.09, -- Crystalline Carapace
			[99] = 0.03, -- Ablative Shielding
			[104] = 0.07, -- Bracing Chill
			[122] = 9.19, -- Streaking Stars
			[156] = 3.89, -- Ruinous Bolt
			[157] = 7.02, -- Rezan's Fury
			[173] = 1.15, -- Power of the Moon
			[192] = 4.6, -- Meticulous Scheming
			[193] = 5.39, -- Blightborne Infusion
			[194] = 6.19, -- Filthy Transfusion
			[195] = 4.84, -- Secrets of the Deep
			[196] = 4.91, -- Swirling Sands
			[200] = 2.76, -- Sunblaze
			[219] = 0.07, -- Reawakening
			[250] = 3.89, -- Dawning Sun
			[356] = 1.15, -- High Noon
			[357] = 0.03, -- Lunar Shrapnel
			[364] = 5.44, -- Lively Spirit
			[459] = 1.73, -- Unstable Flames
			[462] = 2.1, -- Azerite Globules
			[463] = 0.03, -- Blessed Portents
			[478] = 6.38, -- Tidal Surge
			[479] = 8.06, -- Dagger in the Back
			[480] = 3.49, -- Blood Rite
			[481] = 3.63, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 4.68, -- Archive of the Titans
			[485] = 8.95, -- Laser Matrix
			[504] = 5.55, -- Unstable Catalyst
			[505] = 3.87, -- Tradewinds
		})

		-- Feral
		insertDefaultScalesData(defaultName, 11, 2, {
			[18] = 1.07, -- Blood Siphon
			[20] = 1.97, -- Lifespeed
			[21] = 1.84, -- Elemental Whirl
			[22] = 3.2, -- Heed My Call
			[30] = 3.33, -- Overwhelming Power
			[31] = 2.86, -- Gutripper
			[38] = 1.45, -- On My Way
			[82] = 5.93, -- Champion of Azeroth
			[111] = 3.65, -- Blood Mist
			[156] = 3.89, -- Ruinous Bolt
			[157] = 7.15, -- Rezan's Fury
			[169] = 7.51, -- Raking Ferocity
			[192] = 4.33, -- Meticulous Scheming
			[193] = 5.7, -- Blightborne Infusion
			[194] = 5.98, -- Filthy Transfusion
			[195] = 4.74, -- Secrets of the Deep
			[196] = 5.14, -- Swirling Sands
			[209] = 2.39, -- Shredding Fury
			[358] = 4.25, -- Gushing Lacerations
			[459] = 1.8, -- Unstable Flames
			[462] = 2.05, -- Azerite Globules
			[478] = 6.47, -- Tidal Surge
			[479] = 8.24, -- Dagger in the Back
			[480] = 4.4, -- Blood Rite
			[481] = 2.63, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 4.44, -- Archive of the Titans
			[485] = 9.17, -- Laser Matrix
			[504] = 5.23, -- Unstable Catalyst
			[505] = 2.88, -- Tradewinds
		})

		-- Guardian
		insertDefaultScalesData(offensiveName, 11, 3, {
			[18] = 1.13, -- Blood Siphon
			[20] = 1.13, -- Lifespeed
			[21] = 1.28, -- Elemental Whirl
			[22] = 3.2, -- Heed My Call
			[30] = 1.72, -- Overwhelming Power
			[31] = 2.92, -- Gutripper
			[38] = 1.13, -- On My Way
			[43] = 0.03, -- Winds of War
			[82] = 4.24, -- Champion of Azeroth
			[112] = 0.03, -- Layered Mane
			[156] = 4.24, -- Ruinous Bolt
			[157] = 7.23, -- Rezan's Fury
			[192] = 3.13, -- Meticulous Scheming
			[193] = 3.75, -- Blightborne Infusion
			[194] = 6.15, -- Filthy Transfusion
			[195] = 3.46, -- Secrets of the Deep
			[196] = 3.35, -- Swirling Sands
			[241] = 4.12, -- Twisted Claws
			[359] = 1.98, -- Wild Fleshrending
			[361] = 3.23, -- Guardian's Wrath
			[459] = 1.2, -- Unstable Flames
			[462] = 2.1, -- Azerite Globules
			[478] = 7.13, -- Tidal Surge
			[479] = 5.77, -- Dagger in the Back
			[480] = 2.38, -- Blood Rite
			[481] = 2.8, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 3.35, -- Archive of the Titans
			[485] = 9.13, -- Laser Matrix
			[504] = 3.91, -- Unstable Catalyst
			[505] = 3.09, -- Tradewinds
		})
		-- Guardian
		insertDefaultScalesData(defensiveName, 11, 3, {
			[18] = 10, -- Blood Siphon
		})

		-- Restoration
		insertDefaultScalesData(defaultName, 11, 4, {

		})

	-- Demon Hunter
		-- Havoc
		insertDefaultScalesData(defaultName, 12, 1, {
			[18] = 0.98, -- Blood Siphon
			[20] = 1.2, -- Lifespeed
			[21] = 1.42, -- Elemental Whirl
			[22] = 2.97, -- Heed My Call
			[30] = 1.89, -- Overwhelming Power
			[31] = 2.67, -- Gutripper
			[38] = 1.19, -- On My Way
			[43] = 0.08, -- Winds of War
			[82] = 4.17, -- Champion of Azeroth
			[83] = 0.04, -- Impassive Visage
			[84] = 0.08, -- Bulwark of the Masses
			[85] = 0.04, -- Gemhide
			[86] = 0.04, -- Azerite Fortification
			[87] = 0.06, -- Self Reliance
			[89] = 0.04, -- Azerite Veins
			[126] = 10, -- Revolving Blades
			[156] = 3.64, -- Ruinous Bolt
			[157] = 6.42, -- Rezan's Fury
			[159] = 2.28, -- Furious Gaze
			[160] = 0.16, -- Infernal Armor
			[192] = 3.09, -- Meticulous Scheming
			[193] = 4.59, -- Blightborne Infusion
			[194] = 5.86, -- Filthy Transfusion
			[195] = 4.29, -- Secrets of the Deep
			[196] = 4.1, -- Swirling Sands
			[202] = 0.06, -- Soulmonger
			[220] = 4.63, -- Unbound Chaos
			[245] = 4.01, -- Seething Power
			[352] = 6.55, -- Thirsting Blades
			[353] = 2.09, -- Eyes of Rage
			[459] = 1.52, -- Unstable Flames
			[462] = 1.96, -- Azerite Globules
			[478] = 6.14, -- Tidal Surge
			[479] = 7.39, -- Dagger in the Back
			[480] = 2.46, -- Blood Rite
			[481] = 2.44, -- Incite the Pack
			[482] = 9.16, -- Thunderous Blast
			[483] = 3.99, -- Archive of the Titans
			[485] = 8.21, -- Laser Matrix
			[504] = 4.8, -- Unstable Catalyst
			[505] = 2.46, -- Tradewinds
		})

		-- Vengeance
		insertDefaultScalesData(offensiveName, 12, 2, {
			[15] = 0.03, -- Resounding Protection
			[18] = 1.08, -- Blood Siphon
			[20] = 0.83, -- Lifespeed
			[21] = 1.17, -- Elemental Whirl
			[22] = 3.04, -- Heed My Call
			[30] = 1.46, -- Overwhelming Power
			[31] = 2.75, -- Gutripper
			[38] = 0.94, -- On My Way
			[44] = 0.03, -- Vampiric Speed
			[82] = 3.84, -- Champion of Azeroth
			[86] = 0.03, -- Azerite Fortification
			[99] = 0.03, -- Ablative Shielding
			[156] = 4.16, -- Ruinous Bolt
			[157] = 6.99, -- Rezan's Fury
			[192] = 2.59, -- Meticulous Scheming
			[193] = 4.18, -- Blightborne Infusion
			[194] = 6.5, -- Filthy Transfusion
			[195] = 3.44, -- Secrets of the Deep
			[196] = 3.78, -- Swirling Sands
			[459] = 1.32, -- Unstable Flames
			[462] = 2.04, -- Azerite Globules
			[478] = 6.92, -- Tidal Surge
			[479] = 5.59, -- Dagger in the Back
			[480] = 2.06, -- Blood Rite
			[481] = 2.71, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 3.35, -- Archive of the Titans
			[485] = 8.58, -- Laser Matrix
			[504] = 3.89, -- Unstable Catalyst
			[505] = 2.97, -- Tradewinds
		})
		insertDefaultScalesData(defensiveName, 12, 2, {
			[14] = 0.01, -- Longstrider
			[15] = 10, -- Resounding Protection
			[18] = 1.53, -- Blood Siphon
			[20] = 0.55, -- Lifespeed
			[21] = 0.45, -- Elemental Whirl
			[30] = 0.78, -- Overwhelming Power
			[38] = 0.26, -- On My Way
			[43] = 0.02, -- Winds of War
			[44] = 0.01, -- Vampiric Speed
			[82] = 1.39, -- Champion of Azeroth
			[85] = 0.01, -- Gemhide
			[134] = 0.02, -- Revel in Pain
			[156] = 0.03, -- Ruinous Bolt
			[157] = 0.02, -- Rezan's Fury
			[160] = 0.02, -- Infernal Armor
			[192] = 1.62, -- Meticulous Scheming
			[193] = 1.03, -- Blightborne Infusion
			[195] = 0.94, -- Secrets of the Deep
			[196] = 0.93, -- Swirling Sands
			[202] = 0.01, -- Soulmonger
			[221] = 0.01, -- Rigid Carapace
			[355] = 0.03, -- Essence Sever
			[459] = 0.33, -- Unstable Flames
			[480] = 1.21, -- Blood Rite
			[481] = 0.77, -- Incite the Pack
			[482] = 0.02, -- Thunderous Blast
			[483] = 0.93, -- Archive of the Titans
			[504] = 1.09, -- Unstable Catalyst
			[505] = 0.82, -- Tradewinds
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