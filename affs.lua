local affs = {}

-- Outpost Affliction Handling.


affs.current = {}

function affs.add()
	local aff = "none" 
	if not gmcp.Char.Afflictions.Add then return end

	aff = gmcp.Char.Afflictions.Add.name

	if aff == "sprawled" then aff = "prone" end

	affs.current[aff] = {
		when = getEpoch(),
		tried_cure = 0,
		attempt_cure = 0 
	}
	
	raiseEvent("outpost got aff", gmcp.Char.Afflictions.Add.name)
end


function affs.cured()
	local aff = "none" 
	if not gmcp.Char.Afflictions.Remove then return end

	aff = gmcp.Char.Afflictions.Remove[1]

	if aff == "sprawled" then aff = "prone" end

	affs.current[aff] = nil
	raiseEvent("outpost cured aff", gmcp.Char.Afflictions.Remove[1])
end

function affs.has(aff)
	return affs.current[aff] and true or false
end


return affs