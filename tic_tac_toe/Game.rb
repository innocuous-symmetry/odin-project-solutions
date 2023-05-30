require_relative "../common/GameBase.rb"
require_relative "../common/Player.rb"
require_relative "Board.rb"

class Game
  include GameBase

  def initialize
    super("Tic Tac Toe")
    @playerOne = Player.new(@player_one_name, "X")
    @playerTwo = Player.new(@player_two_name, "O")
  end

  # inherits methods "play" and "to_s" from GameBase module

  def turn
    # clear the terminal on each turn
    puts "\e[H\e[2J"
    print self.to_s

    puts "Player #{@turn % 2 == 0 ? @playerTwo.name : @playerOne.name}, please select a square. (1-9)"
    player_input = gets.chomp.to_i

    unless player_input.is_a?(Numeric) and player_input.between?(1, 9)
      @statusMessage = "Invalid input. Expected a number between 1 and 9."
      self.turn
    end

    move_success = @board.update_square(player_input, @turn % 2 == 0 ? "O" : "X")

    if not move_success
      @statusMessage = "Invalid input. This square is already taken."
      self.turn
    end

    if @statusMessage == "Invalid input. This square is already taken."
      @statusMessage = ""
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
