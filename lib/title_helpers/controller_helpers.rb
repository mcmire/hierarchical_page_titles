module Mcmire
  module TitleHelpers
    module Controller
      def self.included(base)
        base.extend(ClassMethods)
      end
      
      include SharedMethods
      
      module ClassMethods
        # Call this in the body of your controller with a string to add the string to
        # the window title before each action in your controller. This will work
        # for subcontrollers too -- so if you call window_title in a supercontroller
        # and also in a subcontroller, there will be two strings when you go to output
        # the window title. You can pass :only and :except to limit this to certain actions.
        def window_title(*args, &block)
          options = Hash === args.last ? args.last : {}
          before_filter(options) {|c| c.window_title(*args, &block) }
        end
      
        # Call this in the body of your controller with a string to set the page title
        # globally for each action in your controller. Unlike window_title, this will not
        # work for subcontrollers -- so if you call page_title in a supercontroller and
        # also in a subcontroller, the subcontroller's title will override the supercontroller's.
        # You can pass :only and :except to limit this to certain actions.
        def page_title(*args, &block)
          options = Hash === args.last ? args.last : {}
          before_filter(options) {|c| c.page_title(*args, &block) }
        end
      
        # Call this in the body of your controller to tell page_title to not show anything.
        # You can pass :only and :except to limit this to certain actions.
        def hide_page_title(*args, &block)
          options = Hash === args.last ? args.last : {}
          before_filter(options) {|c| c.hide_page_title(*args, &block) }
        end
      
        # Call this in the body of your controller with a string to add it to the
        # window title AND set the page title at the same time.
        # See +window_title+ and +page_title+ for more.
        # You can pass :only and :except to limit this to certain actions.
        def title(*args, &block)
          options = Hash === args.last ? args.last : {}
          before_filter(options) {|c| c.title(*args, &block) }
        end
      end
    end
  end
end