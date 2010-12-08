module TitleHelpers
  class Railtie < Rails::Railtie
    # copied from formtastic
    initializer "title-helpers.initialize", :after => :after_initialize do
      ActionController::Base.class_eval { include Mcmire::TitleHelpers::ControllerHelpers }
      ActionView::Base.class_eval { include Mcmire::TitleHelpers::ViewHelpers }
    end
  end
end