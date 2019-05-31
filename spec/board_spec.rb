require './lib/board.rb'

RSpec.describe Board do
    let(:board) { Board.new }
    describe "#add_at" do
        it "adds an string, depending on the current player, in a specific position of the board" do
            expect(board.add_at(5, "X")).to eql("X")
        end
    end
    describe "#full?" do
        it "returns true if all the positions in the board are already taken by all the players" do
            expect(board.full?).to eql(false)
        end
        it "returns false if all the positions in the board are not already taken by the players" do
            9.times do |i|
                board.add_at(i, "X")
            end
            expect(board.full?).to eql(true)
        end
    end
    describe "#taken?" do
        it "returns true if a position is already taken by a player" do
            board.add_at(5, "X")
            expect(board.taken?(5)).to eql(true)
        end
        it "returns false if a position is not taken by a player yet" do
            board.add_at(5, "X")
            expect(board.taken?(4)).to eql(false)
        end
    end
end