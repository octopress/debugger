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
        # Instances
        site      = context.registers[:site]
        page      = site.pages.find{|p| p.url == c('page')['url'] }

        # HELP:
        # Use `c` to read variables from Liquid's context 
        # - c 'site' => site hash
        # - c 'page' => page hash
        #
        # Dot notation works too:
        # - c 'page.content'
        # - c 'post.tags'

        binding.pry

        return '' # Debugger halts on this line
      end

      def c(var)
        @context[var]
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
