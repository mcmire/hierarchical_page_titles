
require 'rails/railtie'
require 'active_support/lazy_load_hooks'
require_relative '../hierarchical_page_titles'

module HierarchicalPageTitles
  require libpath('hierarchical_page_titles/controller_helpers')
  require libpath('hierarchical_page_titles/view_helpers')

  class Railtie < Rails::Railtie
    initializer 'hierarchical_page_titles.hook' do
      ActiveSupport.on_load(:action_controller) do
        include HierarchicalPageTitles::ControllerHelpers
      end

      ActiveSupport.on_load(:action_view) do
        include HierarchicalPageTitles::ViewHelpers
      end
    end

    def self.run_initializers(*args)
      return if @initialized
      super
      @initialized = true
    end
  end
end
