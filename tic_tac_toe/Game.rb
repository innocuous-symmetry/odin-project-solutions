class Game
  def initialize
    puts "Welcome to Tic Tac Toe!"
    puts "Player 1, what is your name?"
    player_one_name = gets

    puts "Player 2, what is your name?"
    player_two_name = gets

    @playerOne = Player.new(player_one_name, "X")
    @playerTwo = Player.new(player_two_name, "O")
    @statusMessage = ""
    @board = Board.new()
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
      self.turn()
    end

    @statusMessage = "#{@statusMessage + "\nPress 'x' to exit"}"
    print self.to_s

    until gets.chomp == "x"
      print self.to_s
    end
  end

  def turn()
    # clear the terminal on each turn
    puts "\e[H\e[2J"
    print self.to_s

    puts "Player #{@turn % 2 == 0 ? @playerTwo.name : @playerOne.name}, please select a square. (1-9)"
    player_input = gets.chomp.to_i

    unless player_input.is_a?(Numeric) and player_input.between?(1, 9)
      @statusMessage = "Invalid input. Expected a number between 1 and 9."
      self.turn()
    end

    move_success = @board.update_square(player_input, @turn % 2 == 0 ? "O" : "X")

    if not move_success
      @statusMessage = "Invalid input. This square is already taken."
      self.turn()
    end

    winner_this_turn = @board.check_for_winner

    if winner_this_turn
      @winner = (winner_this_turn == "X" ? @playerOne.name : @playerTwo.name)
      @statusMessage = "#{@winner} wins!"
    else
      @turn += 1
    end
  end
end
