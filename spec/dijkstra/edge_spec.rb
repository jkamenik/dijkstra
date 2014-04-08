require 'spec_helper'

describe Dijkstra::Edge do
  let(:graph) { Dijkstra::Graph.new }
  
  it 'errors if start is not provided' do
    expect {
      Dijkstra::Edge.new(graph,nil,'B',1)
    }.to raise_error Dijkstra::ParseError
  end
  
  it 'errors if stop is not provided' do
    expect {
      Dijkstra::Edge.new(graph,'A',nil,1)
    }.to raise_error Dijkstra::ParseError
  end
  
  it 'errors if weight is not provided' do
    expect {
      Dijkstra::Edge.new(graph,'A','B',nil)
    }.to raise_error Dijkstra::ParseError
  end
  
  it 'errors if weight is not an integer' do
    expect {
      Dijkstra::Edge.new(graph,'A','B','G')
    }.to raise_error Dijkstra::ParseError
  end
  
  context 'start' do
    it 'is a Node' do
      edge = Dijkstra::Edge.new(graph,'A','B',1)
      expect(edge.start).to be_a Dijkstra::Node
    end
    
    it 'has stop as a neighbor' do
      edge = Dijkstra::Edge.new(graph,'A','B',1)
      
      expect(edge.start.neighbors).to include edge.stop
    end
  end
  
  context 'stop' do
    it 'is a Node' do
      edge = Dijkstra::Edge.new(graph,'A','B',1)
      expect(edge.stop).to be_a Dijkstra::Node
    end
    
    it 'has start as a neighbor' do
      edge = Dijkstra::Edge.new(graph,'A','B',1)
      
      expect(edge.stop.neighbors).to include edge.start
    end
  end
end