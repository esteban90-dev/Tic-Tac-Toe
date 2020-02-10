class Game
  attr_reader :status

  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
    @status = 0
  end

  public

  def winner?
    winning_combos_x = [/XXX....../,/...XXX.../,/......XXX/,/X..X..X../,/.X..X..X/,/..X..X..X/,/X...X...X/,/..X.X.X../]
    winning_combos_o = [/OOO....../,/...OOO.../,/......OOO/,/O..O..O../,/.O..O..O/,/..O..O..O/,/O...O...O/,/..O.O.O../]

    winning_mark = nil
    winning_mark = 'X' if winning_combos_x.any?{ |x| x === @board.contents }
    winning_mark = 'O' if winning_combos_o.any?{ |x| x === @board.contents }  

    return @player1.name if @player1.name == winning_mark
    return @player2.name if @player2.name == winning_mark
    winning_mark   
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
      player.make_move(input)
    else
      @status = 0
    end
  end

  def play
    @status = 1
    player = @player1
    while @status == 1
      @board.draw()
      prompt_player(player)
      @board.update(player.move,player.mark)

      if player == @player1
        player = @player2
      else
        player = @player1
      end

      if winner?
        @board.draw()
        @status = 0
      end

    end
  end
 

end
