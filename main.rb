require './lib/game.rb'
require './lib/player.rb' 
require './lib/board.rb'
require './lib/console_interface.rb'


ConsoleInterface::display("Welcome to the game Tic Tac Toe!")

name = ConsoleInterface::prompt("Enter a name for Player 1", /[a-zA-Z]/)
player1 = Player.new({:name => name, :mark => "X"})

name = ConsoleInterface::prompt("Enter a name for Player 2", /[a-zA-Z]/)
player2 = Player.new({:name => name, :mark => "O"})

players = [player1, player2]

loop do
  board = Board.new()
  game = Game.new(players, board)
  game.play
  input = ConsoleInterface::prompt("Would you like to play again? Please enter y/n.", /^[yn]{1}$/)
  break if input == 'n'
  players.reverse!
end
