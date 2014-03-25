module Djikstra
  class Node
    attr_accessor :name, :distance, :neighbors
    
    def initialize(name)
      @name      = name
      @distance  = :infinity
      @neighbors = []
    end
    
    def neighbor_of(node)
      @neighbors.push node
    end
  end
end