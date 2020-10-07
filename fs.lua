module("fs", package.seeall)


-- Outpost Failsafe Timer Functionality.


limiters = {}

function on(self, key, time)	
	local delay = time or 0.5
	if affs:has("aeon") then
		delay = delay + 1.5
	end

	limiters[key] = {
		start = getEpoch(),
		delay = delay
	}
end


function off(self, key)
	limiters[key] = nil
end


function check(self, key)
	local limiter = limiters[key]
	if limiter == nil then return true end

	local tDelta = getEpoch() - limiter.start
	if tDelta > limiter.delay then
		limiters[key] = nil
		return true
	end

	return false
end
