require './lib/player.rb'

RSpec.describe Player do
	describe "#move" do
			it "adds the player input to the positions array" do
					player = Player.new("player_1", "X")
					expect(player.move(4)).to eql([4])
			end
	end
	
end