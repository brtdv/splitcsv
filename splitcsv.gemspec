# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'splitcsv/version'

Gem::Specification.new do |spec|
  spec.name          = "splitcsv"
  spec.version       = Splitcsv::VERSION
  spec.authors       = ["Bert Devriese"]
  spec.email         = ["bert@builtinbruges.com"]
  spec.description   = %q{This gem splits a CSV file into multiple CSV files, based on a maximum length you can specify}
  spec.summary       = %q{This gem splits a CSV file into multiple CSV files}
  spec.homepage      = "http://www.builtinbruges.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
