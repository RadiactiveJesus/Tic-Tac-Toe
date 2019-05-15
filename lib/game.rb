require '../bin/executable.rb'
class Game
  attr_accessor :symbol
  def initialize (board, player_1, player_2)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    @turn = 1
	end

  def win?(item)
    temp = []
    @board.each_with_index do |value, index|
      temp << index if value == item
    end
    @board.win_patterns.each do |arr|
      result = arr - temp
      return true if result.empty?
    end
    false
  end

  def add_at(pos, symbol)
    @board.board[pos] = symbol
  end

  def interface
    change_turn until win?('X') || win?('O')
    winner
  end

  def winner
    puts ' Player 1 wins' if win?('X')
    puts ' Player 2 wins' if win?('O')
  end

  def change_turn
    if @turn == 1
      index = 
      add_at(index, @player_1.symbol)
      player_1.positions.push(index)
      @turn = 0
    else
      add_at(index, @player_2.symbol)
      player_2.positions.push(index)
      @turn = 1
    end
    if @board.full?
      puts 'The game is a tie ' 
      Game.new.interface
    end
  end
end
