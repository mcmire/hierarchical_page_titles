# hierarchical_page_titles

## What is this?

**hierarchical_page_titles** is a little gem that provides controller and view methods to make displaying of window/page titles DRYer.

* [Documentation](http://rdoc.info/github/mcmire/hierarchical_page_titles/master/frames)
* [Known issues](http://github.com/mcmire/hierarchical_page_titles/issues)

## Why did you make it?

Well, I found that I was doing the same thing over and over in my Rails apps. Setting the window or page title is a very common thing, and usually you'd handle this by simply setting a `@title` variable in your view and using it in your layout. However, I kept running into the case where I wanted to set the window title separate from the page title, or I wanted to set part of the window title globally for a controller, or I wanted to set the window title but hide the page title, and so on. So I decided to come up with a very simple way to satisfy these requirements.

## How do I use it?

I'm going to walk through a few use cases and hopefully you'll get the idea.

### One

The simplest case is if every page in your site has a title, and you want the window title to reflect the page title. **hierarchical_page_titles** gives you two helpers, `window_title` and `page_title`, that you can use in your layout. So let's do that:

      <html>
        <head><title><%= window_title %></title></head>
        <body>
          <h1><%= page_title %></h1>
          <%= yield %>
        </body>
      </html>

Now in your view, you use `title` to set the title for that page:

      <% title "Some Page" %>
      <p>Some content</p>

And now you get this when the page is rendered:

      <html>
        <head><title>Some Page</title></head>
        <body>
          <h1>Some Page</h1>
          <p>Some content</p>
        </body>
      </html>

### Two

What if you want the name of your site to show up in the window title? The easiest way is to just hard-code it in your layout:

      <html>
        <head><title>My Site - <%= window_title %></title></head>
        <body>
          <h1><%= page_title %></h1>
          <%= yield %>
        </body>
      </html>

And this is what you get when a page is rendered:

      <html>
        <head><title>My Site - Some Page</title></head>
        <body>
          <h1>Some Page</h1>
          <p>Some content</p>
        </body>
      </html>

### Three

What if there are some pages on your site in which you don't want to show a page title? Well, another helper this gem gives you is `page_title?`, which will return true if the page title has been set. So let's say your layout looks like this:

    <html>
      <head><title><%= window_title %></title></head>
      <body>
        <% if page_title? %>
          <h1><%= page_title %></h1>
        <% end %>
        <%= yield %>
      </body>
    </html>

In your view, instead of using `title`, you use `window_title`, which will set the window title, but not the page title:

    <% window_title "Some Page" %>
    <p>Some content</p>

Now your page will get rendered as follows:

    <html>
      <head><title>Some Page</title></head>
      <body>
        <p>Some content</p>
      </body>
    </html>

### Four

In many Rails apps, you are working with resources, so your controller hierarchy might look like this:

    main
    foos
      index
      new
      edit
      show
      ...
    bars
      ...

You want to make sure that for every page, the window title reflects the current level of the hierarchy. For the pages within the "foos" resource, you *could* do something like this:

    index
      <% title "Foos" %>
    new
      <% title "Foos", "New Foo" %>
    edit
      <% title "Foos", "Edit Foo ##{foo.id}" %>
    show
      <% title "Foos", "Foo ##{foo.id}" >

This is okay, but it'd be nice if you didn't have to add "Foos" to every view. **hierarchical_page_titles** gives you a way to DRY this up too: a `title` helper in your controller. So your controller might look like this:

    class FooController < ApplicationController
      title "Foos"

      def index; ...; end
      def new; ...; end
      ...
    end

Now that we have `title "Foos"` in the controller, `window_title` will be prepended with "Foos - ".

We could also use this method to set a global window title, say, in ApplicationController:

    class ApplicationController
      title "My Website"
    end
    class FoosController < ApplicationController
      title "Foos"
    end

Now the window title will contain at least "My Website - Foos - ".

It's important to realize that **this only affects the window title**. The *page* title will always be equal to the last title "piece" set. This is because only the window title keeps an array of multiple title "pieces". A side effect of this is that if you call `window_title` multiple times, you add to the window title, whereas multiple calls to `page_title` always overrides what is previously set.

## How is it different from XYZ?

This problem is not a new one, and there are several related gems/plugins:

* **dynamic-page-title**: Provides options to `title` which are unnecessary. No support for hierarchical (controller-level) titles. Isn't compatible with Rails 3.
* **entitled**: Interesting, but has totally different requirements.
* **happy-titles**: The idea here is that you specify a template which I think is inflexible. No support for hierarchical titles, only supports two levels.
* **headliner**: A good design for simple requirements, and compatible with Rails 3. Again, no support for hierarchy, though. Plus, the `t` shortcut conflicts with i18n, which is bad. Not a gem.
* **page_title_helper**: Good if you need i18n, otherwise is a bit overkill. Again, no support for hierarchy, though.
* **smart_titles**: Stupid simple, and provides i18n. Again, no support for hierarchy, though.
* **title_helper**: Not sure, Github project seems to be missing.
* [**title_helpers**](https://github.com/henrik/title_helpers): Supports a page prefix, but doesn't support full hierarchy. Plus, I don't really like the API, and it isn't a gem.

## How do I install it?

Just like you would any other gem: add this to your Gemfile:

    gem 'hierarchical_page_titles', '0.1.1'

## Can I use it with ... ?

At the moment, this gem is only compatible with Rails 3. If you need Rails 2 support, please see my related [title_helpers](https://github.com/mcmire/title_helpers) project.

## I found a bug! or, I have a feature request...

Great! Please file any issues in [Issues](http://github.com/mcmire/hierarchical_page_titles/issues).

## Can I contribute, and if so, how do I do so?

Yes, I will be happy to accept any patches that you give me. At the moment there aren't any tests, so just make sure your code works with your own project. Then pull down the code, make a branch, and send me a pull request.

## Who made this?

**hierarchical_page_titles** is (c) 2009-2011 Elliot Winkler. If you have any questions, please feel free to contact me through these channels:

* **Twitter**: [@mcmire](http://twitter.com/mcmire)
* **Email**: <elliot.winkler@gmail.com>
* **Blog**: <http://lostincode.net>

## Can I use this in my personal/commercial project?

Yes, you are free to do whatever you like with this code.  If you do use it, an attached courtesy would be appreciated. The only other thing I ask is that you make the world a better place with your awesome code powers!