module HierarchicalPageTitles
  module ViewHelpers
    # Public: Append a string to the list of window titles for the view.
    #
    # The window titles array used here is inherited from the controller level,
    # so if you add a window title in the controller and then again in the view
    # then there will be two items in the window titles array.
    #
    # *titles - An Array of Strings which will be appended to the window titles.
    #
    # Example:
    #
    #   class FoosController < ApplicationController
    #     def index
    #       window_title! 'Foos'
    #     end
    #
    #     def new
    #     end
    #   end
    #
    #   # foos/index.html.erb
    #   <% window_title! 'Bars' %>
    #   <%= window_title %>
    #   <%# => 'Foos - Bars' %>
    #
    # Returns the current Array of window titles.
    #
    def window_title!(*titles)
      controller.window_title!(*titles)
    end
    alias :add_to_window_title :window_title!
    alias :window_title :window_title!  # for compatibility

    # Public: Return the array of window titles.
    #
    def window_titles
      controller.window_titles
    end

    # Public: Determine whether there are any window titles to display.
    #
    # Returns true or false.
    #
    def window_title?
      controller.window_title?
    end

    # Public: Determine whether any window titles have been set yet.
    #
    # Returns true or false.
    #
    def window_title_set?
      controller.window_title_set?
    end

    # Public: Set the page title for the view.
    #
    # title - A String.
    #
    # Returns the current page title.
    #
    def page_title!(title)
      controller.page_title!(title)
    end
    alias :set_page_title :page_title!
    alias :page_title :page_title!  # for compatibility

    # Public: Return the current page title.
    #
    def page_title(title=nil)  # DEPRECATED: setting title
      controller.page_title(title)
    end

    # Public: Determine whether there is a page title to display.
    #
    # Returns true or false.
    #
    def page_title?
      controller.page_title?
    end

    # Public: Determine whether the page title has been set yet.
    #
    # Returns true or false.
    #
    def page_title_set?
      controller.page_title_set?
    end

    # Public: Add to the window titles and set the page title at the same time.
    #
    # *titles - An Array of Strings. The whole Array will be appended to the
    #           window titles; the last item in the Array will be used as the
    #           page title.
    #
    # Returns nothing.
    #
    def title!(*titles)
      window_title!(*titles)
      page_title!(titles.last)
    end
    alias :set_window_and_page_title :title!
    alias :title :title!  # for compatibility

    # Public: Return a stringified version of the window titles array joined by
    # a separator.
    #
    # options - A Hash of options (default: {}):
    #           separator - The string with which to join the window titles
    #                       array.
    #
    def window_title(*args)
      options = args.extract_options!
      if args.any?
        # TODO: Remove
        window_title!(*args)
      else
        window_titles.join(options[:separator] || " - ")
      end
    end
  end
end
