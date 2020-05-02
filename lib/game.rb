class Game
  attr_reader :board

  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
  end

  public

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

  private 

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
