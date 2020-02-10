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
end
