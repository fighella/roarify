lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'roarify/version'

Gem::Specification.new do |spec|
  spec.name          = "roarify"
  spec.version       = Roarify::VERSION
  spec.authors       = ["Jonny Dalgliesh"]
  spec.email         = ["fighella@gmail.com"]
  spec.summary       = %q{Use ROAR to connect to the ShopifyAPI}
  spec.description   = %q{Use apotonick/roar and representable to connect to the ShopifyAPI efficiently}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "roar", ">= 1.0.0"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "pry-rescue"
  spec.add_development_dependency "pry-stack_explorer"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
