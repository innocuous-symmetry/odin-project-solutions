module BoardBase
  def check_for_winner
    fail NotImplementedError, "Board must implement a 'check_for_winner' method"
  end
end
