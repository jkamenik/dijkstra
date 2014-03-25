module Djikstra
  class Edge
    attr_accessor :graph, :start, :stop, :weight
    
    def initialize(graph,start,stop,weight,line=0)
      raise ParseError, "Invalid edge on line #{line}" unless start && stop && weight
      
      @graph  = graph
      @start  = graph.find_node(start.to_s.upcase)
      @stop   = graph.find_node(stop.to_s.upcase)
      @weight = Integer(weight)
      
      @start.neighbor_of(@stop)
      @stop.neighbor_of(@start)
    rescue TypeError, ArgumentError
      # Integer may raise this, so reraise as a ParseError
      raise ParseError, "Invalid weight on line #{line}"
    end
  end
end
      