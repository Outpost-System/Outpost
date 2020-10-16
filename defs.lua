local defs = {}

-- Outpost defence handling

defs.enchantments = {
    beauty = {
        raise = "rub beauty",
        lower = "",
        required = { "balance", "equilibrium" }
    },
	mercy = {
        raise = "rub mercy",
        lower = "",
        required = { "balance", "equilibrium" }
    },
	perfection = {
        raise = "rub perfection",
        lower = "",
        required = { "balance", "equilibrium" }
    },
	kingdom = {
        raise = "rub kingdom",
        lower = "",
        required = { "balance", "equilibrium" }
    },
	waterwalk = {
        raise = "rub waterwalk",
        lower = "",
        required = { "balance", "equilibrium" }
    },
	waterbreathe = {
        raise = "rub waterbreathe",
        lower = "",
        required = { "balance", "equilibrium" }
    },
	levitation = {
        raise = "rub levitation",
        lower = "",
        required = { "balance", "equilibrium" }
    },
	nimbus = {
        raise = "rub nimbus",
        lower = "",
        required = { "balance", "equilibrium" }
    },
	acquisitio = {
        raise = "rub acquisitio",
        lower = "",
        required = { "balance", "equilibrium" }
    },
	avarice = {
        raise = "blow avaricehorn",
        lower = "",
        required = { "balance", "equilibrium" }
    },
	truetime = {
        raise = "wind truetime",
        lower = "",
        required = { "balance", "equilibrium" }
    },
	goldenbox = {
        raise = "crank goldenbox",
        lower = "",
        required = { "balance", "equilibrium" }
    },
	emeraldbox = {
        raise = "crank emeraldbox",
        lower = "",
        required = { "balance", "equilibrium" }
    },
	azurebox = {
        raise = "crank azurebox",
        lower = "",
        required = { "balance", "equilibrium" }
    },
	protection = {
		raise = "read protection",
		lower = "",
		required = op.bals.scroll
	},
}
defs.consumable = {
	blacktea = {
		raise = "sip blacktea",
		lower = "",
		required = {},
	},
	greentea = {
		raise = "sip greentea",
		lower = "",
		required = {},
	},
	oolongtea = {
		raise = "sip oolongtea",
		lower = "",
		required = {},
	},
	whitetea = {
		raise = "sip whitetea",
		lower = "",
		required = {},
	},
	greentea = {
		raise = "sip greentea",
		lower = "",
		required = {},
	},
	amberbeer = {
		raise = "sip amberbeer",
		lower = "",
		required = {},
	},
	darkbeer = {
		raise = "sip darkbeer",
		lower = "",
		required = {},
	},
	kafe = {
		raise = "eat kafe",
		lower = "",
		required = {},
	},
	lovepotion = {
		raise = "sip love",
		lower = "sip choleric",
		required = {},
	},
	moonwater = {
		raise = "sip moonwater",
		lower = "",
		required = {},
	},
	quicksilver = {
		raise = "sip quicksilver",
		lower = "",
		required = {},
	},
}

defs.combat = {
    keeneye = {
        raise = "keeneye on",
        lower = "keeneye off",
        required = { "balance", "equilibrium" }
    },
}
defs.discernment = {
    nightsight = {
        raise = "nightsight",
        lower = "",
        required = {}
    },
    thirdeye = {
        raise = "thirdeye",
        lower = "thirdeye relax",
        required = {}
    },   	
	sixthsense = {
        raise = "sixthsense",
        lower = "relax sixthsense",
        required = op.bals.dust
    },
	deathsight = {
        raise = "deathsight on",
        lower = "deathsight off",
        required = { "balance", "equilibrium" }
    },
	lipread = {
	    raise = "lipread",
        lower = "",
        required = { "balance", "equilibrium" }
	},
	powermask = {
	    raise = "powermask",
        lower = "",
        required = { "balance", "equilibrium" },
		power = 10
	},
	aethersight = {
	    raise = "aethersight on",
        lower = "aethersight off",
        required = { "balance", "equilibrium" },
		power = 3
	},
}
defs.lowmagic = {
    circle = {
        raise = "invoke circle",
        lower = "",
		required = { "balance", "equilibrium" },
    },
	red = {
        raise = "invoke red",
        lower = "invoke red off",
		required = { "balance", "equilibrium" },
    },
	orange = {
        raise = "invoke orange",
        lower = "",
		required = { "balance", "equilibrium" },
		power=1
    },
	yellow = {
        raise = "invoke yellow",
        lower = "",
		required = { "balance", "equilibrium" },
		power = 3
    },
	blue = {
        raise = "invoke blue",
        lower = "",
		required = { "balance", "equilibrium" },
    },
	autumn = {
        raise = "invoke autumn",
        lower = "",
		required = { "balance", "equilibrium" },
    },
	serpent = {
        raise = "invoke serpent",
        lower = "",
		required = { "balance", "equilibrium" },
		power = 10
    },
}

defs.discipline = {
	insomnia = {
        raise = "insomnia",
        lower = "relax insomnia",
		required = {},
    },
	truehearing = {
        raise = "truehearing",
        lower = "relax truehearing",
		required = { "steam" },
    },
	obliviousness = {
        raise = "obliviousness on",
        lower = "obliviousness off",
		required = { "balance", "equilibrium" },
    },
	metawake = {
        raise = "metawake on",
        lower = "metawake off",
		required = {},
    },
	breathing = {
        raise = "hold breath",
        lower = "",
		required = {},
    },
	selfishness = {
        raise = "selfishness",
        lower = "generosity",
		required = { "balance", "equilibrium" },
    },
}
defs.environment = {
	attunement = {
        raise = "attune",
        lower = "attune release",
		required = { "balance", "equilibrium" },
		power = 10
    },
}
defs.influence = {
	charismaticaura = {
        raise = "charismaticaura on",
        lower = "charismaticaura off",
		required = { "balance", "equilibrium" },
    },
}
defs.dramatics = {
	performance = {
        raise = "performance on",
        lower = "performance off",
		required = { "balance", "equilibrium" },
    },
	lawyerly = {
        raise = "attitude lawyerly",
        lower = "",
		required = { "balance", "equilibrium" },
    },
	saintly = {
        raise = "attitude saintly",
        lower = "",
		required = { "balance", "equilibrium" },
    },
	zealotry = {
        raise = "attitude zealotry",
        lower = "",
		required = { "balance", "equilibrium" },
    },
	bully = {
        raise = "perform bully",
        lower = "perform end",
		required = { "balance", "equilibrium" },
    },
	sycophant = {
        raise = "perform sycophant",
        lower = "perform end",
		required = { "balance", "equilibrium" },
    },
	drunkard = {
        raise = "perform drunkard",
        lower = "perform end",
		required = { "balance", "equilibrium" },
    },
	bureaucrat = {
        raise = "perform bureaucrat",
        lower = "perform end",
		required = { "balance", "equilibrium" },
    },
	sober = {
        raise = "perform sober",
        lower = "perform end",
		required = { "balance", "equilibrium" },
    },
	gorgeous = {
        raise = "perform gorgeous",
        lower = "perform end",
		required = { "balance", "equilibrium" },
    },
	wounded = {
        raise = "perform wounded",
        lower = "perform end",
		required = { "balance", "equilibrium" },
    },
	vagabond = {
        raise = "perform vagabond",
        lower = "perform end",
		required = { "balance", "equilibrium" },
    },
	diplomat = {
        raise = "perform diplomat",
        lower = "perform end",
		required = { "balance", "equilibrium" },
    },
	review = {
        raise = "review on",
        lower = "review off",
		required = { "balance", "equilibrium" },
    },
}

defs.totems = {
    squirrel = {
        raise = "spiritbond squirrel",
        lower = "spiritrelease squirrel",
        required = { "balance", "equilibrium" }
    },
    night = {
        raise = "spiritbond night",
        lower = "spiritrelease night",
        required = { "balance", "equilibrium" }
    },
    skunk = {
        raise = "spiritbond skunk",
        lower = "spiritrelease skunk",
        required = { "balance", "equilibrium" }
    },
    sun = {
        raise = "spiritbond sun",
        lower = "spiritrelease sun",
        required = { "balance", "equilibrium" }
    },
    rock = {
        raise = "spiritbond rock",
        lower = "spiritrelease rock",
        required = { "balance", "equilibrium" }
    },
    moon = {
        raise = "spiritbond moon",
        lower = "spiritrelease moon",
        required = { "balance", "equilibrium" }
    },
    crow = {
        raise = "spiritbond crow",
        lower = "spiritrelease crow",
        required = { "balance", "equilibrium" }
    },
    tree = {
        raise = "spiritbond tree",
        lower = "spiritrelease tree",
        required = { "balance", "equilibrium" }
    },
    groundhog = {
        raise = "spiritbond groundhog",
        lower = "spiritrelease groundhog",
        required = { "balance", "equilibrium" }
    },
    trout = {
		raise = "spiritbond trout",
        lower = "spiritrelease trout",
        required = { "balance", "equilibrium" }
    },
    wolf = {
        raise = "spiritbond wolf",
        lower = "spiritrelease wolf",
        required = { "balance", "equilibrium" }
    },
    bear = {
        raise = "spiritbond bear",
        lower = "spiritrelease bear",
        required = { "balance", "equilibrium" }
    },
    stag = {
        raise = "spiritbond stag",
        lower = "spiritrelease stag",
        required = { "balance", "equilibrium" }
    },
    monkey = {
        raise = "spiritbond monkey",
        lower = "spiritrelease monkey",
        required = { "balance", "equilibrium" }
    },
    horse = {
        raise = "spiritbond horse",
        lower = "spiritrelease horse",
        required = { "balance", "equilibrium" }
    },
    river = {
        raise = "spiritbond river",
        lower = "spiritrelease river",
        required = { "balance", "equilibrium" }
    },
    snake = {
        raise = "spiritbond snake",
        lower = "spiritrelease snake",
        required = { "balance", "equilibrium" }
    },
	nature = {
        raise = "spiritbond nature",
        lower = "",
        required = { "balance", "equilibrium" },
		power = 5
	}
}

defs.stag = {
    staghide = {
        raise = "staghide",
        lower = "",
        required = { "balance", "equilibrium" }
    },
	    greenman = {
        raise = "paint face greenman",
        lower = "wipe face greenman",
        required = { "balance", "equilibrium" }
    },
	    trueheart = {
        raise = "paint face trueheart",
        lower = "wipe face trueheart",
        required = { "balance", "equilibrium" }
    },
    bolting = {
        raise = "bolting on",
        lower = "bolting off",
        required = { "balance", "equilibrium" }
    },
	lightning = {
        raise = "paint face lightning",
        lower = "wipe face lightning",
        required = { "balance", "equilibrium" }
    },
    swiftstripes = {
        raise = "paint face swiftstripes",
        lower = "wipe face swiftstripes",
        required = { "balance", "equilibrium" }
    },
    stagform = {
        raise = "stagform",
        lower = "",
        required = { "balance", "equilibrium" },
		power = 10
    },
}

defs.nature = {
    barkskin = {
        raise = "nature barkskin",
        lower = "",
        required = { "balance", "equilibrium" }
    },
    blend = {
        raise = "nature blend on",
        lower = "nature blend off",
        required = { "balance", "equilibrium" }
    },
	rooting = {
        raise = "nature rooting",
        lower = "nature rooting off",
        required = { "balance", "equilibrium" }
    },
	torc = {
        raise = "nature torc",
        lower = "",
        required = { "balance", "equilibrium" }
    },
    beauty = {
        raise = "rub beauty",
        lower = "",
        required = { "balance", "equilibrium" }
    },
}

defs.druidry = {
    treebourne = {
        raise = "forestcast treebourne",
        lower = "",
        required = { "balance", "equilibrium" }
    },
}
defs.dreamweaving = {
    control = {
        raise = "dreamweave control",
        lower = "",
        required = { "balance", "equilibrium" }
    },
}

