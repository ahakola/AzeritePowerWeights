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
			[13] = 0.03, -- Azerite Empowered
			[14] = 0.06, -- Longstrider
			[15] = 0.12, -- Resounding Protection
			[18] = 2.4, -- Blood Siphon
			[20] = 2.26, -- Lifespeed
			[21] = 2.69, -- Elemental Whirl
			[22] = 3.83, -- Heed My Call
			[30] = 4.4, -- Overwhelming Power
			[31] = 3.43, -- Gutripper
			[38] = 2.23, -- On My Way
			[43] = 0.15, -- Winds of War
			[44] = 0.09, -- Vampiric Speed
			[82] = 8.32, -- Champion of Azeroth
			[83] = 0.12, -- Impassive Visage
			[84] = 0.06, -- Bulwark of the Masses
			[87] = 0.06, -- Self Reliance
			[89] = 0.09, -- Azerite Veins
			[98] = 0.15, -- Crystalline Carapace
			[99] = 0.03, -- Ablative Shielding
			[100] = 0.06, -- Strength in Numbers
			[101] = 0.03, -- Shimmering Haven
			[121] = 5.15, -- Executioner's Precision
			[156] = 4.92, -- Ruinous Bolt
			[157] = 8.52, -- Rezan's Fury
			[174] = 4, -- Gathering Storm
			[192] = 5.72, -- Meticulous Scheming
			[193] = 8.32, -- Blightborne Infusion
			[194] = 7.89, -- Filthy Transfusion
			[195] = 6.06, -- Secrets of the Deep
			[196] = 7.49, -- Swirling Sands
			[226] = 8.83, -- Test of Might
			[433] = 5.58, -- Seismic Wave
			[434] = 8.52, -- Crushing Assault
			[435] = 10, -- Lord of War
			[459] = 2.89, -- Unstable Flames
			[462] = 2.38, -- Azerite Globules
			[476] = 0.09, -- Moment of Glory
			[477] = 0.06, -- Bury the Hatchet
			[478] = 8.09, -- Tidal Surge
			[479] = 9.32, -- Dagger in the Back
			[480] = 4.58, -- Blood Rite
			[481] = 5.46, -- Incite the Pack
			[482] = 7.2, -- Thunderous Blast
			[483] = 6.69, -- Archive of the Titans
			[485] = 7.46, -- Laser Matrix
			[504] = 6.66, -- Unstable Catalyst
			[505] = 5.83, -- Tradewinds
		})

		-- Fury
		insertDefaultScalesData(defaultName, 1, 2, {
			[13] = 0.11, -- Azerite Empowered
			[15] = 0.06, -- Resounding Protection
			[18] = 2.21, -- Blood Siphon
			[20] = 2.51, -- Lifespeed
			[21] = 2.46, -- Elemental Whirl
			[22] = 3.88, -- Heed My Call
			[30] = 4.97, -- Overwhelming Power
			[31] = 3.37, -- Gutripper
			[38] = 1.88, -- On My Way
			[43] = 0.06, -- Winds of War
			[44] = 0.08, -- Vampiric Speed
			[82] = 7.93, -- Champion of Azeroth
			[83] = 0.13, -- Impassive Visage
			[86] = 0.06, -- Azerite Fortification
			[87] = 0.03, -- Self Reliance
			[98] = 0.03, -- Crystalline Carapace
			[101] = 0.03, -- Shimmering Haven
			[119] = 5.37, -- Trample the Weak
			[156] = 4.23, -- Ruinous Bolt
			[157] = 8.31, -- Rezan's Fury
			[174] = 0.08, -- Gathering Storm
			[176] = 8.54, -- Bloodcraze
			[192] = 6.21, -- Meticulous Scheming
			[193] = 7.07, -- Blightborne Infusion
			[194] = 8, -- Filthy Transfusion
			[195] = 5.22, -- Secrets of the Deep
			[196] = 6.23, -- Swirling Sands
			[229] = 6.18, -- Pulverizing Blows
			[437] = 10, -- Simmering Rage
			[438] = 9.22, -- Reckless Flurry
			[459] = 2.54, -- Unstable Flames
			[462] = 2.56, -- Azerite Globules
			[478] = 6.89, -- Tidal Surge
			[479] = 8.16, -- Dagger in the Back
			[480] = 4.59, -- Blood Rite
			[481] = 5.42, -- Incite the Pack
			[482] = 7.42, -- Thunderous Blast
			[483] = 5.75, -- Archive of the Titans
			[485] = 7.55, -- Laser Matrix
			[504] = 5.95, -- Unstable Catalyst
			[505] = 5.85, -- Tradewinds
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
			[18] = 1.48, -- Blood Siphon
			[20] = 1.66, -- Lifespeed
			[21] = 1.77, -- Elemental Whirl
			[22] = 4.27, -- Heed My Call
			[30] = 3.03, -- Overwhelming Power
			[31] = 3.95, -- Gutripper
			[38] = 1.59, -- On My Way
			[42] = 0.08, -- Savior
			[44] = 0.08, -- Vampiric Speed
			[82] = 5.89, -- Champion of Azeroth
			[125] = 3.95, -- Avenger's Might
			[150] = 2.15, -- Soaring Shield
			[156] = 5.89, -- Ruinous Bolt
			[157] = 10, -- Rezan's Fury
			[189] = 0.04, -- Dauntless Divinity
			[192] = 4.16, -- Meticulous Scheming
			[193] = 6.2, -- Blightborne Infusion
			[194] = 8.98, -- Filthy Transfusion
			[195] = 4.51, -- Secrets of the Deep
			[196] = 5.57, -- Swirling Sands
			[234] = 1.98, -- Inner Light
			[235] = 3.7, -- Indomitable Justice
			[395] = 8.77, -- Inspiring Vanguard
			[459] = 2.05, -- Unstable Flames
			[462] = 2.89, -- Azerite Globules
			[478] = 10, -- Tidal Surge
			[479] = 7.96, -- Dagger in the Back
			[480] = 3.24, -- Blood Rite
			[481] = 3.49, -- Incite the Pack
			[482] = 8.46, -- Thunderous Blast
			[483] = 4.83, -- Archive of the Titans
			[485] = 8.84, -- Laser Matrix
			[504] = 5.22, -- Unstable Catalyst
			[505] = 3.84, -- Tradewinds
		})
		insertDefaultScalesData(defensiveName, 2, 2, {
			[15] = 10, -- Resounding Protection
			[18] = 1.03, -- Blood Siphon
			[20] = 0.01, -- Lifespeed
			[21] = 0.01, -- Elemental Whirl
			[30] = 0.01, -- Overwhelming Power
			[38] = 0.02, -- On My Way
			[82] = 0.03, -- Champion of Azeroth
			[125] = 0.03, -- Avenger's Might
			[150] = 0.02, -- Soaring Shield
			[192] = 0.01, -- Meticulous Scheming
			[193] = 0.02, -- Blightborne Infusion
			[195] = 0.01, -- Secrets of the Deep
			[196] = 0.02, -- Swirling Sands
			[234] = 0.02, -- Inner Light
			[395] = 0.01, -- Inspiring Vanguard
			[459] = 0.01, -- Unstable Flames
			[481] = 0.03, -- Incite the Pack
			[483] = 0.01, -- Archive of the Titans
			[504] = 0.01, -- Unstable Catalyst
			[505] = 0.03, -- Tradewinds
		})

		-- Retribution
		insertDefaultScalesData(defaultName, 2, 3, {
			[14] = 0.09, -- Longstrider
			[15] = 0.06, -- Resounding Protection
			[18] = 2.24, -- Blood Siphon
			[19] = 0.12, -- Woundbinder
			[20] = 2.53, -- Lifespeed
			[21] = 2.47, -- Elemental Whirl
			[22] = 3.74, -- Heed My Call
			[30] = 4.76, -- Overwhelming Power
			[31] = 3.46, -- Gutripper
			[38] = 2.33, -- On My Way
			[42] = 0.12, -- Savior
			[44] = 0.06, -- Vampiric Speed
			[82] = 8.22, -- Champion of Azeroth
			[84] = 0.12, -- Bulwark of the Masses
			[85] = 0.15, -- Gemhide
			[86] = 0.12, -- Azerite Fortification
			[87] = 0.03, -- Self Reliance
			[89] = 0.09, -- Azerite Veins
			[100] = 0.12, -- Strength in Numbers
			[101] = 0.03, -- Shimmering Haven
			[103] = 0.06, -- Concentrated Mending
			[105] = 0.06, -- Ephemeral Recovery
			[125] = 6.01, -- Avenger's Might
			[154] = 7.57, -- Relentless Inquisitor
			[156] = 4.85, -- Ruinous Bolt
			[157] = 8.59, -- Rezan's Fury
			[187] = 6.04, -- Expurgation
			[192] = 6.21, -- Meticulous Scheming
			[193] = 7.34, -- Blightborne Infusion
			[194] = 7.74, -- Filthy Transfusion
			[195] = 6.01, -- Secrets of the Deep
			[196] = 5.93, -- Swirling Sands
			[235] = 5.84, -- Indomitable Justice
			[393] = 0.09, -- Grace of the Justicar
			[396] = 7.03, -- Zealotry
			[453] = 0.09, -- Divine Right
			[454] = 0.15, -- Judicious Defense
			[459] = 2.81, -- Unstable Flames
			[462] = 2.53, -- Azerite Globules
			[471] = 0.03, -- Gallant Steed
			[478] = 8.08, -- Tidal Surge
			[479] = 10, -- Dagger in the Back
			[480] = 4.71, -- Blood Rite
			[481] = 5.25, -- Incite the Pack
			[482] = 7.37, -- Thunderous Blast
			[483] = 6.63, -- Archive of the Titans
			[485] = 7.51, -- Laser Matrix
			[504] = 6.35, -- Unstable Catalyst
			[505] = 5.64, -- Tradewinds
		})

	-- Hunter
		-- Beast Mastery
		insertDefaultScalesData(defaultName, 3, 1, {
			[15] = 0.06, -- Resounding Protection
			[18] = 2.17, -- Blood Siphon
			[20] = 2.11, -- Lifespeed
			[21] = 2.49, -- Elemental Whirl
			[22] = 3.36, -- Heed My Call
			[30] = 4.02, -- Overwhelming Power
			[31] = 3.16, -- Gutripper
			[38] = 2.29, -- On My Way
			[82] = 8.13, -- Champion of Azeroth
			[85] = 0.09, -- Gemhide
			[107] = 5.93, -- Serrated Jaws
			[156] = 5.21, -- Ruinous Bolt
			[157] = 7.87, -- Rezan's Fury
			[161] = 7.37, -- Haze of Rage
			[192] = 6.36, -- Meticulous Scheming
			[193] = 7.52, -- Blightborne Infusion
			[194] = 6.59, -- Filthy Transfusion
			[195] = 6.77, -- Secrets of the Deep
			[196] = 6.1, -- Swirling Sands
			[211] = 5.38, -- Dance of Death
			[366] = 10, -- Primal Instincts
			[367] = 7.55, -- Feeding Frenzy
			[459] = 2.58, -- Unstable Flames
			[462] = 2.26, -- Azerite Globules
			[478] = 8.59, -- Tidal Surge
			[479] = 8.82, -- Dagger in the Back
			[480] = 4.83, -- Blood Rite
			[481] = 5.44, -- Incite the Pack
			[482] = 6.28, -- Thunderous Blast
			[483] = 7.26, -- Archive of the Titans
			[485] = 6.85, -- Laser Matrix
			[504] = 7.66, -- Unstable Catalyst
			[505] = 5.93, -- Tradewinds
		})

		-- Marksmanship
		insertDefaultScalesData(defaultName, 3, 2, {
			[13] = 0.06, -- Azerite Empowered
			[18] = 1.95, -- Blood Siphon
			[20] = 2.17, -- Lifespeed
			[21] = 2.22, -- Elemental Whirl
			[22] = 3.57, -- Heed My Call
			[30] = 4.25, -- Overwhelming Power
			[31] = 3.21, -- Gutripper
			[36] = 2.44, -- In The Rhythm
			[38] = 2.09, -- On My Way
			[82] = 6.96, -- Champion of Azeroth
			[156] = 4.85, -- Ruinous Bolt
			[157] = 8.14, -- Rezan's Fury
			[162] = 5.24, -- Arcane Flurry
			[192] = 6, -- Meticulous Scheming
			[193] = 5.68, -- Blightborne Infusion
			[194] = 7.43, -- Filthy Transfusion
			[195] = 6, -- Secrets of the Deep
			[196] = 4.96, -- Swirling Sands
			[212] = 6.39, -- Unerring Vision
			[368] = 10, -- Steady Aim
			[370] = 3.98, -- Focused Fire
			[459] = 1.81, -- Unstable Flames
			[462] = 2.42, -- Azerite Globules
			[478] = 7.92, -- Tidal Surge
			[479] = 9.29, -- Dagger in the Back
			[480] = 4.55, -- Blood Rite
			[481] = 4.64, -- Incite the Pack
			[482] = 6.8, -- Thunderous Blast
			[483] = 6.44, -- Archive of the Titans
			[485] = 7.13, -- Laser Matrix
			[504] = 6.72, -- Unstable Catalyst
			[505] = 5.07, -- Tradewinds
		})

		-- Survival
		insertDefaultScalesData(defaultName, 3, 3, {
			[13] = 0.09, -- Azerite Empowered
			[14] = 0.06, -- Longstrider
			[15] = 0.04, -- Resounding Protection
			[18] = 1.22, -- Blood Siphon
			[20] = 1.57, -- Lifespeed
			[21] = 1.63, -- Elemental Whirl
			[22] = 2.43, -- Heed My Call
			[30] = 3.13, -- Overwhelming Power
			[31] = 2.1, -- Gutripper
			[38] = 1.51, -- On My Way
			[82] = 4.99, -- Champion of Azeroth
			[83] = 0.04, -- Impassive Visage
			[84] = 0.09, -- Bulwark of the Masses
			[86] = 0.07, -- Azerite Fortification
			[107] = 3.49, -- Serrated Jaws
			[110] = 2.31, -- Wildfire Cluster
			[156] = 3.09, -- Ruinous Bolt
			[157] = 5.26, -- Rezan's Fury
			[163] = 6.85, -- Latent Poison
			[192] = 3.83, -- Meticulous Scheming
			[193] = 4.66, -- Blightborne Infusion
			[194] = 4.7, -- Filthy Transfusion
			[195] = 4.44, -- Secrets of the Deep
			[196] = 4.17, -- Swirling Sands
			[203] = 0.04, -- Shellshock
			[213] = 3.5, -- Venomous Fangs
			[371] = 10, -- Blur of Talons
			[372] = 9.12, -- Wilderness Survival
			[373] = 3.96, -- Up Close And Personal
			[459] = 1.73, -- Unstable Flames
			[462] = 1.61, -- Azerite Globules
			[469] = 0.09, -- Duck and Cover
			[478] = 5.26, -- Tidal Surge
			[479] = 6.11, -- Dagger in the Back
			[480] = 3.37, -- Blood Rite
			[481] = 2.94, -- Incite the Pack
			[482] = 4.49, -- Thunderous Blast
			[483] = 4.71, -- Archive of the Titans
			[485] = 4.7, -- Laser Matrix
			[504] = 4.95, -- Unstable Catalyst
			[505] = 3.14, -- Tradewinds
		})

	-- Rogue
		-- Assassination
		insertDefaultScalesData(defaultName, 4, 1, {
			[13] = 1.1, -- Azerite Empowered
			[14] = 0.21, -- Longstrider
			[15] = 0.15, -- Resounding Protection
			[18] = 2.58, -- Blood Siphon
			[20] = 2.64, -- Lifespeed
			[21] = 2.84, -- Elemental Whirl
			[22] = 3.96, -- Heed My Call
			[30] = 4.72, -- Overwhelming Power
			[31] = 3.56, -- Gutripper
			[38] = 2.32, -- On My Way
			[44] = 0.27, -- Vampiric Speed
			[82] = 8.27, -- Champion of Azeroth
			[83] = 0.15, -- Impassive Visage
			[84] = 0.06, -- Bulwark of the Masses
			[86] = 0.21, -- Azerite Fortification
			[87] = 0.18, -- Self Reliance
			[124] = 8.07, -- Sharpened Blades
			[136] = 10, -- Double Dose
			[156] = 5.15, -- Ruinous Bolt
			[157] = 8.7, -- Rezan's Fury
			[181] = 7.49, -- Twist the Knife
			[192] = 4.92, -- Meticulous Scheming
			[193] = 8.44, -- Blightborne Infusion
			[194] = 7.26, -- Filthy Transfusion
			[195] = 6.74, -- Secrets of the Deep
			[196] = 7.32, -- Swirling Sands
			[217] = 0.09, -- Footpad
			[249] = 5.73, -- Poisoned Wire
			[406] = 4.74, -- Scent of Blood
			[407] = 0.12, -- Fan of Blades
			[408] = 6.71, -- Shrouded Suffocation
			[459] = 3.1, -- Unstable Flames
			[462] = 2.49, -- Azerite Globules
			[473] = 0.09, -- Shrouded Mantle
			[478] = 8.39, -- Tidal Surge
			[479] = 9.83, -- Dagger in the Back
			[480] = 5.29, -- Blood Rite
			[481] = 5.93, -- Incite the Pack
			[482] = 7.23, -- Thunderous Blast
			[483] = 7.52, -- Archive of the Titans
			[485] = 7.37, -- Laser Matrix
			[504] = 7.66, -- Unstable Catalyst
			[505] = 6.33, -- Tradewinds
		})

		-- Outlaw
		insertDefaultScalesData(defaultName, 4, 2, {
			[13] = 1.01, -- Azerite Empowered
			[14] = 0.03, -- Longstrider
			[18] = 1.7, -- Blood Siphon
			[20] = 2.16, -- Lifespeed
			[21] = 2.19, -- Elemental Whirl
			[22] = 3.91, -- Heed My Call
			[30] = 3.94, -- Overwhelming Power
			[31] = 3.4, -- Gutripper
			[38] = 1.98, -- On My Way
			[44] = 0.08, -- Vampiric Speed
			[82] = 6.61, -- Champion of Azeroth
			[83] = 0.06, -- Impassive Visage
			[85] = 0.13, -- Gemhide
			[129] = 9.08, -- Deadshot
			[156] = 5.02, -- Ruinous Bolt
			[157] = 8.59, -- Rezan's Fury
			[180] = 6.92, -- Storm of Steel
			[192] = 5.33, -- Meticulous Scheming
			[193] = 6.33, -- Blightborne Infusion
			[194] = 6.71, -- Filthy Transfusion
			[195] = 5.69, -- Secrets of the Deep
			[196] = 5.66, -- Swirling Sands
			[217] = 0.08, -- Footpad
			[239] = 7.9, -- Snake Eyes
			[410] = 4.84, -- Paradise Lost
			[411] = 8.57, -- Ace Up Your Sleeve
			[446] = 7.9, -- Brigand's Blitz
			[459] = 2.32, -- Unstable Flames
			[462] = 2.47, -- Azerite Globules
			[473] = 0.16, -- Shrouded Mantle
			[478] = 8.51, -- Tidal Surge
			[479] = 10, -- Dagger in the Back
			[480] = 4.35, -- Blood Rite
			[481] = 3.78, -- Incite the Pack
			[482] = 7.07, -- Thunderous Blast
			[483] = 6.64, -- Archive of the Titans
			[485] = 7.67, -- Laser Matrix
			[504] = 6.33, -- Unstable Catalyst
			[505] = 4.25, -- Tradewinds
		})

		-- Subtley
		insertDefaultScalesData(defaultName, 4, 3, {
			[13] = 0.98, -- Azerite Empowered
			[14] = 0.05, -- Longstrider
			[15] = 0.13, -- Resounding Protection
			[18] = 1.9, -- Blood Siphon
			[20] = 1.6, -- Lifespeed
			[21] = 2.07, -- Elemental Whirl
			[22] = 3.12, -- Heed My Call
			[30] = 3.07, -- Overwhelming Power
			[31] = 2.92, -- Gutripper
			[38] = 1.88, -- On My Way
			[82] = 6.34, -- Champion of Azeroth
			[124] = 6.56, -- Sharpened Blades
			[156] = 4.87, -- Ruinous Bolt
			[157] = 7.34, -- Rezan's Fury
			[175] = 5.62, -- Night's Vengeance
			[192] = 3.9, -- Meticulous Scheming
			[193] = 5.87, -- Blightborne Infusion
			[194] = 5.82, -- Filthy Transfusion
			[195] = 5.64, -- Secrets of the Deep
			[196] = 5.39, -- Swirling Sands
			[217] = 0.05, -- Footpad
			[240] = 8.23, -- Blade In The Shadows
			[413] = 6.96, -- The First Dance
			[414] = 10, -- Inevitability
			[445] = 3.42, -- Perforate
			[459] = 2, -- Unstable Flames
			[462] = 2.02, -- Azerite Globules
			[473] = 0.05, -- Shrouded Mantle
			[478] = 7.91, -- Tidal Surge
			[479] = 8.28, -- Dagger in the Back
			[480] = 3.8, -- Blood Rite
			[481] = 4.39, -- Incite the Pack
			[482] = 5.82, -- Thunderous Blast
			[483] = 6.31, -- Archive of the Titans
			[485] = 6.29, -- Laser Matrix
			[504] = 6.39, -- Unstable Catalyst
			[505] = 4.87, -- Tradewinds
		})

	-- Priest
		-- Discipline
		insertDefaultScalesData(defaultName, 5, 1, {

		})
		insertDefaultScalesData(offensiveName, 5, 1, {
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
		})

		-- Holy
		insertDefaultScalesData(defaultName, 5, 2, {

		})

		-- Shadow
		insertDefaultScalesData(defaultName, 5, 3, {
			-- https://github.com/WarcraftPriests/bfa-shadow-priest/blob/master/azerite-traits/AzeritePowerWeights_DA.md
			-- First imported 03.09.2018, last updated 25.09.2018
			[13] = 0.75,
			[18] = 0.83,
			[21] = 1.08,
			[22] = 1.44,
			[30] = 1.94,
			[31] = 1.35,
			[38] = 0.88,
			[82] = 3.48,
			[115] = -0.02,
			[156] = 2.03,
			[157] = 3.33,
			[166] = 1.11,
			[192] = 2.76,
			[193] = 3.74,
			[194] = 2.91,
			[195] = 2.53,
			[196] = 3.32,
			[236] = 3.07,
			[403] = 1.71,
			[404] = 2.44,
			[405] = 5.04,
			[459] = 1.26,
			[461] = 1.03,
			[462] = 0.96,
			[478] = 3.33,
			[479] = 3.84,
			[480] = 2.27,
			[481] = 2.19,
			[482] = 2.81,
			[483] = 2.91,
			[485] = 2.97,
			[486] = 2.09,
			[487] = 1.23,
			[488] = 3.42,
			[489] = 2.43,
			[490] = 0.58,
			[491] = 0.82,
			[498] = 2.15,
			[499] = 1.30,
			[500] = 2.66,
			[501] = 2.97,
			[504] = 2.82,
			[505] = 2.39,
		})

	-- Death Knight
		-- Blood
		insertDefaultScalesData(offensiveName, 6, 1, {
			[14] = 0.07, -- Longstrider
			[18] = 1.5, -- Blood Siphon
			[20] = 1.69, -- Lifespeed
			[21] = 1.86, -- Elemental Whirl
			[22] = 4.44, -- Heed My Call
			[30] = 3.81, -- Overwhelming Power
			[31] = 3.95, -- Gutripper
			[38] = 1.69, -- On My Way
			[43] = 0.07, -- Winds of War
			[44] = 0.07, -- Vampiric Speed
			[82] = 5.8, -- Champion of Azeroth
			[83] = 0.07, -- Impassive Visage
			[85] = 0.1, -- Gemhide
			[87] = 0.04, -- Self Reliance
			[89] = 0.1, -- Azerite Veins
			[98] = 0.14, -- Crystalline Carapace
			[99] = 0.04, -- Ablative Shielding
			[100] = 0.04, -- Strength in Numbers
			[101] = 0.14, -- Shimmering Haven
			[106] = 2.82, -- Deep Cuts
			[140] = 1.26, -- Bone Spike Graveyard
			[156] = 5.73, -- Ruinous Bolt
			[157] = 10, -- Rezan's Fury
			[192] = 4.91, -- Meticulous Scheming
			[193] = 6.3, -- Blightborne Infusion
			[194] = 9.18, -- Filthy Transfusion
			[195] = 4.28, -- Secrets of the Deep
			[196] = 5.57, -- Swirling Sands
			[197] = 0.04, -- Marrowblood
			[201] = 0.04, -- Runic Barrier
			[243] = 0.14, -- Embrace of the Darkfallen
			[348] = 5.24, -- Eternal Rune Weapon
			[349] = 0.63, -- Bones of the Damned
			[459] = 2.16, -- Unstable Flames
			[462] = 2.95, -- Azerite Globules
			[478] = 9.61, -- Tidal Surge
			[479] = 7.99, -- Dagger in the Back
			[480] = 4.01, -- Blood Rite
			[481] = 3.55, -- Incite the Pack
			[482] = 8.65, -- Thunderous Blast
			[483] = 4.77, -- Archive of the Titans
			[485] = 8.91, -- Laser Matrix
			[504] = 4.81, -- Unstable Catalyst
			[505] = 3.75, -- Tradewinds
		})
		insertDefaultScalesData(defensiveName, 6, 1, {
			[13] = 0.01, -- Azerite Empowered
			[15] = 10, -- Resounding Protection
			[18] = 0.95, -- Blood Siphon
			[20] = 0.45, -- Lifespeed
			[21] = 0.21, -- Elemental Whirl
			[30] = 0.97, -- Overwhelming Power
			[38] = 0.03, -- On My Way
			[82] = 0.63, -- Champion of Azeroth
			[84] = 0.02, -- Bulwark of the Masses
			[106] = 1.62, -- Deep Cuts
			[140] = 1.17, -- Bone Spike Graveyard
			[192] = 1.29, -- Meticulous Scheming
			[193] = 0.23, -- Blightborne Infusion
			[195] = 0.12, -- Secrets of the Deep
			[196] = 0.21, -- Swirling Sands
			[197] = 2.43, -- Marrowblood
			[348] = 0.34, -- Eternal Rune Weapon
			[349] = 0.43, -- Bones of the Damned
			[459] = 0.05, -- Unstable Flames
			[478] = 0.02, -- Tidal Surge
			[480] = 1.07, -- Blood Rite
			[481] = 0.09, -- Incite the Pack
			[482] = 0.01, -- Thunderous Blast
			[483] = 0.14, -- Archive of the Titans
			[504] = 0.19, -- Unstable Catalyst
			[505] = 0.11, -- Tradewinds
		})

		-- Frost
		insertDefaultScalesData(defaultName, 6, 2, {
			[13] = 0.2, -- Azerite Empowered
			[14] = 0.03, -- Longstrider
			[15] = 0.03, -- Resounding Protection
			[18] = 2.54, -- Blood Siphon
			[20] = 2.85, -- Lifespeed
			[21] = 2.85, -- Elemental Whirl
			[22] = 3.51, -- Heed My Call
			[30] = 4.08, -- Overwhelming Power
			[31] = 3.08, -- Gutripper
			[38] = 2.43, -- On My Way
			[43] = 0.23, -- Winds of War
			[44] = 0.2, -- Vampiric Speed
			[82] = 8.72, -- Champion of Azeroth
			[83] = 0.12, -- Impassive Visage
			[84] = 0.12, -- Bulwark of the Masses
			[85] = 0.15, -- Gemhide
			[86] = 0.18, -- Azerite Fortification
			[87] = 0.15, -- Self Reliance
			[89] = 0.06, -- Azerite Veins
			[98] = 0.23, -- Crystalline Carapace
			[99] = 0.15, -- Ablative Shielding
			[100] = 0.06, -- Strength in Numbers
			[101] = 0.06, -- Shimmering Haven
			[108] = 6.76, -- Icy Citadel
			[141] = 4.88, -- Latent Chill
			[156] = 5.25, -- Ruinous Bolt
			[157] = 7.78, -- Rezan's Fury
			[192] = 4.28, -- Meticulous Scheming
			[193] = 7.87, -- Blightborne Infusion
			[194] = 6.64, -- Filthy Transfusion
			[195] = 7.16, -- Secrets of the Deep
			[196] = 7.18, -- Swirling Sands
			[198] = 9.35, -- Glacial Contagion
			[201] = 0.26, -- Runic Barrier
			[242] = 5.13, -- Echoing Howl
			[346] = 4.19, -- Killer Frost
			[347] = 6.04, -- Frozen Tempest
			[459] = 2.91, -- Unstable Flames
			[462] = 2.14, -- Azerite Globules
			[478] = 10, -- Tidal Surge
			[479] = 8.87, -- Dagger in the Back
			[480] = 4.88, -- Blood Rite
			[481] = 6.47, -- Incite the Pack
			[482] = 6.47, -- Thunderous Blast
			[483] = 7.64, -- Archive of the Titans
			[485] = 6.76, -- Laser Matrix
			[504] = 8.1, -- Unstable Catalyst
			[505] = 6.9, -- Tradewinds
		})

		-- Unholy
		insertDefaultScalesData(defaultName, 6, 3, {
			[18] = 1.81, -- Blood Siphon
			[20] = 2.7, -- Lifespeed
			[21] = 2.48, -- Elemental Whirl
			[22] = 3.75, -- Heed My Call
			[30] = 4.61, -- Overwhelming Power
			[31] = 3.5, -- Gutripper
			[38] = 2.26, -- On My Way
			[82] = 7.62, -- Champion of Azeroth
			[109] = 3.12, -- Festering Doom
			[140] = 1.12, -- Bone Spike Graveyard
			[142] = 3.88, -- Horrid Experimentation
			[156] = 5.43, -- Ruinous Bolt
			[157] = 8.83, -- Rezan's Fury
			[192] = 5.62, -- Meticulous Scheming
			[193] = 8.23, -- Blightborne Infusion
			[194] = 8.16, -- Filthy Transfusion
			[195] = 6.16, -- Secrets of the Deep
			[196] = 7.31, -- Swirling Sands
			[199] = 9.62, -- Festermight
			[244] = 6.42, -- Harrowing Decay
			[350] = 4.61, -- Cankerous Wounds
			[351] = 3.37, -- Last Surprise
			[459] = 2.86, -- Unstable Flames
			[462] = 2.58, -- Azerite Globules
			[478] = 9.05, -- Tidal Surge
			[479] = 10, -- Dagger in the Back
			[480] = 4.74, -- Blood Rite
			[481] = 4.77, -- Incite the Pack
			[482] = 7.56, -- Thunderous Blast
			[483] = 6.58, -- Archive of the Titans
			[485] = 7.66, -- Laser Matrix
			[504] = 7.08, -- Unstable Catalyst
			[505] = 5.12, -- Tradewinds
		})

	-- Shaman
		-- Elemental
		insertDefaultScalesData(defaultName, 7, 1, {
			[13] = 0.08, -- Azerite Empowered
			[17] = 0.05, -- Astral Shift
			[18] = 1.41, -- Blood Siphon
			[19] = 0.03, -- Woundbinder
			[20] = 1.68, -- Lifespeed
			[21] = 1.99, -- Elemental Whirl
			[22] = 2.96, -- Heed My Call
			[30] = 3.18, -- Overwhelming Power
			[31] = 2.8, -- Gutripper
			[38] = 1.84, -- On My Way
			[42] = 0.1, -- Savior
			[44] = 0.03, -- Vampiric Speed
			[82] = 5.78, -- Champion of Azeroth
			[83] = 0.15, -- Impassive Visage
			[84] = 0.08, -- Bulwark of the Masses
			[85] = 0.05, -- Gemhide
			[86] = 0.03, -- Azerite Fortification
			[103] = 0.15, -- Concentrated Mending
			[104] = 0.05, -- Bracing Chill
			[135] = 0.1, -- Volcanic Lightning
			[156] = 4.06, -- Ruinous Bolt
			[157] = 6.97, -- Rezan's Fury
			[178] = 5.09, -- Lava Shock
			[192] = 3.82, -- Meticulous Scheming
			[193] = 6.62, -- Blightborne Infusion
			[194] = 6.54, -- Filthy Transfusion
			[195] = 5.18, -- Secrets of the Deep
			[196] = 5.64, -- Swirling Sands
			[207] = 0.2, -- Serene Spirit
			[222] = 6.71, -- Echo of the Elementals
			[416] = 5.23, -- Natural Harmony
			[417] = 4.32, -- Rumbling Tremors
			[447] = 5.4, -- Ancestral Resonance
			[448] = 4.49, -- Synapse Shock
			[457] = 10, -- Igneous Potential
			[459] = 2.56, -- Unstable Flames
			[462] = 1.99, -- Azerite Globules
			[463] = 0.1, -- Blessed Portents
			[478] = 6.69, -- Tidal Surge
			[479] = 8, -- Dagger in the Back
			[480] = 3.44, -- Blood Rite
			[481] = 3.42, -- Incite the Pack
			[482] = 5.92, -- Thunderous Blast
			[483] = 5.59, -- Archive of the Titans
			[485] = 6.07, -- Laser Matrix
			[504] = 6, -- Unstable Catalyst
			[505] = 3.73, -- Tradewinds
		})

		-- Enhancement
		insertDefaultScalesData(defaultName, 7, 2, {
			[13] = 0.06, -- Azerite Empowered
			[17] = 0.03, -- Astral Shift
			[18] = 1.87, -- Blood Siphon
			[19] = 0.06, -- Woundbinder
			[20] = 2.08, -- Lifespeed
			[21] = 2.22, -- Elemental Whirl
			[22] = 3.66, -- Heed My Call
			[30] = 4, -- Overwhelming Power
			[31] = 3.36, -- Gutripper
			[38] = 1.92, -- On My Way
			[44] = 0.06, -- Vampiric Speed
			[82] = 7.2, -- Champion of Azeroth
			[83] = 0.06, -- Impassive Visage
			[86] = 0.03, -- Azerite Fortification
			[87] = 0.08, -- Self Reliance
			[103] = 0.08, -- Concentrated Mending
			[137] = 5.71, -- Primal Primer
			[156] = 4.78, -- Ruinous Bolt
			[157] = 8.24, -- Rezan's Fury
			[179] = 10, -- Strength of Earth
			[192] = 5.18, -- Meticulous Scheming
			[193] = 6.88, -- Blightborne Infusion
			[194] = 7.23, -- Filthy Transfusion
			[195] = 5.9, -- Secrets of the Deep
			[196] = 6.14, -- Swirling Sands
			[207] = 0.03, -- Serene Spirit
			[223] = 3.34, -- Lightning Conduit
			[416] = 6.27, -- Natural Harmony
			[417] = 3.58, -- Rumbling Tremors
			[420] = 9.07, -- Roiling Storm
			[447] = 5.79, -- Ancestral Resonance
			[459] = 2.24, -- Unstable Flames
			[462] = 2.24, -- Azerite Globules
			[463] = 0.11, -- Blessed Portents
			[478] = 8, -- Tidal Surge
			[479] = 9.5, -- Dagger in the Back
			[480] = 4.27, -- Blood Rite
			[481] = 4.59, -- Incite the Pack
			[482] = 6.94, -- Thunderous Blast
			[483] = 6.35, -- Archive of the Titans
			[485] = 7.2, -- Laser Matrix
			[504] = 6.8, -- Unstable Catalyst
			[505] = 4.86, -- Tradewinds
		})

		-- Restoration
		insertDefaultScalesData(defaultName, 7, 3, {

		})

	-- Mage
		-- Arcane
		insertDefaultScalesData(defaultName, 8, 1, {
			[18] = 2.48, -- Blood Siphon
			[20] = 1.69, -- Lifespeed
			[21] = 2.33, -- Elemental Whirl
			[22] = 3.64, -- Heed My Call
			[30] = 2.82, -- Overwhelming Power
			[31] = 3.35, -- Gutripper
			[38] = 2.27, -- On My Way
			[82] = 7.45, -- Champion of Azeroth
			[83] = 0.09, -- Impassive Visage
			[88] = 3.55, -- Arcane Pummeling
			[127] = 2.53, -- Anomalous Impact
			[156] = 5.62, -- Ruinous Bolt
			[157] = 8.73, -- Rezan's Fury
			[167] = 4.63, -- Brain Storm
			[192] = 2.36, -- Meticulous Scheming
			[193] = 8.12, -- Blightborne Infusion
			[194] = 7.65, -- Filthy Transfusion
			[195] = 7.04, -- Secrets of the Deep
			[196] = 6.2, -- Swirling Sands
			[214] = 4.37, -- Arcane Pressure
			[374] = 9.28, -- Galvanizing Spark
			[459] = 2.68, -- Unstable Flames
			[462] = 2.36, -- Azerite Globules
			[478] = 9.39, -- Tidal Surge
			[479] = 10, -- Dagger in the Back
			[480] = 3.61, -- Blood Rite
			[481] = 5.79, -- Incite the Pack
			[482] = 7.1, -- Thunderous Blast
			[483] = 7.82, -- Archive of the Titans
			[485] = 7.45, -- Laser Matrix
			[504] = 7.77, -- Unstable Catalyst
			[505] = 6.2, -- Tradewinds
		})

		-- Fire
		insertDefaultScalesData(defaultName, 8, 2, {
			[18] = 1.6, -- Blood Siphon
			[20] = 1.34, -- Lifespeed
			[21] = 1.6, -- Elemental Whirl
			[22] = 3.03, -- Heed My Call
			[30] = 2.55, -- Overwhelming Power
			[31] = 2.81, -- Gutripper
			[38] = 1.58, -- On My Way
			[82] = 5.15, -- Champion of Azeroth
			[128] = 4.81, -- Flames of Alacrity
			[156] = 4.62, -- Ruinous Bolt
			[157] = 7.03, -- Rezan's Fury
			[168] = 3.27, -- Preheat
			[192] = 2.62, -- Meticulous Scheming
			[193] = 5.1, -- Blightborne Infusion
			[194] = 6.05, -- Filthy Transfusion
			[195] = 4.7, -- Secrets of the Deep
			[196] = 4.39, -- Swirling Sands
			[215] = 6.62, -- Blaster Master
			[376] = 3.46, -- Trailing Embers
			[377] = 10, -- Duplicative Incineration
			[378] = 5.24, -- Firemind
			[459] = 1.55, -- Unstable Flames
			[462] = 1.96, -- Azerite Globules
			[478] = 8, -- Tidal Surge
			[479] = 7.98, -- Dagger in the Back
			[480] = 3.1, -- Blood Rite
			[481] = 3.93, -- Incite the Pack
			[482] = 6.1, -- Thunderous Blast
			[483] = 5, -- Archive of the Titans
			[485] = 6.27, -- Laser Matrix
			[504] = 5.65, -- Unstable Catalyst
			[505] = 4.22, -- Tradewinds
		})

		-- Frost
		insertDefaultScalesData(defaultName, 8, 3, {
			[13] = 0.12, -- Azerite Empowered
			[14] = 0.21, -- Longstrider
			[15] = 0.03, -- Resounding Protection
			[18] = 2.15, -- Blood Siphon
			[20] = 2.51, -- Lifespeed
			[21] = 2.81, -- Elemental Whirl
			[22] = 4.12, -- Heed My Call
			[30] = 4.36, -- Overwhelming Power
			[31] = 3.47, -- Gutripper
			[38] = 2.42, -- On My Way
			[44] = 0.15, -- Vampiric Speed
			[82] = 8.09, -- Champion of Azeroth
			[83] = 0.21, -- Impassive Visage
			[84] = 0.24, -- Bulwark of the Masses
			[85] = 0.18, -- Gemhide
			[86] = 0.09, -- Azerite Fortification
			[87] = 0.3, -- Self Reliance
			[132] = 7.29, -- Packed Ice
			[156] = 5.98, -- Ruinous Bolt
			[157] = 8.93, -- Rezan's Fury
			[170] = 5.71, -- Winter's Reach
			[192] = 4.93, -- Meticulous Scheming
			[193] = 8.39, -- Blightborne Infusion
			[194] = 7.92, -- Filthy Transfusion
			[195] = 7.05, -- Secrets of the Deep
			[196] = 7.29, -- Swirling Sands
			[205] = 0.15, -- Eldritch Warding
			[225] = 7.35, -- Glacial Assault
			[379] = 8.03, -- Tunnel of Ice
			[380] = 7.65, -- Whiteout
			[381] = 7.29, -- Frigid Grasp
			[459] = 3.17, -- Unstable Flames
			[462] = 2.81, -- Azerite Globules
			[468] = 0.03, -- Cauterizing Blink
			[478] = 9.32, -- Tidal Surge
			[479] = 10, -- Dagger in the Back
			[480] = 5.11, -- Blood Rite
			[481] = 5.23, -- Incite the Pack
			[482] = 7.53, -- Thunderous Blast
			[483] = 7.59, -- Archive of the Titans
			[485] = 7.92, -- Laser Matrix
			[504] = 8.24, -- Unstable Catalyst
			[505] = 5.68, -- Tradewinds
		})

	-- Warlock
		-- Affliction
		insertDefaultScalesData(defaultName, 9, 1, {
			[13] = 0.09, -- Azerite Empowered
			[14] = 0.17, -- Longstrider
			[15] = 0.17, -- Resounding Protection
			[18] = 2.63, -- Blood Siphon
			[20] = 2.53, -- Lifespeed
			[21] = 2.66, -- Elemental Whirl
			[22] = 3.79, -- Heed My Call
			[30] = 4.75, -- Overwhelming Power
			[31] = 3.6, -- Gutripper
			[38] = 2.23, -- On My Way
			[82] = 8.13, -- Champion of Azeroth
			[83] = 0.03, -- Impassive Visage
			[84] = 0.06, -- Bulwark of the Masses
			[85] = 0.11, -- Gemhide
			[86] = 0.09, -- Azerite Fortification
			[87] = 0.17, -- Self Reliance
			[123] = 8.66, -- Wracking Brilliance
			[156] = 5.18, -- Ruinous Bolt
			[157] = 8.64, -- Rezan's Fury
			[183] = 8.99, -- Inevitable Demise
			[192] = 6.04, -- Meticulous Scheming
			[193] = 7.54, -- Blightborne Infusion
			[194] = 8.32, -- Filthy Transfusion
			[195] = 6.25, -- Secrets of the Deep
			[196] = 6.49, -- Swirling Sands
			[208] = 0.11, -- Lifeblood
			[230] = 6.95, -- Cascading Calamity
			[425] = 7, -- Sudden Onset
			[426] = 3.22, -- Dreadful Calling
			[442] = 0.14, -- Deathbloom
			[459] = 2.5, -- Unstable Flames
			[462] = 2.53, -- Azerite Globules
			[475] = 0.14, -- Desperate Power
			[478] = 8.42, -- Tidal Surge
			[479] = 10, -- Dagger in the Back
			[480] = 5.07, -- Blood Rite
			[481] = 6.09, -- Incite the Pack
			[482] = 7.7, -- Thunderous Blast
			[483] = 6.71, -- Archive of the Titans
			[485] = 7.81, -- Laser Matrix
			[504] = 7.19, -- Unstable Catalyst
			[505] = 6.68, -- Tradewinds
		})

		-- Demonology
		insertDefaultScalesData(defaultName, 9, 2, {
			[13] = 0.12, -- Azerite Empowered
			[14] = 0.15, -- Longstrider
			[15] = 0.12, -- Resounding Protection
			[18] = 2.31, -- Blood Siphon
			[20] = 1.94, -- Lifespeed
			[21] = 2.45, -- Elemental Whirl
			[22] = 3.72, -- Heed My Call
			[30] = 3.98, -- Overwhelming Power
			[31] = 3.23, -- Gutripper
			[38] = 2.22, -- On My Way
			[44] = 0.03, -- Vampiric Speed
			[82] = 7.53, -- Champion of Azeroth
			[83] = 0.09, -- Impassive Visage
			[85] = 0.12, -- Gemhide
			[87] = 0.03, -- Self Reliance
			[130] = 10, -- Shadow's Bite
			[156] = 5.08, -- Ruinous Bolt
			[157] = 8.42, -- Rezan's Fury
			[190] = 5.45, -- Umbral Blaze
			[192] = 4.33, -- Meticulous Scheming
			[193] = 7.27, -- Blightborne Infusion
			[194] = 7.44, -- Filthy Transfusion
			[195] = 6.69, -- Secrets of the Deep
			[196] = 5.25, -- Swirling Sands
			[208] = 0.03, -- Lifeblood
			[231] = 0.09, -- Explosive Potential
			[428] = 8.36, -- Demonic Meteor
			[429] = 5.28, -- Forbidden Knowledge
			[443] = 0.06, -- Excoriate
			[458] = 9.17, -- Supreme Commander
			[459] = 2.6, -- Unstable Flames
			[462] = 2.43, -- Azerite Globules
			[475] = 0.09, -- Desperate Power
			[478] = 8.39, -- Tidal Surge
			[479] = 9.72, -- Dagger in the Back
			[480] = 4.33, -- Blood Rite
			[481] = 5.37, -- Incite the Pack
			[482] = 7.01, -- Thunderous Blast
			[483] = 7.15, -- Archive of the Titans
			[485] = 7.47, -- Laser Matrix
			[504] = 7.09, -- Unstable Catalyst
			[505] = 5.97, -- Tradewinds
		})

		-- Destruction
		insertDefaultScalesData(defaultName, 9, 3, {
			[15] = 0.2, -- Resounding Protection
			[18] = 2.74, -- Blood Siphon
			[20] = 3.31, -- Lifespeed
			[21] = 3.31, -- Elemental Whirl
			[22] = 3.91, -- Heed My Call
			[30] = 5.97, -- Overwhelming Power
			[31] = 3.62, -- Gutripper
			[38] = 2.67, -- On My Way
			[44] = 0.04, -- Vampiric Speed
			[82] = 9.78, -- Champion of Azeroth
			[83] = 0.16, -- Impassive Visage
			[84] = 0.23, -- Bulwark of the Masses
			[85] = 0.26, -- Gemhide
			[86] = 0.04, -- Azerite Fortification
			[131] = 0.13, -- Accelerant
			[156] = 5.37, -- Ruinous Bolt
			[157] = 8.74, -- Rezan's Fury
			[192] = 7.12, -- Meticulous Scheming
			[193] = 9.31, -- Blightborne Infusion
			[194] = 8.2, -- Filthy Transfusion
			[195] = 7.24, -- Secrets of the Deep
			[196] = 7.62, -- Swirling Sands
			[208] = 0.13, -- Lifeblood
			[232] = 7.12, -- Flashpoint
			[431] = 0.26, -- Rolling Havoc
			[432] = 8.35, -- Chaotic Inferno
			[444] = 8.86, -- Crashing Chaos
			[459] = 3.31, -- Unstable Flames
			[460] = 7.27, -- Bursting Flare
			[462] = 2.64, -- Azerite Globules
			[478] = 8.89, -- Tidal Surge
			[479] = 10, -- Dagger in the Back
			[480] = 6.7, -- Blood Rite
			[481] = 6.48, -- Incite the Pack
			[482] = 7.47, -- Thunderous Blast
			[483] = 7.53, -- Archive of the Titans
			[485] = 7.75, -- Laser Matrix
			[504] = 8.07, -- Unstable Catalyst
			[505] = 6.93, -- Tradewinds
		})

	-- Monk
		-- Brewmaster
		insertDefaultScalesData(offensiveName, 10, 1, {
			[13] = 0.19, -- Azerite Empowered
			[15] = 0.1, -- Resounding Protection
			[18] = 1.54, -- Blood Siphon
			[19] = 0.13, -- Woundbinder
			[20] = 1.29, -- Lifespeed
			[21] = 1.64, -- Elemental Whirl
			[22] = 3.77, -- Heed My Call
			[30] = 1.82, -- Overwhelming Power
			[31] = 3.58, -- Gutripper
			[38] = 1.48, -- On My Way
			[42] = 0.1, -- Savior
			[44] = 0.04, -- Vampiric Speed
			[82] = 4.83, -- Champion of Azeroth
			[84] = 0.13, -- Bulwark of the Masses
			[85] = 0.13, -- Gemhide
			[86] = 0.07, -- Azerite Fortification
			[87] = 0.04, -- Self Reliance
			[89] = 0.07, -- Azerite Veins
			[98] = 0.04, -- Crystalline Carapace
			[99] = 0.16, -- Ablative Shielding
			[100] = 0.13, -- Strength in Numbers
			[101] = 0.04, -- Shimmering Haven
			[103] = 0.13, -- Concentrated Mending
			[104] = 0.04, -- Bracing Chill
			[105] = 0.07, -- Ephemeral Recovery
			[116] = 2.32, -- Boiling Brew
			[156] = 5.99, -- Ruinous Bolt
			[157] = 8.69, -- Rezan's Fury
			[192] = 2.89, -- Meticulous Scheming
			[193] = 4.83, -- Blightborne Infusion
			[194] = 7.34, -- Filthy Transfusion
			[195] = 4.61, -- Secrets of the Deep
			[196] = 4.24, -- Swirling Sands
			[218] = 0.07, -- Strength of Spirit
			[238] = 0.16, -- Fit to Burst
			[382] = 0.07, -- Niuzao's Blessing
			[383] = 2.01, -- Training of Niuzao
			[384] = 5.02, -- Elusive Footwork
			[459] = 1.73, -- Unstable Flames
			[462] = 2.54, -- Azerite Globules
			[463] = 0.13, -- Blessed Portents
			[470] = 0.07, -- Sweep the Leg
			[478] = 10, -- Tidal Surge
			[479] = 6.84, -- Dagger in the Back
			[480] = 2.39, -- Blood Rite
			[481] = 3.48, -- Incite the Pack
			[482] = 7.06, -- Thunderous Blast
			[483] = 4.9, -- Archive of the Titans
			[485] = 7.43, -- Laser Matrix
			[504] = 5.08, -- Unstable Catalyst
			[505] = 3.64, -- Tradewinds
		})
		insertDefaultScalesData(defensiveName, 10, 1, {
			[13] = 0.02, -- Azerite Empowered
			[14] = 0.01, -- Longstrider
			[15] = 10, -- Resounding Protection
			[18] = 1.28, -- Blood Siphon
			[19] = 0.03, -- Woundbinder
			[21] = 0.05, -- Elemental Whirl
			[22] = 0.02, -- Heed My Call
			[31] = 0.01, -- Gutripper
			[38] = 0.14, -- On My Way
			[42] = 0.01, -- Savior
			[43] = 0.01, -- Winds of War
			[44] = 0.02, -- Vampiric Speed
			[82] = 0.17, -- Champion of Azeroth
			[83] = 0.01, -- Impassive Visage
			[84] = 0.01, -- Bulwark of the Masses
			[85] = 0.03, -- Gemhide
			[86] = 0.01, -- Azerite Fortification
			[87] = 0.02, -- Self Reliance
			[89] = 0.01, -- Azerite Veins
			[98] = 0.02, -- Crystalline Carapace
			[100] = 0.01, -- Strength in Numbers
			[101] = 0.03, -- Shimmering Haven
			[103] = 0.02, -- Concentrated Mending
			[104] = 0.01, -- Bracing Chill
			[105] = 0.01, -- Ephemeral Recovery
			[116] = 8.15, -- Boiling Brew
			[156] = 0.03, -- Ruinous Bolt
			[157] = 0.02, -- Rezan's Fury
			[186] = 0.79, -- Staggering Strikes
			[193] = 0.44, -- Blightborne Infusion
			[194] = 0.02, -- Filthy Transfusion
			[195] = 0.34, -- Secrets of the Deep
			[196] = 0.4, -- Swirling Sands
			[218] = 0.01, -- Strength of Spirit
			[238] = 0.03, -- Fit to Burst
			[382] = 0.03, -- Niuzao's Blessing
			[383] = 0.16, -- Training of Niuzao
			[384] = 0.05, -- Elusive Footwork
			[459] = 0.17, -- Unstable Flames
			[462] = 0.01, -- Azerite Globules
			[463] = 0.03, -- Blessed Portents
			[470] = 0.02, -- Sweep the Leg
			[478] = 0.02, -- Tidal Surge
			[479] = 0.02, -- Dagger in the Back
			[481] = 0.29, -- Incite the Pack
			[482] = 0.02, -- Thunderous Blast
			[483] = 0.4, -- Archive of the Titans
			[504] = 0.38, -- Unstable Catalyst
			[505] = 0.28, -- Tradewinds
		})

		-- Mistweaver
		insertDefaultScalesData(defaultName, 10, 2, {

		})

		-- Windwalker
		insertDefaultScalesData(defaultName, 10, 3, {
			[13] = 0.12, -- Azerite Empowered
			[15] = 0.15, -- Resounding Protection
			[18] = 2.02, -- Blood Siphon
			[19] = 0.15, -- Woundbinder
			[20] = 2.6, -- Lifespeed
			[21] = 2.4, -- Elemental Whirl
			[22] = 3.85, -- Heed My Call
			[30] = 3.5, -- Overwhelming Power
			[31] = 3.33, -- Gutripper
			[38] = 2.4, -- On My Way
			[42] = 0.15, -- Savior
			[82] = 7.91, -- Champion of Azeroth
			[84] = 0.09, -- Bulwark of the Masses
			[85] = 0.09, -- Gemhide
			[86] = 0.06, -- Azerite Fortification
			[87] = 0.3, -- Self Reliance
			[89] = 0.18, -- Azerite Veins
			[99] = 0.18, -- Ablative Shielding
			[100] = 0.18, -- Strength in Numbers
			[101] = 0.27, -- Shimmering Haven
			[103] = 0.18, -- Concentrated Mending
			[105] = 0.12, -- Ephemeral Recovery
			[117] = 0.06, -- Iron Fists
			[156] = 5.98, -- Ruinous Bolt
			[157] = 8.52, -- Rezan's Fury
			[184] = 7.09, -- Sunrise Technique
			[192] = 4.93, -- Meticulous Scheming
			[193] = 7.32, -- Blightborne Infusion
			[194] = 7.26, -- Filthy Transfusion
			[195] = 5.72, -- Secrets of the Deep
			[196] = 6.19, -- Swirling Sands
			[218] = 0.15, -- Strength of Spirit
			[388] = 3.74, -- Swift Roundhouse
			[389] = 8.02, -- Open Palm Strikes
			[390] = 6.8, -- Pressure Point
			[391] = 9.54, -- Meridian Strikes
			[459] = 2.72, -- Unstable Flames
			[462] = 2.48, -- Azerite Globules
			[463] = 0.06, -- Blessed Portents
			[470] = 0.09, -- Sweep the Leg
			[478] = 10, -- Tidal Surge
			[479] = 9.71, -- Dagger in the Back
			[480] = 4.73, -- Blood Rite
			[481] = 4.82, -- Incite the Pack
			[482] = 6.91, -- Thunderous Blast
			[483] = 6.04, -- Archive of the Titans
			[485] = 7.09, -- Laser Matrix
			[504] = 6.51, -- Unstable Catalyst
			[505] = 5.19, -- Tradewinds
		})

	-- Druid
		-- Balance
		insertDefaultScalesData(defaultName, 11, 1, {
			[18] = 1.74, -- Blood Siphon
			[20] = 2.1, -- Lifespeed
			[21] = 2.27, -- Elemental Whirl
			[22] = 3.83, -- Heed My Call
			[30] = 4.53, -- Overwhelming Power
			[31] = 3.41, -- Gutripper
			[38] = 2.04, -- On My Way
			[43] = 0.06, -- Winds of War
			[44] = 0.03, -- Vampiric Speed
			[82] = 7.6, -- Champion of Azeroth
			[122] = 7.35, -- Streaking Stars
			[156] = 4.78, -- Ruinous Bolt
			[157] = 8.69, -- Rezan's Fury
			[173] = 1.32, -- Power of the Moon
			[192] = 5.87, -- Meticulous Scheming
			[193] = 7.3, -- Blightborne Infusion
			[194] = 7.8, -- Filthy Transfusion
			[195] = 6.49, -- Secrets of the Deep
			[196] = 6.26, -- Swirling Sands
			[200] = 4.75, -- Sunblaze
			[250] = 6.68, -- Dawning Sun
			[356] = 1.49, -- High Noon
			[364] = 7.02, -- Lively Spirit
			[459] = 2.3, -- Unstable Flames
			[462] = 2.49, -- Azerite Globules
			[478] = 7.97, -- Tidal Surge
			[479] = 10, -- Dagger in the Back
			[480] = 4.64, -- Blood Rite
			[481] = 4.61, -- Incite the Pack
			[482] = 7.52, -- Thunderous Blast
			[483] = 6.88, -- Archive of the Titans
			[485] = 7.6, -- Laser Matrix
			[504] = 7.35, -- Unstable Catalyst
			[505] = 4.95, -- Tradewinds
		})

		-- Feral
		insertDefaultScalesData(defaultName, 11, 2, {
			[18] = 1.65, -- Blood Siphon
			[20] = 2.37, -- Lifespeed
			[21] = 2.43, -- Elemental Whirl
			[22] = 3.81, -- Heed My Call
			[30] = 4.79, -- Overwhelming Power
			[31] = 3.36, -- Gutripper
			[38] = 2.05, -- On My Way
			[82] = 7.74, -- Champion of Azeroth
			[84] = 0.03, -- Bulwark of the Masses
			[86] = 0.06, -- Azerite Fortification
			[105] = 0.08, -- Ephemeral Recovery
			[111] = 6.89, -- Blood Mist
			[156] = 4.77, -- Ruinous Bolt
			[157] = 8.57, -- Rezan's Fury
			[169] = 10, -- Raking Ferocity
			[192] = 6.52, -- Meticulous Scheming
			[193] = 7.69, -- Blightborne Infusion
			[194] = 7.16, -- Filthy Transfusion
			[195] = 6.33, -- Secrets of the Deep
			[196] = 6.89, -- Swirling Sands
			[209] = 5.46, -- Shredding Fury
			[241] = 2, -- Twisted Claws
			[358] = 6.31, -- Gushing Lacerations
			[359] = 7.53, -- Wild Fleshrending
			[459] = 2.8, -- Unstable Flames
			[462] = 2.4, -- Azerite Globules
			[463] = 0.06, -- Blessed Portents
			[478] = 8.06, -- Tidal Surge
			[479] = 9.82, -- Dagger in the Back
			[480] = 5.06, -- Blood Rite
			[481] = 4.07, -- Incite the Pack
			[482] = 7.16, -- Thunderous Blast
			[483] = 6.95, -- Archive of the Titans
			[485] = 7.64, -- Laser Matrix
			[504] = 7, -- Unstable Catalyst
			[505] = 4.5, -- Tradewinds
		})

		-- Guardian
		insertDefaultScalesData(offensiveName, 11, 3, {
			[18] = 1.5, -- Blood Siphon
			[19] = 0.04, -- Woundbinder
			[20] = 1.56, -- Lifespeed
			[21] = 1.66, -- Elemental Whirl
			[22] = 4.39, -- Heed My Call
			[30] = 3.02, -- Overwhelming Power
			[31] = 4.1, -- Gutripper
			[38] = 1.56, -- On My Way
			[42] = 0.07, -- Savior
			[82] = 5.62, -- Champion of Azeroth
			[100] = 0.04, -- Strength in Numbers
			[101] = 0.04, -- Shimmering Haven
			[104] = 0.04, -- Bracing Chill
			[112] = 1.21, -- Layered Mane
			[156] = 5.95, -- Ruinous Bolt
			[157] = 10, -- Rezan's Fury
			[171] = 0.04, -- Masterful Instincts
			[192] = 4.16, -- Meticulous Scheming
			[193] = 4.97, -- Blightborne Infusion
			[194] = 8.51, -- Filthy Transfusion
			[195] = 4.52, -- Secrets of the Deep
			[196] = 4.55, -- Swirling Sands
			[241] = 5.33, -- Twisted Claws
			[359] = 1.04, -- Wild Fleshrending
			[361] = 4.32, -- Guardian's Wrath
			[459] = 1.76, -- Unstable Flames
			[462] = 2.93, -- Azerite Globules
			[478] = 9.88, -- Tidal Surge
			[479] = 7.96, -- Dagger in the Back
			[480] = 3.22, -- Blood Rite
			[481] = 3.67, -- Incite the Pack
			[482] = 8.41, -- Thunderous Blast
			[483] = 4.88, -- Archive of the Titans
			[485] = 8.97, -- Laser Matrix
			[504] = 4.97, -- Unstable Catalyst
			[505] = 3.9, -- Tradewinds
		})
		-- Guardian
		insertDefaultScalesData(defensiveName, 11, 3, {
			[15] = 0.06, -- Resounding Protection
			[18] = 10, -- Blood Siphon
			[20] = 0.06, -- Lifespeed
			[22] = 0.06, -- Heed My Call
			[30] = 0.06, -- Overwhelming Power
			[42] = 0.06, -- Savior
			[43] = 0.06, -- Winds of War
			[83] = 0.06, -- Impassive Visage
			[84] = 0.06, -- Bulwark of the Masses
			[85] = 0.06, -- Gemhide
			[86] = 0.06, -- Azerite Fortification
			[219] = 0.06, -- Reawakening
			[241] = 0.06, -- Twisted Claws
			[251] = 0.06, -- Craggy Bark
			[463] = 0.06, -- Blessed Portents
			[478] = 0.06, -- Tidal Surge
			[504] = 0.06, -- Unstable Catalyst
		})

		-- Restoration
		insertDefaultScalesData(defaultName, 11, 4, {

		})

	-- Demon Hunter
		-- Havoc
		insertDefaultScalesData(defaultName, 12, 1, {
			[14] = 0.02, -- Longstrider
			[18] = 1.1, -- Blood Siphon
			[20] = 1.36, -- Lifespeed
			[21] = 1.48, -- Elemental Whirl
			[22] = 3.25, -- Heed My Call
			[30] = 2.93, -- Overwhelming Power
			[31] = 3.01, -- Gutripper
			[38] = 1.34, -- On My Way
			[43] = 0.02, -- Winds of War
			[44] = 0.02, -- Vampiric Speed
			[82] = 4.79, -- Champion of Azeroth
			[87] = 0.02, -- Self Reliance
			[89] = 0.06, -- Azerite Veins
			[98] = 0.02, -- Crystalline Carapace
			[99] = 0.04, -- Ablative Shielding
			[101] = 0.04, -- Shimmering Haven
			[126] = 8.13, -- Revolving Blades
			[156] = 4.13, -- Ruinous Bolt
			[157] = 7.34, -- Rezan's Fury
			[159] = 5.54, -- Furious Gaze
			[192] = 3.51, -- Meticulous Scheming
			[193] = 5.22, -- Blightborne Infusion
			[194] = 6.7, -- Filthy Transfusion
			[195] = 4.79, -- Secrets of the Deep
			[196] = 4.71, -- Swirling Sands
			[220] = 5.22, -- Unbound Chaos
			[245] = 4.43, -- Seething Power
			[352] = 10, -- Thirsting Blades
			[353] = 2.83, -- Eyes of Rage
			[459] = 1.88, -- Unstable Flames
			[462] = 2.1, -- Azerite Globules
			[478] = 6.96, -- Tidal Surge
			[479] = 8.43, -- Dagger in the Back
			[480] = 2.79, -- Blood Rite
			[481] = 2.67, -- Incite the Pack
			[482] = 6.38, -- Thunderous Blast
			[483] = 5.08, -- Archive of the Titans
			[485] = 6.5, -- Laser Matrix
			[504] = 5.46, -- Unstable Catalyst
			[505] = 2.95, -- Tradewinds
		})

		-- Vengeance
		insertDefaultScalesData(offensiveName, 12, 2, {
			[13] = 0.13, -- Azerite Empowered
			[14] = 0.04, -- Longstrider
			[15] = 0.13, -- Resounding Protection
			[18] = 1.74, -- Blood Siphon
			[20] = 1.27, -- Lifespeed
			[21] = 1.77, -- Elemental Whirl
			[22] = 4.39, -- Heed My Call
			[30] = 2.69, -- Overwhelming Power
			[31] = 4.04, -- Gutripper
			[38] = 1.39, -- On My Way
			[43] = 0.19, -- Winds of War
			[82] = 5.46, -- Champion of Azeroth
			[83] = 0.07, -- Impassive Visage
			[84] = 0.13, -- Bulwark of the Masses
			[85] = 0.07, -- Gemhide
			[86] = 0.16, -- Azerite Fortification
			[87] = 0.1, -- Self Reliance
			[89] = 0.19, -- Azerite Veins
			[99] = 0.1, -- Ablative Shielding
			[100] = 0.04, -- Strength in Numbers
			[101] = 0.07, -- Shimmering Haven
			[134] = 0.04, -- Revel in Pain
			[156] = 5.9, -- Ruinous Bolt
			[157] = 10, -- Rezan's Fury
			[160] = 0.1, -- Infernal Armor
			[192] = 3.82, -- Meticulous Scheming
			[193] = 6.06, -- Blightborne Infusion
			[194] = 9.22, -- Filthy Transfusion
			[195] = 5.05, -- Secrets of the Deep
			[196] = 5.4, -- Swirling Sands
			[202] = 0.16, -- Soulmonger
			[221] = 0.1, -- Rigid Carapace
			[246] = 0.13, -- Gaping Maw
			[354] = 0.1, -- Cycle of Binding
			[355] = 0.07, -- Essence Sever
			[459] = 2.15, -- Unstable Flames
			[462] = 3, -- Azerite Globules
			[466] = 0.13, -- Burning Soul
			[478] = 9.91, -- Tidal Surge
			[479] = 8.02, -- Dagger in the Back
			[480] = 3, -- Blood Rite
			[481] = 3.92, -- Incite the Pack
			[482] = 8.62, -- Thunderous Blast
			[483] = 5.43, -- Archive of the Titans
			[485] = 8.46, -- Laser Matrix
			[504] = 5.59, -- Unstable Catalyst
			[505] = 4.23, -- Tradewinds
		})
		insertDefaultScalesData(defensiveName, 12, 2, {
			[13] = 0.01, -- Azerite Empowered
			[15] = 10, -- Resounding Protection
			[18] = 1.54, -- Blood Siphon
			[20] = 0.54, -- Lifespeed
			[21] = 0.45, -- Elemental Whirl
			[30] = 1.05, -- Overwhelming Power
			[38] = 0.26, -- On My Way
			[82] = 1.37, -- Champion of Azeroth
			[89] = 0.02, -- Azerite Veins
			[99] = 0.01, -- Ablative Shielding
			[192] = 1.61, -- Meticulous Scheming
			[193] = 1.05, -- Blightborne Infusion
			[195] = 0.94, -- Secrets of the Deep
			[196] = 0.91, -- Swirling Sands
			[221] = 0.01, -- Rigid Carapace
			[246] = 0.02, -- Gaping Maw
			[459] = 0.35, -- Unstable Flames
			[462] = 0.01, -- Azerite Globules
			[466] = 0.04, -- Burning Soul
			[480] = 1.18, -- Blood Rite
			[481] = 0.73, -- Incite the Pack
			[483] = 1.02, -- Archive of the Titans
			[504] = 1.07, -- Unstable Catalyst
			[505] = 0.81, -- Tradewinds
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