require './lib/game.rb'
require './lib/player.rb' 
require './lib/board.rb'
require './lib/message.rb'

Message.display('welcome')
 
loop do
  players = Message.get_player_names(2)

  player1 = Player.new({:name => players[0], :mark => "X"})
  player2 = Player.new({:name => players[1], :mark => "O"})

  board = Board.new()

  game = Game.new(player1, player2, board)
  result = game.play()

  Message.display(result)
  break if result == 'quit'

  result = Message.replay()
  if result == 'n'
    Message.display('quit')
    break
  end
end


