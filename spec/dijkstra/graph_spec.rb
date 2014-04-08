require 'spec_helper'

describe Dijkstra::Graph do
  context '.new' do
    it 'takes edge tupples and creates edges' do
      graph = Dijkstra::Graph.new [['A','B','1',1]]
      
      expect(graph.edges).to be_an Array
      expect(graph.edges[0]).to be_a Dijkstra::Edge
    end
  end
  
  context '.find_node' do
    it 'returns the found node' do
      graph = Dijkstra::Graph.new
      node1  = graph.find_node('strange')
      node2  = graph.find_node('strange')
      
      expect(node1.object_id).to eq node2.object_id
    end
    
    it 'creates a new node if one does not exist' do
      graph = Dijkstra::Graph.new
      node  = graph.find_node('strange')
      
      expect(node).to be_a Dijkstra::Node
      expect(node.name).to eq 'strange'
    end
  end
  
  context '.shortest_path_between' do
    it 'returns that path' do
      graph = Dijkstra::Graph.new [['A','B','1',1]]
      
      expect(graph.shortest_path_between('A','B')).to eq ['A','B']
    end
  end
end