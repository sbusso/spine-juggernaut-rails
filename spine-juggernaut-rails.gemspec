# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "spine-juggernaut-rails/version"

Gem::Specification.new do |s|
  s.name        = "spine-juggernaut-rails"
  s.version     = SpineJuggernautRails::VERSION
  s.authors     = ["Stephane Busso"]
  s.email       = ["stephane.busso@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A spine juggernaut glue for rails}
  s.description = %q{based on spine.rails3/fowa}

  s.rubyforge_project = "spine-juggernaut-rails"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "juggernaut"
end
