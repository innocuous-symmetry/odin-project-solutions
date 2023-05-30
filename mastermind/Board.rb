require_relative "../common/BoardBase.rb"

class Board
  attr_accessor :turn
  attr_reader :guesses, :keys

  include BoardBase

  def initialize
    @turn = 0
    @guesses = Array.new(12)
    @keys = Array.new(12)

    # generate a random solution code from values between 1 and 6
    solution_code = Array.new(4).map { rand(1..6) }
    @solution = CodeSet.new(solution_code)
  end

  def to_s
    print "wew"
  end

  def put_code(code)
    @guesses[turn] = code

    status = nil

    if (code == @solution)
      status = "win"
    end

    status
  end
end
