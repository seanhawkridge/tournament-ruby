class Tournament

  attr_reader :players, :matches

  def initialize
    @players = []
  end

  def add_player(player)
    @players.push(player)
  end

  def create_matches
    @matches = @players.each_slice(2).to_a
  end

end
