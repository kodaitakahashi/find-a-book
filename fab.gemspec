# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fab/version'

Gem::Specification.new do |spec|
  spec.name          = "find-a-book"
  spec.version       = Fab::VERSION
  spec.authors       = ["kodaitakahashi"]
  spec.email         = ["kodaitakahashi.kt@gmail.com"]
  spec.licenses      = ['MIT']

  spec.summary       = %q{Japan only. Your looking book. This command is easy Your looking book.}
  spec.description   = %q{This command is easy Your looking book.}
  spec.homepage      = "https://github.com/kodaitakahashi/fab"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "thor", "~> 0.19.1"
  spec.add_development_dependency "json", "~>1.8.3"
  spec.add_development_dependency "activesupport", "~>4.2.4"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_dependency "bigdecimal", "~> 1.1.0"
end
