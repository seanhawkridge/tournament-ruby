class Tournament

  attr_reader :players, :matches, :rounds

  def initialize
    @players = []
    @rounds = []
  end

  def add_player(player)
    @players.push(player)
  end

  def build_tournament
    create_first_round
    create_remaining_rounds
  end

  def log_winner(round, winner)
    @rounds[round].map { |match| match.log_winner(winner) if match.players.include?(winner) }
    prepare_next_round(round) unless is_final?(round)
  end

  def champion
    @rounds.last[0].winner.name
  end

  private

  def create_first_round
    pairings = @players.each_slice(2).to_a
    first_round_matches = pairings.map { |pair| Match.new(pair[0], pair[1]) }
    @rounds << first_round_matches
  end

  def create_remaining_rounds
    initial_player_count = @players.size
    updated_player_count = initial_player_count /= 2
    while updated_player_count >= 2
      updated_player_count /= 2
      round = []
      updated_player_count.times { round << Match.new }
      @rounds << round
    end
  end

  def prepare_next_round(round)
    pairings = collect_winners(round).each_slice(2).to_a
    @rounds[round+1].map.with_index do |match, i|
      match.players[0] = pairings[i][0]
      match.players[1] = pairings[i][1]
    end
  end

  def collect_winners(round)
    @rounds[round].map { |match| match.winner }
  end

  def is_final?(round)
    @rounds[round].length < 2
  end

end
