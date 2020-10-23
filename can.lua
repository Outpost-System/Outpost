local can = {}

-- Outpost can module. Can we do a particular action?


function can.full() -- Need to check these afflictions!
	return not affs:has("mucus")
	and not affs:has("muddy")
	and not affs:has("asleep")
	and not affs:has("disrupted")
	and not affs:has("stun")
	and not affs:has("crucified")
	and not affs:has("muddy")
	and not affs:has("paralysis")
	and not fs:check("full")
	and not op.dead
	and op.vitals.pow >= 4

	and true or false
end


return can