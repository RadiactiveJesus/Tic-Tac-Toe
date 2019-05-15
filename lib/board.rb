class Board
  attr_accessor :board
  attr_reader :win_patterns, :row, :column
  
  def initialize(row, column, board, win_patterns)
    @row = row
    @column = column
    @board = board
    @win_patterns = win_patterns
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
