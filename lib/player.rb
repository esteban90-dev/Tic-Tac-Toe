class Player
  attr_reader :name, :mark
  attr_accessor :move

  def initialize(args)
    @name = args.fetch(:name)
    @mark = args.fetch(:mark)
    @move = nil
  end

end