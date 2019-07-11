# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yard/serverspec/plugin/version'

Gem::Specification.new do |spec|
  spec.name          = "yard-serverspec-plugin"
  spec.version       = Yard::Serverspec::Plugin::VERSION
  spec.authors       = ["YOSHIKAWA Ryota"]
  spec.email         = ["yoshikawa@topotal.com"]
  spec.summary       = %q{Displays Serverspec specs in YARD output.}
  spec.description   = %q{Displays Serverspec specs in YARD output.}
  spec.homepage      = "http://github.com/rrreeeyyy/#{spec.name}"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "yard", "~> 0.7"
  spec.add_development_dependency "rspec", "~> 2.6"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 12.3"
end
