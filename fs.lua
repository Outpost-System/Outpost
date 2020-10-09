local fs = {}

-- Outpost Failsafe Timer Functionality.


fs.limiters = {}

function fs.on(self, key, time)	
	local delay = time or 0.5
	if affs:has("aeon") then
		delay = delay + 1.5
	end

	self.limiters[key] = {
		start = getEpoch(),
		delay = delay
	}
end


function fs.off(self, key)
	self.limiters[key] = nil
end


function fs.check(self, key)
	local limiter = self.limiters[key]
	if limiter == nil then return true end

	local tDelta = getEpoch() - limiter.start
	if tDelta > limiter.delay then
		self.limiters[key] = nil
		return true
	end

	return false
end


return fs
