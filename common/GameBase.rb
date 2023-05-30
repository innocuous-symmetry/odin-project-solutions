module GameBase
  def initialize(game_name = "(unspecified game)")
    puts "Welcome to #{game_name}!"
    puts "Player 1, what is your name?"
    @player_one_name = gets.chomp

    puts "Player 2, what is your name?"
    @player_two_name = gets.chomp

    @playerOne = Player.new(@player_one_name)
    @playerTwo = Player.new(@player_two_name)
    @statusMessage = ""
    @board = Board.new
    @winner = nil
    @turn = 1
  end

  def to_s
    print "
    Player one: #{@playerOne.name}\n
    Player two: #{@playerTwo.name}\n
    Current turn: #{@turn}\n
    #{@statusMessage}
    #{@board.to_s}
    "
  end

  def play
    until @winner
      self.turn
    end

    @statusMessage = "#{@statusMessage + "\nPress 'x' to exit or 'a' to play again."}"
    print self.to_s

    if gets.chomp == "a"
      @board = Board.new
      @winner = nil
      @statusMessage = ""
      @turn = 1
      self.play()
    elsif gets.chomp != "x"
      @statusMessage = "Please provide a valid input"
      print self.to_s
    end
  end

  def turn
    fail NotImplementedError, "Game must implement a 'turn' method"
  end
end
