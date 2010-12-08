# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "title_helpers/version"

Gem::Specification.new do |s|
  s.name        = "title_helpers"
  s.version     = TitleHelpers::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Elliot Winkler"]
  s.email       = ["elliot.winkler@gmail.com"]
  s.homepage    = "http://github.com/mcmire/title_helpers"
  s.summary     = %q{A gem that provides controller and view methods to make displaying of window/page titles DRYer.}
  s.description = %q{A gem that provides controller and view methods to make displaying of window/page titles DRYer.}

  #s.rubyforge_project = "title_helpers"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
