class Board
  attr_accessor :board

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
