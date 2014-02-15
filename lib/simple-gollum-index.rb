require "gollum/app"
require "gollum/views/page"

class PageView < Precious::Views::Page

  def initialize(page)
    @page = page
    @content = page.formatted_data
    @h1_title = true
  end

  def title
    page_view_method(:page_header_from_content).call(@content) || page.name
  end

  def page_view_method(name)
    self.class.superclass.instance_method(name).bind(self)
  end

end

class IndexView < Gollum::FileView

  def new_page page
    url  = url_for_page page
    name = PageView.new(page).title
    %Q(  <li><a href="#{url}" class="file">#{name}</a></li>)
  end


 def enclose_tree string
      %Q(<ul>\n) + string + %Q(</ul>)
  end

  def new_sub_folder path
    <<-HTML
    <li>
      <a href="#" class="folder">#{path}</a>
      <ul>
    HTML
  end

  def end_folder
    "</ul></li>\n"
  end

end



module Precious

  module Views
    class Index < Layout
      attr_reader :results, :ref

      def title
        "Index"
      end

      def has_results
        !@results.empty?
      end

      def no_results
        @results.empty?
      end

    end
  end

end


class GollumIndex < Precious::App

    before do
      request.path_info = '/index' if request.path_info == '/'
    end

    get '/index' do
      wiki = wiki_new
      options = settings.wiki_options
      content = wiki.pages

      @results = IndexView.new(content, options).render_files
      @ref = wiki.ref
      mustache :index, {templates: "#{File.dirname(__FILE__)}/templates"}
    end

end
