# Djikstra

Djikstra's algorithm is a graph-based technique for finding the globally shortest path between a starting node and a target node in a non-negative weighted Directed Acyclic Graph (DAG). It is a DAG in that edges are one way and there are no cycles in the graph; it is weighted in that each traversal of the graph has a certain cost. It is used often in graph-based applications such as social, network routing, and logistics supply modeling.
In its simplest form, the algorithm performs in O(v2) where |v| is the number of vertices in the graph.

Details of the algorithm may be found here:

* [Wikipedia](http://en.wikipedia.org/wiki/Dijkstra%27s_algorithm)
* [YouTube](http://www.youtube.com/watch?v=gdmfOwyQlcI)


## Installation

Add this line to your application's Gemfile:

    gem 'djikstra'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install djikstra

## Usage

Use the `djikstra` command and pass it a graph file, a starting node, and an ending node.

    $ djikstra my_graph.txt A G
		Shortest path is [A,B,E,G] with total cost 6

### graph file

A graph file is a txt file containing lines and weights.  A line consists of two nodes.

		[A,B,1]
		[B,C,3]
		[C,D,1]
		[D,F,3]
		[E,G,3]
		[F,G,1]
		[A,C,2]
		[B,D,3]
		[B,E,2]
		[D,E,3]

This file must be a Direct Acyclic Graph (DAG):

1. Lines are one way
1. Lines are always weighted
1. There are no cycles

## Contributing

1. Fork it ( http://github.com/<my-github-username>/djikstra/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
