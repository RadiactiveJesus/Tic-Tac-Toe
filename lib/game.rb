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


	def gameplay
    change_turn until win?(@player_1.symbol) || win?(@player_2.symbol) || @board.full?
    winner()
  end

  def change_turn
    if @turn == 1
      action(@player_1)
      @turn = 0
		else
			action(@player_2)
      @turn = 1
    end
    tie()
  end
  
  def action(player)
    index= get_input
    @board.add_at(index, player.symbol)
    player.move(index)
    print_board()
  end
end

