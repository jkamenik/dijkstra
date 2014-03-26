module Djikstra
  class Node
    attr_accessor :name, :distance, :neighbors, :previous_node
    
    def initialize(name)
      @name      = name
      @neighbors = []
      @weights   = {}
      reset
    end
    
    def reset
      @distance      = :infinity
      @previous_node = nil
    end
    
    def neighbor_of(node, weight)
      @neighbors.push node
      @weights[node.name] = weight
    end
    
    def distance_to(node)
      @weights[node.name]
    end
    
    def >(number)
      return true if @distance == :infinity
      return false if number == :infinity
      
      distance > number
    end
    
    def inspect
      %Q(#<Djikstra::Node name="#{name}" distance=#{distance}>)
    end
    alias_method :to_s, :inspect
  end
end