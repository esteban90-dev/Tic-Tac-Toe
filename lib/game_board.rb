class GameBoard
  attr_reader :contents

  def initialize()
    @contents = '123456789'
  end

  public

  def formatted
    row_1 = "\t\t #{@contents[6]} | #{@contents[7]} | #{@contents[8]}"
    row_2 = "\t\t---|---|---"
    row_3 = "\t\t #{@contents[3]} | #{@contents[4]} | #{@contents[5]}"
    row_4 = "\t\t---|---|---"
    row_5 = "\t\t #{@contents[0]} | #{@contents[1]} | #{@contents[2]}"

    "#{row_1} \n #{row_2} \n #{row_3} \n #{row_4} \n #{row_5} \n"
  end

  def update(move, mark)
    contents.gsub!(move.to_s, mark)
  end

  def winner?
    winning_combos_x = [/XXX....../,/...XXX.../,/......XXX/,/X..X..X../,/.X..X..X/,/..X..X..X/,/X...X...X/,/..X.X.X../]
    winning_combos_o = [/OOO....../,/...OOO.../,/......OOO/,/O..O..O../,/.O..O..O/,/..O..O..O/,/O...O...O/,/..O.O.O../]

    return true if winning_combos_x.any?{ |x| x === contents }
    true if winning_combos_o.any?{ |x| x === contents } 
  end
end

