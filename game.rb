class Game
  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
  end

  def winner?
    winning_combos_x = ['XXX456789','123XXX789','123456XXX','X23X56X89','1X34X67X9',
      '12X45X78X','X234X678X','12X4X6X89']
    winning_combos_o = ['OOO456789','123OOO789','123456OOO','O23O56O89','1O34O67O9',
    '12O45O78O','O234O678O','12O4O6O89']

    if winning_combos_x.include?(@board.contents)
      return 'X'
    elsif winning_combos_o.include?(@board.contents)
      return 'O'
    else
      return nil
    end
  end

  def prompt_player(player)
    input = 0
    while(!input)
      puts "#{player.name}, enter a position (1 - 9), or press q to quit"
      input = gets.chomp
      input = 0 unless (1..9).include?(input) || input == 'q'
    end
    if input.is_a? Numeric
      player.make_move(input)
    else
      ##quit game
    end
  end
 

end
