require "octopress-debugger/version"
require "jekyll"

if RUBY_VERSION >= "2"
  require 'pry-byebug'
else
  require 'pry-debugger'
end

module Octopress
  module Debugger
    class Tag < Liquid::Tag
      def render(context)
        @context = context

        # HELP: How does this work?
        #
        # Try these commands:
        #  site   => Jekyll's Site instance
        #  page   => Current Page instance
        #  scopes => View local variable scopes
        #
        # Use `c` to read variables from Liquid's context 
        #  c 'site' => site hash
        #  c 'page' => page hash
        #
        # Dot notation works too:
        #  c 'site.posts.first'
        #  c 'page.content'
        #  c 'post.tags'

        binding.pry

        return '' # Debugger halts on this line
      end

      def c(var=nil)
        var.nil? ? @context : @context[var]
      end

      def site
        site = @context.registers[:site]
      end

      def page
        @page ||= site.pages.find{|p| p.url == c('page')['url'] }
      end

      def scopes
        @context.scopes
      end
    end
  end
end

Liquid::Template.register_tag('debug', Octopress::Debugger::Tag)

if defined? Octopress::Docs
  Octopress::Docs.add({
    name:        "Octopress Debugger",
    gem:         "octopress-debugger",
    version:     Octopress::Debugger::VERSION,
    description: "Debug Jekyll sites with a fancy console.",
    path:        File.expand_path(File.join(File.dirname(__FILE__), "../")),
    source_url:  "https://github.com/octopress/debugger"
  })
end
