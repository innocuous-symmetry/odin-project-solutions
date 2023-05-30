class BoardBase
  attr_accessor :turn

  def initialize(turn = 1)
    @turn = turn
  end

  def to_s
    print "
    Current turn: #{@turn}\n
    "
  end
end
