
require_relative '../hierarchical_page_titles'

module HierarchicalPageTitles
  libpath {
    require 'hierarchical_page_titles/controller_helpers'
    require 'hierarchical_page_titles/view_helpers'
  }

  class Railtie < Rails::Railtie
    # copied from formtastic
    initializer "hierarchical_page_titles.initialize", :after => :after_initialize do
      ActionController::Base.class_eval { include HierarchicalPageTitles::ControllerHelpers }
      ActionView::Base.class_eval { include HierarchicalPageTitles::ViewHelpers }
    end
  end
end
