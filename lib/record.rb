module Record
    def moves(pos)
        @player.positions << @board.board[pos]
    end
end