class GameBase
  def initialize
    puts "Welcome to Tic Tac Toe!"
    puts "Player 1, what is your name?"
    @player_one_name = gets.chomp

    puts "Player 2, what is your name?"
    @player_two_name = gets.chomp

    @playerOne = Player.new(@player_one_name)
    @playerTwo = Player.new(@player_two_name)
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
end
