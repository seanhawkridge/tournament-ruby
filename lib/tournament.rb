class Tournament

  attr_reader :players, :matches

  def initialize
    @players = []
  end

  def add_player(player)
    @players.push(player)
  end

  def create_matches
    pairings = @players.each_slice(2).to_a
    @matches = pairings.map { |pair| Match.new(pair[0], pair[1]) }
  end

end
