require './lib/board'

describe Board do
    describe "#initialize" do
        it "creates a new board" do
            board = Board.new
            expect(board.board).to eql([["_","_","_"], ["_","_","_"], ["_","_","_"]])
        end
    end
end