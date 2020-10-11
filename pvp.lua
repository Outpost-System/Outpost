local pvp = {}

-- Outpost Combat Functionality.


function pvp.setTarget(self, target)
	op.target = target:title()

	e:echo("Targeting: " .. op.target)

	if op.target ~= "Nothing" then
		send("reject " .. op.target)
		send("unally " .. op.target)
		send("enemy " .. op.target)
	end

	if ndb.isenemy(target) or op.arena_target then
		qm.balqueue:add("order entourage kill "..target)
		qm.balqueue:add("order "..op.fae.leprechaun.." follow "..target)
		send("\n")
	else
		qm.balqueue:add("faecall")
		qm.balqueue:add("order entourage passive")
		send("\n")
	end

	if op.mark_target then killTrigger(op.mark_target) end
	op.mark_target = tempTrigger(op.target, [[selectString("]] .. op.target .. [[", 1) bg("firebrick") fg("white") resetFormat()]])

	if op.leadermode then
		op.to_channel("Target: " .. op.target)
		op.to_channel("Target: " .. op.target)
		op.to_channel("Target: " .. op.target)
	else
		op.to_channel("Targeting: " .. op.target)
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

 function pvp.chooseNextAttack(self, target, hp, mp, ego, action)
 	
 end


 return pvp