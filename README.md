# Octopress Debugger

A simple liquid tag for debugging Jekyll sites with a fancy debugger console.

[![Gem Version](http://img.shields.io/gem/v/octopress-debugger.svg)](https://rubygems.org/gems/octopress-debugger)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://octopress.mit-license.org)

## Installation

If you're using bundler add this gem to your site's Gemfile in the `:jekyll_plugins` group:

    group :jekyll_plugins do
      gem 'octopress-debugger'
    end

Then install the gem with Bundler

    $ bundle

To install manually without bundler:

    $ gem install octopress-debugger

Then add the gem to your Jekyll configuration.

    gems:
      -octopress-debugger

## Usage

Add the `{% debug %}` tag to any page to get access to the `site` and `page` instance from the debugger console.

This will launch an interactive debugging console where you can do some cool things.

- Type `site` to interact with the site instance.
- Type `page` to interact with the current page instance.
- Type `page_hash` to view the page instance as a hash.
- Type `scopes` to view current template variables.

### Example:

Debugging is a great way to learn about how Jekyll works. For example, you can step through a for loop like this.

```
{% assign test='awesome' %}
{% for post in site.posts %}
{% debug %}
{% endfor %}
```

In the debugger you can type `scopes` to see a hash representing variables in the for loop. Here's a look at what you might see:

```
[
  {
    "post"=><Post: /2015/01/12/posts-are-cool>,
    "forloop"=>{
      { "name"=>"post-site.posts", "length"=>3, "index"=>1, … }
    },
  {
    test=>'awesome'
  }
]
```

You can see the value of post and interact with the post instance with `scopes.first['post']` and even see all the available data on
the for loop. 

Then you can enter `continue` or `c` to step through the loop.

## Contributing

1. Fork it ( https://github.com/octopress/debugger/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
