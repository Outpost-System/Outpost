local beast = {}

-- Outpost Beast Related Functionality.


function beast.heal()	
	local to_beast_health = op.vitals.maxhp * (tonumber(settings.cures.beast_health) / 100)
	local to_beast_mana = op.vitals.maxmp * (tonumber(settings.cures.beast_mana) / 100)	
	local to_beast_ego = op.vitals.maxego * (tonumber(settings.cures.beast_ego) / 100)	

	if not can:beast() 
		or not GMCP:has_skill("beastmastery", "healing") 
	then 
		return 
	end

	if (tonumber(op.vitals.hp) <= to_beast_health 
		or affs:has("blackout") 
		or (affs:has("recklessness")
		and not op.manaswap))
		and bals:has("beastbal") 
		and not fs:check("beastheal")
	then
		send("beast order heal health")
		op.manaswap = true
		fs:on("beastheal")
		if affs:has("blackout") then 
			fs:on("beastheal", 6)
		end
	end		

	if (tonumber(op.vitals.ego) <= to_beast_ego 
		or affs:has("blackout") 
		or (affs:has("recklessness")
		and not op.manaswap))
		and bals:has("beastbal") 
		and not fs:check("beastheal")
	then
		send("beast order heal ego")
		op.manaswap = true
		fs:on("beastheal")
		if affs:has("blackout") then 
			fs:on("beastheal", 6) 
		end
	end	

	if (tonumber(op.vitals.mp) <= to_beast_mana 
		or affs:has("blackout") 
		or (affs:has("recklessness")
		and op.manaswap))
		and bals:has("beastbal")
		and not fs:check("beastheal")
	then
		send("beast order heal mana")
		aegis.manaswap = false
		fs:on("beastheal")
		if affs:has("blackout") then 
			fs:on("beastheal", 6) 
		end
	end	
end


return beast