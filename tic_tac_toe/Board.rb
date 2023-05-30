require_relative "../common/BoardBase.rb"

class Board < BoardBase
  attr_accessor :turn, :squares, :update_square

  def initialize(turn = 1)
    super(turn)
    @squares = [
      [" ", " ", " "],
      [" ", " ", " "],
      [" ", " ", " "]
    ]
  end

  def to_s
    print "\n
    1: #{@squares[0][0]} | 2: #{@squares[0][1]} | 3: #{@squares[0][2]} \n
    ---------------------\n
    4: #{@squares[1][0]} | 5: #{@squares[1][1]} | 6: #{@squares[1][2]} \n
    ---------------------\n
    7: #{@squares[2][0]} | 8: #{@squares[2][1]} | 9: #{@squares[2][2]} \n
    "
  end

  def update_square(square, symbol)
    # translate a numbered square onto a matrix
    row = ((square - 1) / 3).ceil()
    column = (square - 1) % 3
    success = false

    if @squares[row][column] != " "
      puts "Square is already taken."
      puts "Please try again."
    else
      @squares[row][column] = symbol
      success = true
    end

    success
  end

  def check_for_winner
    winner = nil

    # check whether all squares in a row match
    for row in @squares
      if row.all? { |square| square == "X" }
        if not winner
          winner = "X"
        end
      elsif row.all? { |square| square == "O" }
        if not winner
          winner = "O"
        end
      end
    end

    # check whether all columns match
    if not winner
      if (@squares[0][0] == "X" and @squares[1][0] == "X" and @squares[2][0] == "X")
        winner = "X"
      elsif (@squares[0][0] == "O" and @squares[1][0] == "O" and @squares[2][0] == "O")
        winner = "O"
      end
    end

    # check for diagonal matches
    if not winner
      if (@squares[0][0] == "X" or @squares[0][0] == "O") and @squares[0][0] == @squares[1][1] and @squares[1][1] == @squares[2][2]
        winner = @squares[0][0]
      elsif (@squares[0][2] == "X" or @squares[0][2] == "O") and @squares[0][2] == @squares[1][1] and @squares[1][1] == @squares[2][0]
        winner = @squares[0][2]
      end
    end

    winner
  end
end
