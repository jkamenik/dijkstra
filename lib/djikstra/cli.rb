module Djikstra
  class Cli
    def initialize(*args)
      @file  = args[0]
      @start = args[1].to_s.upcase
      @stop  = args[2].to_s.upcase
    end
    
    def usage
      puts "#{$0} <file> <start> <end>"
      puts "  file  - a DAG graph file"
      puts "  start - the name of starting node"
      puts "  end   - the name of the ending node"
      puts
      puts " DAG graph file contains lines (between two nodes) and weights in the following format"
      puts "     [A,B,1]"
      puts "     [B,C,3]"
      puts
      puts "Example:"
      puts " $ #{$0} graph.txt A C"
      puts " Shortest path is [A,B,C] with total cost 4"
      
      exit 1
    end
    
    def parse
      edges = []
      open(@file) do |f|
        f.readlines.each_with_index do |line,idx|
          items = line.split /\[(\w+),(\w+),(\d+)\]/
          
          # only care about the center 3
          edges.push [items[1],items[2],items[3],idx+1]
        end
      end
      edges
    end
    
    def run
      return usage unless @file && @start && @stop
      
      graph = Graph.new(parse)
      path  = graph.shortest_path_between(@start,@stop)
      dist  = graph.shortest_path_distance
      
      puts "Shortest path is [#{path.join(',')}] with a total cost of #{dist}"
    end
  end
end
