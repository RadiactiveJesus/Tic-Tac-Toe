module Interface
	def get_input
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
	end
	def print_board()
		n = 0
		while n >= @board.row  
			@board.row.times
					j = 0
					print "\t  #{@board[j]}"
					j += 1
					
			end
			n += 1
		end
		puts "\t ---|---|---" 
  end
end
def print_board   
	puts "\t  #{@board[1]} | #{@board[2]} | #{@board[3]} "
	puts "\t ---|---|---"
	puts "\t  #{@board[4]} | #{@board[5]} | #{@board[6]} "
	puts "\t ---|---|---"
	puts "\t  #{@board[7]} | #{@board[8]} | #{@board[9]} "
	puts ""
end