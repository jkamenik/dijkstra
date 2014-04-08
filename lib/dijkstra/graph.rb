module Dijkstra
  class Graph
    attr_reader :nodes, :edges, :shortest_path_distance
    
    def initialize(edges=[])
      @nodes = {}
      @edges = []
      
      edges.each do |e|
        args = e.unshift self
        
        @edges.push Edge.new(*args)
      end
    end
    
    def find_node(name,raise_if_note_found=false)
      node = @nodes[name]
      return node if node
      
      raise GraphError, %Q(Node "#{name}" not found!) if raise_if_note_found
      
      node = Node.new name
      @nodes[name] = node
      node
    end

    def shortest_path_between(start,stop)
      universe = []
      
      @nodes.each do |key,node|
        node.reset
        
        universe.push node
      end
      
      start_node = find_node(start, true)
      start_node.distance = 0
      
      while universe.size > 0
        start_node.neighbors.each do |neighbor|
          next unless universe.include? neighbor #skip visited nodes
          
          # untraversable branch
          raise GraphError, %Q(Node "#{start_node.name}" is not reachable) if start_node.infinite?
          
          dist = start_node.distance + start_node.distance_to(neighbor)
          
          if neighbor > dist
            neighbor.distance = dist
            neighbor.previous_node = start_node # collect the shortest path back
          end
        end
        
        universe.delete start_node
        
        start_node = closest(universe)
      end
      
      # walk backwards
      start_node = find_node(start, true)
      stop_node  = find_node(stop, true)
      collect_shortest_path_between(start_node,stop_node)
    end
    
    def collect_shortest_path_between(start_node,end_node)
      # artifact, the distance is the end_node distance
      @shortest_path_distance = end_node.distance

      # walk from the end node down the previous_node list
      node = end_node
      path = [node.name]
      while node && node != start_node
        node = node.previous_node
        path.insert 0, node.name
      end
      path
    end
    
    def closest(universe)
      u = universe.first
      
      universe.each do |node|
        u = node if u > node.distance
      end
      u
    end
  end
end