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
        site = context.registers[:site]
        page_hash = context.registers[:page]
        page = site.pages.find{|p| p.url == page_hash['url'] }
        scopes = context.scopes

        binding.pry

        return ''
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
