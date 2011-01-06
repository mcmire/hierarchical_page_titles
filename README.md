## hierarchical_page_titles

### What is this?

hierarchical_page_titles is a little gem that provides controller and view methods to make displaying of window/page titles DRYer. Currently, it's only compatible with Rails 3.

### Why did you make it?

I made it because I found that I was doing the same thing over and over in my Rails apps. Setting the window or page title is a very common thing, and usually you'd handle this by simply setting a `@title` variable in your view and using it in your layout. However, I kept running into the case where I wanted to set the window title separate from the page title, or I wanted to set part of the window title globally for a controller, or I wanted to set the window title but hide the page title, and so on. So I decided to come up with a way to satisfy these requirements and yet keep things simple.

### How do I use it?

I'm going to walk through a few use cases and hopefully you'll get the idea.

#### One

The simplest case is if every page in your site has a title, and you want the window title to reflect the page title. hierarchical_page_titles gives you two helpers, `window_title` and `page_title`, that you can use in your layout. So let's do that:

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

#### Two

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
      
#### Three

What if there are some pages on your site in which you don't want to show a page title? Well, another helper hierarchical_page_titles gives you is `page_title?`, which will return true if the page title has been set. So let's say your layout looks like this:

    <html>
      <head><title><%= window_title %></title></head>
      <body>
        <% if page_title? %>
          <h1><%= page_title %></h1>
        <% end %>
        <%= yield %>
      </body>
    </html>
    
And you have a view in which you set the window title, but not the page title:

    <% window_title "Some Page" %>
    <p>Some content</p>

In this case your page will get rendered as follows:

    <html>
      <head><title>Some Page</title></head>
      <body>
        <p>Some content</p>
      </body>
    </html>

#### Four

Let's combine the last two examples. That it, what happens if you want the 

....

### How is it different from XYZ?

There are several related gems/plugins:

* **dynamic-page-title**: Provides options to `title` which are unnecessary. No support for hierarchical (controller-level) titles. Isn't compatible with Rails 3.
* **entitled**: Interesting, but has totally different requirements.
* **happy-titles**: The idea here is that you specify a template which I think is inflexible. No support for hierarchical titles, only supports two levels.
* **headliner**: A good design for simple requirements, and compatible with Rails 3. Again, no support for hierarchy, though. Plus, the `t` shortcut conflicts with i18n, which is bad. Not a gem.
* **page_title_helper**: Good if you need i18n, otherwise is a bit overkill. Again, no support for hierarchy, though.
* **smart_titles**: Stupid simple, and provides i18n. Again, no support for hierarchy, though.
* **title_helper**: Not sure, Github project seems to be missing.
* [**title_helpers**](https://github.com/henrik/title_helpers): Supports a page prefix, but doesn't support full hierarchy. Plus, I don't really like the API, and it isn't a gem.

### How do I install it?

Just the usual way:

    gem install hierarchical_page_titles

### I found a bug! or, I have a feature request...

Okay! Please file any issues in [Issues](http://github.com/mcmire/hierarchical_page_titles/issues).

### How do I contribute?

Pull down the code, make a branch, and send me a pull request. 

### Author/Copyright/License

(c) 2009-2011 Elliot Winkler (email: <elliot.winkler@gmail.com>, twitter: [@mcmire](http://twitter.com/mcmire)). You are free to do whatever you want with this code, as long as I'm not held responsible, blah blah.