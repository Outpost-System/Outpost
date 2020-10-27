local defs = {}

-- Outpost defence handling

-- Helper functions

-- defs:defup() expects an indexed table of defences.

function defs.defup(args)
    assert((type(args) == "table" and args[1]),
           "Incorrect type to 'defup()' - Indexed table expected, received " ..
               type(args) or "nil")
    for _, skillset_keys in pairs(defs.tree) do
        for skill, skill_keys in pairs(skillset_keys) do
            if table.contains(args, skill) then
                op.balqueue:add(skill_keys.raise, skill_keys.required,
                                skill_keys.consumed)
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
    assert(skillset and def and bool and type(bool) == "boolean",
           "Incorrect usage of defs.set() - Skillset, defence and boolean required.")
    defs.tree[skillset][def].state = bool
end

function defs.raised(skillset, def)
    e:echo("raised " .. skillset .. ":" .. def)
    if defs.tree[skillset][def] then
        echo(" - valid defence!")
        defs.tree[skillset][def].state = true
    end
end

function defs.lowered(skillset, def)
    e:echo("lowered " .. skillset .. ":" .. def)
    if defs.tree[skillset][def] then
        echo(" - valid defence!")
        defs.tree[skillset][def].state = false
    end
end

-- Defence trees

defs.tree = {}

defs.tree.demipowers = {
    judiciouspresence = {
        raise = "manifest judicious presence",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
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
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {},
        defup = false,
        keepup = false,
        state = false,
        defline = "How gorgeous are you? Beauty replenishes your ego."
    },
    mercy = {
        raise = "rub mercy",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {},
        defup = false,
        keepup = false,
        state = false,
        defline = "So this is vitality! Mercy restores your health."
    },
    perfection = {
        raise = "rub perfection",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {},
        defup = false,
        keepup = false,
        state = false,
        defline = "Perfection regenerates your paragon-like mana."
    },
    kingdom = {
        raise = "rub kingdom",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {},
        defup = false,
        keepup = false,
        state = false,
        defline = "Thou shalt not bleed, majesty. Kingdom hastens your clotting."
    },
    waterwalk = {
        raise = "rub waterwalk",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are able to walk on water with consummate ease."
    },
    waterbreathe = {
        raise = "rub waterbreathe",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "Water is to you as air, and you shall not drown."
    },
    levitate = {
        raise = "rub levitate",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are protected by Levitate."
    },
    nimbus = {
        raise = "rub nimbus",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are surrounded by a cosmic nimbus."
    },
    acquisitio = {
        raise = "rub acquisitio",
        lower = "rub acquisitio",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "A lust to accumulate possesses your grubby soul."
    },
    avarice = {
        raise = "blow avaricehorn",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are instilled with a need to hoard gold."
    },
    truetime = {
        raise = "wind truetime",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are slightly protected against shifting time."
    },
    goldenbox = {
        raise = "crank goldenbox",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false
    },
    emeraldbox = {
        raise = "crank emeraldbox",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false
    },
    azurebox = {
        raise = "crank azurebox",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
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
        state = false,
        defline = "You have an aura of protection around you."
    }
}

defs.tree.consumable = {
    blacktea = {
        raise = "sip blacktea",
        lower = "",
        required = {},
        consumed = {},
        replace = {
            {"consumable", "whitetea"}, {"consumable", "greentea"},
            {"consumable", "oolongtea"}
        },
        defup = false,
        keepup = false,
        state = false,
        defline = "Your vivaciousness is herbally heightened."
    },
    greentea = {
        raise = "sip greentea",
        lower = "",
        required = {},
        consumed = {},
        replace = {
            {"consumable", "whitetea"}, {"consumable", "blacktea"},
            {"consumable", "oolongtea"}
        },
        defup = false,
        keepup = false,
        state = false,
        defline = "Your movements are herbally heightened."
    },
    oolongtea = {
        raise = "sip oolongtea",
        lower = "",
        required = {},
        consumed = {},
        replace = {
            {"consumable", "whitetea"}, {"consumable", "greentea"},
            {"consumable", "blacktea"}
        },
        defup = false,
        keepup = false,
        state = false,
        defline = "Your passion is herbally heightened."
    },
    whitetea = {
        raise = "sip whitetea",
        lower = "",
        required = {},
        consumed = {},
        replace = {
            {"consumable", "blacktea"}, {"consumable", "greentea"},
            {"consumable", "oolongtea"}
        },
        defup = false,
        keepup = false,
        state = false,
        defline = "Your insight is herbally heightened."
    },
    amberbeer = {
        raise = "sip amberbeer",
        lower = "",
        required = {},
        consumed = {},
        defup = false,
        keepup = false,
        state = false,
        defline = "Your pain is deadened by alcohol."
    },
    darkbeer = {
        raise = "sip darkbeer",
        lower = "",
        required = {},
        consumed = {},
        defup = false,
        keepup = false,
        state = false,
        defline = "Your aggression is stoked by alcohol."
    },
    kafe = {
        raise = "eat kafe",
        lower = "",
        required = {},
        consumed = {},
        defup = false,
        keepup = false,
        state = false,
        defline = "You have ingested the kafe bean and are feeling extremely energetic."
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
        state = false,
        defline = "You are prepared to make use of moonwater coursing through your body."
    },
    holywater = {
        raise = "sip holywater",
        lower = "",
        required = {"op.bals.orgpotion"},
        consumed = {"op.bals.orgpotion"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are prepared to make use of holy water coursing through your body."
    },
    unholywater = {
        raise = "sip unholywater",
        lower = "",
        required = {"op.bals.orgpotion"},
        consumed = {"op.bals.orgpotion"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are prepared to make use of unholy water coursing through your body."
    },
    quicksilver = {
        raise = "sip quicksilver",
        lower = "",
        required = {},
        consumed = {},
        defup = false,
        keepup = false,
        state = false,
        defline = "Your sense of time is heightened, and your reactions are speeded."
    },
    dragonsblood = {
        raise = "apply dragonsblood quicksilver",
        lower = "",
        required = {},
        consumed = {},
        replace = {
            {"consumable", "jasmine"}, {"consumable", "musk"},
            {"consumable", "sandalwood"}, {"consumable", "vanilla"}
        },
        defup = false,
        keepup = false,
        state = false,
        defline = "You are lightly coated with a layer of dragonsblood."
    },
    jasmine = {
        raise = "apply jasmine",
        lower = "",
        required = {},
        consumed = {},
        replace = {
            {"consumable", "dragonsblood"}, {"consumable", "musk"},
            {"consumable", "sandalwood"}, {"consumable", "vanilla"}
        },
        defup = false,
        keepup = false,
        state = false,
        defline = "You are lightly coated with a layer of jasmine."
    },
    musk = {
        raise = "apply musk",
        lower = "",
        required = {},
        consumed = {},
        replace = {
            {"consumable", "dragonsblood"}, {"consumable", "jasmine"},
            {"consumable", "sandalwood"}, {"consumable", "vanilla"}
        },
        defup = false,
        keepup = false,
        state = false,
        defline = "You are lightly coated with a layer of musk."
    },
    sandalwood = {
        raise = "apply sandalwood",
        lower = "",
        required = {},
        consumed = {},
        replace = {
            {"consumable", "dragonsblood"}, {"consumable", "jasmine"},
            {"consumable", "musk"}, {"consumable", "vanilla"}
        },
        defup = false,
        keepup = false,
        state = false,
        defline = "You are lightly coated with a layer of sandalwood."
    },
    vanilla = {
        raise = "apply vanilla",
        lower = "",
        required = {},
        consumed = {},
        replace = {
            {"consumable", "dragonsblood"}, {"consumable", "jasmine"},
            {"consumable", "musk"}, {"consumable", "sandalwood"}
        },
        defup = false,
        keepup = false,
        state = false,
        defline = "You are lightly coated with a layer of vanilla."
    }
}

defs.tree.combat = {
    keeneye = {
        raise = "keeneye on",
        lower = "keeneye off",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.balance"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are observing with a keen eye."
    }
}

defs.tree.discernment = {
    nightsight = {
        raise = "nightsight",
        lower = "",
        required = {},
        consumed = {},
        defup = false,
        keepup = false,
        state = false,
        defline = "Your vision is heightened to see in the dark."
    },
    thirdeye = {
        raise = "thirdeye",
        lower = "thirdeye relax",
        required = {},
        consumed = {},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are viewing the world through the third eye."
    },
    sixthsense = {
        raise = "sixthsense",
        lower = "relax sixthsense",
        required = "op.bals.dust",
        consumed = "op.bals.dust",
        defup = false,
        keepup = false,
        state = false,
        defline = "The world is seen through your sixth sense."
    },
    deathsight = {
        raise = "deathsight on",
        lower = "deathsight off",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "Your mind is linked with the strings of fate, bringing news of the dead."
    },
    lipread = {
        raise = "lipread",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are lipreading to overcome deafness."
    },
    powermask = {
        raise = "powermask",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        power = 10,
        defup = false,
        keepup = false,
        state = false,
        defline = "You have a powermask hiding your actions."
    },
    aethersight = {
        raise = "aethersight on",
        lower = "aethersight off",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        power = 3,
        defup = false,
        keepup = false,
        state = false,
        defline = "You are sensing disruptions in the aether."
    }
}

defs.tree.lowmagic = {
    circle = {
        raise = "invoke circle",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are surrounded by a nearly invisible magical shield."
    },
    red = {
        raise = "invoke red",
        lower = "invoke red off",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "The pull of the earth roots you more firmly to the ground."
    },
    orange = {
        raise = "invoke orange",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        power = 1,
        defup = false,
        keepup = false,
        state = false,
        defline = "You are protected from hunger by an orange aura."
    },
    yellow = {
        raise = "invoke yellow",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        power = 3,
        defup = false,
        keepup = false,
        state = false,
        defline = "Your constitution is enhanced by a yellow aura."
    },
    blue = {
        raise = "invoke blue",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You have empowered your blue chakra."
    },
    autumn = {
        raise = "invoke autumn",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are followed by the autumn wind."
    },
    serpent = {
        raise = "invoke serpent",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        power = 10,
        defup = false,
        keepup = false,
        state = false
    }
}

defs.tree.discipline = {
    insomnia = {
        raise = "insomnia",
        lower = "relax insomnia",
        required = {},
        consumed = {},
        defup = false,
        keepup = false,
        state = false,
        defline = "You have insomnia, and cannot easily go to sleep."
    },
    truehearing = {
        raise = "truehearing",
        lower = "relax truehearing",
        required = "op.bals.steam",
        consumed = "op.bals.steam",
        defup = false,
        keepup = false,
        state = false,
        defline = "Sounds are heard through your true hearing."
    },
    obliviousness = {
        raise = "obliviousness on",
        lower = "obliviousness off",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are oblivious to your surroundings."
    },
    metawake = {
        raise = "metawake on",
        lower = "metawake off",
        required = {},
        consumed = {},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are concentrating on maintaining distance from the dreamworld."
    },
    breathing = {
        raise = "hold breath",
        lower = "",
        required = {},
        consumed = {},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are holding your breath."
    },
    selfishness = {
        raise = "selfishness",
        lower = "generosity",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are feeling quite selfish."
    }
}

defs.tree.environment = {
    attunement = {
        raise = "attune",
        lower = "attune release",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.balance"},
        power = 10,
        defup = false,
        keepup = false,
        state = false,
        defmatch = "You are attuned to being in the [%a%s]+ environment."
    }
}

defs.tree.influence = {
    charismaticaura = {
        raise = "charismaticaura on",
        lower = "charismaticaura off",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are compellingly charismatic."
    }
}

defs.tree.dramatics = {
    performance = {
        raise = "performance on",
        lower = "performance off",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are in performance mode."
    },
    lawyerly = {
        raise = "attitude lawyerly",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        replace = {{"dramatics", "saintly"}, {"dramatics", "zealotry"}},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are carrying yourself with a lawyerly demeanor."
    },
    saintly = {
        raise = "attitude saintly",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        replace = {{"dramatics", "lawyerly"}, {"dramatics", "zealotry"}},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are carrying yourself with a saintly demeanor."
    },
    zealotry = {
        raise = "attitude zealotry",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        replace = {{"dramatics", "saintly"}, {"dramatics", "lawyerly"}},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are carrying yourself with the demeanor of a zealot."
    },
    bully = {
        raise = "perform bully",
        lower = "perform end",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        exclude = {
            {"dramatics", "sycophant"}, {"dramatics", "diplomat"},
            {"dramatics", "bureaucrat"}, {"dramatics", "gorgeous"},
            {"dramatics", "vagabond"}
        },
        defup = false,
        keepup = false,
        state = false,
        defline = "You are performing the role of a bully."
    },
    sycophant = {
        raise = "perform sycophant",
        lower = "perform end",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        exclude = {
            {"dramatics", "diplomat"}, {"dramatics", "bully"},
            {"dramatics", "bureaucrat"}, {"dramatics", "gorgeous"},
            {"dramatics", "vagabond"}
        },
        defup = false,
        keepup = false,
        state = false,
        defline = "You are performing the role of a sycophant."
    },
    drunkard = {
        raise = "perform drunkard",
        lower = "perform end",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        replace = {{"dramatics", "sober"}},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are acting drunker than you actually is."
    },
    bureaucrat = {
        raise = "perform bureaucrat",
        lower = "perform end",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        exclude = {
            {"dramatics", "sycophant"}, {"dramatics", "bully"},
            {"dramatics", "diplomat"}, {"dramatics", "gorgeous"},
            {"dramatics", "vagabond"}
        },
        defup = false,
        keepup = false,
        state = false,
        defline = "You are performing the role of a bureaucrat."
    },
    sober = {
        raise = "perform sober",
        lower = "perform end",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        replace = {{"dramatics", "drunkard"}},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are acting more sober than you actually are."
    },
    gorgeous = {
        raise = "perform gorgeous",
        lower = "perform end",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        exclude = {
            {"dramatics", "sycophant"}, {"dramatics", "bully"},
            {"dramatics", "bureaucrat"}, {"dramatics", "diplomat"},
            {"dramatics", "vagabond"}
        },
        defup = false,
        keepup = false,
        state = false,
        defline = "You are performing the role of a gorgeous beauty."
    },
    wounded = {
        raise = "perform wounded",
        lower = "perform end",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are acting more wounded than you actually are."
    },
    vagabond = {
        raise = "perform vagabond",
        lower = "perform end",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        exclude = {
            {"dramatics", "sycophant"}, {"dramatics", "bully"},
            {"dramatics", "bureaucrat"}, {"dramatics", "gorgeous"},
            {"dramatics", "diplomat"}
        },
        defup = false,
        keepup = false,
        state = false,
        defline = "You are performing the role of a vagabond."
    },
    diplomat = {
        raise = "perform diplomat",
        lower = "perform end",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        exclude = {
            {"dramatics", "sycophant"}, {"dramatics", "bully"},
            {"dramatics", "bureaucrat"}, {"dramatics", "gorgeous"},
            {"dramatics", "vagabond"}
        },
        defup = false,
        keepup = false,
        state = false,
        defline = "You are performing the role of a diplomat."
    },
    review = {
        raise = "review on",
        lower = "review off",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are reviewing performances of others."
    }
}

defs.tree.totems = {
    squirrel = {
        raise = "spiritbond squirrel",
        lower = "spiritrelease squirrel",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        totemline = "The spirit of squirrel grants you the ability to forage."
    },
    night = {
        raise = "spiritbond night",
        lower = "spiritrelease night",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        totemline = "During the dark hours, the spirit of mother night will conceal you."
    },
    skunk = {
        raise = "spiritbond skunk",
        lower = "spiritrelease skunk",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        totemline = "The spirit of skunk grants you the dubious gift of stink."
    },
    sun = {
        raise = "spiritbond sun",
        lower = "spiritrelease sun",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        totemline = "By the grace of the spirit of the sun, your ego shall replenish during the day."
    },
    rock = {
        raise = "spiritbond rock",
        lower = "spiritrelease rock",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        totemline = "The spirit of rock will help root you to the earth."
    },
    moon = {
        raise = "spiritbond moon",
        lower = "spiritrelease moon",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        totemline = "Under the night sky, your mana replenishes, a gift from the spirit of the moon."
    },
    crow = {
        raise = "spiritbond crow",
        lower = "spiritrelease crow",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        totemline = "Make others flee with the power of the spirit of crow."
    },
    tree = {
        raise = "spiritbond tree",
        lower = "spiritrelease tree",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        totemline = "In the presence of mystic trees, be healed by virtue of the spirit of tree."
    },
    groundhog = {
        raise = "spiritbond groundhog",
        lower = "spiritrelease groundhog",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        totemline = "Burrow through the ground with the spirit of groundhog."
    },
    trout = {
        raise = "spiritbond trout",
        lower = "spiritrelease trout",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        totemline = "You gain the ability to trueswim and breathe underwater by the spirit of trout."
    },
    wolf = {
        raise = "spiritbond wolf",
        lower = "spiritrelease wolf",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        totemline = "Find courage within yourself by the spirit of wolf."
    },
    bear = {
        raise = "spiritbond bear",
        lower = "spiritrelease bear",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        totemline = "The spirit of bear grants you great strength."
    },
    stag = {
        raise = "spiritbond stag",
        lower = "spiritrelease stag",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        totemline = "Run free and fast like the spirit of stag."
    },
    monkey = {
        raise = "spiritbond monkey",
        lower = "spiritrelease monkey",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        totemline = "The spirit of monkey grants you the ability to move about the trees."
    },
    horse = {
        raise = "spiritbond horse",
        lower = "spiritrelease horse",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        totemline = "Leap over obstacles by virtue of the spirit of horse."
    },
    river = {
        raise = "spiritbond river",
        lower = "spiritrelease river",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        totemline = "While in the waters of a raging river, the spirit of river will heal you."
    },
    snake = {
        raise = "spiritbond snake",
        lower = "spiritrelease snake",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        totemline = "Resist venoms by virtue of the spirit of snake."
    },
    nature = {
        raise = "spiritbond nature",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        power = 5,
        defup = false,
        keepup = false,
        state = false
    }
}

defs.tree.moon = {
    aura = {
        raise = "moondance aura",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false
    },
    waxing = {
        raise = "moondance waxing",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false
    },
    shine = {
        raise = "moondance shine",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        power = 4,
        defup = false,
        keepup = false,
        state = false
    },
    full = {
        raise = "moondance full",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        power = 4,
        defup = false,
        keepup = false,
        state = false
    }
}

defs.tree.stag = {
    staghide = {
        raise = "staghide",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You have the hide of the stag protecting your body."
    },
    greenman = {
        raise = "paint face greenman",
        lower = "wipe face greenman",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.balance"},
        exclude = {{"stag", "trueheart"}},
        defup = false,
        keepup = false,
        state = false,
        defline = "Your face is painted with the image of the greenman."
    },
    trueheart = {
        raise = "paint face trueheart",
        lower = "wipe face trueheart",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.balance"},
        exclude = {{"stag", "greenman"}},
        defup = false,
        keepup = false,
        state = false,
        defline = "Your face is painted with yellow rays of sunshine."
    },
    bolting = {
        raise = "bolting on",
        lower = "bolting off",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You will instantly bolt when an enemy approaches."
    },
    lightning = {
        raise = "paint face lightning",
        lower = "wipe face lightning",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.balance"},
        exclude = {{"stag", "swiftstripes"}},
        defup = false,
        keepup = false,
        state = false,
        defline = "Your face is painted with blue bolts of lightning."
    },
    swiftstripes = {
        raise = "paint face swiftstripes",
        lower = "wipe face swiftstripes",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.balance"},
        exclude = {{"stag", "lightning"}},
        defup = false,
        keepup = false,
        state = false,
        defline = "Your face is painted with red stripes."
    },
    stagform = {
        raise = "stagform",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        power = 10,
        defup = false,
        keepup = false,
        state = false,
        defline = "Your body has been blessed by the stag."
    }
}

defs.tree.nature = {
    barkskin = {
        raise = "nature barkskin",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You have skin covered in treebark."
    },
    blend = {
        raise = "nature blend on",
        lower = "nature blend off",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are blended in the foliage."
    },
    rooting = {
        raise = "nature rooting",
        lower = "nature rooting off",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are rooted."
    },
    torc = {
        raise = "nature torc",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false
    }
}

defs.tree.druidry = {
    treebourne = {
        raise = "forestcast treebourne",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are an extension of the forest."
    }
}

defs.tree.dreamweaving = {
    control = {
        raise = "dreamweave control",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are in complete control of your waking mind."
    }
}

defs.tree.healing = {
    sensory = {
        raise = "radiate sensory",
        lower = "cut aura me sensory",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false
    },

    fractures = {
        raise = "radiate fractures",
        lower = "cut aura me fractures",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false
    },
    auric = {
        raise = "radiate auric",
        lower = "cut aura me auric",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false
    },
    choleric = {
        raise = "radiate choleric",
        lower = "cut aura me choleric",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false
    },
    mania = {
        raise = "radiate mania",
        lower = "cut aura me mania",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false
    },
    neurosis = {
        raise = "radiate neurosis",
        lower = "cut aura me neurosis",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false
    },
    phlegmatic = {
        raise = "radiate phlegmatic",
        lower = "cut aura me phlegmatic",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false
    },
    regenerate = {
        raise = "radiate regenerate",
        lower = "cut aura me regenerate",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false
    },
    sanguine = {
        raise = "radiate sanguine",
        lower = "cut aura me sanguine",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false
    },
    vitality = {
        raise = "radiate vitality",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        power = 5
    }
}

defs.tree.music = {
    bardicpresence = {
        raise = "bardicpresence",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
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
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false
    },
    invisibility = {
        raise = "weave invisibility",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false
    },
    reflection = {
        raise = "weave reflection at me",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
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
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
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
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        power = 2
    }
}

defs.tree.highmagic = {
    malkuth = {
        raise = "evoke malkuth",
        lower = "evoke malkuth off",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "The pull of the earth roots you more firmly to the ground."
    },
    yesod = {
        raise = "evoke yesod",
        lower = "evoke yesod",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "Yesod."
    },
    netzach = {
        raise = "evoke netzach",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "Netzach."
    },
    hod = {
        raise = "evoke hod",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        power = 3,
        defup = false,
        keepup = false,
        state = false,
        defline = "Hod."
    },
    geburah = {
        raise = "evoke geburah",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        power = 3,
        defup = false,
        keepup = false,
        state = false,
        defline = "Geburah."
    }
}

defs.tree.rituals = {
    fortuna = {
        raise = "chant fortuna",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are reaping the gifts of Fortuna."
    },
    draconis = {
        raise = "chant draconis",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are surrounded by numinous dragon scales."
    },
    populus = {
        raise = "chant populus",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are filled with exuberance."
    },
    acquisitio = {
        raise = "chant acquisitio on",
        lower = "chant acquisitio off",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "A lust to accumulate possesses your grubby soul."
    },
    rubeus = {
        raise = "chant rubeus",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are filled with the wrath of Rubeus."
    }
}

defs.tree.cosmic = {
    waterwalk = {
        raise = "abjure waterwalk",
        lower = "abjure waterwalk off",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are able to walk on water with consummate ease."
    },
    deathsight = {
        raise = "abjure deathsight",
        lower = "abjure deathsight off",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "Your mind is linked with the strings of fate, bringing news of the dead."
    },
    soulguard = {
        raise = "abjure soulguard",
        lower = "abjure soulguard off",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "Your soul is guarded against the ravages of the cosmos."
    },
    cloak = {
        raise = "abjure cloak",
        lower = "abjure cloak off",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "Your body and soul are cloaked."
    },
    timeslip = {
        raise = "abjure timeslip",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are touching upon cosmic probabilities."
    },
    nimbus = {
        raise = "abjure nimbus",
        lower = "abjure nimbus off",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are surrounded by a cosmic nimbus."
    },
    quickening = {
        raise = "abjure quickening",
        lower = "",
        require = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "Your mind has been quickened."
    }
}

defs.tree.nihilism = {
    wings = {
        raise = "darkcall wings",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "Bat-like wings sprout out of your back."
    },
    demonscales = {
        raise = "darkcall demonscales",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are covered with demon scales."
    },
    channels = {
        raise = "open channels",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        power = 10,
        defup = false,
        keepup = false,
        state = false,
        defline = "You have opened your aetheric channels to other planar entities."
    },
    barbedtail = {
        raise = "darkcall barbedtail",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You have a barbed tail."
    }
}

defs.tree.necromancy = {
    putrefaction = {
        raise = "darkchant putrefaction",
        lower = "solidify",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are bathed in the glorious protection of decaying flesh."
    }
}

defs.tree.tarot = {
    fool = {
        raise = "fling fool at ground",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.balance"},
        power = 3,
        defup = false,
        keepup = false,
        state = false
    },
    warrior = {
        raise = "fling warrior at ground",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.balance"},
        power = 2,
        defup = false,
        keepup = false,
        state = false,
        defline = "You are assisted by the Warrior."
    },
    starleaper = {
        raise = "fling starleaper at ground",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.balance"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are protected by the Starleaper."
    },
    princess = {
        raise = "fling princess at ground",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.balance"},
        power = 5,
        defup = false,
        keepup = false,
        state = false,
        defline = "You are able to beseech the Princess."
    },
    teacher = {
        raise = "fling teacher at me",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.balance"},
        defup = false,
        keepup = false,
        state = false
    },
    enigma = {
        raise = "fling enigma at ground",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.balance"},
        power = 5,
        defup = false,
        keepup = false,
        state = false,
        defline = "The Enigma is upon you."
    },
    world = {
        raise = "fling world at ground",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.balance"},
        power = 5,
        defup = false,
        keepup = false,
        state = false
    }
}

defs.tree.celestialism = {
    wings = {
        raise = "starcall wings",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "Angelic wings sprout out of your back."
    },
    halo = {
        raise = "starcall halo",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are glowing with a radiant halo."
    },
    stigmata = {
        raise = "starcall stigmata on",
        lower = "starcall stigmata off",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are marked with the stigmata."
    },
    channels = {
        raise = "open channels",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        power = 10,
        defup = false,
        keepup = false,
        state = false,
        defline = "You have opened your aetheric channels to other planar entities."
    }
}

defs.tree.sacraments = {
    benediction = {
        raise = "starchant benediction me",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        power = 3,
        defup = false,
        keepup = false,
        state = false
    },
    fervor = {
        raise = "starchant fervor",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        power = 3,
        defup = false,
        keepup = false,
        state = false,
        defline = "You are filled with an intense religious fervor."
    },
    lustration = {
        raise = "starchant lustration",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        power = 2,
        defup = false,
        keepup = false,
        state = false,
        defline = "You are affected by the ritual of lustration."
    },
    ablution = {
        raise = "starchant ablution",
        lower = "",
        required = {"op.bals.balance", "op.bals.equilibrium"},
        consumed = {"op.bals.equilibrium"},
        power = 2,
        defup = false,
        keepup = false,
        state = false,
        defline = "You are affected by the ritual of ablution."
    }
}

defs.tree.acrobatics = {
    limber = {
        raise = "limber",
        gained = "You stretch your muscles, focusing on swift and nimble movements.",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.balance"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are extremely limber."
    },
    falling = {
        raise = "falling",
        gained = "Casting a wary eye about your surroundings, you ready yourself for a fall.",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.balance"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are protected against falling suddenly."
    },
    hyperventilate = {
        raise = "hyperventilate",
        gained = "You breathe in and exhale in a regular, steady rhythm, mastering your control over your breathing.",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are hyperventilating to control your breathing."
    },
    elasticity = {
        raise = "elasticity",
        gained = "Concentrating briefly, you will parts of your muscles to relax, giving them more elasticity to prevent damage.",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are concentrating on providing your muscles with increased elasticity."
    },
    adroitness = {
        raise = "adroitness",
        gained = "You inhale a deep breath, ready to run quickly if the need arises.",
        lower = "",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are moving at an increased rate of speed."
    },
    balancing = {
        raise = "balancing on",
        gained = "You dance as nimbly as a cat, maintaining your balance on the balls of your feet.",
        lower = "balancing off",
        lost = "You can no longer concentrate on maintaining your balance.",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.balance"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are balancing carefully."
    },
    avoid = {
        raise = "avoid",
        gained = "You tense your muscles with the sinuous grace of a predator, prepared to avoid any incoming blows.",
        lower = "",
        lost = "You cease preparing to avoid the next attack.",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.balance"},
        defup = false,
        keepup = false,
        state = false,
        defline = "You are carefully avoiding the next targeted blow."
    },
    handstand = {
        raise = "handstand",
        gained = "You dive dramatically towards the ground, flowing lithely into a graceful handstand that leaves you staring at everything upside-down.",
        lower = "",
        lost = "You push off from your handstand into a graceful twirl through the air, landing on your feet.",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.balance"},
        power = 3,
        defup = false,
        keepup = false,
        state = false
    },
    hyperactive = {
        raise = "hyperactive",
        gained = "You centre yourself and find inner calm, sharpening your reflexes to a deadly, predatory intensity that screams to be used.",
        lower = "",
        lost = "You are no longer hyperactive.",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.balance"},
        power = 5,
        defup = false,
        keepup = false,
        state = false,
        defline = "You are hyperactive and moving very quickly."
    },
    tripleflash = {
        raise = "tripleflash",
        gained = "You dance around chaotically, avoiding incoming blows.",
        lower = "",
        lost = "You cease darting around and avoiding blows.",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.balance"},
        power = 10,
        defup = false,
        keepup = false,
        state = false,
        defline = "You are dancing chaotically about, avoiding blows."
    }
}

defs.tree.hexes = {
    hexensoles = {
        raise = string.format("hexen soles %s %s", op.fsm.hexensoles.left, op.fsm.hexensoles.right),
        gained = "",
        lower = string.format("hexen wipe %s foot", op.fsm.hexensoles.wipe),
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.balance"},
        defup = false,
        keepup = false,
        state = false,
        defline = ""
    },
    hexenpalm = {
        raise = string.format("hexen palm %s %s %s", op.fsm.hexenpalm.hex1, op.fsm.hexenpalm.hex2, op.fsm.hexenpalm.hex3),
        gained = "",
        lower = "hexen wipe palm",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.balance"},
        defup = false,
        keepup = false,
        state = false,
        defline = "",
        power = 10
    },
    hexaura = {
        raise = "hexaura on",
        gained = "",
        lower = "hexaura off",
        required = {
            "op.bals.balance", "op.bals.equilibrium", "op.bals.psiid",
            "op.bals.psisub", "op.bals.psisuper"
        },
        consumed = {"op.bals.equilibrium"},
        defup = false,
        keepup = false,
        state = false,
        defline = "",
        power = 5
    },
}

return defs
