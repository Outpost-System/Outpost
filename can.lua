local can = {}

-- Outpost can module. Can we do a particular action?


function can.full() -- Need to check these afflictions!
	return not affs:has("asleep")
	and not affs:has("stun")
	and not fs:check("full")
	and not op.dead
	and op.vitals.pow >= 4

	and true or false
end

function can.act()
	return bals.has()
	and not affs:has("asleep")
	and not affs:has("stun")
	and not affs:has("sprawled")
	and not fs.check("act")
	and not op.dead

	and true or false
end

function can.bash()
	return bals.has()
	and not affs:has("asleep")
	and not affs:has("stun")
	and not affs:has("sprawled")
	and not fs.check("bash")
	and not op.dead

	and true or false
end

function can.green()
	return bals.has()
	and not affs:has("asleep")
	and not affs:has("stun")
	and not fs.check("green")
	and not op.dead
	and op.vitals.pow >= 3

	and true or false
end

function can.allheale()
	return op.bals.allheale
	and not affs:has("asleep")
	and not affs:has("stun")
	and not fs.check("allheale")
	and not op.dead

	and true or false
end

return can