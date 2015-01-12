# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'octopress-debugger/version'

Gem::Specification.new do |spec|
  spec.name          = "octopress-debugger"
  spec.version       = Octopress::Debugger::VERSION
  spec.authors       = ["Brandon Mathis"]
  spec.email         = ["brandon@imathis.com"]
  spec.summary       = %q{A debugger for Jekyll templates}
  spec.homepage      = "https://github.com/octopress/debugger"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split("\n").grep(%r{^(bin\/|lib\/|assets\/|changelog|readme|license)}i)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "jekyll"

  if RUBY_VERSION >= "2"
    spec.add_runtime_dependency "pry-byebug"
  else
    spec.add_runtime_dependency "pry-debugger"
  end
  
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "octopress"
end
