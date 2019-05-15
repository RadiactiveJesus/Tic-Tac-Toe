module Interface

	def print_board
    
		puts "\t  #{@board[1]} | #{@board[2]} | #{@board[3]} "
		puts "\t ---|---|---"
		puts "\t  #{@board[4]} | #{@board[5]} | #{@board[6]} "
		puts "\t ---|---|---"
		puts "\t  #{@board[7]} | #{@board[8]} | #{@board[9]} "
    puts ""
  end
end