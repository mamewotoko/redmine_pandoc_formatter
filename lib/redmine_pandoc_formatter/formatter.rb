require 'pandoc-ruby'

module RedminePandocFormatter
  class Formatter < Redmine::WikiFormatting::Markdown::HTML
    def initialize(text)
      @text = text
    end

    def to_html(&block)
      head = "/usr/src/redmine/plugins/redmine_pandoc_formatter/head.txt"
      tail = "/usr/src/redmine/plugins/redmine_pandoc_formatter/tail.txt"
      PandocRuby.new(@text).to_html({ :B => head, :A => tail })
    rescue => e
      return("<pre>problem parsing wiki text: #{e.message}\n"+
             "original text: \n"+
             @text+
             "</pre>")
    end
  end
end
