require "minitest/autorun"
require "../../lib/chapter_3/setup_teardown_includer"

class TestSetupTeardownIncluder < Minitest::Test

  def test_render
    rendered_page = SetupTeardownIncluder.render(PageData.new)
    assert_equal "<body>include -setup. a path Existing Page Content include -teardowns. a path</body>", rendered_page
  end

end

