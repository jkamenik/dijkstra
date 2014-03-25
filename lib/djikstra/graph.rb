module Djikstra
  class Graph
    def initialize
      @nodes = {}
    end
    
    def find_node(name)
      node = @nodes[name]
      return node if node
      
      node = Node.new name
      @nodes[name] = node
      node
    end
    # attr_accessor :nodes, :shortest_path_distance
    # 
    # def initialize(edges)
    #   @nodes = []
    #   edges.each do |edge|
    #     
    # end
    # 
    # def shortest_path_between(start,stop)
    #   p graph
    #   dist     = {}
    #   previous = {}
    #   universe = []
    #   
    #   graph.each do |edge|
    #     universe.push edge.start
    #     universe.push edge.stop
    #     
    #     dist[edge.start] = :infinity
    #     dist[edge.stop] = :infinity
    #     
    #     previous[edge.start] = nil
    #     previous[edge.stop] = nil
    #   end
    #   
    #   dist[@start] = 0
    #   
    #   universe.uniq!
    #   
    #   p dist, previous, universe
    #   
    #   while universe.size > 0
    #     node = smallest_dist(dist,universe)
    #     universe.delete node
    #     
    #     break if dist[node] == :infinity
    #   end
    # end
    # 
    # def neighbors_of(vertex)
    # end
    # 
    # def smallest_dist(dist,universe)
    #   smallest = universe.first
    #   length   = dist[smallest]
    #   
    #   universe.each do |node|
    #     next if dist[node] == :infinity
    # 
    #     if dist[node] < length
    #       smallest = node
    #       length   = dist[node]
    #     end
    #   end
    #   
    #   p smallest
    # end
  end
end