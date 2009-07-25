ActionController::Base.class_eval { include Mcmire::TitleHelpers::Controller }
ActionView::Base.class_eval { include Mcmire::TitleHelpers::Helper }