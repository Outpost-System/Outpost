local aegis = {}

-- Outpost Healing Skillset Functionality.


aegis.affs = {}

aegis.affmap = {  -- Thanks go to Sondayga for this table.
		["suffering from a collapsed lung."] = {aff = "collapsedlung", aura = "regenerate chest"},
		["cursed with the healthleech."] = {aff = "healthleech", aura = "auric"},
		--  ["a $(level$) aura."] = {aff = "warpedaura", aura = ""},
  		["afflicted with the curse of the Aeon."] = {aff = "aeon", aura = "phlegmatic"},
  		["suffering from a pox."] = {aff = "pox", aura = "choleric"},
  		["violently ill."] = {aff = "vomiting", aura = "choleric"},
  		["covered in ectoplasm."] = {aff = "ectoplasm", aura = "sanitise"},
		--  ["hearing echoes of everything."] = {aff = "echoes", aura = ""},
  		["has a serious concussion."] = {aff = "concussion", aura = "fractures"},
  		["afflicted with $(level$) blood clots."] = {aff = "clot", aura = "sanguine"},
  		["suffering from a mutilated right leg."] = {aff = "mutilatedrightleg", aura = "regenerate legs"},
		--  ["suffering from a bent aura."] = {aff = "bentaura", aura = ""},
  		["afflicted by thin blood."] = {aff = "relapsing", aura = "sanguine"},
  		["suffering from a damaged throat."] = {aff = "damagedthroat", aura = "fractures"},
  		["transfixed."] = {aff = "transfixed", aura = "phlegmatic"},
		--  ["entangled."] = {aff = "entangled", aura = ""},
  		["extremely oily."] = {aff = "slickness", aura = "sensory"},
  		["suffering from a mutilated left arm."] = {aff = "mutilatedleftarm", aura = "regenerate arms"},
  		["suffering from a mutilated right arm."] = {aff = "mutilatedrightarm", aura = "regenerate arms"},
  		["asthmatic."] = {aff = "asthma", aura = "choleric"},
  		["suffering from a mutilated left leg."] = {aff = "mutilatedleftleg", aura = "regenerate legs"},
  		["emanating an aura of repugnance."] = {aff = "disloyalty", aura = "phlegmatic"},
  		["sickened by an unusual illness."] = {aff = "sickening", aura = "choleric"},
 		["reckless."] = {aff = "recklessness", aura = "mania"},
		--  ["suffering from internal bleeding."] = {aff = "internalbleeding", aura = ""},
  		["confused."] = {aff = "confusion", aura = "neurosis"},
  		["suffering from a damaged skull."] = {aff = "damagedskull", aura = "fractures"},
  		["suffering from a damaged right leg."] = {aff = "damagedrightleg", aura = "fractures"},
  		["frozen stiff."] = {aff = "frozen", aura = "sensory"},
  		["suffering from a damaged right arm."] = {aff = "damagedrightarm", aura = "fractures"},
  		["suffering from a damaged left leg."] = {aff = "damagedleftleg", aura = "fractures"},
		--  ["marked by a $(level$) on the throat."] = {aff = "deathmark", aura = ""},
  		["suffering from a damaged left arm."] = {aff = "damagedleftarm", aura = "fractures"},
  		["suffering from damaged organs"] = {aff = "damagedorgans", aura = "fractures"},
		--  ["deaf."] = {aff = "deaf", aura = "sensory"},
  		["cursed by ego vice."] = {aff = "egovice", aura = "auric"},
  		["pacified."] = {aff = "pacifism", aura = "phlegmatic"},
  		["suffering from a crushed chest."] = {aff = "crushedchest", aura = "regenerate chest"},
  		["turning stiff like a corpse."] = {aff = "rigormortis", aura = "phlegmatic"},
  		["afflicted with an achromatic aura."] = {aff = "achromaticaura", aura = "auric"},
  		["$(level$) warped in time."] = {aff = "timewarp", aura = "phlegmatic"},
  		["ablaze."] = {aff = "ablaze", aura = "sensory"},
  		["shivering."] = {aff = "shivering", aura = "sensory"},
  		["addicted to potions."] = {aff = "addiction", aura = "mania"},
  		["infected with scabies mites."] = {aff = "scabies", aura = "choleric"},
  		["unnaturally stupid."] = {aff = "stupidity", aura = "mania"},
  		["paranoid."] = {aff = "paranoia", aura = "mania"},
		--  ["succumbing to Mother Moon."] = {aff = "succumb", aura = ""},
  		["being sapped of power."] = {aff = "powersap", aura = "auric"},
  		["paralysed."] = {aff = "paralysis", aura = "phlegmatic"},
  		["sensitive to pain."] = {aff = "sensitivity", aura = "sensory"},
  		["cursed by power spikes."] = {aff = "powerspikes", aura = "auric"},
  		["hallucinating."] = {aff = "hallucinations", aura = "mania"},
  		["afflicted by haemophilia."] = {aff = "haemophilia", aura = "sanguine"},
  		["suffering from a $(level$) case of temporary insanity."] = {aff = "temporaryinsanity", aura = "neurosis"},
  		["cursed by mana barbs."] = {aff = "manabarbs", aura = "auric"},
  		["suffering from epilepsy."] = {aff = "epilepsy", aura = "neurosis"},
  		["suffering from a bad bout of dysentery."] = {aff = "dysentery", aura = "choleric"},
 		-- ["blind."] = {aff = "blind", aura = "sensory"},
  		["anorexic."] = {aff = "anorexia", aura = "neurosis"},
  		["first degree burns."] = {aff = "burns", aura = "sensory"},
  		["second degree burns."] = {aff = "burns", aura = "sensory"},
  		["third degree burns."] = {aff = "burns", aura = "sensory"},
  		["fourth degree burns."] = {aff = "burns", aura = "sensory"},
  		["afflicted with clumsiness."] = {aff = "clumsiness", aura = "neurosis"},
  		["surrounded by a colourful light."] = {aff = "luminosity", aura = "auric" },
	}


aegis.a, aegis.r = {}, {
	auric = {"aeon", "achromaticaura", "healthleech", "powerspikes", "manabarbs", "egovice", "powersap", "illuminated"},
	choleric = {"vomiting", "asthma", "pox", "sickening", "dysentery", "scabies", "paralysis"},
	fractures = {"concussion", "fracturedleftarm", "fracturedrightarm", "fracturedskull", "brokenjaw", "brokenrightwrist", "brokenleftwrist", "brokenchest", "brokennose", "crushedrightfoot", "crushedleftfoot", "crushedwindpipe", "snappedrib"},
	mania = {"stupidity", "recklessness", "hallucinations", "addiction", "paranoia", "asthma", "insomnia" },
	neurosis = {"epilepsy", "anorexia", "confusion", "clumsiness", "minorinsanity", "moderateinsanity", "majorinsanity", "massiveinsanity"},
	phlegmatic = {"aeon", "paralysis", "rigormortis", "disloyalty", "pacifism", "minortimewarp", "moderatetimewarp", "majortimewarp", "massivetimewarp", "transfixed"},
	regenerate = {{burstorgans = "gut"}, {missingrightleg = "legs"}, {missingleftarm = "arms"}, {missingleftleg = "legs"}, {missingrightarm = "arms"}, {eyepeckleft = "head"}, {eyepeckright = "head"}, {mangledleftleg = "legs"}, {mangledleftarm = "arms"}, {mangledrightarm = "arms"}, {mangledrightleg = "legs"}, {crushedchest = "chest"}, {collapsedrightnerve = "arms"}, {collapsedlungs = "chest"}, {collapsedleftnerve = "arms"}, {crackedleftelbow = "arms"}, {crackedrightelbow = "arms"}, {crackedrightkneecap = "legs"}, {crackedleftkneecap = "legs"}, {disembowel = "gut"}, {chestpain = "chest"}, {rupturedstomach = "gut"}, {severedspine = "chest"}, {tendonright = "legs"}, {tendonleft = "legs"}, {concussion = "head"}, {damagedhead = "head"}, {shatteredleftankle = "legs"}, {shatteredrightankle = "legs"}, {shatteredjaw = "head"}},
	sensory = {"slickness", "ablaze", "chills", "firstdegreeburn", "seconddegreeburn", "thirddegreeburn", "fourthdegreeburn", "sensitivity", "blindness", "deafness"},
	sanguine = {"haemophilia", "relapsing", "onevessels", "twovessels", "threevessels", "fourvessels", "thirteenplusvessels", "oneclot","twoclots","threeclots","fourplusclots"}
}


for aura, afft in pairs(aegis.r) do
  for _, aff in pairs(afft) do
    if type(aff) == "string" then
      aegis.a[aff] = aura
    elseif type(aff) == "table" then
      aegis.a[next(aff)] = {aura = aura, side = select(2, next(aff))}
    end
  end
end

function aegis.auraShift(aff, person)
  local aff = aff
  local person = person
  local aura = aegis.getAura(aff)
  if not aura then 
    e:error("Unknown affliction passed to aegis.auraShift()")
    return
  end

  op.balqueue:add({
    code = "radiate "..aura, 
    required = {"op.bals.balance", "op.bals.equilibrium"},
    consumed = {"op.bals.equilibrium"}
  })

  if person then
    op.balqueue:add({
      code = "aurashift "..aura.." "..person, 
      required = {"op.bals.balance", "op.bals.equilibrium"},
      consumed = {"op.bals.equilibrium"}
    })
  end
end


function aegis.getAff(diag_line)
	return aegis.affmap[diag_line].aff, aegis.affmap[diag_line].aura
end


function aegis.getAura(aff)
  return aegis.a[aff]
end


function aegis.hasAff(name, aff)
	return op.succor[name].afflictions[aff] and true or false
end


function aegis.getSuccorAffs(name)
	local affs = {}
	for _, v in ipairs(op.succor[name].afflictions) do
		if v ~= "blind"
    	and v ~= "deaf"
    	and v ~= "an insomniac"
      and v ~= "unable to be masochistic"
      and v ~= "sprawled on the ground" then
			affs[#affs+1] = v
    	end
	end
  
	return affs
end

function aegis.getCureByAff(aff)
	for k, v in pairs(aegis.affmap) do
		if v.aff == aff then
			return v.aura
		end
	end
end


function aegis.cure(name)
	local superurgent = {"aeon", "anorexia", "asthma", "crushedwindpipe", "ectoplasm", "slickness", "slitthroat", "throatlock"}

	assert(op.succor[name])

	local affs = aegis.getSuccorAffs(name)
	local urgent = next(table.n_intersection(superurgent, affs)) or nil

	if urgent then
		op.balqueue:add("cure "..name.." "..aegis.getCureByAff(urgent))
	else
		if next(affs) then
			op.balqueue:add("cure "..name.." "..aegis.getCureByAff(affs))
		end
	end
end


function aegis.stop(name)
	if name then
		e:echo("Stopped healing %s.", name)
	else 
		e:echo("We were not healing anybody.") 
	end
	
	name = nil
	op.balqueue:clear()
end


function aegis.succor(aff, bleedamt, attr)
  assert(aff)
  if bleedamt and tonumber(bleedamt) < 200 then return end
  aegis.affs[#aegis.affs+1] = aff
  aegis.affs[op.succortarget] = {}
  bleedamt = bleedamt
end


return aegis
