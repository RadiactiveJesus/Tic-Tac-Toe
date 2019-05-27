require '/lib/board.rb'
require '/lib/game.rb'
require '/lib/interface.rb'
require '/lib/player.rb'

RSpec.describe Board do
    describe "#add_at" do
        it "adds an string, depending on the current player, in a specific position of the board" do
            Board.new
            expect(5, "X").to eql([0, 1, 2, 3, 4, "X", 6, 7, 8])
        end
    end
end