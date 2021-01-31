local inpost = {}

-- Outpost aethercombat module

inpost = {
	version = "0.1",
	init = {},
	total_beasts = 0,
	current_module = "none",
	balance = true,
	locked_in = false,
	functions = {}
}

inpost.empath = {
	hull = {
		current = 0,
		max = 0
	},

	modules = {
		chair = "",
		collectors = {},
		cube = "",
		grid = "",
		orb = "",
		turrets = {}
	},

	skills = {},

	checks = {
		slivven = false
	},

	slivven_found = 0,
	inspected_module = ""
}

function inpost.functions.empath()
	return {
		total_beasts = 0,
		current_module = "",
		actions = op.aetherqueue:act(),

		empath = {
			hull = {
				current = 0,
				max = 0
			},

			modules = {
				chair = "",
				collectors = {},
				cube = "",
				grid = "",
				orb = "",
				turrets = {}
			},

			skills = op.skills.aethercraft,

			checks = {
				slivven = false
			},

			slivven_found = 0,
			inspected_module = ""
		}
	}
end