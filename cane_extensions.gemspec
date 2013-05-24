# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cane_extensions/version'

Gem::Specification.new do |spec|
  spec.name          = "cane_extensions"
  spec.version       = CaneExtensions::VERSION
  spec.authors       = ["Tim Cooper"]
  spec.email         = ["coop@latrobest.com"]
  spec.description   = %q{A set of cane extensions that comply with the Everyday Hero styleguide.}
  spec.summary       = %q{Everyday Hero styleguide cane extensions}
  spec.homepage      = "https://github.com/everydayhero/cane_extensions"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "cane", "~> 2.5.2"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
