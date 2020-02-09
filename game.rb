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
    winning_combos_x = ['XXX456789','123XXX789','123456XXX','X23X56X89','1X34X67X9',
      '12X45X78X','X234X678X','12X4X6X89']
    winning_combos_o = ['OOO456789','123OOO789','123456OOO','O23O56O89','1O34O67O9',
    '12O45O78O','O234O678O','12O4O6O89']

    winning_mark = nil
    winning_mark = 'X' if winning_combos_x.include?(@board.contents)
    winning_mark = 'O' if winning_combos_o.include?(@board.contents)  

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

      puts "Board contents are #{@board.contents}"
      puts "Winner is #{winner?}"
    end
  end
 

end
