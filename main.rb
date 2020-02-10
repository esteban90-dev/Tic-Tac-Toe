require './game.rb'
require './player.rb' 
require './game_board.rb'
require './message.rb'

include Message

Message.display('welcome')

loop do
  players = Message.get_player_names(2)

  player1 = Player.new(players[0],"X")
  player2 = Player.new(players[1],"O")

  board = GameBoard.new()

  game = Game.new(player1, player2, board)
  result = game.play()
  Message.display(result)
  break if result == 'quit'
  Message.replay()
end


