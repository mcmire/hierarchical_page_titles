module Mcmire
  module TitleHelpers
    module SharedMethods
      # Call this in your view with a string to add the string to the array of window titles.
      # Call this in your layout to output the window title. You can specify a separator
      # that should be put between the titles by passing <tt>:separator => " - "</tt>.
      def window_title(*args, &block)
        options = args.extract_options!
        titles = args.flatten
        @_window_titles ||= []
        @_window_titles += titles
      end

      # Call this in your view with a string to set the page title to that string.
      # Call this in your layout with no arguments to output the page title.
      def page_title(*args)
        options = args.extract_options!
        title = args.first
        @_page_title = title unless options[:guarded] && @_page_title
      end
  
      # Call this in your view to tell page_title to not show anything.
      def hide_page_title
        @_hide_page_title = true
      end

      # Call this in your view to set the window title and the page title at the same time.
      # See +window_title+ and +page_title+ for more.
      def title(*args)
        options = args.extract_options!
        window_title(*args)
        page_title(args.last)
        hide_page_title if options[:hide_page_title]
      end
      
      def titles
        @_window_titles
      end
    end
  end
end