local genrun = {}

-- Outpost Bashing Module. Enjoy :)

--[===[
The MIT License (MIT)

Copyright (c) 2020 Damian Monogue

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
--]===]

genrun.autowalker = {}
genrun.autowalker.config = {}
if genrun.autowalker.enabled == nil then
  genrun.autowalker.enabled = false
end

-- Set to false if you don't want to go back to the room you start the walker in when it's done
genrun.autowalker.config.returnToStart = true

function genrun.findAndRemove(targetTable, item)
  table.remove(targetTable, table.index_of(targetTable, item))
end

function genrun.autowalker:init(rooms)
  if rooms == nil then
    rooms = {}
  end
  if type(rooms) ~= "table" then
    genrun.echo("You tried to initialize the autowalker with an argument, and it was not a table of room ID numbers. Try again")
    return
  end

  if genrun.autowalker.enabled then
    return
  end
  genrun.autowalker.enabled = true
  local currentRoom = mmp.currentroom
  genrun.autowalker.currentRoom = currentRoom
  genrun.autowalker.startingRoom = currentRoom
  local area = getRoomArea(currentRoom)
  genrun.autowalker.area = area
  if #rooms ~= 0 then
    area = getRoomArea(rooms[1])
    genrun.autowalker.area = area
    if table.contains(rooms, currentRoom) then
      genrun.findAndRemove(rooms, currentRoom)
    end
    genrun.autowalker.remainingRooms = table.deepcopy(rooms)
  else
    local areaRooms = getAreaRooms(area)
    genrun.findAndRemove(areaRooms, currentRoom)
    genrun.autowalker.remainingRooms = table.deepcopy(areaRooms)
  end
  genrun.autowalker:registerEventHandlers()
  raiseEvent("outpost genrun arrived")
end

function genrun.autowalker:stop()
  if not genrun.autowalker.enabled then
    return
  end
  genrun.autowalker.currentRoom = nil
  genrun.autowalker.remainingRooms = nil
  genrun.autowalker.enabled = false
  genrun.autowalker:removeEventHandlers()
  if genrun.autowalker.config.returnToStart then
    mmp.gotoRoom(genrun.autowalker.startingRoom)
  end
end

function genrun.autowalker:move()
  if not genrun.autowalker.enabled then
    return
  end
  genrun.autowalker.nextRoom = genrun.autowalker:closestRoom()
  if genrun.autowalker.nextRoom ~= "" then
    mmp.gotoRoom(genrun.autowalker.nextRoom)
  else
    raiseEvent("outpost genrun stop")
  end
end

function genrun.autowalker:arrived()
  if tonumber(mmp.currentroom) == tonumber(genrun.autowalker.nextRoom) then
    genrun.autowalker.currentRoom = mmp.currentroom
    genrun.findAndRemove(genrun.autowalker.remainingRooms, mmp.currentroom)
    raiseEvent("outpost genrun arrived")
  else
    debugc("genrun: Somehow, the mudlet mapper says we have arrived but it is not to the room we said to go to.")
  end
end

function genrun.autowalker:failedPath()
  genrun.findAndRemove(genrun.autowalker.remainingRooms, genrun.autowalker.nextRoom)
  genrun.autowalker.currentRoom = mmp.currentroom
  raiseEvent("outpost genrun move")
end

function genrun.autowalker:removeEventHandlers()
  for _, handlerID in pairs(genrun.autowalker.eventHandlers) do
    killAnonymousEventHandler(handlerID)
  end
end

function genrun.autowalker:registerEventHandlers()
  genrun.autowalker.eventHandlers = genrun.autowalker.eventHandlers or {}
  genrun.autowalker:removeEventHandlers()
  genrun.autowalker.eventHandlers.move = registerAnonymousEventHandler("outpost genrun move", genrun.autowalker.move)
  genrun.autowalker.eventHandlers.stop = registerAnonymousEventHandler("outpost genrun stop", genrun.autowalker.stop)
  genrun.autowalker.eventHandlers.arrived = registerAnonymousEventHandler("mmapper arrived", genrun.autowalker.arrived)
  genrun.autowalker.eventHandlers.failedPath = registerAnonymousEventHandler("mmapper failed path", genrun.autowalker.failedPath)
end

function genrun.autowalker:closestRoom()
  local roomID = ""
  local distance = 99999
  for _, v in ipairs(genrun.autowalker.remainingRooms) do
    getPath(genrun.autowalker.currentRoom, v)
    if table.size(speedWalkDir) < distance then
      distance = table.size(speedWalkDir)
      roomID = v
    end
  end
  return roomID
end


return genrun