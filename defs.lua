local defs = {}

-- Outpost defence handling

-- Helper functions


-- defs:defup() expects an indexed table of defences.

function defs.defup(args)
	assert((type(args) == "table" and args[1]), "Incorrect type to 'defup()' - Indexed table expected, received "..type(args) or "nil")
	for _, skillset_keys in pairs(defs.tree) do
		for skill, skill_keys in pairs(skillset_keys) do
			if table.contains(args, skill) then
				op.balqueue:add(skill_keys.raise, skill_keys.required, skill_keys.consumed)
			end
		end
	end
end


-- defs:has() - Returns a boolean via passed argument,

function defs.has(def)
    for _, v in spairs(defs.tree) do
        for l, w in spairs(v) do
            if l == def then
                if w.state == true then
                    return true
                else
                    return false
                end
            end
        end
    end
end


-- defs.set() - Directly manipulate the state of a given defence.

function defs.set(skillset, def, bool)
    assert(skillset and def and bool and type(bool) == "boolean", "Incorrect usage of defs.set() - Skillset, defence and boolean required.")
    defs.tree[skillset][def].state = bool
end


-- Defence trees

defs.tree = {}

defs.tree.demipowers = {
    judiciouspresence = {
        raise = "manifest judicious presence",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        cost = 10000
    }
}

defs.tree.enchantments = {
    beauty = {
        raise = "rub beauty",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {},
        defup = false,
        keepup = false,
		state = false
    },
    mercy = {
        raise = "rub mercy",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {},
        defup = false,
        keepup = false,
		state = false
    },
    perfection = {
        raise = "rub perfection",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {},
        defup = false,
        keepup = false,
		state = false
    },
    kingdom = {
        raise = "rub kingdom",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {},
        defup = false,
        keepup = false,
		state = false
    },
    waterwalk = {
        raise = "rub waterwalk",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    waterbreathe = {
        raise = "rub waterbreathe",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    levitation = {
        raise = "rub levitate",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    nimbus = {
        raise = "rub nimbus",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    acquisitio = {
        raise = "rub acquisitio",
        lower = "rub acquisitio",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    avarice = {
        raise = "blow avaricehorn",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    truetime = {
        raise = "wind truetime",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    goldenbox = {
        raise = "crank goldenbox",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    emeraldbox = {
        raise = "crank emeraldbox",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    azurebox = {
        raise = "crank azurebox",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    protection = {
        raise = "read protection",
        lower = "",
        required = {"op.bals.scroll"},
        consumed = {"op.bals.scroll"},
        defup = false,
        keepup = false,
		state = false
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
		state = false
    },
    greentea = {
        raise = "sip greentea",
        lower = "",
        required = {},
        consumed = {},
		replace = {{"consumable","whitetea"},{"consumable","blacktea"},{"consumable","oolongtea"}},
        defup = false,
        keepup = false,
		state = false
    },
    oolongtea = {
        raise = "sip oolongtea",
        lower = "",
        required = {},
        consumed = {},
		replace = {{"consumable","whitetea"},{"consumable","greentea"},{"consumable","blacktea"}},
        defup = false,
        keepup = false,
		state = false
    },
    whitetea = {
        raise = "sip whitetea",
        lower = "",
        required = {},
        consumed = {},
		replace = {{"consumable","blacktea"},{"consumable","greentea"},{"consumable","oolongtea"}},
        defup = false,
        keepup = false,
		state = false
    },
    amberbeer = {
        raise = "sip amberbeer",
        lower = "",
        required = {},
        consumed = {},
        defup = false,
        keepup = false,
		state = false
    },
    darkbeer = {
        raise = "sip darkbeer",
        lower = "",
        required = {},
        consumed = {},
        defup = false,
        keepup = false,
		state = false
    },
    kafe = {
        raise = "eat kafe",
        lower = "",
        required = {},
        consumed = {},
        defup = false,
        keepup = false,
		state = false
    },
    lovepotion = {
        raise = "sip love",
        lower = "sip choleric",
        required = {},
        consumed = {},
        defup = false,
        keepup = false,
		state = false
    },
    moonwater = {
        raise = "sip moonwater",
        lower = "",
        required = {},
        consumed = {},
        defup = false,
        keepup = false,
		state = false
    },
    quicksilver = {
        raise = "sip quicksilver",
        lower = "",
        required = {},
        consumed = {},
        defup = false,
        keepup = false,
		state = false
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
		state = false
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
		state = false
    },
    thirdeye = {
        raise = "thirdeye",
        lower = "thirdeye relax",
        required = {},
        consumed = {},
        defup = false,
        keepup = false,
		state = false
    },
    sixthsense = {
        raise = "sixthsense",
        lower = "relax sixthsense",
        required = "op.bals.dust",
        consumed = "op.bals.dust",
        defup = false,
        keepup = false,
		state = false
    },
    deathsight = {
        raise = "deathsight on",
        lower = "deathsight off",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    lipread = {
        raise = "lipread",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    powermask = {
        raise = "powermask",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        power = 10,
        defup = false,
        keepup = false,
		state = false
    },
    aethersight = {
        raise = "aethersight on",
        lower = "aethersight off",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        power = 3,
        defup = false,
        keepup = false,
		state = false
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
		state = false
    },
    red = {
        raise = "invoke red",
        lower = "invoke red off",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    orange = {
        raise = "invoke orange",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        power = 1,
        defup = false,
        keepup = false,
		state = false
    },
    yellow = {
        raise = "invoke yellow",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        power = 3,
        defup = false,
        keepup = false,
		state = false
    },
    blue = {
        raise = "invoke blue",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    autumn = {
        raise = "invoke autumn",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    serpent = {
        raise = "invoke serpent",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        power = 10,
        defup = false,
        keepup = false,
		state = false
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
		state = false
    },
    truehearing = {
        raise = "truehearing",
        lower = "relax truehearing",
        required = "op.bals.steam",
        consumed = "op.bals.steam",
        defup = false,
        keepup = false,
		state = false
    },
    obliviousness = {
        raise = "obliviousness on",
        lower = "obliviousness off",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    metawake = {
        raise = "metawake on",
        lower = "metawake off",
        required = {},
        consumed = {},
        defup = false,
        keepup = false,
		state = false
    },
    breathing = {
        raise = "hold breath",
        lower = "",
        required = {},
        consumed = {},
        defup = false,
        keepup = false,
		state = false
    },
    selfishness = {
        raise = "selfishness",
        lower = "generosity",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
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
		state = false
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
		state = false
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
		state = false
    },
    lawyerly = {
        raise = "attitude lawyerly",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
		replace = {{"dramatics","saintly"},{"dramatics","zealotry"}},
        defup = false,
        keepup = false,
		state = false
    },
    saintly = {
        raise = "attitude saintly",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
		replace = {{"dramatics","lawyerly"},{"dramatics","zealotry"}},
        defup = false,
        keepup = false,
		state = false
    },
    zealotry = {
        raise = "attitude zealotry",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
		replace = {{"dramatics","saintly"},{"dramatics","lawyerly"}},
        defup = false,
        keepup = false,
		state = false
    },
    bully = {
        raise = "perform bully",
        lower = "perform end",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
		exclude = {{"dramatics","sycophant"},{"dramatics","diplomat"},{"dramatics","bureaucrat"},{"dramatics","gorgeous"},{"dramatics","vagabond"}},
        defup = false,
        keepup = false,
		state = false
    },
    sycophant = {
        raise = "perform sycophant",
        lower = "perform end",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
		exclude = {{"dramatics","diplomat"},{"dramatics","bully"},{"dramatics","bureaucrat"},{"dramatics","gorgeous"},{"dramatics","vagabond"}},
        defup = false,
        keepup = false,
		state = false
    },
    drunkard = {
        raise = "perform drunkard",
        lower = "perform end",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
		replace = {{"dramatics","sober"}},
        defup = false,
        keepup = false,
		state = false
    },
    bureaucrat = {
        raise = "perform bureaucrat",
        lower = "perform end",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
		exclude = {{"dramatics","sycophant"},{"dramatics","bully"},{"dramatics","diplomat"},{"dramatics","gorgeous"},{"dramatics","vagabond"}},
        defup = false,
        keepup = false,
		state = false
    },
    sober = {
        raise = "perform sober",
        lower = "perform end",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
		replace = {{"dramatics","drunkard"}},
        defup = false,
        keepup = false,
		state = false
    },
    gorgeous = {
        raise = "perform gorgeous",
        lower = "perform end",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
		exclude = {{"dramatics","sycophant"},{"dramatics","bully"},{"dramatics","bureaucrat"},{"dramatics","diplomat"},{"dramatics","vagabond"}},
        defup = false,
        keepup = false,
		state = false
    },
    wounded = {
        raise = "perform wounded",
        lower = "perform end",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    vagabond = {
        raise = "perform vagabond",
        lower = "perform end",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
		exclude = {{"dramatics","sycophant"},{"dramatics","bully"},{"dramatics","bureaucrat"},{"dramatics","gorgeous"},{"dramatics","diplomat"}},
        defup = false,
        keepup = false,
		state = false
    },
    diplomat = {
        raise = "perform diplomat",
        lower = "perform end",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
		exclude = {{"dramatics","sycophant"},{"dramatics","bully"},{"dramatics","bureaucrat"},{"dramatics","gorgeous"},{"dramatics","vagabond"}},
        defup = false,
        keepup = false,
		state = false
    },
    review = {
        raise = "review on",
        lower = "review off",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
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
		state = false
    },
    night = {
        raise = "spiritbond night",
        lower = "spiritrelease night",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    skunk = {
        raise = "spiritbond skunk",
        lower = "spiritrelease skunk",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    sun = {
        raise = "spiritbond sun",
        lower = "spiritrelease sun",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
	rock = {
		raise = "spiritbond rock",
		lower = "spiritrelease rock",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    moon = {
        raise = "spiritbond moon",
        lower = "spiritrelease moon",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    crow = {
        raise = "spiritbond crow",
        lower = "spiritrelease crow",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    tree = {
        raise = "spiritbond tree",
        lower = "spiritrelease tree",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    groundhog = {
        raise = "spiritbond groundhog",
        lower = "spiritrelease groundhog",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    trout = {
        raise = "spiritbond trout",
        lower = "spiritrelease trout",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    wolf = {
        raise = "spiritbond wolf",
        lower = "spiritrelease wolf",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    bear = {
        raise = "spiritbond bear",
        lower = "spiritrelease bear",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    stag = {
        raise = "spiritbond stag",
        lower = "spiritrelease stag",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    monkey = {
        raise = "spiritbond monkey",
        lower = "spiritrelease monkey",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    horse = {
        raise = "spiritbond horse",
        lower = "spiritrelease horse",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    river = {
        raise = "spiritbond river",
        lower = "spiritrelease river",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    snake = {
        raise = "spiritbond snake",
        lower = "spiritrelease snake",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
		state = false
    },
    nature = {
        raise = "spiritbond nature",
        lower = "spiritrelease nature",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        power = 5,
        defup = false,
        keepup = false,
		state = false
    }}

defs.tree.moon = {
	aura = {
		raise = "moondance aura",
		lower = "",
		required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
		consumed = {"op.bals.equilibrium"},
		defup = false,
		keepup = false,
		state = false
	},
	waxing = {
		raise = "moondance waxing",
		lower = "",
		required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
		consumed = {"op.bals.equilibrium"},
		defup = false,
		keepup = false,
		state = false
	},
	shine = {
		raise = "moondance shine",
		lower = "",
		required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
		consumed = {"op.bals.equilibrium"},
		power = 4,
		defup = false,
		keepup = false,
		state = false
	},
    full = {
        raise = "moondance full",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        power = 4,
        defup = false,
        keepup = false,
        state = false
    }}

        
defs.tree.stag = {
	staghide = {
		raise = "staghide",
		lower = "",
		required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
		consumed = {"op.bals.equilibrium"},
		defup = false,
		keepup = false,
		state = false
	},
	greenman = {
		raise = "paint face greenman",
		lower = "wipe face greenman",
		required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
		consumed = {"op.bals.balance"},
		exclude = {{"stag","trueheart"}},
		defup = false,
		keepup = false,
		state = false
	},
	trueheart = {
		raise = "paint face trueheart",
		lower = "wipe face trueheart",
		required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
		consumed = {"op.bals.balance"},
		exclude = {{"stag","greenman"}},
		defup = false,
		keepup = false,
		state = false
	},
	bolting = {
		raise = "bolting on",
		lower = "bolting off",
		required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
		consumed = {"op.bals.equilibrium"},
		defup = false,
		keepup = false,
		state = false
	},
	lightning = {
		raise = "paint face lightning",
		lower = "wipe face lightning",
		required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
		consumed = {"op.bals.balance"},
		exclude = {{"stag","swiftstripes"}},
		defup = false,
		keepup = false,
		state = false
	},
	swiftstripes = {
		raise = "paint face swiftstripes",
		lower = "wipe face swiftstripes",
		required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
		consumed = {"op.bals.balance"},
		exclude = {{"stag","lightning"}},
		defup = false,
		keepup = false,
		state = false
	},
	stagform = {
		raise = "stagform",
		lower = "",
		required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
		consumed = {"op.bals.equilibrium"},
		power = 10,
		defup = false,
		keepup = false,
		state = false
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
		state = false
	},
	blend = {
		raise = "nature blend on",
		lower = "nature blend off",
		required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
		consumed = {"op.bals.equilibrium"},
		defup = false,
		keepup = false,
		state = false
	},
	rooting = {
		raise = "nature rooting",
		lower = "nature rooting off",
		required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
		consumed = {"op.bals.equilibrium"},
		defup = false,
		keepup = false,
		state = false
	},
	torc = {
		raise = "nature torc",
		lower = "",
		required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
		consumed = {"op.bals.equilibrium"},
		defup = false,
		keepup = false,
		state = false
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
		state = false
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
        state = false
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
        state = false
    },

    fractures = {
        raise = "radiate fractures",
        lower = "cut aura me fractures",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false
    },
    auric = {
        raise = "radiate auric",
        lower = "cut aura me auric",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false
    },
    choleric = {
        raise = "radiate choleric",
        lower = "cut aura me choleric",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false
    },
    mania = {
        raise = "radiate mania",
        lower = "cut aura me mania",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false
    },
    neurosis = {
        raise = "radiate neurosis",
        lower = "cut aura me neurosis",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false
    },
    phlegmatic = {
        raise = "radiate phlegmatic",
        lower = "cut aura me phlegmatic",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false
    },
    regenerate = {
        raise = "radiate regenerate",
        lower = "cut aura me regenerate",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false
    },
    sanguine = {
        raise = "radiate sanguine",
        lower = "cut aura me sanguine",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false
    },
    vitality = {
        raise = "radiate vitality",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        power = 5
    },
}

defs.tree.music = {
    bardicpresence = {
        raise = "bardicpresence",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false
    }
}

defs.tree.illusions = {
    changeself = {
        raise = "weave changeself %s",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false
    },
    invisibility = {
        raise = "weave invisibility",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false
    },
    reflection = {
        raise = "weave reflection at me",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false
    }
}

defs.tree.glamours = {
    illusoryself = {
        raise = "weave illusoryself",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false
    }
}

defs.tree.starhymn = {
    guardianangel = {
        raise = "starsong call guardiangel",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        power = 2
    }
}


return defs