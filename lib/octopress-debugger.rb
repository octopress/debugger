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

        binding.pry
        # site: site instance
        # page_hash: page instance in hash form
        # page: page instance

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
