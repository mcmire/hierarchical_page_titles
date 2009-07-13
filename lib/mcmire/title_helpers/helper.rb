module Mcmire
  module TitleHelpers
    module Helper
      # Call this in your view with a string to add the string to the array of window titles.
      # Call this in your layout to output the window title. You can specify a separator
      # that should be put between the titles by passing <tt>:separator => " - "</tt>.
      def window_title(*args, &block)
        options = args.extract_options!
        titles = args.flatten
        @window_title ||= []
        if titles.any?
          @window_title += titles
        else
          options.reverse_merge!(:separator => " - ")
          @window_title.join(options[:separator])
        end
      end

      # Call this in your view with a string to set the page title to that string.
      # Call this in your layout with no arguments to output the page title.
      def page_title(title=nil)
        if title
          @page_title = title
        else
          @page_title
        end
      end

      # Call this in your view to set the window title and the page title at the same time.
      # See +window_title+ and +page_title+ for more.
      def title(*titles)
        titles = titles.flatten
        window_title(*titles)
        page_title(titles.first)
      end
    end
  end
end