module Djikstra
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
    
    def find_node(name)
      node = @nodes[name]
      return node if node
      
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
      
      start_node = find_node(start)
      start_node.distance = 0
      
      while universe.size > 0
        start_node.neighbors.each do |neighbor|
          next unless universe.include? neighbor #skip visited nodes
          
          dist = start_node.distance + start_node.distance_to(neighbor)
          
          if neighbor > dist
            neighbor.distance = dist
            neighbor.previous_node = start_node
          end
        end
        
        universe.delete start_node
        
        start_node = closest(universe)
      end
      
      # walk backwards
      start_node = find_node(start)
      node       = find_node(stop)
      @shortest_path_distance = node.distance
      path       = [node.name]
      while node != start_node
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