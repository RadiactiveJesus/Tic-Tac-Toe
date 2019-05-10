class Board
  attr_accessor :board
  
  def initialize
      @turn = true
      @board = [
          [" ", " ", " "],
          [" ", " ", " "],
          [" ", " ", " "],
      ]        
  end
  def print_board
    @board.each do|row|
      puts row.to_s
    end
  end
end


class Player
  attr_accessor :name
  def initialize(name)
      @name = name
  end
  def play_at(row, column)
    #@board[row][column] = "X"
    puts " You played in row: #{row} column: #{column}"
    #puts " Player 1 wins" if win?("X")
    return row, column
  end
end

class Game
  attr_accessor :symbol
  def initialize
    @game = Board.new  
    @player1 = Player.new("Player 1")
    @player12 = Player.new("Player 2")
  end
  @symbol = "X"
  def win?(item)
    if (@game.board[0][0] == @game.board[1][1] &&  @game.board[1][1] == @game.board[2][2]  && @game.board[2][2]==item ) || (@game.board[0][2]== @game.board[1][1] && @game.board[1][1] == @game.board[2][0] && @game.board[2][0] == item)
      return true
    end

    @game.board.each_with_index do |value, i|
      if @game.board[i][0]== @game.board[i][1] &&  @game.board[i][1]==  @game.board[i][2] && @game.board[i][1] ==item 
        return true
      end
      value.each_with_index do|x, y|
        if @game.board[0][y]== @game.board[1][y] && @game.board[0][y] ==  @game.board[2][y] && @game.board[0][y] ==item
          return true
        end
      end
    end
    return false
  end
  def add_at(row, column)
    @game.board[row][column] = @symbol
  end
  def interface
    until game.win?("X") || game.win?("O")
      print "Type your turn : "
  
      input = gets.chomp 
      case input
      when "0" 
          add_at(0, 0)
      when "1" 
          add_at(0, 1)
      when "2" 
          add_at(0, 2)
      when "3" 
          add_at(1, 0)
      when "4" 
          add_at(1, 1)
      when "5" 
          add_at(1, 2)
      when "6" 
          add_at(2, 0)
      when "7" 
          add_at(2, 1)
      when "8" 
          add_at(2, 2)
      else 
          print "Thats not a valid position"
      end
      change_turn
    end
  end
  def winner
    puts " Player 1 wins" if win?("X")
    puts " Player 2 wins" if win?("O")
  end
  def change_turn
    case @symbol
    when "X" 
      @symbol = "O"
    when "O" 
      @symbol = "X"
    end
  end
end





