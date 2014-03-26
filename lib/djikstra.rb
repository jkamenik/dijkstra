require "djikstra/version"
require 'djikstra/cli'
require 'djikstra/graph'
require 'djikstra/node'
require 'djikstra/edge'

module Djikstra
  class ParseError < RuntimeError; end
  class GraphError < RuntimeError; end
end
