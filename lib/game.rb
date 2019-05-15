require '../lib/interface.rb'

class Game
  include Interface
  attr_accessor :symbol

  def initialize(board, player_1, player_2)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    @turn = 1
   end

  def win?(item)
    temp = []
    @board.board.each_with_index do |value, index|
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

	def gameplay
    change_turn until win?(@player_1.symbol) || win?(@player_2.symbol) || @board.full?
    winner
  end

  def winner
    puts ' Player 1 wins' if win?(@player_1.symbol)
    puts ' Player 2 wins' if win?(@player_2.symbol)
  end

  def change_turn
    if @turn == 1
			index= get_input
      add_at(index, @player_1.symbol)
      @player_1.positions.push(index)
      print_board()
      @turn = 0
		else
			index= get_input	
      add_at(index, @player_2.symbol)
      @player_2.positions.push(index)
      print_board()
      @turn = 1
    end
    if @board.full?
      puts 'The game is a tie'
    end
  end
end

