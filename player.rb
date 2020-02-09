class Player
    attr_reader :name, :mark, :move

    def initialize(name, mark)
      @name = name
      @mark = mark
      @move = 0
    end

    public

    def make_move(move)
      @move = move
    end

end