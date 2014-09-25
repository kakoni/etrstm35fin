# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'etrstm35fin/version'

Gem::Specification.new do |spec|
  spec.name          = "etrstm35fin"
  spec.version       = Etrstm35fin::VERSION
  spec.authors       = ["Karri Niemelä"]
  spec.email         = ["kakoni@gmail.com"]
  spec.summary       = %q{ETRS-TM35FIN to WGS84 coordinates conversion.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
