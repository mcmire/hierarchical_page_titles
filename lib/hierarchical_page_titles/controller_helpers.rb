
require 'active_support/concern'

module HierarchicalPageTitles
  module ControllerHelpers
    extend ActiveSupport::Concern

    module ClassMethods
      # Public: Append a string to the list of window titles for a group of
      # actions.
      #
      # *titles - An Array of Strings which will be appended to the window
      #           titles.
      # options - A Hash of options which filters the actions for which window
      #           titles are set:
      #           :only   - Whitelist of actions (Symbol or Array of Symbols)
      #           :except - Blacklist of actions (Symbol or Array of Symbols)
      # block   - A block which will be evaluated but when the action is run
      #           and should return the value you want to add to the window
      #           titles. Useful if this value cannot be determined right away.
      #
      # Example:
      #
      #   class ApplicationController
      #     window_title 'The best site evar'
      #   end
      #   class FoosController < ApplicationController
      #     window_title!(:only => :index) { winning? ? 'Zombies' : 'Vampires' }
      #     def winning?
      #       action_name == 'index'
      #     end
      #   end
      #
      #   # foos/index.html.erb
      #   <%= window_title %>
      #   <%# => 'The best site evar - Zombies' %>
      #
      #   # foos/new.html.erb
      #   <%= window_title %>
      #   <%# => 'The best site evar - Vampires' %>
      #
      # Returns nothing.
      #
      def window_title!(*args, &block)
        options, titles = args.extract_options!, args
        before_filter(options) do |c|
          if block
            c.window_titles! c.instance_eval(&block)
          else
            c.window_title!(titles)
          end
        end
      end
      alias :add_to_window_title :window_title!
      alias :window_title :window_title!  # for compatibility
    end

    # Public: Append a string to the list of window titles on a per-action
    # basis.
    #
    # Note: This is really only here for use in a before_filter. If you wish to
    # set the window title for a single action you should do so on the view
    # level.
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
    #   <%= window_title %>
    #   <%# => 'Foos' %>
    #
    #   # foos/new.html.erb
    #   <%= window_title %>
    #   <%# => "" %>
    #
    # Returns the current Array of window titles.
    #
    def window_title!(*titles)
      @_window_titles ||= []
      @_window_titles.concat titles.flatten
    end
    alias :add_to_window_title :window_title!
    alias :window_title :window_title!  # for compatibility

    # Public: Return the current array of window titles.
    #
    def window_titles
      @_window_titles
    end

    # Public: Determine whether there are any window titles to display.
    #
    # Returns true or false.
    #
    def window_title?
      window_title_set? and @_window_titles.any?
    end

    # Public: Determine whether any window titles have been set yet.
    #
    # Returns true or false.
    #
    def window_title_set?
      defined?(@_window_titles)
    end

    # Public: Set the page title for a single action.
    #
    # Note: This is really only here for use in a before_filter. If you wish to
    # set the window title for a single action you should do so on the view
    # level.
    #
    # title - A String.
    #
    # Returns the current page title.
    #
    def page_title!(title)
      @_page_title = title
    end
    alias :set_page_title :page_title!
    alias :page_title :page_title!  # for compatibility

    # Public: Return the current page title.
    #
    def page_title(title=nil)
      # DEPRECATED: setting title
      if title
        page_title!(title)
      else
        @_page_title
      end
    end

    # Public: Determine whether there is a page title to display.
    #
    # Returns true or false.
    #
    def page_title?
      @_page_title.present?
    end

    # Public: Determine whether the page title has been set yet.
    #
    # Returns true or false.
    #
    def page_title_set?
      defined?(@_page_title)
    end

    # Public: Add to the window titles and set the page title at the same time.
    #
    # Note: This is really only here for use in a before_filter. If you wish to
    # set the window title for a single action you should do so on the view
    # level.
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
  end
end
