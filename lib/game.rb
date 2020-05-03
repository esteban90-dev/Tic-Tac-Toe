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
      input = prompt("#{current_player.name}, enter a position (1 - 9), or press q to quit", /^[1-9]$/)
      board.update(input, current_player.mark)
      break if game_over?
      switch_players
    end
    display(result)
  end

=begin  
  def play
    player = @player1
    loop do
      puts board.formatted
      result = prompt_player(player)
      board.update(player.move,player.mark)

      if player == @player1
        player = @player2
      else
        player = @player1
      end

      if game_over?
        puts board.formatted
        return winner?
        return tie?
      end

      if board.winner?
        puts board.formatted
        return winner?
      end

      if board.tie?
        puts board.formatted
        return tie?
      end

      if result == 'quit'
        return result
      end
    end
  end
=end  

  private 

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
  end

  def winner?
    winning_combos_x = [/XXX....../,/...XXX.../,/......XXX/,/X..X..X../,/.X..X..X/,/..X..X..X/,/X...X...X/,/..X.X.X../]
    winning_combos_o = [/OOO....../,/...OOO.../,/......OOO/,/O..O..O../,/.O..O..O/,/..O..O..O/,/O...O...O/,/..O.O.O../]

    winner = nil
    winner = 'X' if winning_combos_x.any?{ |x| x === @board.contents }
    winner = 'O' if winning_combos_o.any?{ |x| x === @board.contents }  

    return @player1.name if @player1.mark == winner
    return @player2.name if @player2.mark == winner
    winner   
  end

  def tie?
    return 'tie' if @board.contents.split(//).none?(/\d/)
  end

  def prompt_player(player)
    input = 0
    reprompt = 1
    while reprompt == 1
      puts "#{player.name}, enter a position (1 - 9), or press q to quit"
      input = gets.chomp
      if (1..9).include?(input.to_i)
        reprompt = 0
        input = input.to_i
      end
      if input == 'q'
        reprompt = 0
      end
    end
    if input.is_a? Numeric
      player.move = input
    else
      return 'quit'
    end
  end

end
