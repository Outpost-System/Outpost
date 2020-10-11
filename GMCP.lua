local GMCP = {}

-- Outpost GMCP Handling.

GMCP.items = {}
GMCP.items.inv_items = {}
GMCP.items.room_items = {}

-- Keep our connection alive.

function GMCP.KeepAlive()
	sendGMCP("Core.KeepAlive")
	if op.keepalive then
		killTimer(op.keepalive)
	end
	op.keepalive = tempTimer(60, [[GMCP.KeepAlive()]])
end

GMCP.KeepAlive()



-- Character vitals handling.

function GMCP.ParseVitals()
	if not gmcp
		or not gmcp.Char
		or not gmcp.Char.Vitals
	then
		return
	end


-- Define temporary character vitals tables.

local vitals = {
	"awp",
	"bleeding",
	"bruising",
	"ego",
	"ep",
	"essence",
	"esteem",
	"hp",
	"karma",
	"maxawp",
	"maxego",
	"maxep",
	"maxhp",
	"maxmp",
	"maxpow",
	"maxwp",
	"mount",
	"mp",
	"pow",
	"reserves",
	"wp"
}

local defs = {
	"blind",
	"deaf",
	"kafe"
}

local bals = {
	"allheale",
	"balance",
	"beastbal",
	"dust",
	"eflowbal",
	"enigmaticflow",
	"equilibrium",
	"head",
	"healing",
	"ice",
	"left_arm",
	"left_leg",
	"modulebal",
	"psiid",
	"psisub",
	"psisuper",
	"right_arm",
	"right_leg",
	"scroll",
	"slush",
	"steam",
	"sparkleberry"
}

local stats = {
	"age",
	"bank",
	"city",
	"class",
	"explorerrank",
	"fullname",
	"family",
	"gender",
	"gold",
	"guild",
	"level",
	"mount",
	"order",
	"race",
	"true_race",
	"unread_msgs",
	"unread_news",
	"xprank"
}

local wounds = {
	"chestwounds",
	"gutwounds",
	"headwounds",
	"rightarmwounds",
	"rightlegwounds",
	"leftarmwounds",
	"leftlegwounds"
}

	op.bals.last = {}
	op.stats.last = {}
	op.vitals.last = {}


	for _, key in ipairs(bals) do
		op.bals.last[key] = op.bals[key]
	end

	for _, key in ipairs(stats) do
		op.stats.last[key] = op.stats[key]
	end

	for _, key in ipairs(vitals) do
		op.vitals.last[key] = op.vitals[key]
	end


	for _, key in ipairs(bals) do
		op.bals[key] = gmcp.Char.Vitals[key] == "1" and true or false

		if op.bals[key] == true and op.bals.last[key] == false then
			if op.limiters[key] ~= nil then 
				fs:off(key)
			end
			timer.set[key] = nil
		elseif op.bals[key] == false and op.bals.last[key] == true then
			timer:start(key)
		end
	end


	for _, key in ipairs(stats) do
		if gmcp.Char.Status[key] then
			op.stats[key] = gmcp.Char.Status[key]
		end
	end

	for _, key in ipairs(vitals) do
		if gmcp.Char.Vitals[key] then
			op.vitals[key] = tonumber(gmcp.Char.Vitals[key])
		end
	end


	op.vitals.levels = {
		ratios = {
			health = math.floor((gmcp.Char.Vitals.hp / gmcp.Char.Vitals.maxhp) * 100),
			mana = math.floor((gmcp.Char.Vitals.mp / gmcp.Char.Vitals.maxmp) * 100),
			ego = math.floor((gmcp.Char.Vitals.ego / gmcp.Char.Vitals.maxego) * 100),
			power = math.floor((gmcp.Char.Vitals.pow / gmcp.Char.Vitals.maxpow) * 100)
		}
	}
end


function GMCP.GetSkillsets()
	op.skills = {}
	for _, set in ipairs(gmcp.Char.Skills.Groups) do
		local skills = string.format("Char.Skills.Get %s", yajl.to_string({ group = set.name }))
		sendGMCP(skills)
	end
	send("\n")
end


function GMCP.PopulateSkillTree()
	local group = gmcp.Char.Skills.List.group
	local list = gmcp.Char.Skills.List.list
	local newlist = {}
	for i, val in ipairs(list) do
		list[i] = val:gsub("* ", ""):lower()
	end

	if group then
		if not op.skills then op.skills = {} end
		op.skills[group] = list
		raiseEvent("outpost gmcp skills done", group)
	end
end


function GMCP.items:Add()
   local location = gmcp.Char.Items.Add.location
   if location ~= "inv" and location ~= "room" then
      location = location:match("%d+$")
   end
   local loc = location .. "_items"
   local item = {}
   for x, y in pairs(gmcp.Char.Items.Add.item) do 
      item[x] = y
   end
   if not self[loc] then
      sendGMCP("Char.Items.Inv")
      return
   end
   table.insert(self[loc], gmcp.Char.Items.Add.item)
   if loc == "inv_items" and item.attrib and item.attrib:find("c") then
      sendGMCP("Char.Items.Contents "..item.id)
   end
   return "outpost gmcp items add", location
end

function GMCP.items:Remove()
   local location = gmcp.Char.Items.Remove.location
   if location ~= "inv" and location ~= "room" then
      location = location:match("%d+$")
   end
   local loc = location .. "_items"
   if not self[loc] then
      sendGMCP("Char.Items.Inv")
      return
   end
   for k, v in pairs(self[loc]) do
      if v.id == gmcp.Char.Items.Remove.item.id then
         table.remove(self[loc], k)
         break
      end
   end
   return "outpost gmcp items remove", location
end


function GMCP.items:List()
   local location = gmcp.Char.Items.List.location
   if location ~= "inv" and location ~= "room" then
      location = location:match("%d+$")
   end
   local loc = location .. "_items"
   self[loc] = {}
   for k, v in pairs(gmcp.Char.Items.List.items) do
      local item = {}
      for x, y in pairs(v) do 
        item[x] = y
      end
      table.insert(self[loc], item)
      if loc == "inv_items" and v.attrib and v.attrib:find("c") then
         sendGMCP("Char.Items.Contents "..v.id)
      end
   end
   return "outpost gmcp items list", location
end


function GMCP.items:Update()
   local location = gmcp.Char.Items.Update.location
   if location ~= "inv" and location ~= "room" then
      location = location:match("%d+$")
   end
   local loc = location .. "_items"
   local item = gmcp.Char.Items.Update.item
   local updated
      if not self[loc] then
      sendGMCP("Char.Items.Inv")
      return
   end
   for k, v in pairs(self[loc]) do
      if v.id == item.id then
         local item = {}
         for x, y in pairs(v) do 
            item[x] = y
         end
         self[loc][k] = item
         updated = true
         break
      end
   end
   if loc == "inv_items" and not updated then sendGMCP("Char.Items.Inv") end
   if loc == "inv_items" and item.attrib and item.attrib:find("c") then
      sendGMCP("Char.Items.Contents "..item.id)
   end
   return "outpost gmcp items update", location
end

function GMCP.items:StatusVars()
   GMCP.items.inv_items = {}
   GMCP.items.room_items = {}
   sendGMCP("Char.Items.Inv")
   send("ql", false)
end

function GMCP.ItemsEvent(self, event)
	local event = event:match("%w+$")
	display(event)
	local func = loadstring("return GMCP.items:"..event.."()")
	local x, y = func()
	op.invitems = GMCP.items.inv_items
	op.roomitems = GMCP.items.room_items
	if x then raiseEvent(x, y) end
end


return GMCP