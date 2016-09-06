require 'tournament'

describe Tournament do

  let(:player_one) {double :player_one, name: :"Sean"}
  let(:player_two) {double :player_two, name: :"Eleanor"}
  let(:player_three) {double :player_three, name: :"Zac"}
  let(:player_four) {double :player_four, name: :"Jude"}
  let(:player_five) {double :player_five, name: :"Refkah"}

  let(:match_one) {double :match, p1: :"Sean", p2: :"Eleaor"}

  subject(:tournament) {described_class.new}

  before do
    allow(player_one).to receive(:name).and_return(:"Sean")
    allow(player_two).to receive(:name).and_return(:"Eleanor")
  end

  describe '#initialize' do

    it 'initialises with an empty players array' do
      expect(tournament.players).to eq []
    end

  end

  describe '#add_player' do

    it 'adds a player to the players array' do
      tournament.add_player(player_one)
      expect(tournament.players).to eq [player_one]
    end

  end

  describe '#build_tournament' do

    before do
      tournament.add_player(player_one)
      tournament.add_player(player_two)
      tournament.add_player(player_three)
      tournament.add_player(player_four)
    end

    it 'creates a set of pairings for matches from the players array for the first round' do
      tournament.build_tournament
      expect(tournament.rounds.first[0]).to be_a Match
      expect(tournament.rounds.first[0].players[0]).to eq player_one
      expect(tournament.rounds.first[0].players[1]).to eq player_two
      expect(tournament.rounds.first[1]).to be_a Match
      expect(tournament.rounds.first[1].players[0]).to eq player_three
      expect(tournament.rounds.first[1].players[1]).to eq player_four
    end

    it 'sets up the remaining rounds in the tournament' do
      tournament.build_tournament
      expect(tournament.rounds.length).to eq 2
      expect(tournament.rounds.first.length).to eq 2
      expect(tournament.rounds.last.length).to eq 1
    end

  end

  describe '#log_winner' do

    before do
      tournament.add_player(player_one)
      tournament.add_player(player_two)
      tournament.add_player(player_three)
      tournament.add_player(player_four)
      tournament.build_tournament
    end

    it 'logs the winner of a match' do
      tournament.log_winner(0, player_two)
      tournament.log_winner(0, player_three)
      expect(tournament.rounds.first[0].winner).to eq player_two
      expect(tournament.rounds.first[1].winner).to eq player_three
    end

    it 'adds the logged winner as a player in the next round' do
      tournament.log_winner(0, player_two)
      tournament.log_winner(0, player_three)
      expect(tournament.rounds.last[0].players[0]).to eq player_two
      expect(tournament.rounds.last[0].players[1]).to eq player_three
    end

  end

  describe '#champion' do

    before do
      tournament.add_player(player_one)
      tournament.add_player(player_two)
      tournament.add_player(player_three)
      tournament.add_player(player_four)
      tournament.build_tournament
      tournament.log_winner(0, player_two)
      tournament.log_winner(0, player_three)
      tournament.log_winner(1, player_two)
    end

    it 'displays the name of the tournament champion' do
      expect(tournament.champion).to eq "Eleanor"
    end

  end

end
