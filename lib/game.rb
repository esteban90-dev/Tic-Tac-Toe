require './lib/console_interface.rb'

class Game
  include ConsoleInterface

  attr_reader :board
  attr_accessor :players, :current_player, :other_player

  def initialize(players, board)
    @current_player = players.first
    @other_player = players.last
    @players = players
    @board = board
  end

  public

  def play
    loop do
      display(board.formatted)
      input = ""
      loop do
        input = prompt("#{current_player.name}, enter a position (1 - 9)", /^[1-9]$/)
        break unless board.already_placed?(input)
      end
      board.update(input, current_player.mark)
      break if game_over?
      switch_players
    end
    display(result)
  end  

  def result
    return "Game was a tie" if board.tie?
    "#{current_player.name} is the Winner!"
  end

  def switch_players
    players.reverse!
    self.current_player = players.first
    self.other_player = players.last
  end

  def game_over?
    return true if board.winner?
    return true if board.tie?
    false
  end

end
