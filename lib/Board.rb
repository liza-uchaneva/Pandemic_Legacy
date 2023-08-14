class Board
    attr_reader :graph

    def initialize(map)
        @graph = map
    end

    def findBestSpotForNextStation(cur_stations)
        visited_with_level = Hash.new
        queue = Queue.new
        spots_for_next_stations = Array.new

        cur_stations.each do |station|
            queue.push(station)
            visited_with_level[station] = 0
        end
        max_level = 0
        
        while !queue.empty?()
            cur = queue.pop()
            
            @graph[cur].each do |city|
                if(!visited_with_level.keys.include?(city))
                    queue.push(city)
                    visited_with_level[city] = visited_with_level[cur] + 1

                    if(visited_with_level[city] > max_level)
                        spots_for_next_stations = Array.new
                        spots_for_next_stations.push(city)
                    end

                    if(visited_with_level[city] == max_level)
                        spots_for_next_stations.push(city)
                    end
                end
            end            
        end

        return spots_for_next_stations
    end

end