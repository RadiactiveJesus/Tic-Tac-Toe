class Board
  attr_accessor :board

  def initialize
    @turn = true
    @board = [
      [' ', ' ', ' '],
      [' ', ' ', ' '],
      [' ', ' ', ' ']
    ]
  end

  def print_board
    @board.each do |row|
      puts row.to_s
    end
  end
  def full?
    @full = false
    @count = 0
    @board.each do |i|
      @board.each do |j|
        if @board[i][j] == 'X' || @board[i][j] == 'O'
          count += 1
        end
      end
    end
    if count == 9
      @full = true
    end
    return @full
  end
end

class Player
  attr_accessor :name, :symbol
  def initialize(name, symbol=nil)
    @name = name
    @symbol = symbol
  end

  def play_at
    print 'Type your turn : '

    user_input = gets.chomp
    case user_input
    when '0'
      row =0
      column = 0
    when '1'
      row =0
      column = 1
    when '2'
      row =0
      column = 2
    when '3'
      row =1
      column = 0
    when '4'
      row =1
      column = 1
    when '5'
      row =1
      column = 2
    when '6'
      row =2
      column = 0
    when '7'
      row =2
      column = 1
    when '8'
      row =2
      column = 2
    else
      print 'Thats not a valid position'
    end
    puts " You played in row: #{row} column: #{column}"
    [row, column]
  end
end

class Game
  attr_accessor :symbol
  def initialize
    @board = Board.new
    @player_1 = Player.new('Player 1', 'X')
    @player_2 = Player.new('Player 2', 'O')
    @turn = 1
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

  def add_at(row, column, symbol)
    @board.board[row][column] = symbol
  end

  def interface()
    until win?('X') || win?('O')
      change_turn
    end
    winner
  end

  def winner
    puts ' Player 1 wins' if win?('X')
    puts ' Player 2 wins' if win?('O')
  end

  def change_turn
    if @turn == 1
      reply = @player_1.play_at
      add_at(reply[0], reply[1], @player_1.symbol)
      print "The game is a tie " if @board.full?
      @turn = 0
    else
      reply = @player_2.play_at
      add_at(reply[0], reply[1], @player_2.symbol)
      print "The game is a tie " if @board.full?
      @turn = 1
    end
    @board.print_board
  end
end
