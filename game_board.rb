class GameBoard
  attr_reader :contents

  def initialize()
    @contents = '123456789'
  end

  public

  def draw()
    row_1 = "\t\t #{@contents[6]} | #{@contents[7]} | #{@contents[8]}"
    row_2 = "\t\t---|---|---"
    row_3 = "\t\t #{@contents[3]} | #{@contents[4]} | #{@contents[5]}"
    row_4 = "\t\t---|---|---"
    row_5 = "\t\t #{@contents[0]} | #{@contents[1]} | #{@contents[2]}"

    puts "",row_1,row_2,row_3,row_4,row_5,""
  end

  def update(move, mark)
    @contents.gsub!(move.to_s, mark)
  end
end

