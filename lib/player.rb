class Player
  attr_reader :name, :mark

  def initialize(args)
    @name = args.fetch(:name)
    @mark = args.fetch(:mark)
  end
end