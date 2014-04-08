require 'spec_helper'

describe Dijkstra::Node do
  let(:node) { Dijkstra::Node.new 'A' }
  
  context '.reset' do
    it 'resets distance to infinity' do
      node.distance = 1
      
      node.reset
      expect(node.distance).to eq :infinity
    end
    
    it 'removes any previous nodes' do
      node.previous_node = node
      
      node.reset
      expect(node.reset).to eq nil
    end
  end
  
  context ">" do
    it 'returns true if my distance is infinity' do
      node.distance = :infinity
      
      expect(node > 1_000_000_000_000).to be_true
    end
    
    it 'returns false if the number is infinity' do
      node.distance = 1_000_000_000_000
      
      expect(node > :infinity).to be_false
    end
    
    it 'compares distance to number' do
      node.distance = 1
      
      expect(node > 2).to be_false
    end
  end
end