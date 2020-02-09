class Player
    attr_reader :name, :mark
    attr_accessor :move

    def initialize(name, mark)
      @name = name
      @mark = mark
      @move = []
    end

    public

    def make_move(move)
      @move.push(move)
    end

end

