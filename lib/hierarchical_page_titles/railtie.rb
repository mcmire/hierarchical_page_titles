require 'rails'

require 'hierarchical_page_titles/controller_helpers'
require 'hierarchical_page_titles/view_helpers'

module HierarchicalPageTitles
  class Railtie < Rails::Railtie
    # copied from formtastic
    initializer "title-helpers.initialize", :after => :after_initialize do
      ActionController::Base.class_eval { include HierarchicalPageTitles::ControllerHelpers }
      ActionView::Base.class_eval { include HierarchicalPageTitles::ViewHelpers }
    end
  end
end