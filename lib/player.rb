class Player
  attr_accessor :name, :move
  def initialize(name, move = [])
    @name = name
    @move = move
  end
end
