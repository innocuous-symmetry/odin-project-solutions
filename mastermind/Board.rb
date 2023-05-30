require_relative "../common/BoardBase.rb"

class Board < BoardBase
  def initialize(turn = 1)
    super(turn)
  end

  def to_s
    print "wew"
  end
end
