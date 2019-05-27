require './lib/game.rb'
require './lib/board.rb'
require './lib/player.rb'

RSpec.describe Board do
    board = Board.new
    player_1 = Player.new('Player 1', 'X')
    player_2 = Player.new('Player 2', 'O')
    new_game = Game.new(board, player_1, player_2)

    describe "#win?" do
        it "returns true  if a player has already won" do
            player_1.positions = [0, 1, 2]
            expect(new_game.win?(player_1)).to eql(true)
        end
        it "returns false if a player has not won yet" do
            player_1.positions = [0, 3, 2]
            expect(new_game.win?(player_1)).to eql(false)
        end
    end

    describe "#is_game_over?" do
        it "finishes the game if the game is actually over" do
            expect(new_game.is_game_over?).to eql(false)
        end
        it "finishes the game if the game is actually over" do
            player_1.positions = [0, 1, 2]
            expect(new_game.is_game_over?).to eql(true)
        end
        it "finishes the game if the game is actually over" do
            9.times do |i|
                board.add_at(i, "X")
            end
            expect(new_game.is_game_over?).to eql(true)
        end
    end
    describe "#tie" do
        it "prints the game is a tie if the board is full and no player has won yet" do
            board.board = ["X","O","X","O","X","O","O","X","O"]
            player_1.positions = [0, 2 , 4, 7]
            player_2.positions = [1, 3 , 5, 6, 8]
            expect(new_game.tie).to eql('The game is a tie')
        end
    end
    describe "#winner" do
        it "prints the the player that has won if the positions of the player is equal to a winning combination" do
            player_1.positions = [0, 1, 2]
            player_2.positions = [5, 7]
            expect(new_game.winner).to eql(' Player 1 wins')
        end
    end
    describe "#get_input" do
        it "gets the input of a player to make a move" do
            user_input = "5"
            expect(new_game.get_input).to eql(5)
        end
    end
end