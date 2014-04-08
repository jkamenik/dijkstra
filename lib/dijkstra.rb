require "dijkstra/version"
require 'dijkstra/cli'
require 'dijkstra/graph'
require 'dijkstra/node'
require 'dijkstra/edge'

module Dijkstra
  class ParseError < RuntimeError; end
  class GraphError < RuntimeError; end
end
