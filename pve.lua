module("pve", package.seeall)


-- Outpost PvE Functionality.

mobs_by_area = {
	["the Serenwilde Forest"] = {
		"an ethereal opossum",
		"an ethereal white peacock",
		"an ethereal stag",
	},

	elsewhere = {
		"something"
	}
}


function get_mob_table()
	local mobiles = {}
	local area = gmcp.Room.Info.area
	local mobs = pve.mobs_by_area[area]

	for k, v in pairs(op.roomitems) do
		if table.contains(mobs, v.name) then
			table.insert(mobiles, v.id)
		end
	end

	raiseEvent("outpost got pve targets")
	return mobiles
end


function bash()
	-- Handle individual class-based bashing attack via gmcp.Char.Skills.
end
