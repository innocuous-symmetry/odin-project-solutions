class Player
  attr_accessor :turn_active
  attr_reader :name, :symbol, :turn_active

  def initialize(name, symbol = nil)
    @name = name
    @symbol = symbol
    @turn_active = false
  end
end
