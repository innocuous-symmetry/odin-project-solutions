require_relative "../common/GameBase.rb"
require_relative "../common/Player.rb"
require_relative "../common/Board.rb"
require_relative "KeySet.rb"
require_relative "CodeSet.rb"

class Game
  include GameBase

  def initialize
    super("Mastermind")
  end

  # inherits "play"

  def turn
    # clear the terminal on each turn
    puts "\e[H\e[2J"
    print self.to_s

    puts "Player #{@turn % 2 == 0 ? @playerTwo.name : @playerOne.name}, please enter a guess."
    player_input = gets.chomp

    unless player_input.is_a?(String) and player_input.length == 4 and player_input.split("").all? { |code| code.to_i.between?(1, 6) }
      @statusMessage = "Invalid input. Expected a 4-digit code between 1 and 6."
      self.turn
    end

    @statusMessage = ""

    # convert the player's input into a CodeSet object
    player_code = CodeSet.new(player_input.split("").map { |code| code.to_i })

    # pass object to the board, which will also check it against the solution
    result = @board.put_code(player_code)

    @board.turn(@turn)
  end
end
