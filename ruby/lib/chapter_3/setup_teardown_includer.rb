class SetupTeardownIncluder

  def self.render(page_data, is_suite = false)
    SetupTeardownIncluder.new(page_data, is_suite).render
  end

  def render
    if test_page?
      include_setup_and_teardown_pages
    end
    page_data.html
  end

  private

  def initialize(page_data, is_suite)
    @page_data        = page_data
    @test_page        = @page_data.wiki_page
    @page_crawler     = @test_page.page_crawler
    @new_page_content = ''
    @is_suite         = is_suite
  end

  def test_page?
    page_data.has_attribute?("test")
  end

  def include_setup_and_teardown_pages
    include_setup_pages
    include_page_content
    include_teardown_pages
    update_page_content
  end

  def include_setup_pages
    if is_suite
      include_suite_setup_page
    end
    include_setup_page
  end

  def include_suite_setup_page
    include(SuiteResponder::SUITE_SETUP_NAME, "-setup")
  end

  def include_setup_page
    include("SetUp", "-setup")
  end

  def include_page_content
    @new_page_content << page_data.content
  end

  def include_teardown_pages
    include_teardown_page
    if is_suite
      include_suite_teardown_page
    end
  end

  def include_teardown_page
    include("TearDown", "-teardowns")
  end

  def include_suite_teardown_page
    include(SuiteResponder::SUITE_TEARDOWN_NAME, "-teardown")
  end

  def update_page_content
    page_data.content = @new_page_content
  end

  def include(page_name, arg)
    inherited_page = find_inherited_page(page_name)
    if inherited_page
      page_path_name = get_path_name_for_page(inherited_page)
      build_include_directive(page_path_name, arg)
    end
  end

  def find_inherited_page(page_name)
    page_crawler.inherited_page(page_name)
  end

  def get_path_name_for_page(page)
    page_path = page_crawler.full_path(page)
    PathParser.render(page_path)
  end

  def build_include_directive(page_path_name, arg)
    @new_page_content << "include #{arg}. #{page_path_name}"
  end

  attr_reader :page_data, :is_suite, :page_crawler

end


#Mocks
class PageData

  def initialize
    @content = " Existing Page Content "
  end

  def html
    "<body>#{content}</body>"
  end

  def content
    @content
  end

  def content=(new_content)
    @content = new_content
  end

  def wiki_page
    WikiPage.new
  end

  def has_attribute?(attribute)
    true
  end
end

class WikiPage
  def page_crawler
    PageCrawler.new
  end
end

class PageCrawler
  def inherited_page(page_name)
    WikiPage.new
  end

  def full_path(page)
    WikiPagePath.new
  end

end

class WikiPagePath

end

class PathParser
  def self.render(page_path)
    "a path"
  end
end

class SuiteResponder
  SUITE_SETUP_NAME    = "Setup Name"
  SUITE_TEARDOWN_NAME = "Teardown Name"
end
