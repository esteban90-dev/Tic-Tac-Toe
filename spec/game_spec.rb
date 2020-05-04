require "./lib/game.rb"

describe Game do

  TestPlayer = Struct.new(:name, :mark)
  let (:joe) { TestPlayer.new({ name: "joe", mark: "X"}) }
  let (:bob) { TestPlayer.new({ name: "bob", mark: "O"}) }

  context "#initialize" do
    it "Given an array of two players, it sets the first player as current player" do
      board1 = double('board')
      game = Game.new([joe,bob],board1)
      expect(game.current_player).to eql(joe)
    end

    it "Given an array of two players, it sets the second player as other player" do
      board1 = double('board')
      game = Game.new([joe,bob],board1)
      expect(game.other_player).to eql(bob)
    end
  end

  context "#result" do
    it "Announces a tie if a there was a tie game" do
      board1 = double('board')
      allow(board1).to receive(:tie?) { true }
      game = Game.new([joe,bob], board1)
      expect(game.result).to eql("Game was a tie")
    end

    it "Announces a winner if a there is a winner" do
      board1 = double('board')
      allow(board1).to receive(:tie?) { false }
      game = Game.new([joe,bob], board1)
      allow(game.current_player).to receive(:name) { "joe" }
      expect(game.result).to eql("joe is the Winner!")
    end
  end

  context "#switch players" do
    it "switches the current player with the other player" do
      board1 = double('board')
      game = Game.new([joe,bob], board1)
      game.switch_players
      expect(game.current_player).to eql(bob)
    end
  end

  context "#game_over?" do
    it "returns true if there is a tie" do
      board1 = double('board')
      allow(board1).to receive(:winner?) { false }
      allow(board1).to receive(:tie?) { true }
      game = Game.new([joe,bob], board1)
      expect(game.game_over?).to eql(true)
    end

    it "returns true if there is a winner" do
      board1 = double('board')
      allow(board1).to receive(:winner?) { true }
      allow(board1).to receive(:tie?) { false }
      game = Game.new([joe,bob], board1)
      expect(game.game_over?).to eql(true)
    end

    it "returns false if there is no tie or winner" do
      board1 = double('board')
      allow(board1).to receive(:winner?) { false }
      allow(board1).to receive(:tie?) { false }
      game = Game.new([joe,bob], board1)
      expect(game.game_over?).to eql(false)
    end
  end

end