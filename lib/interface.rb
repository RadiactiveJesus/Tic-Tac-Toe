module Interface
	def get_input
		puts "Please type a position to play your turn :"
	  user_input = gets.chomp
	  position = user_input.to_i
  
	  if user_input.to_i < 0 || user_input.to_i > 8
			  puts "Thats not a valid position. Play again "
			  position = get_input
	  end
  
	  if @board.board[user_input.to_i].is_a? String
		puts 'That position is already taken by a player, please play again'
		position = get_input
	  end
	  position
	end
	
	def winner
    puts ' Player 1 wins' if win?(@player_1.symbol)
    puts ' Player 2 wins' if win?(@player_2.symbol)
	end
	
	def tie
		if @board.full?  && !win?(@player_1.symbol) && !win?(@player_2.symbol)
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
