require './lib/board.rb'

describe Board do

  context "#contents" do
    it "returns the contents of the board" do
      board = Board.new
      expect(board.contents).to eql('123456789')
    end
  end

  context "#update" do
    it "updates the contents of the board when supplied with a mark and position" do
      board = Board.new
      board.update("3",'X')
      expect(board.contents).to eql('12X456789')
    end

    it "raises an error when not supplied with a mark and position" do
      board = Board.new
      expect{ board.update }.to raise_error(ArgumentError)
    end
  end

end