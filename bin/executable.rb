require '../lib/board.rb'
require '../lib/game.rb'
require '../lib/interface.rb'
require '../lib/player.rb'
winning_pattern = [ [0, 1, 2],[3, 4, 5],[6, 7,8],[0, 3, 6],[1, 4, 7],[2, 5, 8],[0, 4, 8],[2, 4, 6] ]
grid = [1, 2, 3, 4, 5, 6, 7, 8, 9]
board = Board.new(3, 3, grid, winning_pattern)
player_1 = Player.new('Player 1', 'X')
player_2 = Player.new('Player 2', 'O')
new_game = Game.new(board, player_1, player_2)
new_game.interface


board.print_board
print 'Type your turn : '

user_input = gets.chomp
position = user_input.to_i

if user_input.to_i < 0 ||  user_input.to_i > 9
    puts "Thats not a valid position. Play again #{@name}"
end

if board.taken?(user_input.to_i)
    puts "That position is already taken by a player, please play again"
    position = play_at(board)  
end
return position


     