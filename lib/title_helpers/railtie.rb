require 'rails'

require 'title_helpers/controller_helpers'
require 'title_helpers/view_helpers'

module TitleHelpers
  class Railtie < Rails::Railtie
    # copied from formtastic
    initializer "title-helpers.initialize", :after => :after_initialize do
      ActionController::Base.class_eval { include TitleHelpers::ControllerHelpers }
      ActionView::Base.class_eval { include TitleHelpers::ViewHelpers }
    end
  end
end