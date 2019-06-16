module RedminePandocFormatter
  module Helper
    unloadable

    def wikitoolbar_for(field_id, preview_url = preview_text_path)
          heads_for_wiki_formatter
          url = "#{Redmine::Utils.relative_url_root}/help/#{current_language.to_s.downcase}/wiki_syntax_markdown.html"
          javascript_tag("var wikiToolbar = new jsToolBar(document.getElementById('#{field_id}')); wikiToolbar.setHelpLink('#{escape_javascript url}'); wikiToolbar.setPreviewUrl('#{escape_javascript preview_url}'); wikiToolbar.draw();")
    end

    def initial_setup
      nil
    end

    def initial_page_content(page)
      "#{page.pretty_title}\n#{'='*page.pretty_title.length}"
    end

    def heads_for_wiki_formatter
      unless @heads_for_wiki_formatter_included
        content_for :header_tags do
          javascript_include_tag('jstoolbar/jstoolbar') +
            javascript_include_tag('jstoolbar/markdown') +
            javascript_include_tag("jstoolbar/lang/jstoolbar-#{current_language.to_s.downcase}") +
            javascript_tag("var wikiImageMimeTypes = #{Redmine::MimeType.by_type('image').to_json};") +
            stylesheet_link_tag('jstoolbar')
        end
        @heads_for_wiki_formatter_included = true
      end
    end
  end
end
