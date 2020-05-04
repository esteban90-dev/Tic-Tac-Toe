require "./lib/game.rb"

describe Game do

  TestPlayer = Struct.new(:name, :mark)
  let (:joe) { TestPlayer.new({ name: "joe", mark: "X"}) }
  let (:bob) { TestPlayer.new({ name: "bob", mark: "O"}) }

  TestBoard = Struct.new(:contents)
  let (:board) { TestBoard.new({ contents: "123456789" }) }

  context "#initialize" do
    it "Given an array of two players, it sets the first player as current player" do
      game = Game.new([joe,bob],board)
      expect(game.current_player).to eql(joe)
    end

    it "Given an array of two players, it sets the second player as other player" do
      game = Game.new([joe,bob],board)
      expect(game.other_player).to eql(bob)
    end

    
  end

end