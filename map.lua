local map = {}

-- Dijkstra's Algorithm. A Lua implementation.


function map.dijkstra(self, graphmap, current, destination, directed)
    if not directed then self.complete(graphmap) end
    local unvisited, distanceTo, trail = {}, {}, {}
    local nearest, nextNode, tentative
    for node, edgeDists in pairs(graphmap) do
        if node == current then
            distanceTo[node] = 0
            trail[current] = false
        else
            distanceTo[node] = math.huge
            unvisited[node] = true
        end
    end
    repeat
        nearest = math.huge
        for neighbour, pathDist in pairs(graphmap[current]) do
            if unvisited[neighbour] then
                tentative = distanceTo[current] + pathDist
                if tentative < distanceTo[neighbour] then
                    distanceTo[neighbour] = tentative
                    trail[neighbour] = current
                end
                if tentative < nearest then
                    nearest = tentative
                    nextNode = neighbour
                end
            end
        end
        unvisited[current] = false
        current = nextNode
    until unvisited[destination] == false or nearest == math.huge
    return distanceTo[destination], follow(trail, destination)
end

function map.complete(self, graphmap)
    for node, edges in pairs(graphmap) do
        for edge, distance in pairs(edges) do
            if not graphmap[edge] then graphmap[edge] = {} end
            graphmap[edge][node] = distance
        end
    end
end

function map.follow(self, trail, destination)
    local path, nextStep = destination, trail[destination]
    while nextStep do
        path = nextStep .. " " .. path
        nextStep = trail[nextStep]
    end
    return path
end


return map