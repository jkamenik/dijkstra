require 'spec_helper'

describe Djikstra::Graph do
  context '.find_node' do
    it 'returns the found node' do
      graph = Djikstra::Graph.new
      node1  = graph.find_node('strange')
      node2  = graph.find_node('strange')
      
      expect(node1.object_id).to eq node2.object_id
    end
    
    it 'creates a new node if one does not exist' do
      graph = Djikstra::Graph.new
      node  = graph.find_node('strange')
      
      expect(node).to be_a Djikstra::Node
      expect(node.name).to eq 'strange'
    end
  end
end