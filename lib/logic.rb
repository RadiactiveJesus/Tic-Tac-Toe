class Board
    attr_accessor :board, :player1, :player2
    
    @player1 = []
    @player2 = []
    
    def initialize
        @turn = true
        @board = [
            [nil, nil, nil],
            [nil, nil, nil],
            [nil, nil, nil],
        ]        
    end
    def add_at(row, column)
      if @turn
          @board[row][column] = "X"
          print " Player 1 wins" if win?("X")
          print @board
          @turn = false
      else
          @board[row][column] = "O"
          print " Player 2 wins" if win?("O")
          print @board
          @turn = true
      end
    end

    print @player1

    def win?(item)

      if (@board[0][0] == @board[1][1] &&  @board[1][1] == @board[2][2]  && @board[2][2]==item ) || (@board[0][2]== @board[1][1] && @board[0][2] == @board[0][2] && @board[0][2] == item)
        return true
      end

      @board.each_with_index do |value, i|
        if @board[i][0]== @board[i][1] &&  @board[i][1]==  @board[i][2] && @board[i][1] ==item 
          return true
        end
        value.each_with_index do|x, y|
          if @board[0][y]== @board[1][y] && @board[0][y] ==  @board[2][y] && @board[0][y] ==item
            return true
          end
        end
      end

      return false
    end
end
game = Board.new
game.add_at(0, 0)
game.add_at(1, 1)
game.add_at(0, 1)
game.add_at(1, 0)
game.add_at(0, 2)



