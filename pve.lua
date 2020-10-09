local pve = {}

-- Outpost PvE Functionality.

pve.mobsByArea = {
	["the Serenwilde Forest"] = {
		"an ethereal opossum",
		"an ethereal white peacock",
		"an ethereal stag",
	},

	elsewhere = {
		"something"
	}
}

function pve.getMobTable()
	local mobiles = {}
	local area = gmcp.Room.Info.area
	local mobs = self.mobsByArea[area]

	for k, v in pairs(op.roomitems) do
		if table.contains(mobs, v.name) then
			table.insert(mobiles, v.id)
		end
	end

	raiseEvent("outpost got pve targets")
	return mobiles
end


function pve.bash()
	-- Handle individual class-based bashing attack via gmcp.Char.Skills.
end


return pve