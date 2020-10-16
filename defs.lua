local defs = {}

-- Outpost defence handling

defs.enchantments = {
    beauty = {
        raise = "rub beauty",
        lower = "",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = {},
        defup = false,
        keepup = false
    },
	mercy = {
        raise = "rub mercy",
        lower = "",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = {},
        defup = false,
        keepup = false
    },
	perfection = {
        raise = "rub perfection",
        lower = "",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = {},
        defup = false,
        keepup = false
    },
	kingdom = {
        raise = "rub kingdom",
        lower = "",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = {},
        defup = false,
        keepup = false
    },
	waterwalk = {
        raise = "rub waterwalk",
        lower = "",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	waterbreathe = {
        raise = "rub waterbreathe",
        lower = "",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	levitation = {
        raise = "rub levitate",
        lower = "",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	nimbus = {
        raise = "rub nimbus",
        lower = "",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	acquisitio = {
        raise = "rub acquisitio",
        lower = "rub acquisitio",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	avarice = {
        raise = "blow avaricehorn",
        lower = "",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	truetime = {
        raise = "wind truetime",
        lower = "",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	goldenbox = {
        raise = "crank goldenbox",
        lower = "",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	emeraldbox = {
        raise = "crank emeraldbox",
        lower = "",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	azurebox = {
        raise = "crank azurebox",
        lower = "",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	protection = {
		raise = "read protection",
		lower = "",
		required = { op.bals.scroll },
		consumed = { op.bals.scroll },
        defup = false,
        keepup = false
	},
}
defs.consumable = {
	blacktea = {
		raise = "sip blacktea",
		lower = "",
		required = {},
		consumed = {},
        defup = false,
        keepup = false
	},
	greentea = {
		raise = "sip greentea",
		lower = "",
		required = {},
		consumed = {},
        defup = false,
        keepup = false
	},
	oolongtea = {
		raise = "sip oolongtea",
		lower = "",
		required = {},
		consumed = {},
        defup = false,
        keepup = false
	},
	whitetea = {
		raise = "sip whitetea",
		lower = "",
		required = {},
		consumed = {},
        defup = false,
        keepup = false
	},
	greentea = {
		raise = "sip greentea",
		lower = "",
		required = {},
		consumed = {},
        defup = false,
        keepup = false
	},
	amberbeer = {
		raise = "sip amberbeer",
		lower = "",
		required = {},
		consumed = {},
        defup = false,
        keepup = false
	},
	darkbeer = {
		raise = "sip darkbeer",
		lower = "",
		required = {},
		consumed = {},
        defup = false,
        keepup = false
	},
	kafe = {
		raise = "eat kafe",
		lower = "",
		required = {},
		consumed = {},
        defup = false,
        keepup = false
	},
	lovepotion = {
		raise = "sip love",
		lower = "sip choleric",
		required = {},
		consumed = {},
        defup = false,
        keepup = false
	},
	moonwater = {
		raise = "sip moonwater",
		lower = "",
		required = {},
		consumed = {},
        defup = false,
        keepup = false
	},
	quicksilver = {
		raise = "sip quicksilver",
		lower = "",
		required = {},
		consumed = {},
        defup = false,
        keepup = false
	},
}

defs.combat = {
    keeneye = {
        raise = "keeneye on",
        lower = "keeneye off",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.balance" },
        defup = false,
        keepup = false
    },
}
defs.discernment = {
    nightsight = {
        raise = "nightsight",
        lower = "",
		required = {},
		consumed = {},
        defup = false,
        keepup = false
    },
    thirdeye = {
        raise = "thirdeye",
        lower = "thirdeye relax",
		required = {},
		consumed = {},
        defup = false,
        keepup = false
    },   	
	sixthsense = {
        raise = "sixthsense",
        lower = "relax sixthsense",
        required = "op.bals.dust",
		consumed = "op.bals.dust",
        defup = false,
        keepup = false
    },
	deathsight = {
        raise = "deathsight on",
        lower = "deathsight off",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	lipread = {
	    raise = "lipread",
        lower = "",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
	},
	powermask = {
	    raise = "powermask",
        lower = "",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
		power = 10,
        defup = false,
        keepup = false
	},
	aethersight = {
	    raise = "aethersight on",
        lower = "aethersight off",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
		power = 3,
        defup = false,
        keepup = false
	},
}
defs.lowmagic = {
    circle = {
        raise = "invoke circle",
        lower = "",
		required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	red = {
        raise = "invoke red",
        lower = "invoke red off",
		required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	orange = {
        raise = "invoke orange",
        lower = "",
		required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
		power = 1,
        defup = false,
        keepup = false
    },
	yellow = {
        raise = "invoke yellow",
        lower = "",
		required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
		power = 3,
        defup = false,
        keepup = false
    },
	blue = {
        raise = "invoke blue",
        lower = "",
		required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	autumn = {
        raise = "invoke autumn",
        lower = "",
		required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	serpent = {
        raise = "invoke serpent",
        lower = "",
		required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
		power = 10,
        defup = false,
        keepup = false
    },
}

defs.discipline = {
	insomnia = {
        raise = "insomnia",
        lower = "relax insomnia",
		required = {},
		consumed = {},
        defup = false,
        keepup = false
    },
	truehearing = {
        raise = "truehearing",
        lower = "relax truehearing",
		required = "op.bals.steam",
		consumed = "op.bals.steam",
        defup = false,
        keepup = false
    },
	obliviousness = {
        raise = "obliviousness on",
        lower = "obliviousness off",
		required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	metawake = {
        raise = "metawake on",
        lower = "metawake off",
		required = {},
		consumed = {},
        defup = false,
        keepup = false
    },
	breathing = {
        raise = "hold breath",
        lower = "",
		required = {},
		consumed = {},
        defup = false,
        keepup = false
    },
	selfishness = {
        raise = "selfishness",
        lower = "generosity",
		required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
}
defs.environment = {
	attunement = {
        raise = "attune",
        lower = "attune release",
		required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.balance" },
		power = 10,
        defup = false,
        keepup = false
    },
}
defs.influence = {
	charismaticaura = {
        raise = "charismaticaura on",
        lower = "charismaticaura off",
		required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = {},
        defup = false,
        keepup = false
    },
}
defs.dramatics = {
	performance = {
        raise = "performance on",
        lower = "performance off",
		required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	lawyerly = {
        raise = "attitude lawyerly",
        lower = "",
		required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	saintly = {
        raise = "attitude saintly",
        lower = "",
		required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	zealotry = {
        raise = "attitude zealotry",
        lower = "",
		required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	bully = {
        raise = "perform bully",
        lower = "perform end",
		required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	sycophant = {
        raise = "perform sycophant",
        lower = "perform end",
		required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	drunkard = {
        raise = "perform drunkard",
        lower = "perform end",
		required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	bureaucrat = {
        raise = "perform bureaucrat",
        lower = "perform end",
		required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	sober = {
        raise = "perform sober",
        lower = "perform end",
		required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	gorgeous = {
        raise = "perform gorgeous",
        lower = "perform end",
		required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	wounded = {
        raise = "perform wounded",
        lower = "perform end",
		required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	vagabond = {
        raise = "perform vagabond",
        lower = "perform end",
		required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	diplomat = {
        raise = "perform diplomat",
        lower = "perform end",
		required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	review = {
        raise = "review on",
        lower = "review off",
		required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
}

defs.totems = {
    squirrel = {
        raise = "spiritbond squirrel",
        lower = "spiritrelease squirrel",
        required = { "op.bals.balance", "op.bals.equilibrium" },
        consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
    night = {
        raise = "spiritbond night",
        lower = "spiritrelease night",
        required = { "op.bals.balance", "op.bals.equilibrium" },
        consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
    skunk = {
        raise = "spiritbond skunk",
        lower = "spiritrelease skunk",
        required = { "op.bals.balance", "op.bals.equilibrium" },
        consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
    sun = {
        raise = "spiritbond sun",
        lower = "spiritrelease sun",
        required = { "op.bals.balance", "op.bals.equilibrium" },
        consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
    rock = {
        raise = "spiritbond rock",
        lower = "spiritrelease rock",
        required = { "op.bals.balance", "op.bals.equilibrium" },
        consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
    moon = {
        raise = "spiritbond moon",
        lower = "spiritrelease moon",
        required = { "op.bals.balance", "op.bals.equilibrium" },
        consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
    crow = {
        raise = "spiritbond crow",
        lower = "spiritrelease crow",
        required = { "op.bals.balance", "op.bals.equilibrium" },
        consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
    tree = {
        raise = "spiritbond tree",
        lower = "spiritrelease tree",
        required = { "op.bals.balance", "op.bals.equilibrium" },
        consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
    groundhog = {
        raise = "spiritbond groundhog",
        lower = "spiritrelease groundhog",
        required = { "op.bals.balance", "op.bals.equilibrium" },
        consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
    trout = {
        raise = "spiritbond trout",
        lower = "spiritrelease trout",
        required = { "op.bals.balance", "op.bals.equilibrium" },
        consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
    wolf = {
        raise = "spiritbond wolf",
        lower = "spiritrelease wolf",
        required = { "op.bals.balance", "op.bals.equilibrium" },
        consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
    bear = {
        raise = "spiritbond bear",
        lower = "spiritrelease bear",
        required = { "op.bals.balance", "op.bals.equilibrium" },
        consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
    stag = {
        raise = "spiritbond stag",
        lower = "spiritrelease stag",
        required = { "op.bals.balance", "op.bals.equilibrium" },
        consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
    monkey = {
        raise = "spiritbond monkey",
        lower = "spiritrelease monkey",
        required = { "op.bals.balance", "op.bals.equilibrium" },
        consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
    horse = {
        raise = "spiritbond horse",
        lower = "spiritrelease horse",
        required = { "op.bals.balance", "op.bals.equilibrium" },
        consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
    river = {
        raise = "spiritbond river",
        lower = "spiritrelease river",
        required = { "op.bals.balance", "op.bals.equilibrium" },
        consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
    snake = {
        raise = "spiritbond snake",
        lower = "spiritrelease snake",
        required = { "op.bals.balance", "op.bals.equilibrium" },
        consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
    nature = {
        raise = "spiritbond nature",
        lower = "spiritrelease nature",
        required = { "op.bals.balance", "op.bals.equilibrium" },
        consumed = { "op.bals.equilibrium" },
        power = 5,
        defup = false,
        keepup = false
    }
}

defs.moon = {
    aura = {
        raise = "moondance aura",
        lower = "",
        required = { "op.bals.balance", "op.bals.equilibrium" },
        consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
    waxing = {
        raise = "moondance waxing",
        lower = "",
        required = { "op.bals.balance", "op.bals.equilibrium" },
        consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
    shine = {
        raise = "moondance shine",
        lower = "",
        required = { "op.bals.balance", "op.bals.equilibrium" },
        consumed = { "op.bals.equilibrium" },
        power = 4,
        defup = false,
        keepup = false
    },
    full = {
        raise = "moondance full",
        lower = "",
        required = { "op.bals.balance", "op.bals.equilibrium" },
        consumed = { "op.bals.equilibrium" },
        power = 4,
        defup = false,
        keepup = false
    }
}

defs.stag = {
    staghide = {
        raise = "staghide",
        lower = "",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	    greenman = {
        raise = "paint face greenman",
        lower = "wipe face greenman",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.balance" },
        defup = false,
        keepup = false
    },
	    trueheart = {
        raise = "paint face trueheart",
        lower = "wipe face trueheart",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.balance" },
        defup = false,
        keepup = false
    },
    bolting = {
        raise = "bolting on",
        lower = "bolting off",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	lightning = {
        raise = "paint face lightning",
        lower = "wipe face lightning",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.balance" },
        defup = false,
        keepup = false
    },
    swiftstripes = {
        raise = "paint face swiftstripes",
        lower = "wipe face swiftstripes",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.balance" },
        defup = false,
        keepup = false
    },
    stagform = {
        raise = "stagform",
        lower = "",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
		power = 10,
        defup = false,
        keepup = false
    },
}

defs.nature = {
    barkskin = {
        raise = "nature barkskin",
        lower = "",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
    blend = {
        raise = "nature blend on",
        lower = "nature blend off",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	rooting = {
        raise = "nature rooting",
        lower = "nature rooting off",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
	torc = {
        raise = "nature torc",
        lower = "",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
}

defs.druidry = {
    treebourne = {
        raise = "forestcast treebourne",
        lower = "",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
}
defs.dreamweaving = {
    control = {
        raise = "dreamweave control",
        lower = "",
        required = { "op.bals.balance", "op.bals.equilibrium" },
		consumed = { "op.bals.equilibrium" },
        defup = false,
        keepup = false
    },
}

