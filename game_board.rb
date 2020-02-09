class GameBoard
    
  def initialize(str)
    @cell_value_str = str
  end

  public

  def draw()
    row_1 = "\t\t #{@cell_value_str[6]} | #{@cell_value_str[7]} | #{@cell_value_str[8]}"
    row_2 = "\t\t---|---|---"
    row_3 = "\t\t #{@cell_value_str[3]} | #{@cell_value_str[4]} | #{@cell_value_str[5]}"
    row_4 = "\t\t---|---|---"
    row_5 = "\t\t #{@cell_value_str[0]} | #{@cell_value_str[1]} | #{@cell_value_str[2]}"

    puts row_1,row_2,row_3,row_4,row_5
  end

  def update(str, mark)
    @cell_value_str.gsub!(str, mark)
  end
end

