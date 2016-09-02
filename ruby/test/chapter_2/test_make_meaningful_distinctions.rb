require "minitest/autorun"
require "../../lib/chapter_2/make_meaningful_distinctions"

class TestMakeMeaningfulDistinctions < MiniTest::Test

  def test_copy_chars
    a1 = ['a', 'b', 'c']
    a2 = []
    MakeMeaningfulDistinctions.copy_chars(a1, a2)
    assert_equal a1, a2
  end

  def test_copy_arrays
    a1 = ['a', 'b', 'c']
    a2 = []
    MakeMeaningfulDistinctions.copy_arrays(a1, a2)
    assert_equal a1, a2
  end

end

