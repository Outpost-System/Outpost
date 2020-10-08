module("genrun", package.seeall)


-- Outpost Bashing Module. Enjoy :)

config = {}

function init(self, rs)
	if rs and type(rs) ~= "boolean" then
		e.error("genrun:init() error. Supplied argument must be a boolean.")
		return
	end

	timer:start("genrun plot time")
	e:echo("Genrunner plotting: " .. getRoomAreaName(getRoomArea(mmp.currentroom)) .. "...")
	
	local r = getAreaRooms(getRoomArea(mmp.currentroom))
	
	rooms = {}
	reverse_path = {}
	
	for _, vnum in ipairs(r) do
		if getPath(mmp.currentroom, vnum) then
			rooms[vnum] = {}
			local exits = getRoomExits(vnum)
			for direction, to_room in pairs(exits) do
				rooms[vnum][to_room] = {
					dir = direction,
				}
			end
		end
	end

	rooms[mmp.currentroom] = {}
	
	local exits = getRoomExits(mmp.currentroom)
	
	for direction, to_room in pairs(exits) do
		rooms[mmp.currentroom][to_room] = {
			dir = direction,
		}
	end

	rooms_left_to_touch = {}
	starting_room = mmp.currentroom
	
	for vnum, exits in pairs(rooms) do
		if vnum ~= starting_room then
			rooms_left_to_touch[vnum] = true
		end
	end

	e:echo("Parsed " .. counttable(rooms_left_to_touch) .. " rooms. (Took " .. timer:stop("genrun plot time") .. ")\n")

	local area = gmcp.Room.Info.area
	local mobs = pve.mobs_by_area[area]

	e:echo("Detected for this run:\n")
	e:echo(concand(mobs)..".\n")

	e:echo("All set! Type 'op genrun go' to start.")
	config.return_to_start = rs

	highlight_rooms()

	op.genrunning = true

	raiseEvent("outpost genrun start")
end


function walk()
	for links_to, room_info in pairs(rooms[mmp.currentroom]) do
		if rooms_left_to_touch[links_to] then
			walking_to = links_to
			table.insert(reverse_path, mmp.currentroom)
			return mmp.gotoRoom(walking_to)
		end
	end
	
	backtrack()
end


function backtrack()
	backtracking = true
	if #reverse_path > 0 then
		walking_to = table.remove(reverse_path)
		return mmp.gotoRoom(walking_to)
	else
		e:echo("Hunting for this area has been completed.")
		raiseEvent("outpost genrun completed")
	end
end


function stop()
	mmp.stop()
	walking = false
	rooms = {}
	walking_to = 0
	backtracking = false
	raiseEvent("outpost genrun stop")
	if genrun.config.return_to_start then
		e:echo("Returning you to your starting room!")
		op.genrunning = true
		mmp.gotoRoom(starting_room)
	end
end


function continue()
	walking = true
	for k, v in pairs(op.roomitems) do
		local items_to_pickup = { "essence" }
		for _, i in ipairs(items_to_pickup) do
			if v.name:find(i) then
				send("get " .. i)
			end
		end
	end
  
	walk()
end


function arrived()
	if op.genrunning then
		local vnum = gmcp.Room.Info.num
		
		unHighlightRoom(mmp.currentroom) 

		if vnum ~= walking_to then
			return
		end
	
		if backtracking then
			backtracking = false
		else
			rooms_left_to_touch[vnum] = nil
		end

		pve:get_mob_table()
		raiseEvent("outpost genrun arrived")
		walking = false
	end
end


function highlight_rooms()
	local r = getAreaRooms(getRoomArea(mmp.currentroom))
	for _, v in ipairs(r) do
		local r,g,b = unpack(color_table.red)
		local br,bg,bb = unpack(color_table.blue)
		highlightRoom(v, r, g, b, br, bg, bb, 1, 255, 255)
	end
end
