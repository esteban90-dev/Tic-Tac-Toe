class Player
  attr_reader :name, :mark, :move

  def initialize(args)
    @name = args.fetch(:name)
    @mark = args.fetch(:mark)
    @move = nil
  end

  public

  def make_move(move)
    @move = move
  end

end