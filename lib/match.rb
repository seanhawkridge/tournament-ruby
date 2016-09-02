class Match

  attr_reader :players, :winner

  def initialize(player_one = :player_one, player_two = :player_two)
    @players = [player_one, player_two]
    @winner = false
  end

  def log_winner(winner)
    @winner = winner
  end

end
