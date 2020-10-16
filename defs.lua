local defs = {}

-- Outpost defence handling


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