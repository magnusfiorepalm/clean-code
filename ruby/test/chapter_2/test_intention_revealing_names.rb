require "minitest/autorun"
require "../../lib/chapter_2/intention_revealing_names"

class TestIntentionRevealingNames < MiniTest::Test

  def setup
    @object = IntentionRevealingNames.new
  end

  def test_get_them
    the_list = [[1, 2, 3, 4], [4, 5, 6], [5, 4, 3]]
    assert_equal [[4, 5, 6,]], @object.get_them(the_list)
  end

  def test_get_flagged_cells
    game_board = [[1, 2, 3, 4], [4, 5, 6], [5, 4, 3]]
    assert_equal [[4, 5, 6,]], @object.get_flagged_cells(game_board)
  end

  def test_get_flagged_board_cells
    game_board = [Cell.new(flagged: false), Cell.new(flagged: true), Cell.new(flagged: false), Cell.new(flagged: false)]
    assert_equal true, @object.get_flagged_board_cells(game_board).first.is_flagged?
    assert_equal 1, @object.get_flagged_board_cells(game_board).size
  end

end

