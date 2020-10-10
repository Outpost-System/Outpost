local map = {}

-- Dijkstra's Algorithm. A Lua implementation for Mudlet.


function map.dijkstra(self, graphmap, current, destination, directed)
    if not directed then 
        self.complete(graphmap) 
    end

    local unvisited, distance_to, trail = {}, {}, {}
    local nearest, next_node, speculate

    for node, edge_dists in pairs(graphmap) do

        if node == current then
            distance_to[node] = 0
            trail[current] = false
        else
            distance_to[node] = math.huge
            unvisited[node] = true
        end

    end

    repeat
        nearest = math.huge
        for neighbour, path_dist in pairs(graphmap[current]) do

            if unvisited[neighbour] then
                speculate = distance_to[current] + path_dist

                if speculate < distance_to[neighbour] then
                    distance_to[neighbour] = speculate
                    trail[neighbour] = current
                end

                if speculate < nearest then
                    nearest = speculate
                    next_node = neighbour
                end

            end

        end

        unvisited[current] = false
        current = next_node
    until unvisited[destination] == false or nearest == math.huge
    return distance_to[destination], self.follow(trail, destination)
end

function map.complete(self, graphmap)
    for node, edges in pairs(graphmap) do

        for edge, distance in pairs(edges) do

            if not graphmap[edge] then 
                graphmap[edge] = {} 
            end
            
            graphmap[edge][node] = distance
        end

    end
end

function map.follow(self, trail, destination)
    local path, next_step = destination, trail[destination]

    while next_step do
        path = next_step .. " " .. path
        next_step = trail[next_step]
    end

    return path
end


return map
