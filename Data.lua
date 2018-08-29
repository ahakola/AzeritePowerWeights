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
	["role"] = {
		["tank"] = {
			{
				["icon"] = 1029596,
				["name"] = "Winds of War",
				["azeritePowerID"] = 43,
			}, -- [1]
			{
				["icon"] = 1129419,
				["name"] = "Azerite Veins",
				["azeritePowerID"] = 89,
			}, -- [2]
			{
				["icon"] = 134978,
				["name"] = "Crystalline Carapace",
				["azeritePowerID"] = 98,
			}, -- [3]
			{
				["icon"] = 645224,
				["name"] = "Ablative Shielding",
				["azeritePowerID"] = 99,
			}, -- [4]
			{
				["icon"] = 136031,
				["name"] = "Strength in Numbers",
				["azeritePowerID"] = 100,
			}, -- [5]
			{
				["icon"] = 1323035,
				["name"] = "Shimmering Haven",
				["azeritePowerID"] = 101,
			}, -- [6]
		},
		["nonhealer"] = {
			{
				["icon"] = 1029585,
				["name"] = "Elemental Whirl",
				["azeritePowerID"] = 21,
			}, -- [1]
			{
				["icon"] = 252174,
				["name"] = "Overwhelming Power",
				["azeritePowerID"] = 30,
			}, -- [2]
			{
				["icon"] = 132109,
				["name"] = "Gutripper",
				["azeritePowerID"] = 31,
			}, -- [3]
			{
				["icon"] = 646670,
				["name"] = "Azerite Globules",
				["azeritePowerID"] = 462,
			}, -- [4]
		},
		["healer"] = {
			{
				["icon"] = 463526,
				["name"] = "Woundbinder",
				["azeritePowerID"] = 19,
			}, -- [1]
			{
				["icon"] = 413576,
				["name"] = "Savior",
				["azeritePowerID"] = 42,
			}, -- [2]
			{
				["icon"] = 513195,
				["name"] = "Synergistic Growth",
				["azeritePowerID"] = 102,
			}, -- [3]
			{
				["icon"] = 970412,
				["name"] = "Concentrated Mending",
				["azeritePowerID"] = 103,
			}, -- [4]
			{
				["icon"] = 236832,
				["name"] = "Bracing Chill",
				["azeritePowerID"] = 104,
			}, -- [5]
			{
				["icon"] = 133020,
				["name"] = "Ephemeral Recovery",
				["azeritePowerID"] = 105,
			}, -- [6]
			{
				["icon"] = 135905,
				["name"] = "Blessed Portents",
				["azeritePowerID"] = 463,
			}, -- [7]
		},
		["common"] = {
			{
				["icon"] = 538560,
				["name"] = "Blood Siphon",
				["azeritePowerID"] = 18,
			}, -- [1]
			{
				["icon"] = 236166,
				["name"] = "Lifespeed",
				["azeritePowerID"] = 20,
			}, -- [2]
			{
				["icon"] = 237589,
				["name"] = "Heed My Call",
				["azeritePowerID"] = 22,
			}, -- [3]
			{
				["icon"] = 132565,
				["name"] = "On My Way",
				["azeritePowerID"] = 38,
			}, -- [4]
			{
				["icon"] = 514016,
				["name"] = "Unstable Flames",
				["azeritePowerID"] = 459,
			}, -- [5]
			{
				["icon"] = 2065623,
				["name"] = "Earthlink",
				["azeritePowerID"] = 461,
			}, -- [6]
		},
	},
	["center"] = {
		["icon"] = 2065624,
		["name"] = "Azerite Empowered",
		["azeritePowerID"] = 13,
	},
	["zone"] = {
		{
			["icon"] = 135885,
			["name"] = "Champion of Azeroth",
			["azeritePowerID"] = 82,
		}, -- [1]
		{
			["icon"] = 135780,
			["name"] = "Ruinous Bolt",
			["azeritePowerID"] = 156,
		}, -- [2]
		{
			["icon"] = 2011133,
			["name"] = "Rezan's Fury",
			["azeritePowerID"] = 157,
		}, -- [3]
		{
			["icon"] = 132299,
			["name"] = "Meticulous Scheming",
			["azeritePowerID"] = 192,
		}, -- [4]
		{
			["icon"] = 1778229,
			["name"] = "Blightborne Infusion",
			["azeritePowerID"] = 193,
		}, -- [5]
		{
			["icon"] = 840409,
			["name"] = "Filthy Transfusion",
			["azeritePowerID"] = 194,
		}, -- [6]
		{
			["icon"] = 463858,
			["name"] = "Secrets of the Deep",
			["azeritePowerID"] = 195,
		}, -- [7]
		{
			["icon"] = 796638,
			["name"] = "Swirling Sands",
			["azeritePowerID"] = 196,
		}, -- [8]
		{
			["icon"] = 1698701,
			["name"] = "Tidal Surge",
			["azeritePowerID"] = 478,
		}, -- [9]
		{
			["icon"] = 135642,
			["name"] = "Dagger in the Back",
			["azeritePowerID"] = 479,
		}, -- [10]
		{
			["icon"] = 463568,
			["name"] = "Blood Rite",
			["azeritePowerID"] = 480,
		}, -- [11]
		{
			["icon"] = 132193,
			["name"] = "Incite the Pack",
			["azeritePowerID"] = 481,
		}, -- [12]
		{
			["icon"] = 839983,
			["name"] = "Thunderous Blast",
			["azeritePowerID"] = 482,
		}, -- [13]
		{
			["icon"] = 2032578,
			["name"] = "Unstable Catalyst",
			["azeritePowerID"] = 504,
		}, -- [14]
		{
			["icon"] = 1029595,
			["name"] = "Tradewinds",
			["azeritePowerID"] = 505,
		}, -- [15]
	},
	["raid"] = {
		{
			["icon"] = 2000853,
			["name"] = "Archive of the Titans",
			["azeritePowerID"] = 483,
		}, -- [1]
		{
			["icon"] = 136039,
			["name"] = "Laser Matrix",
			["azeritePowerID"] = 485,
		}, -- [2]
	},
	["class"] = {
		{
			[73] = {
				{
					["icon"] = 136105,
					["name"] = "Deafening Crash",
					["azeritePowerID"] = 118,
				}, -- [1]
				{
					["icon"] = 1377132,
					["name"] = "Bloodsport",
					["azeritePowerID"] = 177,
				}, -- [2]
				{
					["icon"] = 134952,
					["name"] = "Reinforced Plating",
					["azeritePowerID"] = 237,
				}, -- [3]
				{
					["icon"] = 132353,
					["name"] = "Callous Reprisal",
					["azeritePowerID"] = 440,
				}, -- [4]
				{
					["icon"] = 942783,
					["name"] = "Iron Fortress",
					["azeritePowerID"] = 441,
				}, -- [5]
				{
					["icon"] = 134951,
					["name"] = "Brace for Impact",
					["azeritePowerID"] = 450,
				}, -- [6]
			},
			[71] = {
				{
					["icon"] = 132355,
					["name"] = "Executioner's Precision",
					["azeritePowerID"] = 121,
				}, -- [1]
				{
					["icon"] = 236303,
					["name"] = "Gathering Storm",
					["azeritePowerID"] = 174,
				}, -- [2]
				{
					["icon"] = 236314,
					["name"] = "Test of Might",
					["azeritePowerID"] = 226,
				}, -- [3]
				{
					["icon"] = 132223,
					["name"] = "Seismic Wave",
					["azeritePowerID"] = 433,
				}, -- [4]
				{
					["icon"] = 132340,
					["name"] = "Crushing Assault",
					["azeritePowerID"] = 434,
				}, -- [5]
				{
					["icon"] = 464973,
					["name"] = "Lord of War",
					["azeritePowerID"] = 435,
				}, -- [6]
			},
			[72] = {
				{
					["icon"] = 136088,
					["name"] = "Trample the Weak",
					["azeritePowerID"] = 119,
				}, -- [1]
				{
					["icon"] = 136012,
					["name"] = "Bloodcraze",
					["azeritePowerID"] = 176,
				}, -- [2]
				{
					["icon"] = 132352,
					["name"] = "Pulverizing Blows",
					["azeritePowerID"] = 229,
				}, -- [3]
				{
					["icon"] = 136110,
					["name"] = "Simmering Rage",
					["azeritePowerID"] = 437,
				}, -- [4]
				{
					["icon"] = 132147,
					["name"] = "Reckless Flurry",
					["azeritePowerID"] = 438,
				}, -- [5]
				{
					["icon"] = 458972,
					["name"] = "Infinite Fury",
					["azeritePowerID"] = 451,
				}, -- [6]
			},
		}, -- [1]
		{
			[70] = {
				{
					["icon"] = 135875,
					["name"] = "Avenger's Might",
					["azeritePowerID"] = 125,
				}, -- [1]
				{
					["icon"] = 135897,
					["name"] = "Relentless Inquisitor",
					["azeritePowerID"] = 154,
				}, -- [2]
				{
					["icon"] = 1360757,
					["name"] = "Expurgation",
					["azeritePowerID"] = 187,
				}, -- [3]
				{
					["icon"] = 135959,
					["name"] = "Indomitable Justice",
					["azeritePowerID"] = 235,
				}, -- [4]
				{
					["icon"] = 135986,
					["name"] = "Zealotry",
					["azeritePowerID"] = 396,
				}, -- [5]
				{
					["icon"] = 236250,
					["name"] = "Divine Right",
					["azeritePowerID"] = 453,
				}, -- [6]
			},
			[65] = {
				{
					["icon"] = 1360762,
					["name"] = "Martyr's Breath",
					["azeritePowerID"] = 139,
				}, -- [1]
				{
					["icon"] = 135907,
					["name"] = "Moment of Compassion",
					["azeritePowerID"] = 188,
				}, -- [2]
				{
					["icon"] = 236254,
					["name"] = "Divine Revelations",
					["azeritePowerID"] = 233,
				}, -- [3]
				{
					["icon"] = 135917,
					["name"] = "Grace of the Justicar",
					["azeritePowerID"] = 393,
				}, -- [4]
				{
					["icon"] = 461859,
					["name"] = "Breaking Dawn",
					["azeritePowerID"] = 394,
				}, -- [5]
				{
					["icon"] = 135972,
					["name"] = "Radiant Incandescence",
					["azeritePowerID"] = 452,
				}, -- [6]
			},
			[66] = {
				{
					["icon"] = 135943,
					["name"] = "Bulwark of Light",
					["azeritePowerID"] = 133,
				}, -- [1]
				{
					["icon"] = 135874,
					["name"] = "Soaring Shield",
					["azeritePowerID"] = 150,
				}, -- [2]
				{
					["icon"] = 135919,
					["name"] = "Dauntless Divinity",
					["azeritePowerID"] = 189,
				}, -- [3]
				{
					["icon"] = 236265,
					["name"] = "Inner Light",
					["azeritePowerID"] = 234,
				}, -- [4]
				{
					["icon"] = 133176,
					["name"] = "Inspiring Vanguard",
					["azeritePowerID"] = 395,
				}, -- [5]
				{
					["icon"] = 1603010,
					["name"] = "Judicious Defense",
					["azeritePowerID"] = 454,
				}, -- [6]
			},
		}, -- [2]
		{
			[255] = {
				{
					["icon"] = 451164,
					["name"] = "Wildfire Cluster",
					["azeritePowerID"] = 110,
				}, -- [1]
				{
					["icon"] = 1033905,
					["name"] = "Latent Poison",
					["azeritePowerID"] = 163,
				}, -- [2]
				{
					["icon"] = 136067,
					["name"] = "Venomous Fangs",
					["azeritePowerID"] = 213,
				}, -- [3]
				{
					["icon"] = 2065565,
					["name"] = "Blur of Talons",
					["azeritePowerID"] = 371,
				}, -- [4]
				{
					["icon"] = 132214,
					["name"] = "Wilderness Survival",
					["azeritePowerID"] = 372,
				}, -- [5]
				{
					["icon"] = 135134,
					["name"] = "Up Close And Personal",
					["azeritePowerID"] = 373,
				}, -- [6]
			},
			[254] = {
				{
					["icon"] = 461115,
					["name"] = "In The Rhythm",
					["azeritePowerID"] = 36,
				}, -- [1]
				{
					["icon"] = 132218,
					["name"] = "Arcane Flurry",
					["azeritePowerID"] = 162,
				}, -- [2]
				{
					["icon"] = 132329,
					["name"] = "Unerring Vision",
					["azeritePowerID"] = 212,
				}, -- [3]
				{
					["icon"] = 135130,
					["name"] = "Steady Aim",
					["azeritePowerID"] = 368,
				}, -- [4]
				{
					["icon"] = 132330,
					["name"] = "Rapid Reload",
					["azeritePowerID"] = 369,
				}, -- [5]
				{
					["icon"] = 878211,
					["name"] = "Focused Fire",
					["azeritePowerID"] = 370,
				}, -- [6]
			},
			[253] = {
				{
					["icon"] = 132176,
					["name"] = "Serrated Jaws",
					["azeritePowerID"] = 107,
				}, -- [1]
				{
					["icon"] = 132127,
					["name"] = "Haze of Rage",
					["azeritePowerID"] = 161,
				}, -- [2]
				{
					["icon"] = 132133,
					["name"] = "Dance of Death",
					["azeritePowerID"] = 211,
				}, -- [3]
				{
					["icon"] = 132203,
					["name"] = "Pack Alpha",
					["azeritePowerID"] = 365,
				}, -- [4]
				{
					["icon"] = 136074,
					["name"] = "Primal Instincts",
					["azeritePowerID"] = 366,
				}, -- [5]
				{
					["icon"] = 2058007,
					["name"] = "Feeding Frenzy",
					["azeritePowerID"] = 367,
				}, -- [6]
			},
		}, -- [3]
		{
			[260] = {
				{
					["icon"] = 1373908,
					["name"] = "Deadshot",
					["azeritePowerID"] = 129,
				}, -- [1]
				{
					["icon"] = 1373911,
					["name"] = "Storm of Steel",
					["azeritePowerID"] = 180,
				}, -- [2]
				{
					["icon"] = 132336,
					["name"] = "Snake Eyes",
					["azeritePowerID"] = 239,
				}, -- [3]
				{
					["icon"] = 1373910,
					["name"] = "Paradise Lost",
					["azeritePowerID"] = 410,
				}, -- [4]
				{
					["icon"] = 135610,
					["name"] = "Ace Up Your Sleeve",
					["azeritePowerID"] = 411,
				}, -- [5]
				{
					["icon"] = 136206,
					["name"] = "Brigand's Blitz",
					["azeritePowerID"] = 446,
				}, -- [6]
			},
			[261] = {
				{
					["icon"] = 135431,
					["name"] = "Sharpened Blades",
					["azeritePowerID"] = 124,
				}, -- [1]
				{
					["icon"] = 1373907,
					["name"] = "Night's Vengeance",
					["azeritePowerID"] = 175,
				}, -- [2]
				{
					["icon"] = 1373912,
					["name"] = "Blade In The Shadows",
					["azeritePowerID"] = 240,
				}, -- [3]
				{
					["icon"] = 136181,
					["name"] = "The First Dance",
					["azeritePowerID"] = 413,
				}, -- [4]
				{
					["icon"] = 252272,
					["name"] = "Inevitability",
					["azeritePowerID"] = 414,
				}, -- [5]
				{
					["icon"] = 132090,
					["name"] = "Perforate",
					["azeritePowerID"] = 445,
				}, -- [6]
			},
			[259] = {
				{
					["icon"] = 132304,
					["name"] = "Double Dose",
					["azeritePowerID"] = 136,
				}, -- [1]
				{
					["icon"] = 132287,
					["name"] = "Twist the Knife",
					["azeritePowerID"] = 181,
				}, -- [2]
				{
					["icon"] = 463899,
					["name"] = "Poisoned Wire",
					["azeritePowerID"] = 249,
				}, -- [3]
				{
					["icon"] = 132302,
					["name"] = "Scent of Blood",
					["azeritePowerID"] = 406,
				}, -- [4]
				{
					["icon"] = 236273,
					["name"] = "Fan of Blades",
					["azeritePowerID"] = 407,
				}, -- [5]
				{
					["icon"] = 132297,
					["name"] = "Shrouded Suffocation",
					["azeritePowerID"] = 408,
				}, -- [6]
			},
		}, -- [4]
		{
			[257] = {
				{
					["icon"] = 135907,
					["name"] = "Permeating Glow",
					["azeritePowerID"] = 114,
				}, -- [1]
				{
					["icon"] = 237541,
					["name"] = "Blessed Sanctuary",
					["azeritePowerID"] = 165,
				}, -- [2]
				{
					["icon"] = 135943,
					["name"] = "Prayerful Litany",
					["azeritePowerID"] = 228,
				}, -- [3]
				{
					["icon"] = 135913,
					["name"] = "Everlasting Light",
					["azeritePowerID"] = 400,
				}, -- [4]
				{
					["icon"] = 135944,
					["name"] = "Word of Mending",
					["azeritePowerID"] = 401,
				}, -- [5]
				{
					["icon"] = 135972,
					["name"] = "Sacred Flame",
					["azeritePowerID"] = 402,
				}, -- [6]
			},
			[258] = {
				{
					["icon"] = 237565,
					["name"] = "Searing Dialogue",
					["azeritePowerID"] = 115,
				}, -- [1]
				{
					["icon"] = 136224,
					["name"] = "Thought Harvester",
					["azeritePowerID"] = 166,
				}, -- [2]
				{
					["icon"] = 237298,
					["name"] = "Whispers of the Damned",
					["azeritePowerID"] = 236,
				}, -- [3]
				{
					["icon"] = 458229,
					["name"] = "Spiteful Apparitions",
					["azeritePowerID"] = 403,
				}, -- [4]
				{
					["icon"] = 136163,
					["name"] = "Death Throes",
					["azeritePowerID"] = 404,
				}, -- [5]
				{
					["icon"] = 1386549,
					["name"] = "Chorus of Insanity",
					["azeritePowerID"] = 405,
				}, -- [6]
			},
			[256] = {
				{
					["icon"] = 135936,
					["name"] = "Moment of Repose",
					["azeritePowerID"] = 113,
				}, -- [1]
				{
					["icon"] = 237545,
					["name"] = "Weal and Woe",
					["azeritePowerID"] = 164,
				}, -- [2]
				{
					["icon"] = 136202,
					["name"] = "Depth of the Shadows",
					["azeritePowerID"] = 227,
				}, -- [3]
				{
					["icon"] = 135924,
					["name"] = "Gift of Forgiveness",
					["azeritePowerID"] = 397,
				}, -- [4]
				{
					["icon"] = 237567,
					["name"] = "Contemptuous Homily",
					["azeritePowerID"] = 398,
				}, -- [5]
				{
					["icon"] = 1386546,
					["name"] = "Enduring Luminescence",
					["azeritePowerID"] = 399,
				}, -- [6]
			},
		}, -- [5]
		{
			[252] = {
				{
					["icon"] = 237519,
					["name"] = "Festering Doom",
					["azeritePowerID"] = 109,
				}, -- [1]
				{
					["icon"] = 342913,
					["name"] = "Horrid Experimentation",
					["azeritePowerID"] = 142,
				}, -- [2]
				{
					["icon"] = 1129420,
					["name"] = "Festermight",
					["azeritePowerID"] = 199,
				}, -- [3]
				{
					["icon"] = 136145,
					["name"] = "Harrowing Decay",
					["azeritePowerID"] = 244,
				}, -- [4]
				{
					["icon"] = 879926,
					["name"] = "Cankerous Wounds",
					["azeritePowerID"] = 350,
				}, -- [5]
				{
					["icon"] = 136133,
					["name"] = "Last Surprise",
					["azeritePowerID"] = 351,
				}, -- [6]
			},
			[251] = {
				{
					["icon"] = 135372,
					["name"] = "Icy Citadel",
					["azeritePowerID"] = 108,
				}, -- [1]
				{
					["icon"] = 237520,
					["name"] = "Latent Chill",
					["azeritePowerID"] = 141,
				}, -- [2]
				{
					["icon"] = 236227,
					["name"] = "Glacial Contagion",
					["azeritePowerID"] = 198,
				}, -- [3]
				{
					["icon"] = 135833,
					["name"] = "Echoing Howl",
					["azeritePowerID"] = 242,
				}, -- [4]
				{
					["icon"] = 135305,
					["name"] = "Killer Frost",
					["azeritePowerID"] = 346,
				}, -- [5]
				{
					["icon"] = 538770,
					["name"] = "Frozen Tempest",
					["azeritePowerID"] = 347,
				}, -- [6]
			},
			[250] = {
				{
					["icon"] = 132155,
					["name"] = "Deep Cuts",
					["azeritePowerID"] = 106,
				}, -- [1]
				{
					["icon"] = 136144,
					["name"] = "Bone Spike Graveyard",
					["azeritePowerID"] = 140,
				}, -- [2]
				{
					["icon"] = 237517,
					["name"] = "Marrowblood",
					["azeritePowerID"] = 197,
				}, -- [3]
				{
					["icon"] = 136168,
					["name"] = "Embrace of the Darkfallen",
					["azeritePowerID"] = 243,
				}, -- [4]
				{
					["icon"] = 135277,
					["name"] = "Eternal Rune Weapon",
					["azeritePowerID"] = 348,
				}, -- [5]
				{
					["icon"] = 1376745,
					["name"] = "Bones of the Damned",
					["azeritePowerID"] = 349,
				}, -- [6]
			},
		}, -- [6]
		{
			[263] = {
				{
					["icon"] = 236289,
					["name"] = "Primal Primer",
					["azeritePowerID"] = 137,
				}, -- [1]
				{
					["icon"] = 136086,
					["name"] = "Strength of Earth",
					["azeritePowerID"] = 179,
				}, -- [2]
				{
					["icon"] = 237443,
					["name"] = "Lightning Conduit",
					["azeritePowerID"] = 223,
				}, -- [3]
				{
					["icon"] = 132314,
					["name"] = "Roiling Storm",
					["azeritePowerID"] = 420,
				}, -- [4]
				{
					["icon"] = 451167,
					["name"] = "Ancestral Resonance",
					["azeritePowerID"] = 447,
				}, -- [5]
			},
			[264] = {
				{
					["icon"] = 136042,
					["name"] = "Soothing Waters",
					["azeritePowerID"] = 138,
				}, -- [1]
				{
					["icon"] = 538569,
					["name"] = "Ebb and Flow",
					["azeritePowerID"] = 191,
				}, -- [2]
				{
					["icon"] = 135127,
					["name"] = "Swelling Stream",
					["azeritePowerID"] = 224,
				}, -- [3]
				{
					["icon"] = 252995,
					["name"] = "Surging Tides",
					["azeritePowerID"] = 422,
				}, -- [4]
				{
					["icon"] = 237586,
					["name"] = "Spouting Spirits",
					["azeritePowerID"] = 423,
				}, -- [5]
				{
					["icon"] = 136037,
					["name"] = "Overflowing Shores",
					["azeritePowerID"] = 449,
				}, -- [6]
			},
			[262] = {
				{
					["icon"] = 136026,
					["name"] = "Lava Shock",
					["azeritePowerID"] = 178,
				}, -- [1]
				{
					["icon"] = 135790,
					["name"] = "Echo of the Elementals",
					["azeritePowerID"] = 222,
				}, -- [2]
				{
					["icon"] = 136028,
					["name"] = "Natural Harmony",
					["azeritePowerID"] = 416,
				}, -- [3]
				{
					["icon"] = 136024,
					["name"] = "Rumbling Tremors",
					["azeritePowerID"] = 417,
				}, -- [4]
				{
					["icon"] = 136048,
					["name"] = "Synapse Shock",
					["azeritePowerID"] = 448,
				}, -- [5]
				{
					["icon"] = 451169,
					["name"] = "Igneous Potential",
					["azeritePowerID"] = 457,
				}, -- [6]
			},
		}, -- [7]
		{
			[64] = {
				{
					["icon"] = 612394,
					["name"] = "Packed Ice",
					["azeritePowerID"] = 132,
				}, -- [1]
				{
					["icon"] = 1506795,
					["name"] = "Winter's Reach",
					["azeritePowerID"] = 170,
				}, -- [2]
				{
					["icon"] = 2126034,
					["name"] = "Glacial Assault",
					["azeritePowerID"] = 225,
				}, -- [3]
				{
					["icon"] = 135846,
					["name"] = "Tunnel of Ice",
					["azeritePowerID"] = 379,
				}, -- [4]
				{
					["icon"] = 135844,
					["name"] = "Whiteout",
					["azeritePowerID"] = 380,
				}, -- [5]
				{
					["icon"] = 135838,
					["name"] = "Frigid Grasp",
					["azeritePowerID"] = 381,
				}, -- [6]
			},
			[63] = {
				{
					["icon"] = 135810,
					["name"] = "Flames of Alacrity",
					["azeritePowerID"] = 128,
				}, -- [1]
				{
					["icon"] = 135827,
					["name"] = "Preheat",
					["azeritePowerID"] = 168,
				}, -- [2]
				{
					["icon"] = 135807,
					["name"] = "Blaster Master",
					["azeritePowerID"] = 215,
				}, -- [3]
				{
					["icon"] = 135808,
					["name"] = "Trailing Embers",
					["azeritePowerID"] = 376,
				}, -- [4]
				{
					["icon"] = 135812,
					["name"] = "Duplicative Incineration",
					["azeritePowerID"] = 377,
				}, -- [5]
				{
					["icon"] = 236218,
					["name"] = "Firemind",
					["azeritePowerID"] = 378,
				}, -- [6]
			},
			[62] = {
				{
					["icon"] = 136096,
					["name"] = "Arcane Pummeling",
					["azeritePowerID"] = 88,
				}, -- [1]
				{
					["icon"] = 1041233,
					["name"] = "Anomalous Impact",
					["azeritePowerID"] = 127,
				}, -- [2]
				{
					["icon"] = 136075,
					["name"] = "Brain Storm",
					["azeritePowerID"] = 167,
				}, -- [3]
				{
					["icon"] = 236205,
					["name"] = "Arcane Pressure",
					["azeritePowerID"] = 214,
				}, -- [4]
				{
					["icon"] = 135730,
					["name"] = "Galvanizing Spark",
					["azeritePowerID"] = 374,
				}, -- [5]
				{
					["icon"] = 136116,
					["name"] = "Explosive Echo",
					["azeritePowerID"] = 375,
				}, -- [6]
			},
		}, -- [8]
		{
			[266] = {
				{
					["icon"] = 136181,
					["name"] = "Shadow's Bite",
					["azeritePowerID"] = 130,
				}, -- [1]
				{
					["icon"] = 236296,
					["name"] = "Umbral Blaze",
					["azeritePowerID"] = 190,
				}, -- [2]
				{
					["icon"] = 2032610,
					["name"] = "Explosive Potential",
					["azeritePowerID"] = 231,
				}, -- [3]
				{
					["icon"] = 535592,
					["name"] = "Demonic Meteor",
					["azeritePowerID"] = 428,
				}, -- [4]
				{
					["icon"] = 134544,
					["name"] = "Forbidden Knowledge",
					["azeritePowerID"] = 429,
				}, -- [5]
				{
					["icon"] = 2065628,
					["name"] = "Supreme Commander",
					["azeritePowerID"] = 458,
				}, -- [6]
			},
			[267] = {
				{
					["icon"] = 136186,
					["name"] = "Accelerant",
					["azeritePowerID"] = 131,
				}, -- [1]
				{
					["icon"] = 135817,
					["name"] = "Flashpoint",
					["azeritePowerID"] = 232,
				}, -- [2]
				{
					["icon"] = 1380866,
					["name"] = "Rolling Havoc",
					["azeritePowerID"] = 431,
				}, -- [3]
				{
					["icon"] = 135789,
					["name"] = "Chaotic Inferno",
					["azeritePowerID"] = 432,
				}, -- [4]
				{
					["icon"] = 236291,
					["name"] = "Crashing Chaos",
					["azeritePowerID"] = 444,
				}, -- [5]
				{
					["icon"] = 135807,
					["name"] = "Bursting Flare",
					["azeritePowerID"] = 460,
				}, -- [6]
			},
			[265] = {
				{
					["icon"] = 237564,
					["name"] = "Wracking Brilliance",
					["azeritePowerID"] = 123,
				}, -- [1]
				{
					["icon"] = 136118,
					["name"] = "Inevitable Demise",
					["azeritePowerID"] = 183,
				}, -- [2]
				{
					["icon"] = 136228,
					["name"] = "Cascading Calamity",
					["azeritePowerID"] = 230,
				}, -- [3]
				{
					["icon"] = 136139,
					["name"] = "Sudden Onset",
					["azeritePowerID"] = 425,
				}, -- [4]
				{
					["icon"] = 1416161,
					["name"] = "Dreadful Calling",
					["azeritePowerID"] = 426,
				}, -- [5]
				{
					["icon"] = 136193,
					["name"] = "Deathbloom",
					["azeritePowerID"] = 442,
				}, -- [6]
			},
		}, -- [9]
		{
			[269] = {
				{
					["icon"] = 135906,
					["name"] = "Iron Fists",
					["azeritePowerID"] = 117,
				}, -- [1]
				{
					["icon"] = 642415,
					["name"] = "Sunrise Technique",
					["azeritePowerID"] = 184,
				}, -- [2]
				{
					["icon"] = 574575,
					["name"] = "Swift Roundhouse",
					["azeritePowerID"] = 388,
				}, -- [3]
				{
					["icon"] = 627606,
					["name"] = "Open Palm Strikes",
					["azeritePowerID"] = 389,
				}, -- [4]
				{
					["icon"] = 606551,
					["name"] = "Pressure Point",
					["azeritePowerID"] = 390,
				}, -- [5]
				{
					["icon"] = 606552,
					["name"] = "Meridian Strikes",
					["azeritePowerID"] = 391,
				}, -- [6]
			},
			[270] = {
				{
					["icon"] = 1360980,
					["name"] = "Invigorating Brew",
					["azeritePowerID"] = 76,
				}, -- [1]
				{
					["icon"] = 775461,
					["name"] = "Overflowing Mists",
					["azeritePowerID"] = 185,
				}, -- [2]
				{
					["icon"] = 627487,
					["name"] = "Misty Peaks",
					["azeritePowerID"] = 248,
				}, -- [3]
				{
					["icon"] = 627485,
					["name"] = "Burst of Life",
					["azeritePowerID"] = 385,
				}, -- [4]
				{
					["icon"] = 1360978,
					["name"] = "Font of Life",
					["azeritePowerID"] = 386,
				}, -- [5]
				{
					["icon"] = 1020466,
					["name"] = "Uplifted Spirits",
					["azeritePowerID"] = 387,
				}, -- [6]
			},
			[268] = {
				{
					["icon"] = 615339,
					["name"] = "Boiling Brew",
					["azeritePowerID"] = 116,
				}, -- [1]
				{
					["icon"] = 1500803,
					["name"] = "Staggering Strikes",
					["azeritePowerID"] = 186,
				}, -- [2]
				{
					["icon"] = 133701,
					["name"] = "Fit to Burst",
					["azeritePowerID"] = 238,
				}, -- [3]
				{
					["icon"] = 627486,
					["name"] = "Niuzao's Blessing",
					["azeritePowerID"] = 382,
				}, -- [4]
				{
					["icon"] = 611419,
					["name"] = "Training of Niuzao",
					["azeritePowerID"] = 383,
				}, -- [5]
				{
					["icon"] = 642416,
					["name"] = "Elusive Footwork",
					["azeritePowerID"] = 384,
				}, -- [6]
			},
		}, -- [10]
		{
			[103] = {
				{
					["icon"] = 236149,
					["name"] = "Blood Mist",
					["azeritePowerID"] = 111,
				}, -- [1]
				{
					["icon"] = 132122,
					["name"] = "Raking Ferocity",
					["azeritePowerID"] = 169,
				}, -- [2]
				{
					["icon"] = 132242,
					["name"] = "Shredding Fury",
					["azeritePowerID"] = 209,
				}, -- [3]
				{
					["icon"] = 132134,
					["name"] = "Iron Jaws",
					["azeritePowerID"] = 247,
				}, -- [4]
				{
					["icon"] = 132152,
					["name"] = "Gushing Lacerations",
					["azeritePowerID"] = 358,
				}, -- [5]
				{
					["icon"] = 236305,
					["name"] = "Wild Fleshrending",
					["azeritePowerID"] = 359,
				}, -- [6]
			},
			[104] = {
				{
					["icon"] = 1378702,
					["name"] = "Layered Mane",
					["azeritePowerID"] = 112,
				}, -- [1]
				{
					["icon"] = 236169,
					["name"] = "Masterful Instincts",
					["azeritePowerID"] = 171,
				}, -- [2]
				{
					["icon"] = 451161,
					["name"] = "Twisted Claws",
					["azeritePowerID"] = 241,
				}, -- [3]
				{
					["icon"] = 136097,
					["name"] = "Craggy Bark",
					["azeritePowerID"] = 251,
				}, -- [4]
				{
					["icon"] = 132091,
					["name"] = "Gory Regeneration",
					["azeritePowerID"] = 360,
				}, -- [5]
				{
					["icon"] = 132136,
					["name"] = "Guardian's Wrath",
					["azeritePowerID"] = 361,
				}, -- [6]
			},
			[105] = {
				{
					["icon"] = 134222,
					["name"] = "Fungal Essence",
					["azeritePowerID"] = 120,
				}, -- [1]
				{
					["icon"] = 134914,
					["name"] = "Grove Tending",
					["azeritePowerID"] = 172,
				}, -- [2]
				{
					["icon"] = 136081,
					["name"] = "Autumn Leaves",
					["azeritePowerID"] = 210,
				}, -- [3]
				{
					["icon"] = 136085,
					["name"] = "Rampant Growth",
					["azeritePowerID"] = 362,
				}, -- [4]
				{
					["icon"] = 134157,
					["name"] = "Waking Dream",
					["azeritePowerID"] = 363,
				}, -- [5]
				{
					["icon"] = 136048,
					["name"] = "Lively Spirit",
					["azeritePowerID"] = 364,
				}, -- [6]
			},
			[102] = {
				{
					["icon"] = 136060,
					["name"] = "Streaking Stars",
					["azeritePowerID"] = 122,
				}, -- [1]
				{
					["icon"] = 136096,
					["name"] = "Power of the Moon",
					["azeritePowerID"] = 173,
				}, -- [2]
				{
					["icon"] = 535045,
					["name"] = "Sunblaze",
					["azeritePowerID"] = 200,
				}, -- [3]
				{
					["icon"] = 135753,
					["name"] = "Dawning Sun",
					["azeritePowerID"] = 250,
				}, -- [4]
				{
					["icon"] = 236216,
					["name"] = "High Noon",
					["azeritePowerID"] = 356,
				}, -- [5]
				{
					["icon"] = 236168,
					["name"] = "Lunar Shrapnel",
					["azeritePowerID"] = 357,
				}, -- [6]
			},
		}, -- [11]
		{
			[577] = {
				{
					["icon"] = 1305149,
					["name"] = "Revolving Blades",
					["azeritePowerID"] = 126,
				}, -- [1]
				{
					["icon"] = 1305156,
					["name"] = "Furious Gaze",
					["azeritePowerID"] = 159,
				}, -- [2]
				{
					["icon"] = 1247261,
					["name"] = "Unbound Chaos",
					["azeritePowerID"] = 220,
				}, -- [3]
				{
					["icon"] = 1097741,
					["name"] = "Seething Power",
					["azeritePowerID"] = 245,
				}, -- [4]
				{
					["icon"] = 1305152,
					["name"] = "Thirsting Blades",
					["azeritePowerID"] = 352,
				}, -- [5]
				{
					["icon"] = 463286,
					["name"] = "Eyes of Rage",
					["azeritePowerID"] = 353,
				}, -- [6]
			},
			[581] = {
				{
					["icon"] = 1344647,
					["name"] = "Revel in Pain",
					["azeritePowerID"] = 134,
				}, -- [1]
				{
					["icon"] = 1344649,
					["name"] = "Infernal Armor",
					["azeritePowerID"] = 160,
				}, -- [2]
				{
					["icon"] = 1344645,
					["name"] = "Rigid Carapace",
					["azeritePowerID"] = 221,
				}, -- [3]
				{
					["icon"] = 1344653,
					["name"] = "Gaping Maw",
					["azeritePowerID"] = 246,
				}, -- [4]
				{
					["icon"] = 1344652,
					["name"] = "Cycle of Binding",
					["azeritePowerID"] = 354,
				}, -- [5]
				{
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
				["icon"] = 132351,
				["name"] = "Moment of Glory",
				["azeritePowerID"] = 476,
			}, -- [1]
			{
				["icon"] = 132342,
				["name"] = "Bury the Hatchet",
				["azeritePowerID"] = 477,
			}, -- [2]
		}, -- [1]
		{
			{
				["icon"] = 524354,
				["name"] = "Stalwart Protector",
				["azeritePowerID"] = 206,
			}, -- [1]
			{
				["icon"] = 1360759,
				["name"] = "Gallant Steed",
				["azeritePowerID"] = 471,
			}, -- [2]
		}, -- [2]
		{
			{
				["icon"] = 132199,
				["name"] = "Shellshock",
				["azeritePowerID"] = 203,
			}, -- [1]
			{
				["icon"] = 132293,
				["name"] = "Duck and Cover",
				["azeritePowerID"] = 469,
			}, -- [2]
		}, -- [3]
		{
			{
				["icon"] = 132307,
				["name"] = "Footpad",
				["azeritePowerID"] = 217,
			}, -- [1]
			{
				["icon"] = 136177,
				["name"] = "Shrouded Mantle",
				["azeritePowerID"] = 473,
			}, -- [2]
		}, -- [4]
		{
			{
				["icon"] = 135994,
				["name"] = "Sanctum",
				["azeritePowerID"] = 204,
			}, -- [1]
			{
				["icon"] = 136066,
				["name"] = "Twist Magic",
				["azeritePowerID"] = 472,
			}, -- [2]
		}, -- [5]
		{
			{
				["icon"] = 136120,
				["name"] = "Runic Barrier",
				["azeritePowerID"] = 201,
			}, -- [1]
			{
				["icon"] = 237561,
				["name"] = "March of the Damned",
				["azeritePowerID"] = 465,
			}, -- [2]
		}, -- [6]
		{
			{
				["icon"] = 538565,
				["name"] = "Serene Spirit",
				["azeritePowerID"] = 207,
			}, -- [1]
			{
				["icon"] = 136095,
				["name"] = "Pack Spirit",
				["azeritePowerID"] = 474,
			}, -- [2]
		}, -- [7]
		{
			{
				["icon"] = 135991,
				["name"] = "Eldritch Warding",
				["azeritePowerID"] = 205,
			}, -- [1]
			{
				["icon"] = 135736,
				["name"] = "Cauterizing Blink",
				["azeritePowerID"] = 468,
			}, -- [2]
		}, -- [8]
		{
			{
				["icon"] = 538745,
				["name"] = "Lifeblood",
				["azeritePowerID"] = 208,
			}, -- [1]
			{
				["icon"] = 136169,
				["name"] = "Desperate Power",
				["azeritePowerID"] = 475,
			}, -- [2]
		}, -- [9]
		{
			{
				["icon"] = 606546,
				["name"] = "Strength of Spirit",
				["azeritePowerID"] = 218,
			}, -- [1]
			{
				["icon"] = 642414,
				["name"] = "Sweep the Leg",
				["azeritePowerID"] = 470,
			}, -- [2]
		}, -- [10]
		{
			{
				["icon"] = 136080,
				["name"] = "Reawakening",
				["azeritePowerID"] = 219,
			}, -- [1]
			{
				["icon"] = 136097,
				["name"] = "Ursoc's Endurance",
				["azeritePowerID"] = 467,
			}, -- [2]
		}, -- [11]
		{
			{
				["icon"] = 1305158,
				["name"] = "Soulmonger",
				["azeritePowerID"] = 202,
			}, -- [1]
			{
				["icon"] = 828455,
				["name"] = "Burning Soul",
				["azeritePowerID"] = 466,
			}, -- [2]
		}, -- [12]
		["common"] = {
			{
				["icon"] = 538536,
				["name"] = "Longstrider",
				["azeritePowerID"] = 14,
			}, -- [1]
			{
				["icon"] = 1769069,
				["name"] = "Resounding Protection",
				["azeritePowerID"] = 15,
			}, -- [2]
			{
				["icon"] = 237395,
				["name"] = "Vampiric Speed",
				["azeritePowerID"] = 44,
			}, -- [3]
			{
				["icon"] = 1387707,
				["name"] = "Impassive Visage",
				["azeritePowerID"] = 83,
			}, -- [4]
			{
				["icon"] = 651746,
				["name"] = "Bulwark of the Masses",
				["azeritePowerID"] = 84,
			}, -- [5]
			{
				["icon"] = 1686575,
				["name"] = "Gemhide",
				["azeritePowerID"] = 85,
			}, -- [6]
			{
				["icon"] = 646669,
				["name"] = "Azerite Fortification",
				["azeritePowerID"] = 86,
			}, -- [7]
			{
				["icon"] = 413591,
				["name"] = "Self Reliance",
				["azeritePowerID"] = 87,
			}, -- [8]
		},
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
			[13] = 1, -- Azerite Empowered
			[14] = 1, -- Longstrider
			[15] = 1, -- Resounding Protection
			[18] = 2, -- Blood Siphon
			[20] = 2, -- Lifespeed
			[21] = 2, -- Elemental Whirl
			[22] = 3, -- Heed My Call
			[30] = 3, -- Overwhelming Power
			[31] = 3, -- Gutripper
			[38] = 2, -- On My Way
			[83] = 1, -- Impassive Visage
			[85] = 1, -- Gemhide
			[86] = 1, -- Azerite Fortification
			[121] = 1, -- Executioner's Precision
			[174] = 3, -- Gathering Storm
			[226] = 10, -- Test of Might
			[433] = 4, -- Seismic Wave
			[434] = 6, -- Crushing Assault
			[435] = 8, -- Lord of War
			[459] = 2, -- Unstable Flames
			[462] = 2, -- Azerite Globules
			[476] = 1, -- Moment of Glory
			[477] = 1, -- Bury the Hatchet
		})

		-- Fury
		insertDefaultScalesData(defaultName, 1, 2, {
			[18] = 2, -- Blood Siphon
			[20] = 3, -- Lifespeed
			[21] = 3, -- Elemental Whirl
			[22] = 4, -- Heed My Call
			[30] = 5, -- Overwhelming Power
			[31] = 3, -- Gutripper
			[38] = 2, -- On My Way
			[119] = 5, -- Trample the Weak
			[176] = 5, -- Bloodcraze
			[229] = 6, -- Pulverizing Blows
			[437] = 8, -- Simmering Rage
			[438] = 10, -- Reckless Flurry
			[451] = 5, -- Infinite Fury
			[459] = 3, -- Unstable Flames
			[462] = 3, -- Azerite Globules
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
			[14] = 1, -- Longstrider
			[15] = 1, -- Resounding Protection
			[18] = 2, -- Blood Siphon
			[20] = 2, -- Lifespeed
			[21] = 3, -- Elemental Whirl
			[22] = 6, -- Heed My Call
			[30] = 3, -- Overwhelming Power
			[31] = 5, -- Gutripper
			[38] = 2, -- On My Way
			[44] = 1, -- Vampiric Speed
			[83] = 1, -- Impassive Visage
			[84] = 1, -- Bulwark of the Masses
			[85] = 1, -- Gemhide
			[86] = 1, -- Azerite Fortification
			[87] = 1, -- Self Reliance
			[98] = 1, -- Crystalline Carapace
			[99] = 1, -- Ablative Shielding
			[100] = 1, -- Strength in Numbers
			[101] = 1, -- Shimmering Haven
			[133] = 1, -- Bulwark of Light
			[150] = 3, -- Soaring Shield
			[206] = 1, -- Stalwart Protector
			[234] = 3, -- Inner Light
			[395] = 10, -- Inspiring Vanguard
			[454] = 1, -- Judicious Defense
			[459] = 2, -- Unstable Flames
			[462] = 4, -- Azerite Globules
			[471] = 1, -- Gallant Steed
		})
		insertDefaultScalesData(defensiveName, 2, 2, {
			[15] = 10, -- Resounding Protection
			[18] = 1, -- Blood Siphon
			[21] = 1, -- Elemental Whirl
			[38] = 1, -- On My Way
			[150] = 1, -- Soaring Shield
			[234] = 1, -- Inner Light
		})

		-- Retribution
		insertDefaultScalesData(defaultName, 2, 3, {
			[15] = 1, -- Resounding Protection
			[18] = 3, -- Blood Siphon
			[20] = 4, -- Lifespeed
			[21] = 4, -- Elemental Whirl
			[22] = 6, -- Heed My Call
			[30] = 6, -- Overwhelming Power
			[31] = 5, -- Gutripper
			[38] = 4, -- On My Way
			[44] = 1, -- Vampiric Speed
			[86] = 1, -- Azerite Fortification
			[125] = 8, -- Avenger's Might
			[154] = 10, -- Relentless Inquisitor
			[187] = 7, -- Expurgation
			[235] = 7, -- Indomitable Justice
			[396] = 6, -- Zealotry
			[459] = 4, -- Unstable Flames
			[462] = 4, -- Azerite Globules
			[471] = 1, -- Gallant Steed
		})

	-- Hunter
		-- Beast Mastery
		insertDefaultScalesData(defaultName, 3, 1, {
			[13] = 8, -- Azerite Empowered
			[14] = 8, -- Longstrider
			[15] = 8, -- Resounding Protection
			[18] = 9, -- Blood Siphon
			[20] = 9, -- Lifespeed
			[21] = 9, -- Elemental Whirl
			[22] = 9, -- Heed My Call
			[30] = 9, -- Overwhelming Power
			[31] = 9, -- Gutripper
			[38] = 9, -- On My Way
			[44] = 8, -- Vampiric Speed
			[83] = 8, -- Impassive Visage
			[84] = 8, -- Bulwark of the Masses
			[85] = 8, -- Gemhide
			[86] = 8, -- Azerite Fortification
			[87] = 8, -- Self Reliance
			[107] = 9, -- Serrated Jaws
			[161] = 10, -- Haze of Rage
			[203] = 8, -- Shellshock
			[211] = 9, -- Dance of Death
			[365] = 8, -- Pack Alpha
			[366] = 10, -- Primal Instincts
			[367] = 9, -- Feeding Frenzy
			[459] = 9, -- Unstable Flames
			[462] = 9, -- Azerite Globules
			[469] = 8, -- Duck and Cover
		})

		-- Marksmanship
		insertDefaultScalesData(defaultName, 3, 2, {
			[15] = 1, -- Resounding Protection
			[18] = 3, -- Blood Siphon
			[20] = 2, -- Lifespeed
			[21] = 3, -- Elemental Whirl
			[22] = 4, -- Heed My Call
			[30] = 4, -- Overwhelming Power
			[31] = 4, -- Gutripper
			[36] = 3, -- In The Rhythm
			[38] = 3, -- On My Way
			[83] = 1, -- Impassive Visage
			[84] = 1, -- Bulwark of the Masses
			[162] = 3, -- Arcane Flurry
			[212] = 4, -- Unerring Vision
			[368] = 10, -- Steady Aim
			[370] = 4, -- Focused Fire
			[459] = 2, -- Unstable Flames
			[462] = 3, -- Azerite Globules
			[469] = 1, -- Duck and Cover
		})

		-- Survival
		insertDefaultScalesData(defaultName, 3, 3, {
			[13] = 1, -- Azerite Empowered
			[15] = 1, -- Resounding Protection
			[18] = 2, -- Blood Siphon
			[20] = 2, -- Lifespeed
			[21] = 2, -- Elemental Whirl
			[22] = 3, -- Heed My Call
			[30] = 3, -- Overwhelming Power
			[31] = 3, -- Gutripper
			[38] = 2, -- On My Way
			[83] = 1, -- Impassive Visage
			[85] = 1, -- Gemhide
			[87] = 1, -- Self Reliance
			[110] = 3, -- Wildfire Cluster
			[163] = 9, -- Latent Poison
			[213] = 6, -- Venomous Fangs
			[371] = 10, -- Blur of Talons
			[372] = 10, -- Wilderness Survival
			[373] = 5, -- Up Close And Personal
			[459] = 2, -- Unstable Flames
			[462] = 2, -- Azerite Globules
		})

	-- Rogue
		-- Assassination
		insertDefaultScalesData(defaultName, 4, 1, {
			[13] = 1, -- Azerite Empowered
			[14] = 1, -- Longstrider
			[15] = 1, -- Resounding Protection
			[18] = 3, -- Blood Siphon
			[20] = 2, -- Lifespeed
			[21] = 3, -- Elemental Whirl
			[22] = 4, -- Heed My Call
			[30] = 4, -- Overwhelming Power
			[31] = 3, -- Gutripper
			[38] = 2, -- On My Way
			[44] = 1, -- Vampiric Speed
			[83] = 1, -- Impassive Visage
			[84] = 1, -- Bulwark of the Masses
			[85] = 1, -- Gemhide
			[86] = 1, -- Azerite Fortification
			[87] = 1, -- Self Reliance
			[136] = 9, -- Double Dose
			[181] = 7, -- Twist the Knife
			[217] = 1, -- Footpad
			[249] = 3, -- Poisoned Wire
			[406] = 4, -- Scent of Blood
			[407] = 1, -- Fan of Blades
			[408] = 10, -- Shrouded Suffocation
			[459] = 3, -- Unstable Flames
			[462] = 3, -- Azerite Globules
			[473] = 1, -- Shrouded Mantle
		})

		-- Outlaw
		insertDefaultScalesData(defaultName, 4, 2, {
			[13] = 1, -- Azerite Empowered
			[14] = 1, -- Longstrider
			[15] = 1, -- Resounding Protection
			[18] = 2, -- Blood Siphon
			[20] = 2, -- Lifespeed
			[21] = 3, -- Elemental Whirl
			[22] = 5, -- Heed My Call
			[30] = 3, -- Overwhelming Power
			[31] = 4, -- Gutripper
			[38] = 2, -- On My Way
			[83] = 1, -- Impassive Visage
			[84] = 1, -- Bulwark of the Masses
			[85] = 1, -- Gemhide
			[86] = 1, -- Azerite Fortification
			[87] = 1, -- Self Reliance
			[129] = 10, -- Deadshot
			[180] = 8, -- Storm of Steel
			[217] = 1, -- Footpad
			[239] = 7, -- Snake Eyes
			[410] = 6, -- Paradise Lost
			[411] = 2, -- Ace Up Your Sleeve
			[446] = 5, -- Brigand's Blitz
			[459] = 3, -- Unstable Flames
			[462] = 3, -- Azerite Globules
			[473] = 1, -- Shrouded Mantle
		})

		-- Subtley
		insertDefaultScalesData(defaultName, 4, 3, {
			[18] = 2, -- Blood Siphon
			[20] = 2, -- Lifespeed
			[21] = 2, -- Elemental Whirl
			[22] = 3, -- Heed My Call
			[30] = 3, -- Overwhelming Power
			[31] = 3, -- Gutripper
			[38] = 2, -- On My Way
			[124] = 7, -- Sharpened Blades
			[175] = 4, -- Night's Vengeance
			[217] = 1, -- Footpad
			[240] = 10, -- Blade In The Shadows
			[413] = 4, -- The First Dance
			[414] = 9, -- Inevitability
			[445] = 3, -- Perforate
			[459] = 2, -- Unstable Flames
			[462] = 2, -- Azerite Globules
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
			[15] = 1, -- Resounding Protection
			[18] = 3, -- Blood Siphon
			[20] = 4, -- Lifespeed
			[21] = 4, -- Elemental Whirl
			[22] = 5, -- Heed My Call
			[30] = 5, -- Overwhelming Power
			[31] = 5, -- Gutripper
			[38] = 3, -- On My Way
			[85] = 1, -- Gemhide
			[115] = 1, -- Searing Dialogue
			[166] = 4, -- Thought Harvester
			[236] = 10, -- Whispers of the Damned
			[403] = 6, -- Spiteful Apparitions
			[404] = 8, -- Death Throes
			[405] = 5, -- Chorus of Insanity
			[459] = 4, -- Unstable Flames
			[462] = 4, -- Azerite Globules
		})

	-- Death Knight
		-- Blood
		insertDefaultScalesData(offensiveName, 6, 1, {
			[18] = 3, -- Blood Siphon
			[20] = 3, -- Lifespeed
			[21] = 3, -- Elemental Whirl
			[22] = 9, -- Heed My Call
			[30] = 4, -- Overwhelming Power
			[31] = 8, -- Gutripper
			[38] = 3, -- On My Way
			[44] = 1, -- Vampiric Speed
			[83] = 1, -- Impassive Visage
			[85] = 1, -- Gemhide
			[86] = 1, -- Azerite Fortification
			[100] = 1, -- Strength in Numbers
			[106] = 5, -- Deep Cuts
			[140] = 1, -- Bone Spike Graveyard
			[201] = 1, -- Runic Barrier
			[243] = 1, -- Embrace of the Darkfallen
			[348] = 10, -- Eternal Rune Weapon
			[349] = 1, -- Bones of the Damned
			[459] = 4, -- Unstable Flames
			[462] = 6, -- Azerite Globules
			[465] = 1, -- March of the Damned
		})
		insertDefaultScalesData(defensiveName, 6, 1, {
			[15] = 10, -- Resounding Protection
			[18] = 1, -- Blood Siphon
			[20] = 1, -- Lifespeed
			[21] = 1, -- Elemental Whirl
			[22] = 1, -- Heed My Call
			[30] = 1, -- Overwhelming Power
			[84] = 1, -- Bulwark of the Masses
			[85] = 1, -- Gemhide
			[98] = 1, -- Crystalline Carapace
			[100] = 1, -- Strength in Numbers
			[140] = 2, -- Bone Spike Graveyard
			[197] = 3, -- Marrowblood
			[348] = 1, -- Eternal Rune Weapon
			[349] = 1, -- Bones of the Damned
			[459] = 1, -- Unstable Flames
			[462] = 1, -- Azerite Globules
			[465] = 1, -- March of the Damned
		})

		-- Frost
		insertDefaultScalesData(defaultName, 6, 2, {
			[13] = 1, -- Azerite Empowered
			[15] = 1, -- Resounding Protection
			[18] = 3, -- Blood Siphon
			[20] = 3, -- Lifespeed
			[21] = 3, -- Elemental Whirl
			[22] = 4, -- Heed My Call
			[30] = 4, -- Overwhelming Power
			[31] = 4, -- Gutripper
			[38] = 3, -- On My Way
			[44] = 1, -- Vampiric Speed
			[83] = 1, -- Impassive Visage
			[85] = 1, -- Gemhide
			[86] = 1, -- Azerite Fortification
			[108] = 7, -- Icy Citadel
			[141] = 6, -- Latent Chill
			[198] = 10, -- Glacial Contagion
			[201] = 1, -- Runic Barrier
			[242] = 6, -- Echoing Howl
			[346] = 5, -- Killer Frost
			[347] = 4, -- Frozen Tempest
			[459] = 3, -- Unstable Flames
			[462] = 3, -- Azerite Globules
			[465] = 1, -- March of the Damned
		})

		-- Unholy
		insertDefaultScalesData(defaultName, 6, 3, {
			[13] = 1, -- Azerite Empowered
			[14] = 1, -- Longstrider
			[15] = 1, -- Resounding Protection
			[18] = 3, -- Blood Siphon
			[20] = 3, -- Lifespeed
			[21] = 3, -- Elemental Whirl
			[22] = 5, -- Heed My Call
			[30] = 4, -- Overwhelming Power
			[31] = 4, -- Gutripper
			[38] = 3, -- On My Way
			[44] = 1, -- Vampiric Speed
			[83] = 1, -- Impassive Visage
			[84] = 1, -- Bulwark of the Masses
			[85] = 1, -- Gemhide
			[86] = 1, -- Azerite Fortification
			[87] = 1, -- Self Reliance
			[109] = 3, -- Festering Doom
			[140] = 1, -- Bone Spike Graveyard
			[142] = 4, -- Horrid Experimentation
			[199] = 10, -- Festermight
			[201] = 1, -- Runic Barrier
			[244] = 7, -- Harrowing Decay
			[350] = 5, -- Cankerous Wounds
			[351] = 5, -- Last Surprise
			[459] = 3, -- Unstable Flames
			[462] = 3, -- Azerite Globules
			[465] = 1, -- March of the Damned
		})

	-- Shaman
		-- Elemental
		insertDefaultScalesData(defaultName, 7, 1, {
			[18] = 2, -- Blood Siphon
			[20] = 2, -- Lifespeed
			[21] = 2, -- Elemental Whirl
			[22] = 4, -- Heed My Call
			[30] = 3, -- Overwhelming Power
			[31] = 3, -- Gutripper
			[38] = 2, -- On My Way
			[44] = 1, -- Vampiric Speed
			[86] = 1, -- Azerite Fortification
			[178] = 6, -- Lava Shock
			[222] = 7, -- Echo of the Elementals
			[416] = 4, -- Natural Harmony
			[417] = 5, -- Rumbling Tremors
			[448] = 5, -- Synapse Shock
			[457] = 10, -- Igneous Potential
			[459] = 3, -- Unstable Flames
			[462] = 3, -- Azerite Globules
		})

		-- Enhancement
		insertDefaultScalesData(defaultName, 7, 2, {
			[15] = 1, -- Resounding Protection
			[18] = 4, -- Blood Siphon
			[20] = 4, -- Lifespeed
			[21] = 5, -- Elemental Whirl
			[22] = 7, -- Heed My Call
			[30] = 6, -- Overwhelming Power
			[31] = 6, -- Gutripper
			[38] = 4, -- On My Way
			[83] = 1, -- Impassive Visage
			[84] = 1, -- Bulwark of the Masses
			[85] = 1, -- Gemhide
			[137] = 10, -- Primal Primer
			[179] = 9, -- Strength of Earth
			[207] = 1, -- Serene Spirit
			[223] = 6, -- Lightning Conduit
			[420] = 9, -- Roiling Storm
			[447] = 10, -- Ancestral Resonance
			[459] = 4, -- Unstable Flames
			[462] = 5, -- Azerite Globules
			[474] = 1, -- Pack Spirit
		})

		-- Restoration
		insertDefaultScalesData(defaultName, 7, 3, {

		})

	-- Mage
		-- Arcane
		insertDefaultScalesData(defaultName, 8, 1, {
			[18] = 2, -- Blood Siphon
			[20] = 1, -- Lifespeed
			[21] = 2, -- Elemental Whirl
			[22] = 3, -- Heed My Call
			[30] = 3, -- Overwhelming Power
			[31] = 3, -- Gutripper
			[38] = 2, -- On My Way
			[44] = 1, -- Vampiric Speed
			[87] = 1, -- Self Reliance
			[88] = 3, -- Arcane Pummeling
			[127] = 2, -- Anomalous Impact
			[167] = 4, -- Brain Storm
			[214] = 4, -- Arcane Pressure
			[374] = 10, -- Galvanizing Spark
			[459] = 3, -- Unstable Flames
			[462] = 3, -- Azerite Globules
			[468] = 1, -- Cauterizing Blink
		})

		-- Fire
		insertDefaultScalesData(defaultName, 8, 2, {
			[13] = 1, -- Azerite Empowered
			[14] = 1, -- Longstrider
			[15] = 1, -- Resounding Protection
			[18] = 2, -- Blood Siphon
			[20] = 2, -- Lifespeed
			[21] = 2, -- Elemental Whirl
			[22] = 4, -- Heed My Call
			[30] = 3, -- Overwhelming Power
			[31] = 4, -- Gutripper
			[38] = 2, -- On My Way
			[83] = 1, -- Impassive Visage
			[84] = 1, -- Bulwark of the Masses
			[85] = 1, -- Gemhide
			[86] = 1, -- Azerite Fortification
			[128] = 6, -- Flames of Alacrity
			[168] = 4, -- Preheat
			[215] = 8, -- Blaster Master
			[376] = 3, -- Trailing Embers
			[377] = 10, -- Duplicative Incineration
			[378] = 5, -- Firemind
			[459] = 2, -- Unstable Flames
			[462] = 3, -- Azerite Globules
			[468] = 1, -- Cauterizing Blink
		})

		-- Frost
		insertDefaultScalesData(defaultName, 8, 3, {
			[14] = 1, -- Longstrider
			[18] = 3, -- Blood Siphon
			[20] = 4, -- Lifespeed
			[21] = 4, -- Elemental Whirl
			[22] = 6, -- Heed My Call
			[30] = 5, -- Overwhelming Power
			[31] = 5, -- Gutripper
			[38] = 3, -- On My Way
			[44] = 1, -- Vampiric Speed
			[86] = 1, -- Azerite Fortification
			[132] = 5, -- Packed Ice
			[170] = 7, -- Winter's Reach
			[225] = 5, -- Glacial Assault
			[379] = 10, -- Tunnel of Ice
			[380] = 10, -- Whiteout
			[381] = 5, -- Frigid Grasp
			[459] = 4, -- Unstable Flames
			[462] = 4, -- Azerite Globules
		})

	-- Warlock
		-- Affliction
		insertDefaultScalesData(defaultName, 9, 1, {
			[18] = 3, -- Blood Siphon
			[20] = 3, -- Lifespeed
			[21] = 4, -- Elemental Whirl
			[22] = 5, -- Heed My Call
			[30] = 5, -- Overwhelming Power
			[31] = 4, -- Gutripper
			[38] = 3, -- On My Way
			[44] = 1, -- Vampiric Speed
			[123] = 10, -- Wracking Brilliance
			[183] = 7, -- Inevitable Demise
			[230] = 8, -- Cascading Calamity
			[425] = 3, -- Sudden Onset
			[426] = 4, -- Dreadful Calling
			[459] = 3, -- Unstable Flames
			[462] = 3, -- Azerite Globules
			[475] = 1, -- Desperate Power
		})

		-- Demonology
		insertDefaultScalesData(defaultName, 9, 2, {
			[18] = 3, -- Blood Siphon
			[20] = 2, -- Lifespeed
			[21] = 3, -- Elemental Whirl
			[22] = 5, -- Heed My Call
			[30] = 4, -- Overwhelming Power
			[31] = 4, -- Gutripper
			[38] = 3, -- On My Way
			[83] = 1, -- Impassive Visage
			[84] = 1, -- Bulwark of the Masses
			[130] = 4, -- Shadow's Bite
			[190] = 5, -- Umbral Blaze
			[208] = 1, -- Lifeblood
			[428] = 6, -- Demonic Meteor
			[429] = 4, -- Forbidden Knowledge
			[458] = 10, -- Supreme Commander
			[459] = 3, -- Unstable Flames
			[462] = 3, -- Azerite Globules
		})

		-- Destruction
		insertDefaultScalesData(defaultName, 9, 3, {
			[18] = 2, -- Blood Siphon
			[20] = 3, -- Lifespeed
			[21] = 3, -- Elemental Whirl
			[22] = 4, -- Heed My Call
			[30] = 4, -- Overwhelming Power
			[31] = 3, -- Gutripper
			[38] = 3, -- On My Way
			[87] = 1, -- Self Reliance
			[232] = 4, -- Flashpoint
			[432] = 7, -- Chaotic Inferno
			[444] = 10, -- Crashing Chaos
			[459] = 3, -- Unstable Flames
			[460] = 6, -- Bursting Flare
			[462] = 3, -- Azerite Globules
			[475] = 1, -- Desperate Power
		})

	-- Monk
		-- Brewmaster
		insertDefaultScalesData(offensiveName, 10, 1, {
			[18] = 3, -- Blood Siphon
			[20] = 3, -- Lifespeed
			[21] = 4, -- Elemental Whirl
			[22] = 8, -- Heed My Call
			[30] = 4, -- Overwhelming Power
			[31] = 7, -- Gutripper
			[38] = 3, -- On My Way
			[83] = 1, -- Impassive Visage
			[86] = 1, -- Azerite Fortification
			[116] = 5, -- Boiling Brew
			[383] = 4, -- Training of Niuzao
			[384] = 10, -- Elusive Footwork
			[459] = 4, -- Unstable Flames
			[462] = 5, -- Azerite Globules
		})
		insertDefaultScalesData(defensiveName, 10, 1, {
			[14] = 1, -- Longstrider
			[15] = 10, -- Resounding Protection
			[18] = 2, -- Blood Siphon
			[21] = 1, -- Elemental Whirl
			[22] = 1, -- Heed My Call
			[31] = 1, -- Gutripper
			[38] = 1, -- On My Way
			[43] = 1, -- Winds of War
			[84] = 1, -- Bulwark of the Masses
			[85] = 1, -- Gemhide
			[86] = 1, -- Azerite Fortification
			[87] = 1, -- Self Reliance
			[89] = 1, -- Azerite Veins
			[100] = 1, -- Strength in Numbers
			[101] = 1, -- Shimmering Haven
			[116] = 9, -- Boiling Brew
			[186] = 1, -- Staggering Strikes
			[218] = 1, -- Strength of Spirit
			[238] = 1, -- Fit to Burst
			[382] = 1, -- Niuzao's Blessing
			[383] = 1, -- Training of Niuzao
			[384] = 1, -- Elusive Footwork
			[459] = 1, -- Unstable Flames
			[470] = 1, -- Sweep the Leg
		})

		-- Mistweaver
		insertDefaultScalesData(defaultName, 10, 2, {

		})

		-- Windwalker
		insertDefaultScalesData(defaultName, 10, 3, {
			[13] = 1, -- Azerite Empowered
			[14] = 1, -- Longstrider
			[15] = 1, -- Resounding Protection
			[18] = 3, -- Blood Siphon
			[20] = 3, -- Lifespeed
			[21] = 4, -- Elemental Whirl
			[22] = 5, -- Heed My Call
			[30] = 4, -- Overwhelming Power
			[31] = 4, -- Gutripper
			[38] = 3, -- On My Way
			[44] = 1, -- Vampiric Speed
			[83] = 1, -- Impassive Visage
			[84] = 1, -- Bulwark of the Masses
			[85] = 1, -- Gemhide
			[86] = 1, -- Azerite Fortification
			[87] = 1, -- Self Reliance
			[117] = 1, -- Iron Fists
			[184] = 9, -- Sunrise Technique
			[218] = 1, -- Strength of Spirit
			[388] = 5, -- Swift Roundhouse
			[389] = 6, -- Open Palm Strikes
			[390] = 8, -- Pressure Point
			[391] = 10, -- Meridian Strikes
			[459] = 3, -- Unstable Flames
			[462] = 3, -- Azerite Globules
			[470] = 1, -- Sweep the Leg
		})

	-- Druid
		-- Balance
		insertDefaultScalesData(defaultName, 11, 1, {
			[13] = 1, -- Azerite Empowered
			[14] = 1, -- Longstrider
			[15] = 1, -- Resounding Protection
			[18] = 2, -- Blood Siphon
			[20] = 2, -- Lifespeed
			[21] = 2, -- Elemental Whirl
			[22] = 4, -- Heed My Call
			[30] = 3, -- Overwhelming Power
			[31] = 3, -- Gutripper
			[38] = 2, -- On My Way
			[84] = 1, -- Bulwark of the Masses
			[85] = 1, -- Gemhide
			[86] = 1, -- Azerite Fortification
			[122] = 10, -- Streaking Stars
			[173] = 2, -- Power of the Moon
			[200] = 3, -- Sunblaze
			[219] = 1, -- Reawakening
			[250] = 4, -- Dawning Sun
			[356] = 2, -- High Noon
			[357] = 1, -- Lunar Shrapnel
			[459] = 2, -- Unstable Flames
			[462] = 3, -- Azerite Globules
			[467] = 1, -- Ursoc's Endurance
		})

		-- Feral
		insertDefaultScalesData(defaultName, 11, 2, {
			[13] = 1, -- Azerite Empowered
			[14] = 1, -- Longstrider
			[18] = 2, -- Blood Siphon
			[20] = 4, -- Lifespeed
			[21] = 3, -- Elemental Whirl
			[22] = 5, -- Heed My Call
			[30] = 5, -- Overwhelming Power
			[31] = 5, -- Gutripper
			[38] = 3, -- On My Way
			[44] = 1, -- Vampiric Speed
			[83] = 1, -- Impassive Visage
			[84] = 1, -- Bulwark of the Masses
			[85] = 1, -- Gemhide
			[87] = 1, -- Self Reliance
			[111] = 6, -- Blood Mist
			[169] = 10, -- Raking Ferocity
			[209] = 4, -- Shredding Fury
			[247] = 1, -- Iron Jaws
			[358] = 7, -- Gushing Lacerations
			[359] = 1, -- Wild Fleshrending
			[459] = 3, -- Unstable Flames
			[462] = 3, -- Azerite Globules
			[467] = 1, -- Ursoc's Endurance
		})

		-- Guardian
		insertDefaultScalesData(offensiveName, 11, 3, {
			[13] = 8, -- Azerite Empowered
			[14] = 8, -- Longstrider
			[15] = 8, -- Resounding Protection
			[18] = 9, -- Blood Siphon
			[20] = 9, -- Lifespeed
			[21] = 9, -- Elemental Whirl
			[22] = 10, -- Heed My Call
			[30] = 9, -- Overwhelming Power
			[31] = 10, -- Gutripper
			[38] = 9, -- On My Way
			[43] = 8, -- Winds of War
			[44] = 8, -- Vampiric Speed
			[83] = 8, -- Impassive Visage
			[84] = 8, -- Bulwark of the Masses
			[85] = 8, -- Gemhide
			[86] = 8, -- Azerite Fortification
			[87] = 8, -- Self Reliance
			[89] = 8, -- Azerite Veins
			[98] = 8, -- Crystalline Carapace
			[99] = 8, -- Ablative Shielding
			[100] = 8, -- Strength in Numbers
			[101] = 8, -- Shimmering Haven
			[112] = 8, -- Layered Mane
			[171] = 8, -- Masterful Instincts
			[219] = 8, -- Reawakening
			[241] = 10, -- Twisted Claws
			[251] = 8, -- Craggy Bark
			[360] = 8, -- Gory Regeneration
			[361] = 10, -- Guardian's Wrath
			[459] = 9, -- Unstable Flames
			[462] = 9, -- Azerite Globules
			[467] = 8, -- Ursoc's Endurance
		})
		-- Guardian
		insertDefaultScalesData(defensiveName, 11, 3, {

		})

		-- Restoration
		insertDefaultScalesData(defaultName, 11, 4, {

		})

	-- Demon Hunter
		-- Havoc
		insertDefaultScalesData(defaultName, 12, 1, {
			[13] = 1, -- Azerite Empowered
			[15] = 1, -- Resounding Protection
			[18] = 1, -- Blood Siphon
			[20] = 2, -- Lifespeed
			[21] = 2, -- Elemental Whirl
			[22] = 3, -- Heed My Call
			[30] = 2, -- Overwhelming Power
			[31] = 3, -- Gutripper
			[38] = 2, -- On My Way
			[84] = 1, -- Bulwark of the Masses
			[86] = 1, -- Azerite Fortification
			[126] = 10, -- Revolving Blades
			[159] = 3, -- Furious Gaze
			[220] = 5, -- Unbound Chaos
			[245] = 5, -- Seething Power
			[352] = 7, -- Thirsting Blades
			[353] = 3, -- Eyes of Rage
			[459] = 2, -- Unstable Flames
			[462] = 2, -- Azerite Globules
			[466] = 1, -- Burning Soul
		})

		-- Vengeance
		insertDefaultScalesData(offensiveName, 12, 2, {
			[18] = 4, -- Blood Siphon
			[20] = 4, -- Lifespeed
			[21] = 5, -- Elemental Whirl
			[22] = 10, -- Heed My Call
			[30] = 6, -- Overwhelming Power
			[31] = 10, -- Gutripper
			[38] = 4, -- On My Way
			[83] = 1, -- Impassive Visage
			[84] = 1, -- Bulwark of the Masses
			[85] = 1, -- Gemhide
			[86] = 1, -- Azerite Fortification
			[87] = 1, -- Self Reliance
			[89] = 1, -- Azerite Veins
			[100] = 1, -- Strength in Numbers
			[101] = 1, -- Shimmering Haven
			[134] = 1, -- Revel in Pain
			[160] = 1, -- Infernal Armor
			[221] = 1, -- Rigid Carapace
			[354] = 1, -- Cycle of Binding
			[459] = 5, -- Unstable Flames
			[462] = 7, -- Azerite Globules
			[466] = 1, -- Burning Soul
		})
		insertDefaultScalesData(defensiveName, 12, 2, {
			[15] = 10, -- Resounding Protection
			[18] = 2, -- Blood Siphon
			[20] = 1, -- Lifespeed
			[21] = 1, -- Elemental Whirl
			[30] = 1, -- Overwhelming Power
			[38] = 1, -- On My Way
			[85] = 1, -- Gemhide
			[86] = 1, -- Azerite Fortification
			[89] = 1, -- Azerite Veins
			[98] = 1, -- Crystalline Carapace
			[101] = 1, -- Shimmering Haven
			[134] = 1, -- Revel in Pain
			[354] = 1, -- Cycle of Binding
			[459] = 1, -- Unstable Flames
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