require './message.rb'

class Game
  include Message

  attr_reader :status

  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
  end

  public

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

  def play
    player = @player1
    loop do
      @board.draw()
      result = prompt_player(player)
      @board.update(player.move,player.mark)

      if player == @player1
        player = @player2
      else
        player = @player1
      end

      if winner?
        @board.draw()
        return winner?
      end

      if tie?
        @board.draw()
        return tie?
      end

      if result == 'quit'
        return result
      end
    end
  end
end
