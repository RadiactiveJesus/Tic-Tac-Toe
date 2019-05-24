require '../lib/interface.rb'

class Game
  include Interface
 

  def initialize(board, player_1, player_2)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def gameplay
    print_board
    until is_game_over?
      action(@player_1)
      action(@player_2)
    end
  end
  
  private 
   
  def win?(player)
    
    @board.win_patterns.each do |arr|
      return true if arr.all? {|i| player.positions.include? i}
    end
    false
  end

  def is_game_over?
    win?(@player_1) || win?(@player_2) || @board.full?
  end

  
  def action(player)
    if !is_game_over?
      index = get_input
      @board.add_at(index, player.symbol)
      player.move(index)
      print_board
      winner
      tie
    end
  end
end

