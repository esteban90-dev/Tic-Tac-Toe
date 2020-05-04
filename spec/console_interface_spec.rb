require './lib/console_interface.rb'

describe ConsoleInterface do

  context "Used directly" do
    it "Prints a string to the console" do
      expect{ ConsoleInterface::display("Hello World!") }.to output("Hello World!\n").to_stdout
    end
  end

  context "Used as a mixin" do
    before(:each) do
      subject { Class.new.include(ConsoleInterface).new }
    end
    
    it "Prints a string to the console" do
      expect{ subject.display("Hello World!") }.to output("Hello World!\n").to_stdout
    end
  end
end