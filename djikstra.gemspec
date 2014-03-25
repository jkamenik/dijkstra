# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'djikstra/version'

Gem::Specification.new do |spec|
  spec.name          = "djikstra"
  spec.version       = Djikstra::VERSION
  spec.authors       = ["John Kamenik"]
  spec.email         = ["jkamenik@gmail.com"]
  spec.summary       = %Q{djikstra-#{Djikstra::VERSION}}
  spec.description   = %q{Runs the Djikstra algorithm against a graph file.}
  spec.homepage      = "http://github.com/jkamenik/djikstra"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
