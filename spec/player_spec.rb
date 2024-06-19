require './lib/player'

describe Player do
    describe "#initialize" do
        it "creates a new player" do
            player = Player.new("Player 1", "X")
            expect(player.name).to eql("Player 1")
            expect(player.symbol).to eql("X")
        end
    end
end