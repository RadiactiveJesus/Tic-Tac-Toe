class Board
  attr_accessor :board
  attr_reader :win_patterns
  @win_patterns = [ [0, 1, 2],[3, 4, 5],[6, 7,[0, 3, 6],[1, 4, 7],[2, 5, 8],[0, 4, 8],[2, 4, 6] ]
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def full?
    @board.each do |value|
      return false if value.is_a? Integer
    end
    true
  end

  def taken?(value)
    return true unless @board[value].is_a? Integer

    false
  end
end
