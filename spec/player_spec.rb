require "./lib/player.rb"

describe Player do 
  context "#initialize" do
    it "Raises an exception when initialized with an empty {}" do 
      expect{ Player.new({}) }.to raise_error(KeyError)
    end

    it "Does not raise an exception when initialized with a valid input {}" do
      expect{ Player.new({ :name => "john", :mark => "X" }) }.not_to raise_error(KeyError)
    end
  end

  context "#name" do 
    it "Returns name" do
      player = Player.new( { :name => "john", :mark => "X" })
      expect(player.name).to eql("john")
    end
  end

  context "#mark" do 
    it "Returns mark" do
      player = Player.new( { :name => "john", :mark => "X" })
      expect(player.mark).to eql("X")
    end
  end

  context "#move" do
    it "Returns move" do
      player = Player.new( { :name => "john", :mark => "X" })
      player.move = 9
      expect(player.move).to eql(9)
    end
  end

end