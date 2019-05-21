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

  def gameplay
    print_board
    until is_game_over?
      player = change_turn
      action(player)
      tie
    end
  end
  
  private 
  
  #check which player is supposed to play
  def change_turn
    if @turn == 1
      @turn = 0
      @player_1
    else
      @turn = 1
      @player_2
    end
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

  def is_game_over?
    win?(@player_1.symbol) || win?(@player_2.symbol) || @board.full?
  end

  
  def action(player)
    index= get_input
    @board.add_at(index, player.symbol)
    print_board
    winner
  end
end

