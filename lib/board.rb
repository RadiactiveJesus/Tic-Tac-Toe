class Board
  attr_accessor :board
  attr_reader :win_patterns

  def initialize
    @board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    @win_patterns = [ [0, 1, 2],[3, 4, 5],[6, 7,8],[0, 3, 6],[1, 4, 7],[2, 5, 8],[0, 4, 8],[2, 4, 6] ]

  end

  def add_at(pos, symbol)
    @board[pos] = symbol
  end

  def full?
    @board.all?{|value| value.is_a? String}
  end

  def taken?(value)
    @board[value].is_a? String

  end
end
