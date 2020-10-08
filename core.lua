module("core", package.seeall)

-- Outpost Core Functions.


function newlineSendCheck()
	if bals:has() then
		deleteLine()
		send("\n")
	end
end


function _G.round(num, idp)
    local mult = 10 ^ (idp or 0)
    return math.floor(num * mult + 0.5) / mult
end


function _G.copyitable(source)
	local target = {}
	if type(source) ~= "table" then return end
	for i, v in ipairs(source) do
		target[i] = v
	end
	return target
end


function _G.randomstring(length, pattern)
    local f = ""
    for loop = 0, 255 do
        f = f .. string.char(loop)
    end

    local pattern, random = pattern or '.', ''
    local str = string.gsub(f, '[^' .. pattern .. ']', '')
    --display(length)
    for loop = 1, length do
        random = random .. string.char(string.byte(str, math.random(1, string.len(str))))
    end

    return random
end


function _G.copytable(self, source)
	local target = {}
	if type(source) ~= "table" then return end
	for k, v in pairs(source) do
		target[k] = v
	end
	return target
end

function _G.shallowcopy(orig)
	local orig_type = type(orig)
	local copy
	if orig_type == 'table' then
		copy = {}
		for orig_key, orig_value in pairs(orig) do
			copy[orig_key] = orig_value
		end
	else
		copy = orig
	end
	return copy
end

function _G.deepcopy(self, orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else
        copy = orig
    end
    return copy
end


function _G.mergetable(self, table1, table2)
	local results = copytable(table1)
	for k, v in pairs(table2) do
		table.insert(results, v)
	end

	return results
end


function _G.counttable(tbl)
    local count = 0
    for _ in pairs(tbl) do
        count = count + 1
    end

    return count
end


function _G.dirtree(self, dir)
    assert(dir and dir ~= "", "directory parameter is missing or empty")
    if string.sub(dir, -1) == "/" then
        dir = string.sub(dir, 1, -2)
    end
 
    local function yieldtree(dir)
        for entry in lfs.dir(dir) do
            if entry ~= "." and entry ~= ".." and not entry:find("lua") then
                entry = dir..entry
                local attr = lfs.attributes(entry)
                coroutine.yield(entry,attr)
                if attr.mode == "directory" then
                    yieldtree(entry)
                end
            end
        end
    end
 
    return coroutine.wrap(function() yieldtree(dir) end)
end


function _G.gaglp()
    if core.debug then return false end
    selectString(line, 1)
    replace("")
    resetFormat()
    tempLineTrigger(1, 1, [[
        if isPrompt() then deleteLine() end
        ]])
end


function _G.dehex(self, h)
    local i
    local s = ""
    for i = 1, #h, 2 do
        high = ascii_to_num(string.byte(h,i))
        low = ascii_to_num(string.byte(h,i+1))
        s = s .. string.char((high*16)+low)
    end
    return s
end


function _G.ascii_to_num(self, c)
    if (c >= string.byte("0") and c <= string.byte("9")) then
        return c - string.byte("0")
    elseif (c >= string.byte("A") and c <= string.byte("F")) then
        return (c - string.byte("A"))+10
    elseif (c >= string.byte("a") and c <= string.byte("f")) then
        return (c - string.byte("a"))+10
    else
        echo("Wrong input for ascii to num convertion.")
    end
end


function _G.concand(t)
	assert(type(t) == "table", "concand: argument must be a table")

	if #t == 0 then
		return ""
	elseif #t == 1 then
		return t[1]
	else
		return table.concat(t, ", ", 1, #t-1) .. " and "..t[#t]
	end
end

