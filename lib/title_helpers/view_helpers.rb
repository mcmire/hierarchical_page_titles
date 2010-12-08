require 'title_helpers/shared_methods'

module TitleHelpers
  module ViewHelpers
    include SharedMethods
    
    # Call this in your view with a string to add the string to the array of window titles.
    # Call this in your layout to output the window title. You can specify a separator
    # that should be put between the titles by passing <tt>:separator => " - "</tt>.
    def window_title(*args, &block)
      options = args.extract_options!
      if args.empty?
        options[:separator] ||= " - "
        @_window_titles ||= []
        prefix = Array(options[:prefix]) || []
        (prefix + @_window_titles).join(options[:separator])
      else
        super
      end
    end
    
    # Call this in your view with a string to set the page title to that string.
    # Call this in your layout with no arguments to output the page title.
    def page_title(*args)
      options = args.extract_options!
      if args.empty?
        @_page_title
      else
        super
      end
    end
    
    # TODO: Document
    def window_title_set?
      @_window_title_set
    end
    
    # TODO: Document
    def page_title_set?
      @_window_title_set
    end
    
    # TODO: Document
    def title_set?
      @_title_set
    end
  end
end