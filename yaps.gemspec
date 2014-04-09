# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yaps/version'

Gem::Specification.new do |spec|
  spec.name          = "yaps"
  spec.version       = Yaps::VERSION
  spec.authors       = ["Võ Anh Duy"]
  spec.email         = ["voanhduy1512@live.com"]
  spec.summary       = %q{Yet another publish subscribe gem}
  spec.description   = %q{Yet another publish subscribe gem}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'

  spec.add_dependency 'wisper'
  spec.add_dependency 'activerecord', '>= 3.0'
end
