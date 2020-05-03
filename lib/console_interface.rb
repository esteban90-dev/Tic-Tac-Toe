module ConsoleInterface
  def display(string)
    puts string
  end

  def prompt(string, regexp)
    input = ""
    loop do
      puts string
      input = gets.chomp
      break if input.match?(regexp)
    end
    input
  end

  module_function :display, :prompt
end
