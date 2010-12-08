## title_helpers

### What is this?

This is a little gem that provides controller and view methods to make displaying of window/page titles DRYer.

### Why did you make it?

I made it because I found that I was doing the same thing over and over in my Rails apps. Setting the window or page title is a very common thing, and usually you'd handle this by simply setting a `@title` variable in your view and using it in your layout. However, I kept running into the case where I wanted to set the window title separate from the page title, or I wanted to set part of the window title globally for a controller, or I wanted to set the window title but hide the page title, and so on. So I decided to come up with a way to satisfy these requirements and yet keep things simple.

### How do I use it?

I'm going to walk through a few use cases and hopefully you'll get the idea.

#### Window and page title are the same

Here's what your layout might look like:

      <html>
        <head><title><%= window_title %></title></head>
        <body>
          <h1><%= page_title %></h1>
          <%= yield %>
        </body>
      </html>

So in your view, you'd do this:

      <% title "Some Page" %>
      <p>Some content</p>
      
And now when your layout is rendered, it will be this:

      <html>
        <head><title>Some Page</title></head>
        <body>
          <h1>Some Page</h1>
          <p>Some content</p>
        </body>
      </html>

#### Window title with prefix

Nothing special required here, just put it in your layout:

      <html>
        <head><title>My Site - <%= window_title %></title></head>
        <body>
          <h1><%= page_title %></h1>
          <%= yield %>
        </body>
      </html>

And when the page is rendered:

      <html>
        <head><title>My Site - Some Page</title></head>
        <body>
          <h1>Some Page</h1>
          <p>Some content</p>
        </body>
      </html>
      
#### Hiding page title for certain pages

#### A page hierarchy

Controllers:

<pre>
<code>
  class ApplicationController < ActionController::Base
    window_title "My Site Name"
  end
  class SupportController < ApplicationController
    window_title "Support"
    def billing; end
  end
</code>
</pre>

Views:
  
<pre>
<code>
  #==== app/views/layouts/application.html.erb ====
  <html>
    <head><title><%= window_title %></title></head>
    <body>
      <h2><%= page_title %></h2>
    </body>
  </html>
  #==== app/views/support/billing.html.erb ====
  # this adds to the window title and the page title at the same time
  <% title "Billing FAQs" %>
</code>
</pre>

When the billing view is rendered:

* The window title will be "My Site Name - Support - Billing FAQs"
* The page title (in the &lt;h2&gt; tag) will be "Billing FAQs"

### How is it different from XYZ?



### How do I install it?

<pre>
  script/plugin install git://github.com/mcmire/title_helpers.git
</pre>

### How do I contribute?

### Who wrote this?

(c) 2009 Elliot Winkler (elliot dot winkler at gmail dot com).
Released under the MIT license.