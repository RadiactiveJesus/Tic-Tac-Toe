module Interface
	def get_input(user_input = gets.chomp)
		position = nil
		if !win?(@player_1) && !win?(@player_2) && !@board.full?
			puts "Please type a position to play your turn :"
			
			position = user_input.to_i
		
			if user_input.to_i < 0 || user_input.to_i > 8
					puts "Thats not a valid position. Play again "
					position = get_input
			end
		
			if @board.taken?(user_input.to_i)
			puts 'That position is already taken by a player, please play again'
			position = get_input
			end
			position
		end
		position
	end
	
	def winner
		puts ' Player 1 wins' if win?(@player_1)
		puts ' Player 2 wins' if win?(@player_2)
	end
	
	def tie
		if @board.full?  && !win?(@player_1) && !win?(@player_2)
			puts 'The game is a tie'
		end
		
	end
  
	def print_board
	  puts "\t  #{@board.board[0]} | #{@board.board[1]} | #{@board.board[2]} "
	  puts "\t ---|---|---"
	  puts "\t  #{@board.board[3]} | #{@board.board[4]} | #{@board.board[5]} "
	  puts "\t ---|---|---"
	  puts "\t  #{@board.board[6]} | #{@board.board[7]} | #{@board.board[8]} "
	  puts ''
	end
end
