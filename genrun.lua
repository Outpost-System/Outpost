local genrun = {}

-- Outpost Bashing Module. Enjoy :)

genrun.config = {}

function genrun.init(self, rs)
	if rs and type(rs) ~= "boolean" then
		e.error("genrun:init() error. Supplied argument must be a boolean.")
		return
	end

	timer:start("genrun plot time")
	e:echo("Genrunner plotting: " .. getRoomAreaName(getRoomArea(mmp.currentroom)) .. "...")
	
	local r = getAreaRooms(getRoomArea(mmp.currentroom))
	
	genrun.rooms = {}
	genrun.reverse_path = {}
	
	for _, vnum in ipairs(r) do
		if getPath(mmp.currentroom, vnum) then
			genrun.rooms[vnum] = {}
			local exits = getRoomExits(vnum)
			for direction, to_room in pairs(exits) do
				genrun.rooms[vnum][to_room] = {
					dir = direction,
				}
			end
		end
	end

	genrun.rooms[mmp.currentroom] = {}
	
	local exits = getRoomExits(mmp.currentroom)
	
	for direction, to_room in pairs(exits) do
		genrun.rooms[mmp.currentroom][to_room] = {
			dir = direction,
		}
	end

	genrun.rooms_left_to_touch = {}
	genrun.starting_room = mmp.currentroom
	
	for vnum, exits in pairs(self.rooms) do
		if vnum ~= starting_room then
			genrun.rooms_left_to_touch[vnum] = true
		end
	end

	e:echo("Parsed " .. counttable(genrun.rooms_left_to_touch) .. " rooms. (Took " .. timer:stop("genrun plot time") .. ")\n")

	local area = gmcp.Room.Info.area
	local mobs = pve.mobs_by_area[area]

	e:echo("Detected for this run:\n")
	e:echo(concand(mobs)..".\n")

	e:echo("All set! Type 'op genrun go' to start.")
	genrun.config.return_to_start = rs

	genrun.highlight_rooms()

	op.genrunning = true

	raiseEvent("outpost genrun start")
end


function genrun.walk()
	for links_to, room_info in pairs(genrun.rooms[mmp.currentroom]) do
		if genrun.rooms_left_to_touch[links_to] then
			walking_to = links_to
			table.insert(genrun.reverse_path, mmp.currentroom)
			return mmp.gotoRoom(walking_to)
		end
	end
	
	genrun.backtrack()
end


function genrun.backtrack()
	genrun.backtracking = true
	if #genrun.reverse_path > 0 then
		genrun.walking_to = table.remove(genrun.reverse_path)
		return mmp.gotoRoom(genrun.walking_to)
	else
		e:echo("Hunting for this area has been completed.")
		raiseEvent("outpost genrun completed")
	end
end


function genrun.stop()
	mmp.stop()
	genrun.walking = false
	genrun.rooms = {}
	genrun.walking_to = 0
	genrun.backtracking = false
	raiseEvent("outpost genrun stop")
	if genrun.config.return_to_start then
		e:echo("Returning you to your starting room!")
		op.genrunning = true
		mmp.gotoRoom(genrun.starting_room)
	end
end


function genrun.continue()
	genrun.walking = true
	for k, v in pairs(op.roomitems) do
		local items_to_pickup = { "essence" }
		for _, i in ipairs(items_to_pickup) do
			if v.name:find(i) then
				send("get " .. i)
			end
		end
	end
  
	genrun.walk()
end


function genrun.arrived()
	if op.genrunning then
		local vnum = gmcp.Room.Info.num
		
		genrun.unHighlightRoom(mmp.currentroom) 

		if vnum ~= genrun.walking_to then
			return
		end
	
		if genrun.backtracking then
			genrun.backtracking = false
		else
			genrun.rooms_left_to_touch[vnum] = nil
		end

		pve:getMobTable()
		raiseEvent("outpost genrun arrived")
		genrun.walking = false
	end
end


function genrun.highlightRooms()
	local r = getAreaRooms(getRoomArea(mmp.currentroom))
	for _, v in ipairs(r) do
		local r,g,b = unpack(color_table.red)
		local br,bg,bb = unpack(color_table.blue)
		highlightRoom(v, r, g, b, br, bg, bb, 1, 255, 255)
	end
end


return genrun