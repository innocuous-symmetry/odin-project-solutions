require_relative "../common/GameBase.rb"

class Game < GameBase
  def initialize
    puts "Welcome to Mastermind!"
    puts "Player 1, what is your name?"
    player_one_name = gets.chomp

    puts "Player 2, what is your name?"
    player_two_name = gets.chomp

    @playerOne = Player.new(player_one_name)
    @playerTwo = Player.new(player_two_name)
    @statusMessage = ""
  end
end
