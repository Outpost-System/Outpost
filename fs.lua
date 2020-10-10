local fs = {}

-- Outpost Failsafe Timer Functionality.


fs.limiters = {}

function fs.on(key, time)	
	local delay = time or 0.5
	-- Put check in here for affs only. Aeon only affects curing now.
	--if affs:has("aeon")
	--then
	--	delay = delay + 1.5
	--end

	fs.limiters[key] = {
		start = getEpoch(),
		delay = delay
	}
end


function fs.off(key)
	fs.limiters[key] = nil
end


function fs.check(key)
	local limiter = fs.limiters[key]
	if limiter == nil then return true end

	local tDelta = getEpoch() - limiter.start
	if tDelta > limiter.delay then
		fs.limiters[key] = nil
		return true
	end

	return false
end


return fs
