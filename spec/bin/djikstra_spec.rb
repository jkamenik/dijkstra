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
  def djikstra(*args)
    command = File.expand_path("../../../bin/djikstra",__FILE__)
    args[0] = File.expand_path("../../files/#{args[0]}",__FILE__) if args[0]
    output  = `ruby #{command} #{args.join ' '}`
    
    Output.new output.chop, $?.exitstatus
  end
  
  it 'requires three arguments' do
    expect(djikstra.exitcode).to eq 1
  end
  
  it 'states the shortest path' do
    expect(djikstra('example.txt','A','G').output).to eq 'Shortest path is [A,B,E,G] with a total cost of 6'
  end
end