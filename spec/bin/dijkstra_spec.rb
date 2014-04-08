require 'spec_helper'

class Output
  attr_reader :output, :exitcode
  
  def initialize(output,exitcode)
    @output = output
    @exitcode = exitcode
  end
  
  def to_s
    @output
  end
  
  def to_i
    @exitcode
  end
end


describe 'CLI' do
  def dijkstra(*args)
    command = File.expand_path("../../../bin/dijkstra",__FILE__)
    args[0] = File.expand_path("../../files/#{args[0]}",__FILE__) if args[0]
    output  = `ruby #{command} #{args.join ' '}`
    
    Output.new output.chop, $?.exitstatus
  end
  
  it 'requires three arguments' do
    expect(dijkstra.exitcode).to eq 1
  end
  
  it 'states the shortest path' do
    expect(dijkstra('example.txt','A','G').output).to eq 'Shortest path is [A,B,E,G] with a total cost of 6'
  end
  
  it 'works for the simple case' do
    expect(dijkstra('simple.txt','A','B').output).to eq 'Shortest path is [A,B] with a total cost of 1'
  end
  
  it 'works for a linear case' do
    expect(dijkstra('linear.txt','A','C').output).to eq 'Shortest path is [A,B,C] with a total cost of 2'
  end
  
  it 'shows an error if the end node doesn\'t exist' do
    # "E" doesn't exist as a node.
    expect(dijkstra('linear.txt','A','E').output).to eq 'Node "E" not found!'
  end
  
  it 'shows an error if the end node doesn\'t exist' do
    # "E" doesn't exist as a node.
    expect(dijkstra('linear.txt','E','C').output).to eq 'Node "E" not found!'
  end
end