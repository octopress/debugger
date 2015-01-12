# Octopress Debugger

A simple liquid tag for debugging Jekyll sites with a fancy debugger console.

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

## Contributing

1. Fork it ( https://github.com/octopress/debugger/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
