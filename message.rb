module Message
  def display(str)
    case str
    when 'welcome'
      puts "Welcome to Tic-Tac-Toe.  We will need two players to play this game."
    when 'tie'
      puts "Game was a tie!"
    when 'quit'
      puts "Thanks for playing!"
    else
      puts "Winner is #{str}!"
    end
  end

  def get_player_names(num)
    arr = []
    i = 0
    while i < num
      puts "Enter name for player #{i + 1}:"
      arr[i] = gets.chomp
      i += 1
    end
    return arr
  end

  def replay
    puts "Would you like to play again? Enter y/n."
    input = gets.chomp
    loop do
      if 'yn'.include?(input)
        return input
      else
        puts "Please enter valid input (y/n)."
        input = gets.chomp
      end
    end
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
      return 'quit'
    end
  end

end
