module RedminePandocFormatter
  module Helper
    unloadable

    def wikitoolbar_for(field_id, dummy=nil)
      nil
    end

    def initial_setup
      nil
    end

    def initial_page_content(page)
      "#{page.pretty_title}\n#{'='*page.pretty_title.length}"
    end

    def heads_for_wiki_formatter
      nil
    end
  end
end
