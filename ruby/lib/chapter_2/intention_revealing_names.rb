class IntentionRevealingNames

  # 1
  def get_them(the_list)
    list1 = []
    the_list.each do |x|
      if x[0] == 4
        list1 << x
      end
    end
    list1
  end

  # 2
  STATUS_VALUE = 0
  FLAGGED      = 4

  def get_flagged_cells(game_board)
    game_board.each_with_object([]) do |cell, flagged_cells|
      if cell[STATUS_VALUE] == FLAGGED
        flagged_cells << cell
      end
    end
  end

  # 3
  def get_flagged_board_cells(game_board)
    game_board.each_with_object([]) do |cell, flagged_cells|
      if cell.is_flagged?
        flagged_cells << cell
      end
    end
  end
end

class Cell

  def initialize(flagged:)
    @flagged = flagged
  end

  def is_flagged?
    @flagged
  end
end

