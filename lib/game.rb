class Game
  attr_accessor :symbol
  def initialize 
    @board = Board.new
    @player_1 = Player.new('Player 1', 'X')
    @player_2 = Player.new('Player 2', 'O')
    @turn = 1
	end

	def win?()
		

	end
	
  
  def win?(item)
    if (@board.board[0][0] == @board.board[1][1] && @board.board[1][1] == @board.board[2][2] && @board.board[2][2] == item) || (@board.board[0][2] == @board.board[1][1] && @board.board[1][1] == @board.board[2][0] && @board.board[2][0] == item)
      return true
    end

    @board.board.each_with_index do |value, i|
      if @board.board[i][0] == @board.board[i][1] && @board.board[i][1] == @board.board[i][2] && @board.board[i][1] == item
        return true
      end

      value.each_with_index do |_x, y|
        if @board.board[0][y] == @board.board[1][y] && @board.board[0][y] == @board.board[2][y] && @board.board[0][y] == item
          return true
        end
      end
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
      reply = @player_1.play_at(@board)

      add_at(reply[0], reply[1], @player_1.symbol)
      @turn = 0
    else
      reply = @player_2.play_at(@board)
      add_at(reply[0], reply[1], @player_2.symbol)
      @turn = 1
    end
    if @board.full?
      puts 'The game is a tie ' 
      Game.new.interface
    end
  end
end
