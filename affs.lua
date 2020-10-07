module("affs", package.seeall)


-- Outpost Affliction Handling.

current = {}

function add()
local aff = "none" 
if not gmcp.Char.Afflictions.Add then return end

aff = gmcp.Char.Afflictions.Add.name

if aff == "sprawled" then aff = "prone" end

	current[aff] = {
		when = os.clock(),
		tried_cure = 0,
		attempt_cure = 0 
	}
	
	--ps.got_aff(gmcp.Char.Afflictions.Add.name)
	raiseEvent("outpost got aff", gmcp.Char.Afflictions.Add.name)
end


function cured()
local aff = "none" 
if not gmcp.Char.Afflictions.Remove then return end

aff = gmcp.Char.Afflictions.Remove[1]

if aff == "sprawled" then aff = "prone" end

	current[aff] = nil
	ps.cured_aff(gmcp.Char.Afflictions.Remove[1])
	raiseEvent("outpost cured aff", gmcp.Char.Afflictions.Remove[1])
end

function has(self, aff)
	return affs.current[aff] and true or false
end
