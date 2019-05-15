require '../lib/logic.rb'
new_game = Game.new
new_game.interface

def play_at(board)
	board.print_board
	print 'Type your turn : '

	user_input = gets.chomp

	if user_input.to_i < 0 ||  user_input.to_i >9
		puts "Thats not a valid position. Play again #{@name}"
	end

	if board.taken?(user_input.to_i)
		puts "That position is already taken by a player, please play again"
		row,column = play_at(board)
	else
		puts "You played in row: #{row+1} column: #{column+1}"
		
	end
  
end

     