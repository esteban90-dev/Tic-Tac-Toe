require "./lib/player.rb"

describe Player do 
  context "initialize" do
    it "Raises an exception when initialized with an empty {}" do 
      expect{ Player.new({}) }.to raise_error(KeyError)
    end

    it "Does not raise an exception when initialized with a valid input {}" do
      expect{ Player.new({ :name => "john", :mark => "X" }) }.not_to raise_error(KeyError)
    end
  end
end