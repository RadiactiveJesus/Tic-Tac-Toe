require './lib/player.rb'

RSpec.describe Player do
	describe "#move" do
		let!(:player_1) { Player.new("player_1", "X") }
			it "adds the player input to the positions array" do
					expect(player_1.move(4)).to eql([4])
			end
	end
	
end