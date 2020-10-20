local pvp = {}

-- Outpost Combat Functionality.


function pvp.setTarget(target_array)
	op.targets = target_array
	op.target = target_array[1]:title()
	e:echo("Targeting: " .. op.target)

	if op.target ~= "Nothing" then
		send("reject " .. op.target)
		send("unally " .. op.target)
		send("enemy " .. op.target)
	end

	if ndb.isenemy(op.target) or op.arena_target then
		if GMCP.HasSkill("leprechaun") then
			qm.balqueue:add("order entourage kill "..op.target)
			qm.balqueue:add("order "..op.fae.leprechaun.." follow "..op.target)
			qm.Check()
		else
			-- Handle other skillset preliminaries here
		end
	else
		if GMCP.HasSkill("leprechaun") then
			balqueue:add("faecall")
			balqueue:add("order entourage passive")
			qm.Check()
		end
	end

	if op.mark_target then killTrigger(op.mark_target) end
	op.mark_target = tempTrigger(op.target, [[selectString("]] .. op.target .. [[", 1) bg("firebrick") fg("white") resetFormat()]])

	if op.leadermode then
		op.to_channel("Target: " .. op.target)
		op.to_channel("Target: " .. op.target)
		op.to_channel("Target: " .. op.target)
	else
		if op.announce_target then
			op.to_channel("Targeting prios set: Next target: " .. op.target)
		end
	end
end


 function pvp.succumb()
 	if bals:has("equilibrium") and bals:has("balance") then
 		send("moondance succumb "..op.target)
 	else
 		e:warn("Hang on. Waiting on balance!")
 	end
 end

function pvp.bluemoon()
 	if bals:has("equilibrium") and bals:has("balance") then
 		send("moondance bluemoon "..op.target)
 	else
 		e:warn("Hang on. Waiting on balance!")
 	end
 end

function pvp.waning()
	if bals:has("equilibrium") and bals:has("balance") then
 		send("moondance waning "..op.target)
 	else
 		e:warn("Hang on. Waiting on balance!")
 	end
 end


-- Hexes Control :)

local function push (h, k, v)
	assert(v ~= nil, "cannot push nil")
	local t = h.nodes
	local h = h.heap
	local n = #h + 1
	local p = (n - n % 2) / 2
	h[n] = k
	t[k] = v
	while n > 1 and t[h[p]] > v do 
		h[p], h[n] = h[n], h[p]
		n = p
		p = (n - n % 2) / 2
	end
end

local function peek (h)
	local t = h.nodes
	local h = h.heap
	local s = #h
	assert(s > 0, "cannot pop from empty heap")
	local e = h[1] 
	local r = t[e]
	return e, r
end

local function pop (h)
	local t = h.nodes
	local h = h.heap
	local s = #h
	assert(s > 0, "cannot pop from empty heap")
	local e = h[1]
  	local r = t[e]
	local v = t[h[s]]
	h[1] = h[s]
	h[s] = nil 
  	t[e] = nil
  	s = s - 1
  	local n = 1 
  	local p = 2 * n
	if s > p and t[h[p]] > t[h[p + 1]] then
		p = 2 * n + 1
	end
	while s >= p and t[h[p]] < v do 
		h[p], h[n] = h[n], h[p]
		n = p
		p = 2 * n
		if s > p and t[h[p]] > t[h[p + 1]] then
			p = 2 * n + 1
		end
	end
	
	return e, r
end

local function isempty (h) return h.heap[1] == nil end


function pvp.hexesHeap()
	return setmetatable({heap = {}, nodes = {}},
		{__index = {push=push, peek=peek, pop=pop, isempty=isempty}})
end


 function pvp.chooseNextAttack(self, target, hp, mp, ego, action)
 	
 end


 return pvp