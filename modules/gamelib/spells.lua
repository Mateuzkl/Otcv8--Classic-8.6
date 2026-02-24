SpelllistSettings = {
	Default = {
		spellWindowWidth = 550,
		spellListWidth = 210,
		iconFile = "/images/game/spells/defaultspells",
		iconSize = {
			width = 32,
			height = 32
		},
		spellOrder = {
			"Animate Dead",
			"Annihilation",
			"Avalanche",
			"Berserk",
			"Blood Rage",
			"Brutal Strike",
			"Cancel Invisibility",
			"Challenge",
			"Chameleon",
			"Charge",
			"Conjure Arrow",
			"Conjure Bolt",
			"Conjure Explosive Arrow",
			"Conjure Piercing Bolt",
			"Conjure Poisoned Arrow",
			"Conjure Power Bolt",
			"Conjure Sniper Arrow",
			"Convince Creature",
			"Creature Illusion",
			"Cure Bleeding",
			"Cure Burning",
			"Cure Curse",
			"Cure Electrification",
			"Cure Poison",
			"Cure Poison Rune",
			"Curse",
			"Death Strike",
			"Desintegrate",
			"Destroy Field",
			"Divine Caldera",
			"Divine Healing",
			"Divine Missile",
			"Electrify",
			"Enchant Party",
			"Enchant Spear",
			"Enchant Staff",
			"Energy Beam",
			"Energy Field",
			"Energy Strike",
			"Energy Wall",
			"Energy Wave",
			"Energybomb",
			"Envenom",
			"Eternal Winter",
			"Ethereal Spear",
			"Explosion",
			"Fierce Berserk",
			"Find Person",
			"Fire Field",
			"Fire Wall",
			"Fire Wave",
			"Fireball",
			"Firebomb",
			"Flame Strike",
			"Food",
			"Front Sweep",
			"Great Energy Beam",
			"Great Fireball",
			"Great Light",
			"Groundshaker",
			"Haste",
			"Heal Friend",
			"Heal Party",
			"Heavy Magic Missile",
			"Hells Core",
			"Holy Flash",
			"Holy Missile",
			"Ice Strike",
			"Ice Wave",
			"Icicle",
			"Ignite",
			"Inflict Wound",
			"Intense Healing",
			"Intense Healing Rune",
			"Intense Recovery",
			"Intense Wound Cleansing",
			"Invisibility",
			"Levitate",
			"Light",
			"Light Healing",
			"Light Magic Missile",
			"Lightning",
			"Magic Rope",
			"Magic Shield",
			"Magic Wall",
			"Mass Healing",
			"Paralyze",
			"Physical Strike",
			"Poison Bomb",
			"Poison Field",
			"Poison Wall",
			"Protect Party",
			"Protector",
			"Rage of the Skies",
			"Recovery",
			"Salvation",
			"Sharpshooter",
			"Soulfire",
			"Stalagmite",
			"Stone Shower",
			"Strong Energy Strike",
			"Strong Ethereal Spear",
			"Strong Flame Strike",
			"Strong Haste",
			"Strong Ice Strike",
			"Strong Ice Wave",
			"Strong Terra Strike",
			"Sudden Death",
			"Summon Creature",
			"Swift Foot",
			"Terra Strike",
			"Terra Wave",
			"Thunderstorm",
			"Train Party",
			"Ultimate Energy Strike",
			"Ultimate Flame Strike",
			"Ultimate Healing",
			"Ultimate Healing Rune",
			"Ultimate Ice Strike",
			"Ultimate Light",
			"Ultimate Terra Strike",
			"Whirlwind Throw",
			"Wild Growth",
			"Wound Cleansing",
			"Wrath of Nature"
		}
	}
}
SpellInfo = {
	Default = {
		["Death Strike"] = {
			type = "Instant",
			premium = true,
			exhaustion = 2000,
			words = "exori mort",
			id = 87,
			soul = 0,
			level = 16,
			mana = 20,
			icon = "deathstrike",
			group = {
				[1.0] = 2000
			},
			vocations = {
				1,
				5
			}
		},
		["Flame Strike"] = {
			type = "Instant",
			premium = true,
			exhaustion = 2000,
			words = "exori flam",
			id = 89,
			soul = 0,
			level = 14,
			mana = 20,
			icon = "flamestrike",
			group = {
				[1.0] = 2000
			},
			vocations = {
				1,
				2,
				5,
				6
			}
		},
		["Strong Flame Strike"] = {
			type = "Instant",
			premium = true,
			exhaustion = 8000,
			words = "exori gran flam",
			id = 150,
			soul = 0,
			level = 70,
			mana = 60,
			icon = "strongflamestrike",
			group = {
				[1.0] = 2000,
				[4.0] = 8000
			},
			vocations = {
				1,
				5
			}
		},
		["Ultimate Flame Strike"] = {
			type = "Instant",
			premium = true,
			exhaustion = 30000,
			words = "exori max flam",
			id = 154,
			soul = 0,
			level = 90,
			mana = 100,
			icon = "ultimateflamestrike",
			group = {
				[1.0] = 4000
			},
			vocations = {
				1,
				5
			}
		},
		["Energy Strike"] = {
			type = "Instant",
			premium = true,
			exhaustion = 2000,
			words = "exori vis",
			id = 88,
			soul = 0,
			level = 12,
			mana = 20,
			icon = "energystrike",
			group = {
				[1.0] = 2000
			},
			vocations = {
				1,
				2,
				5,
				6
			}
		},
		["Strong Energy Strike"] = {
			type = "Instant",
			premium = true,
			exhaustion = 8000,
			words = "exori gran vis",
			id = 151,
			soul = 0,
			level = 80,
			mana = 60,
			icon = "strongenergystrike",
			group = {
				[1.0] = 2000,
				[4.0] = 8000
			},
			vocations = {
				1,
				5
			}
		},
		["Ultimate Energy Strike"] = {
			type = "Instant",
			premium = true,
			exhaustion = 30000,
			words = "exori max vis",
			id = 155,
			soul = 0,
			level = 100,
			mana = 100,
			icon = "ultimateenergystrike",
			group = {
				[1.0] = 4000
			},
			vocations = {
				1,
				5
			}
		},
		["Whirlwind Throw"] = {
			type = "Instant",
			premium = true,
			exhaustion = 6000,
			words = "exori hur",
			id = 107,
			soul = 0,
			level = 28,
			mana = 40,
			icon = "whirlwindthrow",
			group = {
				[1.0] = 2000
			},
			vocations = {
				4,
				8
			}
		},
		["Fire Wave"] = {
			type = "Instant",
			premium = false,
			exhaustion = 4000,
			words = "exevo flam hur",
			id = 19,
			soul = 0,
			level = 18,
			mana = 25,
			icon = "firewave",
			group = {
				[1.0] = 2000
			},
			vocations = {
				1,
				5
			}
		},
		["Ethereal Spear"] = {
			type = "Instant",
			premium = true,
			exhaustion = 2000,
			words = "exori con",
			id = 111,
			soul = 0,
			level = 23,
			mana = 25,
			icon = "etherealspear",
			group = {
				[1.0] = 2000
			},
			vocations = {
				3,
				7
			}
		},
		["Strong Ethereal Spear"] = {
			type = "Instant",
			premium = true,
			exhaustion = 8000,
			words = "exori gran con",
			id = 57,
			soul = 0,
			level = 90,
			mana = 55,
			icon = "strongetherealspear",
			group = {
				[1.0] = 2000
			},
			vocations = {
				3,
				7
			}
		},
		["Energy Beam"] = {
			type = "Instant",
			premium = false,
			exhaustion = 4000,
			words = "exevo vis lux",
			id = 22,
			soul = 0,
			level = 23,
			mana = 40,
			icon = "energybeam",
			group = {
				[1.0] = 2000
			},
			vocations = {
				1,
				5
			}
		},
		["Great Energy Beam"] = {
			type = "Instant",
			premium = false,
			exhaustion = 6000,
			words = "exevo gran vis lux",
			id = 23,
			soul = 0,
			level = 29,
			mana = 110,
			icon = "greatenergybeam",
			group = {
				[1.0] = 2000
			},
			vocations = {
				1,
				5
			}
		},
		Groundshaker = {
			type = "Instant",
			premium = true,
			exhaustion = 8000,
			words = "exori mas",
			id = 106,
			soul = 0,
			level = 33,
			mana = 160,
			icon = "groundshaker",
			group = {
				[1.0] = 2000
			},
			vocations = {
				4,
				8
			}
		},
		Berserk = {
			type = "Instant",
			premium = true,
			exhaustion = 4000,
			words = "exori",
			id = 80,
			soul = 0,
			level = 35,
			mana = 115,
			icon = "berserk",
			group = {
				[1.0] = 2000
			},
			vocations = {
				4,
				8
			}
		},
		Annihilation = {
			type = "Instant",
			premium = true,
			exhaustion = 30000,
			words = "exori gran ico",
			id = 62,
			soul = 0,
			level = 110,
			mana = 300,
			icon = "annihilation",
			group = {
				[1.0] = 4000
			},
			vocations = {
				4,
				8
			}
		},
		["Brutal Strike"] = {
			type = "Instant",
			premium = true,
			exhaustion = 6000,
			words = "exori ico",
			id = 61,
			soul = 0,
			level = 16,
			mana = 30,
			icon = "brutalstrike",
			group = {
				[1.0] = 2000
			},
			vocations = {
				4,
				8
			}
		},
		["Front Sweep"] = {
			type = "Instant",
			premium = true,
			exhaustion = 6000,
			words = "exori min",
			id = 59,
			soul = 0,
			level = 70,
			mana = 200,
			icon = "frontsweep",
			group = {
				[1.0] = 2000
			},
			vocations = {
				4,
				8
			}
		},
		["Inflict Wound"] = {
			type = "Instant",
			premium = true,
			exhaustion = 30000,
			words = "utori kor",
			id = 141,
			soul = 0,
			level = 40,
			mana = 30,
			icon = "inflictwound",
			group = {
				[1.0] = 2000
			},
			vocations = {
				4,
				8
			}
		},
		Ignite = {
			type = "Instant",
			premium = true,
			exhaustion = 30000,
			words = "utori flam",
			id = 138,
			soul = 0,
			level = 26,
			mana = 30,
			icon = "ignite",
			group = {
				[1.0] = 2000
			},
			vocations = {
				1,
				5
			}
		},
		Lightning = {
			type = "Instant",
			premium = true,
			exhaustion = 8000,
			words = "exori amp vis",
			id = 149,
			soul = 0,
			level = 55,
			mana = 60,
			icon = "lightning",
			group = {
				[1.0] = 2000,
				[4.0] = 8000
			},
			vocations = {
				1,
				5
			}
		},
		Curse = {
			type = "Instant",
			premium = true,
			exhaustion = 50000,
			words = "utori mort",
			id = 139,
			soul = 0,
			level = 75,
			mana = 30,
			icon = "curse",
			group = {
				[1.0] = 2000
			},
			vocations = {
				1,
				5
			}
		},
		Electrify = {
			type = "Instant",
			premium = true,
			exhaustion = 30000,
			words = "utori vis",
			id = 140,
			soul = 0,
			level = 34,
			mana = 30,
			icon = "electrify",
			group = {
				[1.0] = 2000
			},
			vocations = {
				1,
				5
			}
		},
		["Energy Wave"] = {
			type = "Instant",
			premium = false,
			exhaustion = 8000,
			words = "exevo vis hur",
			id = 13,
			soul = 0,
			level = 38,
			mana = 170,
			icon = "energywave",
			group = {
				[1.0] = 2000
			},
			vocations = {
				1,
				5
			}
		},
		["Rage of the Skies"] = {
			type = "Instant",
			premium = true,
			exhaustion = 40000,
			words = "exevo gran mas vis",
			id = 119,
			soul = 0,
			level = 55,
			mana = 600,
			icon = "rageoftheskies",
			group = {
				[1.0] = 4000
			},
			vocations = {
				1,
				5
			}
		},
		["Fierce Berserk"] = {
			type = "Instant",
			premium = true,
			exhaustion = 6000,
			words = "exori gran",
			id = 105,
			soul = 0,
			level = 90,
			mana = 340,
			icon = "fierceberserk",
			group = {
				[1.0] = 2000
			},
			vocations = {
				4,
				8
			}
		},
		["Hells Core"] = {
			type = "Instant",
			premium = true,
			exhaustion = 40000,
			words = "exevo gran mas flam",
			id = 24,
			soul = 0,
			level = 60,
			mana = 1100,
			icon = "hellscore",
			group = {
				[1.0] = 4000
			},
			vocations = {
				1,
				5
			}
		},
		["Holy Flash"] = {
			type = "Instant",
			premium = true,
			exhaustion = 40000,
			words = "utori san",
			id = 143,
			soul = 0,
			level = 70,
			mana = 30,
			icon = "holyflash",
			group = {
				[1.0] = 2000
			},
			vocations = {
				3,
				7
			}
		},
		["Divine Missile"] = {
			type = "Instant",
			premium = true,
			exhaustion = 2000,
			words = "exori san",
			id = 122,
			soul = 0,
			level = 40,
			mana = 20,
			icon = "divinemissile",
			group = {
				[1.0] = 2000
			},
			vocations = {
				3,
				7
			}
		},
		["Divine Caldera"] = {
			type = "Instant",
			premium = true,
			exhaustion = 4000,
			words = "exevo mas san",
			id = 124,
			soul = 0,
			level = 50,
			mana = 160,
			icon = "divinecaldera",
			group = {
				[1.0] = 2000
			},
			vocations = {
				3,
				7
			}
		},
		["Physical Strike"] = {
			type = "Instant",
			premium = true,
			exhaustion = 2000,
			words = "exori moe ico",
			id = 148,
			soul = 0,
			level = 16,
			mana = 20,
			icon = "physicalstrike",
			group = {
				[1.0] = 2000
			},
			vocations = {
				2,
				6
			}
		},
		["Eternal Winter"] = {
			type = "Instant",
			premium = true,
			exhaustion = 40000,
			words = "exevo gran mas frigo",
			id = 118,
			soul = 0,
			level = 60,
			mana = 1050,
			icon = "eternalwinter",
			group = {
				[1.0] = 4000
			},
			vocations = {
				2,
				6
			}
		},
		["Ice Strike"] = {
			type = "Instant",
			premium = true,
			exhaustion = 2000,
			words = "exori frigo",
			id = 112,
			soul = 0,
			level = 15,
			mana = 20,
			icon = "icestrike",
			group = {
				[1.0] = 2000
			},
			vocations = {
				1,
				5,
				2,
				6
			}
		},
		["Strong Ice Strike"] = {
			type = "Instant",
			premium = true,
			exhaustion = 8000,
			words = "exori gran frigo",
			id = 152,
			soul = 0,
			level = 80,
			mana = 60,
			icon = "strongicestrike",
			group = {
				[1.0] = 2000,
				[4.0] = 8000
			},
			vocations = {
				2,
				6
			}
		},
		["Ultimate Ice Strike"] = {
			type = "Instant",
			premium = true,
			exhaustion = 30000,
			words = "exori max frigo",
			id = 156,
			soul = 0,
			level = 100,
			mana = 100,
			icon = "ultimateicestrike",
			group = {
				[1.0] = 4000
			},
			vocations = {
				2,
				6
			}
		},
		["Ice Wave"] = {
			type = "Instant",
			premium = false,
			exhaustion = 4000,
			words = "exevo frigo hur",
			id = 121,
			soul = 0,
			level = 18,
			mana = 25,
			icon = "icewave",
			group = {
				[1.0] = 2000
			},
			vocations = {
				2,
				6
			}
		},
		["Strong Ice Wave"] = {
			type = "Instant",
			premium = true,
			exhaustion = 8000,
			words = "exevo gran frigo hur",
			id = 43,
			soul = 0,
			level = 40,
			mana = 170,
			icon = "strongicewave",
			group = {
				[1.0] = 2000
			},
			vocations = {
				2,
				6
			}
		},
		Envenom = {
			type = "Instant",
			premium = true,
			exhaustion = 40000,
			words = "utori pox",
			id = 142,
			soul = 0,
			level = 50,
			mana = 30,
			icon = "envenom",
			group = {
				[1.0] = 2000
			},
			vocations = {
				2,
				6
			}
		},
		["Terra Strike"] = {
			type = "Instant",
			premium = true,
			exhaustion = 2000,
			words = "exori tera",
			id = 113,
			soul = 0,
			level = 13,
			mana = 20,
			icon = "terrastrike",
			group = {
				[1.0] = 2000
			},
			vocations = {
				1,
				5,
				2,
				6
			}
		},
		["Strong Terra Strike"] = {
			type = "Instant",
			premium = true,
			exhaustion = 8000,
			words = "exori gran tera",
			id = 153,
			soul = 0,
			level = 70,
			mana = 60,
			icon = "strongterrastrike",
			group = {
				[1.0] = 2000,
				[4.0] = 8000
			},
			vocations = {
				2,
				6
			}
		},
		["Ultimate Terra Strike"] = {
			type = "Instant",
			premium = true,
			exhaustion = 30000,
			words = "exori max tera",
			id = 157,
			soul = 0,
			level = 90,
			mana = 100,
			icon = "ultimateterrastrike",
			group = {
				[1.0] = 4000
			},
			vocations = {
				2,
				6
			}
		},
		["Terra Wave"] = {
			type = "Instant",
			premium = false,
			exhaustion = 4000,
			words = "exevo tera hur",
			id = 120,
			soul = 0,
			level = 38,
			mana = 210,
			icon = "terrawave",
			group = {
				[1.0] = 2000
			},
			vocations = {
				2,
				6
			}
		},
		["Wrath of Nature"] = {
			type = "Instant",
			premium = true,
			exhaustion = 40000,
			words = "exevo gran mas tera",
			id = 56,
			soul = 0,
			level = 55,
			mana = 700,
			icon = "wrathofnature",
			group = {
				[1.0] = 4000
			},
			vocations = {
				2,
				6
			}
		},
		["Light Healing"] = {
			type = "Instant",
			premium = false,
			exhaustion = 1000,
			words = "exura",
			id = 1,
			soul = 0,
			level = 9,
			mana = 20,
			icon = "lighthealing",
			group = {
				[2.0] = 1000
			},
			vocations = {
				1,
				2,
				3,
				5,
				6,
				7
			}
		},
		["Wound Cleansing"] = {
			type = "Instant",
			premium = false,
			exhaustion = 1000,
			words = "exura ico",
			id = 123,
			soul = 0,
			level = 10,
			mana = 40,
			icon = "woundcleansing",
			group = {
				[2.0] = 1000
			},
			vocations = {
				4,
				8
			}
		},
		["Intense Wound Cleansing"] = {
			type = "Instant",
			premium = true,
			exhaustion = 600000,
			words = "exura gran ico",
			id = 158,
			soul = 0,
			level = 80,
			mana = 200,
			icon = "intensewoundcleansing",
			group = {
				[2.0] = 1000
			},
			vocations = {
				4,
				8
			}
		},
		["Cure Bleeding"] = {
			type = "Instant",
			premium = true,
			exhaustion = 6000,
			words = "exana kor",
			id = 144,
			soul = 0,
			level = 30,
			mana = 30,
			icon = "curebleeding",
			group = {
				[2.0] = 1000
			},
			vocations = {
				4,
				8
			}
		},
		["Cure Electrification"] = {
			type = "Instant",
			premium = true,
			exhaustion = 6000,
			words = "exana vis",
			id = 146,
			soul = 0,
			level = 22,
			mana = 30,
			icon = "curseelectrification",
			group = {
				[2.0] = 1000
			},
			vocations = {
				2,
				6
			}
		},
		["Cure Poison"] = {
			type = "Instant",
			premium = false,
			exhaustion = 6000,
			words = "exana pox",
			id = 29,
			soul = 0,
			level = 10,
			mana = 30,
			icon = "curepoison",
			group = {
				[2.0] = 1000
			},
			vocations = {
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8
			}
		},
		["Cure Burning"] = {
			type = "Instant",
			premium = true,
			exhaustion = 6000,
			words = "exana flam",
			id = 145,
			soul = 0,
			level = 30,
			mana = 30,
			icon = "cureburning",
			group = {
				[2.0] = 1000
			},
			vocations = {
				2,
				6
			}
		},
		["Cure Curse"] = {
			type = "Instant",
			premium = true,
			exhaustion = 6000,
			words = "exana mort",
			id = 147,
			soul = 0,
			level = 80,
			mana = 40,
			icon = "curecurse",
			group = {
				[2.0] = 1000
			},
			vocations = {
				3,
				7
			}
		},
		Recovery = {
			type = "Instant",
			premium = true,
			exhaustion = 60000,
			words = "utura",
			id = 159,
			soul = 0,
			level = 50,
			mana = 75,
			icon = "recovery",
			group = {
				[2.0] = 1000
			},
			vocations = {
				4,
				8,
				3,
				7
			}
		},
		["Intense Recovery"] = {
			type = "Instant",
			premium = true,
			exhaustion = 60000,
			words = "utura gran",
			id = 160,
			soul = 0,
			level = 100,
			mana = 165,
			icon = "intenserecovery",
			group = {
				[2.0] = 1000
			},
			vocations = {
				4,
				8,
				3,
				7
			}
		},
		Salvation = {
			type = "Instant",
			premium = true,
			exhaustion = 1000,
			words = "exura gran san",
			id = 36,
			soul = 0,
			level = 60,
			mana = 210,
			icon = "salvation",
			group = {
				[2.0] = 1000
			},
			vocations = {
				3,
				7
			}
		},
		["Intense Healing"] = {
			type = "Instant",
			premium = false,
			exhaustion = 1000,
			words = "exura gran",
			id = 2,
			soul = 0,
			level = 20,
			mana = 70,
			icon = "intensehealing",
			group = {
				[2.0] = 1000
			},
			vocations = {
				1,
				2,
				3,
				5,
				6,
				7
			}
		},
		["Heal Friend"] = {
			type = "Instant",
			premium = true,
			exhaustion = 1000,
			parameter = true,
			words = "exura sio",
			id = 84,
			soul = 0,
			level = 18,
			mana = 140,
			icon = "healfriend",
			group = {
				[2.0] = 1000
			},
			vocations = {
				2,
				6
			}
		},
		["Ultimate Healing"] = {
			type = "Instant",
			premium = false,
			exhaustion = 1000,
			words = "exura vita",
			id = 3,
			soul = 0,
			level = 30,
			mana = 160,
			icon = "ultimatehealing",
			group = {
				[2.0] = 1000
			},
			vocations = {
				1,
				2,
				5,
				6
			}
		},
		["Mass Healing"] = {
			type = "Instant",
			premium = true,
			exhaustion = 2000,
			words = "exura gran mas res",
			id = 82,
			soul = 0,
			level = 36,
			mana = 150,
			icon = "masshealing",
			group = {
				[2.0] = 1000
			},
			vocations = {
				2,
				6
			}
		},
		["Divine Healing"] = {
			type = "Instant",
			premium = false,
			exhaustion = 1000,
			words = "exura san",
			id = 125,
			soul = 0,
			level = 35,
			mana = 160,
			icon = "divinehealing",
			group = {
				[2.0] = 1000
			},
			vocations = {
				3,
				7
			}
		},
		Light = {
			type = "Instant",
			premium = false,
			exhaustion = 2000,
			words = "utevo lux",
			id = 10,
			soul = 0,
			level = 8,
			mana = 20,
			icon = "light",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8
			}
		},
		["Find Person"] = {
			type = "Instant",
			premium = false,
			exhaustion = 2000,
			parameter = true,
			words = "exiva",
			id = 20,
			soul = 0,
			level = 8,
			mana = 20,
			icon = "findperson",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8
			}
		},
		["Magic Rope"] = {
			type = "Instant",
			premium = true,
			exhaustion = 2000,
			words = "exani tera",
			id = 76,
			soul = 0,
			level = 9,
			mana = 20,
			icon = "magicrope",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8
			}
		},
		Levitate = {
			type = "Instant",
			premium = true,
			exhaustion = 2000,
			parameter = true,
			words = "exani hur",
			id = 81,
			soul = 0,
			level = 12,
			mana = 50,
			icon = "levitate",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8
			}
		},
		["Great Light"] = {
			type = "Instant",
			premium = false,
			exhaustion = 2000,
			words = "utevo gran lux",
			id = 11,
			soul = 0,
			level = 13,
			mana = 60,
			icon = "greatlight",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8
			}
		},
		["Magic Shield"] = {
			type = "Instant",
			premium = false,
			exhaustion = 2000,
			words = "utamo vita",
			id = 44,
			soul = 0,
			level = 14,
			mana = 50,
			icon = "magicshield",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				2,
				5,
				6
			}
		},
		Haste = {
			type = "Instant",
			premium = true,
			exhaustion = 2000,
			words = "utani hur",
			id = 6,
			soul = 0,
			level = 14,
			mana = 60,
			icon = "haste",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8
			}
		},
		Charge = {
			type = "Instant",
			premium = true,
			exhaustion = 2000,
			words = "utani tempo hur",
			id = 131,
			soul = 0,
			level = 25,
			mana = 100,
			icon = "charge",
			group = {
				[3.0] = 2000
			},
			vocations = {
				4,
				8
			}
		},
		["Swift Foot"] = {
			type = "Instant",
			premium = true,
			exhaustion = 2000,
			words = "utamo tempo san",
			id = 134,
			soul = 0,
			level = 55,
			mana = 400,
			icon = "swiftfoot",
			group = {
				[1.0] = 10000,
				[3.0] = 2000
			},
			vocations = {
				3,
				7
			}
		},
		Challenge = {
			type = "Instant",
			premium = true,
			exhaustion = 2000,
			words = "exeta res",
			id = 93,
			soul = 0,
			level = 20,
			mana = 30,
			icon = "challenge",
			group = {
				[3.0] = 2000
			},
			vocations = {
				8
			}
		},
		["Strong Haste"] = {
			type = "Instant",
			premium = true,
			exhaustion = 2000,
			words = "utani gran hur",
			id = 39,
			soul = 0,
			level = 20,
			mana = 100,
			icon = "stronghaste",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				2,
				5,
				6
			}
		},
		["Creature Illusion"] = {
			type = "Instant",
			premium = false,
			exhaustion = 2000,
			parameter = true,
			words = "utevo res ina",
			id = 38,
			soul = 0,
			level = 23,
			mana = 100,
			icon = "creatureillusion",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				2,
				5,
				6
			}
		},
		["Ultimate Light"] = {
			type = "Instant",
			premium = true,
			exhaustion = 2000,
			words = "utevo vis lux",
			id = 75,
			soul = 0,
			level = 26,
			mana = 140,
			icon = "ultimatelight",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				2,
				5,
				6
			}
		},
		["Cancel Invisibility"] = {
			type = "Instant",
			premium = true,
			exhaustion = 2000,
			words = "exana ina",
			id = 90,
			soul = 0,
			level = 26,
			mana = 200,
			icon = "cancelinvisibility",
			group = {
				[3.0] = 2000
			},
			vocations = {
				3,
				7
			}
		},
		Invisibility = {
			type = "Instant",
			premium = false,
			exhaustion = 2000,
			words = "utana vid",
			id = 45,
			soul = 0,
			level = 35,
			mana = 440,
			icon = "invisible",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				2,
				5,
				6
			}
		},
		Sharpshooter = {
			type = "Instant",
			premium = true,
			exhaustion = 2000,
			words = "utito tempo san",
			id = 135,
			soul = 0,
			level = 60,
			mana = 450,
			icon = "sharpshooter",
			group = {
				[2.0] = 10000,
				[3.0] = 10000
			},
			vocations = {
				3,
				7
			}
		},
		Protector = {
			type = "Instant",
			premium = true,
			exhaustion = 2000,
			words = "utamo tempo",
			id = 132,
			soul = 0,
			level = 55,
			mana = 200,
			icon = "protector",
			group = {
				[1.0] = 10000,
				[3.0] = 2000
			},
			vocations = {
				4,
				8
			}
		},
		["Blood Rage"] = {
			type = "Instant",
			premium = true,
			exhaustion = 2000,
			words = "utito tempo",
			id = 133,
			soul = 0,
			level = 60,
			mana = 290,
			icon = "bloodrage",
			group = {
				[3.0] = 2000
			},
			vocations = {
				4,
				8
			}
		},
		["Train Party"] = {
			type = "Instant",
			premium = true,
			exhaustion = 2000,
			words = "utito mas sio",
			id = 126,
			soul = 0,
			level = 32,
			mana = "Var.",
			icon = "trainparty",
			group = {
				[3.0] = 2000
			},
			vocations = {
				8
			}
		},
		["Protect Party"] = {
			type = "Instant",
			premium = true,
			exhaustion = 2000,
			words = "utamo mas sio",
			id = 127,
			soul = 0,
			level = 32,
			mana = "Var.",
			icon = "protectparty",
			group = {
				[3.0] = 2000
			},
			vocations = {
				7
			}
		},
		["Heal Party"] = {
			type = "Instant",
			premium = true,
			exhaustion = 2000,
			words = "utura mas sio",
			id = 128,
			soul = 0,
			level = 32,
			mana = "Var.",
			icon = "healparty",
			group = {
				[3.0] = 2000
			},
			vocations = {
				6
			}
		},
		["Enchant Party"] = {
			type = "Instant",
			premium = true,
			exhaustion = 2000,
			words = "utori mas sio",
			id = 129,
			soul = 0,
			level = 32,
			mana = "Var.",
			icon = "enchantparty",
			group = {
				[3.0] = 2000
			},
			vocations = {
				5
			}
		},
		["Summon Creature"] = {
			type = "Instant",
			premium = false,
			exhaustion = 2000,
			parameter = true,
			words = "utevo res",
			id = 9,
			soul = 0,
			level = 25,
			mana = "Var.",
			icon = "summoncreature",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				2,
				5,
				6
			}
		},
		["Conjure Arrow"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "exevo con",
			id = 51,
			soul = 1,
			level = 13,
			mana = 100,
			icon = "conjurearrow",
			group = {
				[3.0] = 2000
			},
			vocations = {
				3,
				7
			}
		},
		Food = {
			type = "Instant",
			premium = false,
			exhaustion = 2000,
			words = "exevo pan",
			id = 42,
			soul = 1,
			level = 14,
			mana = 120,
			icon = "food",
			group = {
				[3.0] = 2000
			},
			vocations = {
				2,
				6
			}
		},
		["Conjure Poisoned Arrow"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "exevo con pox",
			id = 48,
			soul = 2,
			level = 16,
			mana = 130,
			icon = "poisonedarrow",
			group = {
				[3.0] = 2000
			},
			vocations = {
				3,
				7
			}
		},
		["Conjure Bolt"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "exevo con mort",
			id = 79,
			soul = 2,
			level = 17,
			mana = 140,
			icon = "conjurebolt",
			group = {
				[3.0] = 2000
			},
			vocations = {
				3,
				7
			}
		},
		["Conjure Sniper Arrow"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "exevo con hur",
			id = 108,
			soul = 3,
			level = 24,
			mana = 160,
			icon = "sniperarrow",
			group = {
				[3.0] = 2000
			},
			vocations = {
				3,
				7
			}
		},
		["Conjure Explosive Arrow"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "exevo con flam",
			id = 49,
			soul = 3,
			level = 25,
			mana = 290,
			icon = "explosivearrow",
			group = {
				[3.0] = 2000
			},
			vocations = {
				3,
				7
			}
		},
		["Conjure Piercing Bolt"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "exevo con grav",
			id = 109,
			soul = 3,
			level = 33,
			mana = 180,
			icon = "piercingbolt",
			group = {
				[3.0] = 2000
			},
			vocations = {
				3,
				7
			}
		},
		["Enchant Staff"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "exeta vis",
			id = 92,
			soul = 0,
			level = 41,
			mana = 80,
			icon = "enchantstaff",
			group = {
				[3.0] = 2000
			},
			vocations = {
				5
			}
		},
		["Enchant Spear"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "exeta con",
			id = 110,
			soul = 3,
			level = 45,
			mana = 350,
			icon = "enchantspear",
			group = {
				[3.0] = 2000
			},
			vocations = {
				3,
				7
			}
		},
		["Conjure Power Bolt"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "exevo con vis",
			id = 95,
			soul = 3,
			level = 59,
			mana = 800,
			icon = "powerbolt",
			group = {
				[3.0] = 2000
			},
			vocations = {
				7
			}
		},
		["Poison Field"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adevo grav pox",
			id = 26,
			soul = 1,
			level = 14,
			mana = 200,
			icon = "poisonfield",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				2,
				5,
				6
			}
		},
		["Light Magic Missile"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adori min vis",
			id = 7,
			soul = 1,
			level = 15,
			mana = 120,
			icon = "lightmagicmissile",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				2,
				5,
				6
			}
		},
		["Fire Field"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adevo grav flam",
			id = 25,
			soul = 1,
			level = 15,
			mana = 240,
			icon = "firefield",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				2,
				5,
				6
			}
		},
		Fireball = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adori flam",
			id = 15,
			soul = 3,
			level = 27,
			mana = 460,
			icon = "fireball",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				5
			}
		},
		["Energy Field"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adevo grav vis",
			id = 27,
			soul = 2,
			level = 18,
			mana = 320,
			icon = "energyfield",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				2,
				5,
				6
			}
		},
		Stalagmite = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adori tera",
			id = 77,
			soul = 2,
			level = 24,
			mana = 400,
			icon = "stalagmite",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				5,
				2,
				6
			}
		},
		["Great Fireball"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adori mas flam",
			id = 16,
			soul = 3,
			level = 30,
			mana = 530,
			icon = "greatfireball",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				5
			}
		},
		["Heavy Magic Missile"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adori vis",
			id = 8,
			soul = 2,
			level = 25,
			mana = 350,
			icon = "heavymagicmissile",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				5,
				2,
				6
			}
		},
		["Poison Bomb"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adevo mas pox",
			id = 91,
			soul = 2,
			level = 25,
			mana = 520,
			icon = "poisonbomb",
			group = {
				[3.0] = 2000
			},
			vocations = {
				2,
				6
			}
		},
		Firebomb = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adevo mas flam",
			id = 17,
			soul = 3,
			level = 27,
			mana = 600,
			icon = "firebomb",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				2,
				5,
				6
			}
		},
		Soulfire = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adevo res flam",
			id = 50,
			soul = 3,
			level = 27,
			mana = 600,
			icon = "soulfire",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				2,
				5,
				6
			}
		},
		["Poison Wall"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adevo mas grav pox",
			id = 32,
			soul = 3,
			level = 29,
			mana = 640,
			icon = "poisonwall",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				2,
				5,
				6
			}
		},
		Explosion = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adevo mas hur",
			id = 18,
			soul = 3,
			level = 31,
			mana = 570,
			icon = "explosion",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				2,
				5,
				6
			}
		},
		["Fire Wall"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adevo mas grav flam",
			id = 28,
			soul = 3,
			level = 33,
			mana = 780,
			icon = "firewall",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				2,
				5,
				6
			}
		},
		Energybomb = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adevo mas vis",
			id = 55,
			soul = 5,
			level = 37,
			mana = 880,
			icon = "energybomb",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				5
			}
		},
		["Energy Wall"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adevo mas grav vis",
			id = 33,
			soul = 5,
			level = 41,
			mana = 1000,
			icon = "energywall",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				2,
				5,
				6
			}
		},
		["Sudden Death"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adori gran mort",
			id = 21,
			soul = 5,
			level = 45,
			mana = 985,
			icon = "suddendeath",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				5
			}
		},
		["Cure Poison Rune"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adana pox",
			id = 31,
			soul = 1,
			level = 15,
			mana = 200,
			icon = "antidote",
			group = {
				[3.0] = 2000
			},
			vocations = {
				2,
				6
			}
		},
		["Intense Healing Rune"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adura gran",
			id = 4,
			soul = 2,
			level = 15,
			mana = 240,
			icon = "intensehealingrune",
			group = {
				[3.0] = 2000
			},
			vocations = {
				2,
				6
			}
		},
		["Ultimate Healing Rune"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adura vita",
			id = 5,
			soul = 3,
			level = 24,
			mana = 400,
			icon = "ultimatehealingrune",
			group = {
				[3.0] = 2000
			},
			vocations = {
				2,
				6
			}
		},
		["Convince Creature"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adeta sio",
			id = 12,
			soul = 3,
			level = 16,
			mana = 200,
			icon = "convincecreature",
			group = {
				[3.0] = 2000
			},
			vocations = {
				2,
				6
			}
		},
		["Animate Dead"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adana mort",
			id = 83,
			soul = 5,
			level = 27,
			mana = 600,
			icon = "animatedead",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				2,
				5,
				6
			}
		},
		Chameleon = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adevo ina",
			id = 14,
			soul = 2,
			level = 27,
			mana = 600,
			icon = "chameleon",
			group = {
				[3.0] = 2000
			},
			vocations = {
				2,
				6
			}
		},
		["Destroy Field"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adito grav",
			id = 30,
			soul = 2,
			level = 17,
			mana = 120,
			icon = "destroyfield",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				2,
				3,
				5,
				6,
				7
			}
		},
		Desintegrate = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adito tera",
			id = 78,
			soul = 3,
			level = 21,
			mana = 200,
			icon = "desintegrate",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				2,
				3,
				5,
				6,
				7
			}
		},
		["Magic Wall"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adevo grav tera",
			id = 86,
			soul = 5,
			level = 32,
			mana = 750,
			icon = "magicwall",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				5
			}
		},
		["Wild Growth"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adevo grav vita",
			id = 94,
			soul = 5,
			level = 27,
			mana = 600,
			icon = "wildgrowth",
			group = {
				[3.0] = 2000
			},
			vocations = {
				2,
				6
			}
		},
		Paralyze = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adana ani",
			id = 54,
			soul = 3,
			level = 54,
			mana = 1400,
			icon = "paralyze",
			group = {
				[3.0] = 2000
			},
			vocations = {
				2,
				6
			}
		},
		Icicle = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adori frigo",
			id = 114,
			soul = 3,
			level = 28,
			mana = 460,
			icon = "icicle",
			group = {
				[3.0] = 2000
			},
			vocations = {
				2,
				6
			}
		},
		Avalanche = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adori mas frigo",
			id = 115,
			soul = 3,
			level = 30,
			mana = 530,
			icon = "avalanche",
			group = {
				[3.0] = 2000
			},
			vocations = {
				2,
				6
			}
		},
		["Stone Shower"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adori mas tera",
			id = 116,
			soul = 3,
			level = 28,
			mana = 430,
			icon = "stoneshower",
			group = {
				[3.0] = 2000
			},
			vocations = {
				2,
				6
			}
		},
		Thunderstorm = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adori mas vis",
			id = 117,
			soul = 3,
			level = 28,
			mana = 430,
			icon = "thunderstorm",
			group = {
				[3.0] = 2000
			},
			vocations = {
				1,
				5
			}
		},
		["Holy Missile"] = {
			type = "Conjure",
			premium = false,
			exhaustion = 2000,
			words = "adori san",
			id = 130,
			soul = 3,
			level = 27,
			mana = 350,
			icon = "holymissile",
			group = {
				[3.0] = 2000
			},
			vocations = {
				3,
				7
			}
		},
		["Divine speed [Dungeon]"] = {
			type = "Instant",
			premium = true,
			exhaustion = 60000,
			parameter = true,
			words = "utamo sio",
			id = 600,
			soul = 0,
			level = 50,
			mana = 120,
			icon = "sharpshooter",
			group = {
				[2.0] = 2000
			},
			vocations = {
				7
			}
		},
		["Arrow rain [Dungeon]"] = {
			type = "Instant",
			premium = true,
			exhaustion = 8000,
			words = "exori con mas",
			id = 601,
			soul = 0,
			level = 50,
			mana = 160,
			icon = "powerbolt",
			group = {
				[2.0] = 2000
			},
			vocations = {
				7
			}
		},
		["Extreme recovery [Dungeon]"] = {
			type = "Instant",
			premium = true,
			exhaustion = 60000,
			words = "utura spur",
			id = 700,
			soul = 0,
			level = 70,
			mana = 75,
			icon = "chivalrouschallange",
			group = {
				[2.0] = 2000
			},
			vocations = {
				8
			}
		},
		["Inflict massive wounds [Dungeon]"] = {
			type = "Instant",
			premium = true,
			exhaustion = 30000,
			words = "exori kor",
			id = 701,
			soul = 0,
			level = 55,
			mana = 145,
			icon = "fairwoundcleansing",
			group = {
				[1.0] = 2000
			},
			vocations = {
				8
			}
		},
		["Massive death wave [Dungeon]"] = {
			type = "Instant",
			premium = true,
			exhaustion = 20000,
			words = "exevo mort hur max",
			id = 900,
			soul = 0,
			level = 80,
			mana = 100,
			icon = "deathstrike",
			group = {
				[1.0] = 2000
			},
			vocations = {
				6
			}
		},
		["Massive energy wave [Dungeon]"] = {
			type = "Instant",
			premium = true,
			exhaustion = 20000,
			words = "exevo vis hur max",
			id = 800,
			soul = 0,
			level = 80,
			mana = 100,
			icon = "greatenergybeam",
			group = {
				[1.0] = 2000
			},
			vocations = {
				5
			}
		}
	}
}
SpellIcons = {
	summonsorcererfamiliar = {
		130,
		173
	},
	summondruidfamiliar = {
		129,
		172
	},
	summonpaladinfamiliar = {
		127,
		171
	},
	summonknightfamiliar = {
		128,
		170
	},
	exposeweakness = {
		134,
		106
	},
	sapstrenght = {
		135,
		105
	},
	restoration = {
		137,
		103
	},
	fairwoundcleansing = {
		132,
		102
	},
	chivalrouschallange = {
		131,
		101
	},
	naturesembrace = {
		138,
		101
	},
	divinedazzle = {
		139,
		101
	},
	greatfirewave = {
		136,
		100
	},
	conjurewandofdarkness = {
		133,
		92
	},
	intenserecovery = {
		16,
		160
	},
	recovery = {
		15,
		159
	},
	intensewoundcleansing = {
		4,
		158
	},
	ultimateterrastrike = {
		37,
		157
	},
	ultimateicestrike = {
		34,
		156
	},
	ultimateenergystrike = {
		31,
		155
	},
	ultimateflamestrike = {
		28,
		154
	},
	strongterrastrike = {
		36,
		153
	},
	strongicestrike = {
		33,
		152
	},
	strongenergystrike = {
		30,
		151
	},
	strongflamestrike = {
		27,
		150
	},
	lightning = {
		51,
		149
	},
	physicalstrike = {
		17,
		148
	},
	curecurse = {
		11,
		147
	},
	curseelectrification = {
		14,
		146
	},
	cureburning = {
		13,
		145
	},
	curebleeding = {
		12,
		144
	},
	holyflash = {
		53,
		143
	},
	envenom = {
		58,
		142
	},
	inflictwound = {
		57,
		141
	},
	electrify = {
		56,
		140
	},
	curse = {
		54,
		139
	},
	ignite = {
		55,
		138
	},
	sharpshooter = {
		121,
		135
	},
	swiftfoot = {
		119,
		134
	},
	bloodrage = {
		96,
		133
	},
	protector = {
		122,
		132
	},
	charge = {
		98,
		131
	},
	holymissile = {
		76,
		130
	},
	enchantparty = {
		113,
		129
	},
	healparty = {
		126,
		128
	},
	protectparty = {
		123,
		127
	},
	trainparty = {
		120,
		126
	},
	divinehealing = {
		2,
		125
	},
	divinecaldera = {
		40,
		124
	},
	woundcleansing = {
		3,
		123
	},
	divinemissile = {
		39,
		122
	},
	icewave = {
		45,
		121
	},
	terrawave = {
		47,
		120
	},
	rageoftheskies = {
		52,
		119
	},
	eternalwinter = {
		50,
		118
	},
	thunderstorm = {
		63,
		117
	},
	stoneshower = {
		65,
		116
	},
	avalanche = {
		92,
		115
	},
	icicle = {
		75,
		114
	},
	terrastrike = {
		35,
		113
	},
	icestrike = {
		32,
		112
	},
	etherealspear = {
		18,
		111
	},
	enchantspear = {
		104,
		110
	},
	piercingbolt = {
		110,
		109
	},
	sniperarrow = {
		112,
		108
	},
	whirlwindthrow = {
		19,
		107
	},
	groundshaker = {
		25,
		106
	},
	fierceberserk = {
		22,
		105
	},
	powerbolt = {
		108,
		95
	},
	wildgrowth = {
		61,
		94
	},
	challenge = {
		97,
		93
	},
	enchantstaff = {
		103,
		92
	},
	poisonbomb = {
		70,
		91
	},
	cancelinvisibility = {
		95,
		90
	},
	flamestrike = {
		26,
		89
	},
	energystrike = {
		29,
		88
	},
	deathstrike = {
		38,
		87
	},
	magicwall = {
		72,
		86
	},
	healfriend = {
		8,
		84
	},
	animatedead = {
		93,
		83
	},
	masshealing = {
		9,
		82
	},
	levitate = {
		125,
		81
	},
	berserk = {
		21,
		80
	},
	conjurebolt = {
		107,
		79
	},
	desintegrate = {
		88,
		78
	},
	stalagmite = {
		66,
		77
	},
	magicrope = {
		105,
		76
	},
	ultimatelight = {
		115,
		75
	},
	annihilation = {
		24,
		62
	},
	brutalstrike = {
		23,
		61
	},
	frontsweep = {
		20,
		59
	},
	strongetherealspear = {
		59,
		57
	},
	wrathofnature = {
		48,
		56
	},
	energybomb = {
		86,
		55
	},
	paralyze = {
		71,
		54
	},
	conjurearrow = {
		106,
		51
	},
	soulfire = {
		67,
		50
	},
	explosivearrow = {
		109,
		49
	},
	poisonedarrow = {
		111,
		48
	},
	invisible = {
		94,
		45
	},
	magicshield = {
		124,
		44
	},
	strongicewave = {
		46,
		43
	},
	food = {
		99,
		42
	},
	stronghaste = {
		102,
		39
	},
	creatureillusion = {
		100,
		38
	},
	salvation = {
		60,
		36
	},
	energywall = {
		84,
		33
	},
	poisonwall = {
		68,
		32
	},
	antidote = {
		10,
		31
	},
	destroyfield = {
		87,
		30
	},
	curepoison = {
		10,
		29
	},
	firewall = {
		80,
		28
	},
	energyfield = {
		85,
		27
	},
	poisonfield = {
		69,
		26
	},
	firefield = {
		81,
		25
	},
	hellscore = {
		49,
		24
	},
	greatenergybeam = {
		42,
		23
	},
	energybeam = {
		41,
		22
	},
	suddendeath = {
		64,
		21
	},
	findperson = {
		114,
		20
	},
	firewave = {
		44,
		19
	},
	explosion = {
		83,
		18
	},
	firebomb = {
		82,
		17
	},
	greatfireball = {
		78,
		16
	},
	fireball = {
		79,
		15
	},
	chameleon = {
		91,
		14
	},
	energywave = {
		43,
		13
	},
	convincecreature = {
		90,
		12
	},
	greatlight = {
		116,
		11
	},
	light = {
		117,
		10
	},
	summoncreature = {
		118,
		9
	},
	heavymagicmissile = {
		77,
		8
	},
	lightmagicmissile = {
		73,
		7
	},
	haste = {
		101,
		6
	},
	ultimatehealingrune = {
		62,
		5
	},
	intensehealingrune = {
		74,
		4
	},
	ultimatehealing = {
		1,
		3
	},
	intensehealing = {
		7,
		2
	},
	lighthealing = {
		6,
		1
	}
}
VocationNames = {
	"Sorcerer",
	"Druid",
	"Paladin",
	"Knight",
	"Master Sorcerer",
	"Elder Druid",
	"Royal Paladin",
	"Elite Knight"
}
SpellGroups = {
	"Attack",
	"Healing",
	"Support",
	"Special",
	"Cripple"
}
Spells = {}

function Spells.getClientId(spellName)
	local profile = Spells.getSpellProfileByName(spellName)
	local id = SpellInfo[profile][spellName].icon

	if not tonumber(id) and SpellIcons[id] then
		return SpellIcons[id][1]
	end

	return tonumber(id)
end

function Spells.getServerId(spellName)
	local profile = Spells.getSpellProfileByName(spellName)
	local id = SpellInfo[profile][spellName].icon

	if not tonumber(id) and SpellIcons[id] then
		return SpellIcons[id][2]
	end

	return tonumber(id)
end

function Spells.getSpellByName(name)
	return SpellInfo[Spells.getSpellProfileByName(name)][name]
end

function Spells.getSpellByWords(words)
	local words = words:lower():trim()

	for profile, data in pairs(SpellInfo) do
		for k, spell in pairs(data) do
			if spell.words == words then
				return spell, profile, k
			end
		end
	end

	return nil
end

function Spells.getSpellByIcon(iconId)
	for profile, data in pairs(SpellInfo) do
		for k, spell in pairs(data) do
			if spell.id == iconId then
				return spell, profile, k
			end
		end
	end

	return nil
end

function Spells.getSpellIconIds()
	local ids = {}

	for profile, data in pairs(SpellInfo) do
		for k, spell in pairs(data) do
			table.insert(ids, spell.id)
		end
	end

	return ids
end

function Spells.getSpellProfileById(id)
	for profile, data in pairs(SpellInfo) do
		for k, spell in pairs(data) do
			if spell.id == id then
				return profile
			end
		end
	end

	return nil
end

function Spells.getSpellProfileByWords(words)
	for profile, data in pairs(SpellInfo) do
		for k, spell in pairs(data) do
			if spell.words == words then
				return profile
			end
		end
	end

	return nil
end

function Spells.getSpellProfileByName(spellName)
	for profile, data in pairs(SpellInfo) do
		if table.findbykey(data, spellName:trim(), true) then
			return profile
		end
	end

	return nil
end

function Spells.getSpellsByVocationId(vocId)
	local spells = {}

	for profile, data in pairs(SpellInfo) do
		for k, spell in pairs(data) do
			if table.contains(spell.vocations, vocId) then
				table.insert(spells, spell)
			end
		end
	end

	return spells
end

function Spells.filterSpellsByGroups(spells, groups)
	local filtered = {}

	for v, spell in pairs(spells) do
		local spellGroups = Spells.getGroupIds(spell)

		if table.equals(spellGroups, groups) then
			table.insert(filtered, spell)
		end
	end

	return filtered
end

function Spells.getGroupIds(spell)
	local groups = {}

	for k, _ in pairs(spell.group) do
		table.insert(groups, k)
	end

	return groups
end

function Spells.getImageClip(id, profile)
	return (id - 1) % 12 * SpelllistSettings[profile].iconSize.width .. " " .. (math.ceil(id / 12) - 1) * SpelllistSettings[profile].iconSize.height .. " " .. SpelllistSettings[profile].iconSize.width .. " " .. SpelllistSettings[profile].iconSize.height
end
