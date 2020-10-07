module("timer", package.seeall)

-- Outpost timing framework.


set = {}

function start(self, key)
	set[key] = optime()
end


function optime()
	local t = getTime()
	return t.msec
		+ t.sec * 1000
		+ t.min * 1000 * 60
		+ t.hour * 1000 * 60 * 60
end


function stop(self, key, rt)
	if set[key] == nil then
		return numeric and 0 or "ERR"
	end

	local time = optime()
	local diff = time - set[key]

	if rt then
		return tdiff(set[key], time)
	end

	return diff
end


function tdiff(start, stop, rt)

	local s  = stop
	local ss = string.format("%02d", math.fmod(s, 60))
	local mm = string.format("%02d", math.fmod((s / 60 ), 60))
	local hh = string.format("%02d", (s / (60 * 60)))

	local out = ""

	if tonumber(hh) > 0 then out = out .. hh .. " hr " end
	if tonumber(mm) > 0 then out = out .. mm .. " min " end
	if tonumber(ss) > 0 then out = out .. ss .. " sec " end
	if tonumber(s) > 0 then out = out .. s .. " ms " end

	return out:gsub(".$", "")
end
