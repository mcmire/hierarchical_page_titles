# -*- encoding: utf-8 -*-
require File.expand_path('../lib/hierarchical_page_titles/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "hierarchical_page_titles"
  s.version     = HierarchicalPageTitles.version
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Elliot Winkler"]
  s.email       = ["elliot.winkler@gmail.com"]
  s.homepage    = "http://github.com/mcmire/hierarchical_page_titles"
  s.summary     = %q{A gem that provides controller and view methods to make displaying of window/page titles DRYer.}
  s.description = %q{A gem that provides controller and view methods to make displaying of window/page titles DRYer.}

  s.files         = ["README.md"] + Dir["lib/**/*"]
  s.test_files    = Dir["{test,spec,features}/**/*"]
  s.require_paths = ["lib"]
end
