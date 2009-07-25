module Mcmire
  module TitleHelpers
    module Controller
      def self.included(base)
        base.extend(ClassMethods)
      end
      
      module ClassMethods
        # Call this in the body of your controller with a string to add the string to
        # the window title before each action in your controller. This will work
        # for subcontrollers too -- so if you call window_title in a supercontroller
        # and also in a subcontroller, there will be two strings when you go to output
        # the window title.
        def window_title(*args, &block)
          before_filter {|c| c.window_title(*args, &block) }
        end
      
        # Call this in the body of your controller with a string to set the page title
        # globally for each action in your controller. Unlike window_title, this will not
        # work for subcontrollers -- so if you call page_title in a supercontroller and
        # also in a subcontroller, the subcontroller's title will override the supercontroller's.
        def page_title(*args, &block)
          before_filter {|c| c.page_title(*args, &block) }
        end
      
        # Call this in the body of your controller to tell page_title to not show anything.
        def hide_page_title(*args, &block)
          before_filter {|c| c.hide_page_title(*args, &block) }
        end
      
        # Call this in the body of your controller with a string to add it to the
        # window title AND set the page title at the same time.
        # See +window_title+ and +page_title+ for more.
        def title(*args, &block)
          before_filter {|c| c.title(*args, &block) }
        end
      end
      
      include SharedMethods
    end
  end
end