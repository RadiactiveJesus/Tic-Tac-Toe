class Board
    attr_accessor :board, :player1, :player2
    @turn = true
    @player1 = []
    @player2 = []
    WINNING_COMBOS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 4, 8],
        [2, 4, 6],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
    ]
    def initialize
        @board = [
            [nil, nil, nil],
            [nil, nil, nil],
            [nil, nil, nil],
        ]        
    end
    def add_at(row, column)
        if @turn == true
            @move = [row, column]
            @board[row][column] = "X"
            @turn = false
            case @move
                when @move == [0, 0] then @player1 << 0
                when @move == [0, 1] then @player1 << 1
                when @move == [0, 2] then @player1 << 2
                when @move == [1, 0] then @player1 << 3
                when @move == [1, 1] then @player1 << 4
                when @move == [1, 2] then @player1 << 5
                when @move == [2, 0] then @player1 << 6
                when @move == [2, 1] then @player1 << 7
                when @move == [2, 2] then @player1 << 8
            end
        else
            @move = [row, column]
            @board[row][column] = "O"
            @turn = true
            case @move
                when @move == [0, 0] then @player2 << 0
                when @move == [0, 1] then @player2 << 1
                when @move == [0, 2] then @player2 << 2
                when @move == [1, 0] then @player2 << 3
                when @move == [1, 1] then @player2 << 4
                when @move == [1, 2] then @player2 << 5
                when @move == [2, 0] then @player2 << 6
                when @move == [2, 1] then @player2 << 7
                when @move == [2, 2] then @player2 << 8
            end
        end
    end
    print @player1
end
game = Board.new
game.add_at(0, 0)
game.add_at(0, 1)
game.add_at(0, 2)
game.add_at(1, 0)
game.add_at(1, 1)
game.add_at(1, 2)
game.add_at(2, 0)
game.add_at(2, 1)
game.add_at(2, 2)


