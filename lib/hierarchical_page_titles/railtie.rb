
require_relative '../hierarchical_page_titles'

module HierarchicalPageTitles
  libpath {
    require 'hierarchical_page_titles/controller_helpers'
    require 'hierarchical_page_titles/view_helpers'
  }

  class Railtie < Rails::Railtie
    ActiveSupport.on_load(:action_controller) do
      include HierarchicalPageTitles::ControllerHelpers
    end

    ActiveSupport.on_load(:action_view) do
      include HierarchicalPageTitles::ViewHelpers
      # pp instance_methods.sort
    end
  end
end
