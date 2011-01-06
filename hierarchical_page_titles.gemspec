# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "hierarchical_page_titles/version"

Gem::Specification.new do |s|
  s.name        = "hierarchical_page_titles"
  s.version     = HierarchicalPageTitles::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Elliot Winkler"]
  s.email       = ["elliot.winkler@gmail.com"]
  s.homepage    = "http://github.com/mcmire/hierarchical_page_titles"
  s.summary     = %q{A gem that provides controller and view methods to make displaying of window/page titles DRYer.}
  s.description = %q{A gem that provides controller and view methods to make displaying of window/page titles DRYer.}

  #s.rubyforge_project = "title_helpers"
  
  s.files         = ["README.md", "hierarchical_page_titles.gemspec"] + Dir["lib/**/*"]
  s.test_files    = Dir["{test,spec,features}/**/*"]
  s.executables   = Dir["bin/**/*"].map {|f| File.basename(f) }
  s.require_paths = ["lib"]
end
