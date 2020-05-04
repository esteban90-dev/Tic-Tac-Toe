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

  context "#winner?" do
    it "returns true when there are X's in positions 1,2,3" do
      board = Board.new
      board.update("1","X")
      board.update("2","X")
      board.update("3","X")
      expect(board.winner?).to eql(true)
    end

    it "returns true when there are X's in positions 4,5,6" do
      board = Board.new
      board.update("4","X")
      board.update("5","X")
      board.update("6","X")
      expect(board.winner?).to eql(true)
    end

    it "returns true when there are X's in positions 7,8,9" do
      board = Board.new
      board.update("7","X")
      board.update("8","X")
      board.update("9","X")
      expect(board.winner?).to eql(true)
    end

    it "returns true when there are X's in positions 1,4,7" do
      board = Board.new
      board.update("1","X")
      board.update("4","X")
      board.update("7","X")
      expect(board.winner?).to eql(true)
    end

    it "returns true when there are X's in positions 2,5,8" do
      board = Board.new
      board.update("2","X")
      board.update("5","X")
      board.update("8","X")
      expect(board.winner?).to eql(true)
    end

    it "returns true when there are X's in positions 3,6,9" do
      board = Board.new
      board.update("3","X")
      board.update("6","X")
      board.update("9","X")
      expect(board.winner?).to eql(true)
    end

    it "returns true when there are X's in positions 1,5,9" do
      board = Board.new
      board.update("1","X")
      board.update("5","X")
      board.update("9","X")
      expect(board.winner?).to eql(true)
    end

    it "returns true when there are X's in positions 3,5,7" do
      board = Board.new
      board.update("3","X")
      board.update("5","X")
      board.update("7","X")
      expect(board.winner?).to eql(true)
    end

    it "returns true when there are O's in positions 1,2,3" do
      board = Board.new
      board.update("1","O")
      board.update("2","O")
      board.update("3","O")
      expect(board.winner?).to eql(true)
    end

    it "returns true when there are O's in positions 4,5,6" do
      board = Board.new
      board.update("4","O")
      board.update("5","O")
      board.update("6","O")
      expect(board.winner?).to eql(true)
    end

    it "returns true when there are O's in positions 7,8,9" do
      board = Board.new
      board.update("7","O")
      board.update("8","O")
      board.update("9","O")
      expect(board.winner?).to eql(true)
    end

    it "returns true when there are O's in positions 1,4,7" do
      board = Board.new
      board.update("1","O")
      board.update("4","O")
      board.update("7","O")
      expect(board.winner?).to eql(true)
    end

    it "returns true when there are O's in positions 2,5,8" do
      board = Board.new
      board.update("2","O")
      board.update("5","O")
      board.update("8","O")
      expect(board.winner?).to eql(true)
    end

    it "returns true when there are O's in positions 3,6,9" do
      board = Board.new
      board.update("3","O")
      board.update("6","O")
      board.update("9","O")
      expect(board.winner?).to eql(true)
    end

    it "returns true when there are O's in positions 1,5,9" do
      board = Board.new
      board.update("1","O")
      board.update("5","O")
      board.update("9","O")
      expect(board.winner?).to eql(true)
    end

    it "returns true when there are O's in positions 3,5,7" do
      board = Board.new
      board.update("3","O")
      board.update("5","O")
      board.update("7","O")
      expect(board.winner?).to eql(true)
    end
  end

  context "#tie?" do
    it "returns true if are no numbers left on the board" do
      board = Board.new
      board.update("1","X")
      board.update("2","X")
      board.update("3","X")
      board.update("4","X")
      board.update("5","X")
      board.update("6","X")
      board.update("7","X")
      board.update("8","X")
      board.update("9","X")
      expect(board.tie?).to eql(true)
    end
  end

end