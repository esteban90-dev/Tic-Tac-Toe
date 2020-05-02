require "./lib/player.rb"

describe Player do 
  context "initialize" do
    it "Raises an exception when initialized with an empty {}" do 
      expect{ Player.new({}) }.to raise_error(KeyError)
    end
  end
end