ActionView::Base.class_eval { include Mcmire::TitleHelpers::Helper }
ActionController::Base.class_eval { extend Mcmire::TitleHelpers::Controller }