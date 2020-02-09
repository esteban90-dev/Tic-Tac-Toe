require './game.rb'
require './player.rb' 
require './game_board.rb'


player1 = Player.new("Stephen","X")
player2 = Player.new("Regan","O")
board = GameBoard.new()
game = Game.new(player1, player2, board)
game.play()


