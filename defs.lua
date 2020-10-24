local defs = {}

-- Outpost defence handling

-- Helper functions


-- defs:defup() expects an indexed table of defences.

function defs.defup(args)
	assert((type(args) == "table" and args[1]), "Incorrect type to 'defup()' - Indexed table expected, received "..type(args) or "nil")
	for _, skillset_keys in pairs(defs.tree) do
		for skill, skill_keys in pairs(skillset_keys) do
			if table.contains(args, skill) then
				balqueue:add(skill_keys.raise, skill_keys.required, skill_keys.consumed)
			end
		end
	end
end


-- defs:has() - Returns a boolean via passed argument,

function defs.has(def)
    for _, v in spairs(defs.tree) do
        for _, w in spairs(v) do
            if l == def and w.state == "up" then
                return true
            else
                return false
            end
        end
    end
end


-- Defence trees

defs.tree = {}

defs.tree.enchantments = {
    beauty = {
        raise = "rub beauty",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {},
        defup = false,
        keepup = false,
		state = "down"
    },
    mercy = {
        raise = "rub mercy",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {},
        defup = false,
        keepup = false,
		state = "down"
    },
    perfection = {
        raise = "rub perfection",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {},
        defup = false,
        keepup = false,
		state = "down"
    },
    kingdom = {
        raise = "rub kingdom",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {},
        defup = false,
        keepup = false,
		state = "down"
    },
    waterwalk = {
        raise = "rub waterwalk",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    waterbreathe = {
        raise = "rub waterbreathe",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    levitation = {
        raise = "rub levitate",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    nimbus = {
        raise = "rub nimbus",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    acquisitio = {
        raise = "rub acquisitio",
        lower = "rub acquisitio",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    avarice = {
        raise = "blow avaricehorn",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    truetime = {
        raise = "wind truetime",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    goldenbox = {
        raise = "crank goldenbox",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    emeraldbox = {
        raise = "crank emeraldbox",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    azurebox = {
        raise = "crank azurebox",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    protection = {
        raise = "read protection",
        lower = "",
        required = {"op.bals.scroll"},
        consumed = {"op.bals.scroll"},
        defup = false,
        keepup = false,
		state = "down"
    },
}

defs.tree.consumable = {
    blacktea = {
        raise = "sip blacktea",
        lower = "",
        required = {},
        consumed = {},
		replace = {{"consumable","whitetea"},{"consumable","greentea"},{"consumable","oolongtea"}},
        defup = false,
        keepup = false,
		state = "down"
    },
    greentea = {
        raise = "sip greentea",
        lower = "",
        required = {},
        consumed = {},
		replace = {{"consumable","whitetea"},{"consumable","blacktea"},{"consumable","oolongtea"}},
        defup = false,
        keepup = false,
		state = "down"
    },
    oolongtea = {
        raise = "sip oolongtea",
        lower = "",
        required = {},
        consumed = {},
		replace = {{"consumable","whitetea"},{"consumable","greentea"},{"consumable","blacktea"}},
        defup = false,
        keepup = false,
		state = "down"
    },
    whitetea = {
        raise = "sip whitetea",
        lower = "",
        required = {},
        consumed = {},
		replace = {{"consumable","blacktea"},{"consumable","greentea"},{"consumable","oolongtea"}},
        defup = false,
        keepup = false,
		state = "down"
    },
    amberbeer = {
        raise = "sip amberbeer",
        lower = "",
        required = {},
        consumed = {},
        defup = false,
        keepup = false,
		state = "down"
    },
    darkbeer = {
        raise = "sip darkbeer",
        lower = "",
        required = {},
        consumed = {},
        defup = false,
        keepup = false,
		state = "down"
    },
    kafe = {
        raise = "eat kafe",
        lower = "",
        required = {},
        consumed = {},
        defup = false,
        keepup = false,
		state = "down"
    },
    lovepotion = {
        raise = "sip love",
        lower = "sip choleric",
        required = {},
        consumed = {},
        defup = false,
        keepup = false,
		state = "down"
    },
    moonwater = {
        raise = "sip moonwater",
        lower = "",
        required = {},
        consumed = {},
        defup = false,
        keepup = false,
		state = "down"
    },
    quicksilver = {
        raise = "sip quicksilver",
        lower = "",
        required = {},
        consumed = {},
        defup = false,
        keepup = false,
		state = "down"
    },
}

defs.tree.combat = {
    keeneye = {
        raise = "keeneye on",
        lower = "keeneye off",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.balance"},
        defup = false,
        keepup = false,
		state = "down"
    },
}

defs.tree.discernment = {
    nightsight = {
        raise = "nightsight",
        lower = "",
        required = {},
        consumed = {},
        defup = false,
        keepup = false,
		state = "down"
    },
    thirdeye = {
        raise = "thirdeye",
        lower = "thirdeye relax",
        required = {},
        consumed = {},
        defup = false,
        keepup = false,
		state = "down"
    },
    sixthsense = {
        raise = "sixthsense",
        lower = "relax sixthsense",
        required = "op.bals.dust",
        consumed = "op.bals.dust",
        defup = false,
        keepup = false,
		state = "down"
    },
    deathsight = {
        raise = "deathsight on",
        lower = "deathsight off",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    lipread = {
        raise = "lipread",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    powermask = {
        raise = "powermask",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        power = 10,
        defup = false,
        keepup = false,
		state = "down"
    },
    aethersight = {
        raise = "aethersight on",
        lower = "aethersight off",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        power = 3,
        defup = false,
        keepup = false,
		state = "down"
    },
}

defs.tree.lowmagic = {
    circle = {
        raise = "invoke circle",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    red = {
        raise = "invoke red",
        lower = "invoke red off",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    orange = {
        raise = "invoke orange",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        power = 1,
        defup = false,
        keepup = false,
		state = "down"
    },
    yellow = {
        raise = "invoke yellow",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        power = 3,
        defup = false,
        keepup = false,
		state = "down"
    },
    blue = {
        raise = "invoke blue",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    autumn = {
        raise = "invoke autumn",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    serpent = {
        raise = "invoke serpent",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        power = 10,
        defup = false,
        keepup = false,
		state = "down"
    },
}

defs.tree.discipline = {
    insomnia = {
        raise = "insomnia",
        lower = "relax insomnia",
        required = {},
        consumed = {},
        defup = false,
        keepup = false,
		state = "down"
    },
    truehearing = {
        raise = "truehearing",
        lower = "relax truehearing",
        required = "op.bals.steam",
        consumed = "op.bals.steam",
        defup = false,
        keepup = false,
		state = "down"
    },
    obliviousness = {
        raise = "obliviousness on",
        lower = "obliviousness off",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    metawake = {
        raise = "metawake on",
        lower = "metawake off",
        required = {},
        consumed = {},
        defup = false,
        keepup = false,
		state = "down"
    },
    breathing = {
        raise = "hold breath",
        lower = "",
        required = {},
        consumed = {},
        defup = false,
        keepup = false,
		state = "down"
    },
    selfishness = {
        raise = "selfishness",
        lower = "generosity",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
}

defs.tree.environment = {
    attunement = {
        raise = "attune",
        lower = "attune release",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.balance"},
        power = 10,
        defup = false,
        keepup = false,
		state = "down"
    },
}

defs.tree.influence = {
    charismaticaura = {
        raise = "charismaticaura on",
        lower = "charismaticaura off",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {},
        defup = false,
        keepup = false,
		state = "down"
    },
}

defs.tree.dramatics = {
    performance = {
        raise = "performance on",
        lower = "performance off",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    lawyerly = {
        raise = "attitude lawyerly",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
		replace = {{"dramatics","saintly"},{"dramatics","zealotry"}},
        defup = false,
        keepup = false,
		state = "down"
    },
    saintly = {
        raise = "attitude saintly",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
		replace = {{"dramatics","lawyerly"},{"dramatics","zealotry"}},
        defup = false,
        keepup = false,
		state = "down"
    },
    zealotry = {
        raise = "attitude zealotry",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
		replace = {{"dramatics","saintly"},{"dramatics","lawyerly"}},
        defup = false,
        keepup = false,
		state = "down"
    },
    bully = {
        raise = "perform bully",
        lower = "perform end",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
		exclude = {{"dramatics","sycophant"},{"dramatics","diplomat"},{"dramatics","bureaucrat"},{"dramatics","gorgeous"},{"dramatics","vagabond"}},
        defup = false,
        keepup = false,
		state = "down"
    },
    sycophant = {
        raise = "perform sycophant",
        lower = "perform end",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
		exclude = {{"dramatics","diplomat"},{"dramatics","bully"},{"dramatics","bureaucrat"},{"dramatics","gorgeous"},{"dramatics","vagabond"}},
        defup = false,
        keepup = false,
		state = "down"
    },
    drunkard = {
        raise = "perform drunkard",
        lower = "perform end",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
		replace = {{"dramatics","sober"}},
        defup = false,
        keepup = false,
		state = "down"
    },
    bureaucrat = {
        raise = "perform bureaucrat",
        lower = "perform end",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
		exclude = {{"dramatics","sycophant"},{"dramatics","bully"},{"dramatics","diplomat"},{"dramatics","gorgeous"},{"dramatics","vagabond"}},
        defup = false,
        keepup = false,
		state = "down"
    },
    sober = {
        raise = "perform sober",
        lower = "perform end",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
		replace = {{"dramatics","drunkard"}},
        defup = false,
        keepup = false,
		state = "down"
    },
    gorgeous = {
        raise = "perform gorgeous",
        lower = "perform end",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
		exclude = {{"dramatics","sycophant"},{"dramatics","bully"},{"dramatics","bureaucrat"},{"dramatics","diplomat"},{"dramatics","vagabond"}},
        defup = false,
        keepup = false,
		state = "down"
    },
    wounded = {
        raise = "perform wounded",
        lower = "perform end",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    vagabond = {
        raise = "perform vagabond",
        lower = "perform end",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
		exclude = {{"dramatics","sycophant"},{"dramatics","bully"},{"dramatics","bureaucrat"},{"dramatics","gorgeous"},{"dramatics","diplomat"}},
        defup = false,
        keepup = false,
		state = "down"
    },
    diplomat = {
        raise = "perform diplomat",
        lower = "perform end",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
		exclude = {{"dramatics","sycophant"},{"dramatics","bully"},{"dramatics","bureaucrat"},{"dramatics","gorgeous"},{"dramatics","vagabond"}},
        defup = false,
        keepup = false,
		state = "down"
    },
    review = {
        raise = "review on",
        lower = "review off",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
}

defs.tree.totems = {
    squirrel = {
        raise = "spiritbond squirrel",
        lower = "spiritrelease squirrel",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    night = {
        raise = "spiritbond night",
        lower = "spiritrelease night",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    skunk = {
        raise = "spiritbond skunk",
        lower = "spiritrelease skunk",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    sun = {
        raise = "spiritbond sun",
        lower = "spiritrelease sun",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
	rock = {
		raise = "spiritbond rock",
		lower = "spiritrelease rock",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    moon = {
        raise = "spiritbond moon",
        lower = "spiritrelease moon",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    crow = {
        raise = "spiritbond crow",
        lower = "spiritrelease crow",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    tree = {
        raise = "spiritbond tree",
        lower = "spiritrelease tree",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    groundhog = {
        raise = "spiritbond groundhog",
        lower = "spiritrelease groundhog",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    trout = {
        raise = "spiritbond trout",
        lower = "spiritrelease trout",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    wolf = {
        raise = "spiritbond wolf",
        lower = "spiritrelease wolf",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    bear = {
        raise = "spiritbond bear",
        lower = "spiritrelease bear",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    stag = {
        raise = "spiritbond stag",
        lower = "spiritrelease stag",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    monkey = {
        raise = "spiritbond monkey",
        lower = "spiritrelease monkey",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    horse = {
        raise = "spiritbond horse",
        lower = "spiritrelease horse",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    river = {
        raise = "spiritbond river",
        lower = "spiritrelease river",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    snake = {
        raise = "spiritbond snake",
        lower = "spiritrelease snake",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = "down"
    },
    nature = {
        raise = "spiritbond nature",
        lower = "spiritrelease nature",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        power = 5,
        defup = false,
        keepup = false,
		state = "down"
    }}

defs.tree.moon = {
	aura = {
		raise = "moondance aura",
		lower = "",
		required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
		consumed = {"op.bals.equilibrium"},
		defup = false,
		keepup = false,
		state = "down"
	},
	waxing = {
		raise = "moondance waxing",
		lower = "",
		required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
		consumed = {"op.bals.equilibrium"},
		defup = false,
		keepup = false,
		state = "down"
	},
	shine = {
		raise = "moondance shine",
		lower = "",
		required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
		consumed = {"op.bals.equilibrium"},
		power = 4,
		defup = false,
		keepup = false,
		state = "down"
	},
	full = {
		raise = "moondance full",
		lower = "",
		required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
		consumed = {"op.bals.equilibrium"},
		power = 4,
		defup = false,
		keepup = false,
		state = "down"
	}}
        
defs.tree.stag = {
	staghide = {
		raise = "staghide",
		lower = "",
		required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
		consumed = {"op.bals.equilibrium"},
		defup = false,
		keepup = false,
		state = "down"
	},
	greenman = {
		raise = "paint face greenman",
		lower = "wipe face greenman",
		required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
		consumed = {"op.bals.balance"},
		exclude = {{"stag","trueheart"}},
		defup = false,
		keepup = false,
		state = "down"
	},
	trueheart = {
		raise = "paint face trueheart",
		lower = "wipe face trueheart",
		required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
		consumed = {"op.bals.balance"},
		exclude = {{"stag","greenman"}},
		defup = false,
		keepup = false,
		state = "down"
	},
	bolting = {
		raise = "bolting on",
		lower = "bolting off",
		required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
		consumed = {"op.bals.equilibrium"},
		defup = false,
		keepup = false,
		state = "down"
	},
	lightning = {
		raise = "paint face lightning",
		lower = "wipe face lightning",
		required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
		consumed = {"op.bals.balance"},
		exclude = {{"stag","swiftstripes"}},
		defup = false,
		keepup = false,
		state = "down"
	},
	swiftstripes = {
		raise = "paint face swiftstripes",
		lower = "wipe face swiftstripes",
		required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
		consumed = {"op.bals.balance"},
		exclude = {{"stag","lightning"}},
		defup = false,
		keepup = false,
		state = "down"
	},
	stagform = {
		raise = "stagform",
		lower = "",
		required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
		consumed = {"op.bals.equilibrium"},
		power = 10,
		defup = false,
		keepup = false,
		state = "down"
	},
}
        
defs.tree.nature = {
	barkskin = {
		raise = "nature barkskin",
		lower = "",
		required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
		consumed = {"op.bals.equilibrium"},
		defup = false,
		keepup = false,
		state = "down"
	},
	blend = {
		raise = "nature blend on",
		lower = "nature blend off",
		required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
		consumed = {"op.bals.equilibrium"},
		defup = false,
		keepup = false,
		state = "down"
	},
	rooting = {
		raise = "nature rooting",
		lower = "nature rooting off",
		required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
		consumed = {"op.bals.equilibrium"},
		defup = false,
		keepup = false,
		state = "down"
	},
	torc = {
		raise = "nature torc",
		lower = "",
		required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
		consumed = {"op.bals.equilibrium"},
		defup = false,
		keepup = false,
		state = "down"
	},
}
        
defs.tree.druidry = {
	treebourne = {
		raise = "forestcast treebourne",
		lower = "",
		required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
		consumed = {"op.bals.equilibrium"},
		defup = false,
		keepup = false,
		state = "down"
	},
}

defs.tree.dreamweaving = {
    control = {
        raise = "dreamweave control",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = "down"
    },
}

defs.tree.healing = {
    sensory = {
        raise = "radiate sensory",
        lower = "cut aura me sensory",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = "down"
    },

    fractures = {
        raise = "radiate fractures",
        lower = "cut aura me fractures",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = "down"
    },
    auric = {
        raise = "radiate auric",
        lower = "cut aura me auric",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = "down"
    },
    choleric = {
        raise = "radiate choleric",
        lower = "cut aura me choleric",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = "down"
    },
    mania = {
        raise = "radiate mania",
        lower = "cut aura me mania",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = "down"
    },
    neurosis = {
        raise = "radiate neurosis",
        lower = "cut aura me neurosis",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = "down"
    },
    phlegmatic = {
        raise = "radiate phlegmatic",
        lower = "cut aura me phlegmatic",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = "down"
    },
    regenerate = {
        raise = "radiate regenerate",
        lower = "cut aura me regenerate",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = "down"
    },
    sanguine = {
        raise = "radiate sanguine",
        lower = "cut aura me sanguine",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = "down"
    },
    vitality = {
        raise = "radiate vitality",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = "down",
        power = 5
    },
}


return defs