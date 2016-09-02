require "minitest/autorun"
require "../../lib/chapter_2/add_meaningful_context"

class TestAddMeaningfulContext < MiniTest::Test

  def setup
    @object = AddMeaningfulContext.new
  end

  def test_print_guess_statistics
    assert_equal "There is 1 Toad", @object.print_quess_statistics("Toad", 1)
    assert_equal "There are 34 Weasels", @object.print_quess_statistics("Weasel", 34)
  end

  def test_print_with_context
    assert_equal "There is 1 Toad", GuessStatisticsMessage.new(candidate: "Toad", count: 1).print
    assert_equal "There are 34 Weasels", GuessStatisticsMessage.new(candidate: "Weasel", count: 34).print
  end

end

