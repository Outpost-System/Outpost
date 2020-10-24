local timer = {}

-- Outpost timing framework.


timer.set = {}

function timer.start(key)
	timer.set[key] = timer.optime()
end


function timer.optime()
	local t = getTime()
	return t.msec
		+ t.sec * 1000
		+ t.min * 1000 * 60
		+ t.hour * 1000 * 60 * 60
end


function timer.stop(key, rt)
	if timer.set[key] == nil then
		return numeric and 0 or "ERR"
	end

	local time = timer.optime()
	local diff = time - timer.set[key]

	if rt then
		return timer.tdiff(timer.set[key], time)
	end

	return diff
end


function timer.tdiff(start, stop, rt)
	local s = stop - start
	s = (s / 1000)
	return shms(s)
end



return timer