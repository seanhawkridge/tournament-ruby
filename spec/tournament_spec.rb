require 'tournament'

describe Tournament do

  let(:player_one) {double :player_one, name: :"Sean"}
  let(:player_two) {double :player_two, name: :"Eleanor"}
  let(:player_three) {double :player_three, name: :"Zac"}
  let(:player_four) {double :player_four, name: :"Jude"}
  let(:player_five) {double :player_five, name: :"Refkah"}

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
      tournament.add_player(:player_one)
      expect(tournament.players).to eq [:player_one]
    end

  end

  describe '#create_matches' do

    it 'creates a set of pairings for matches from the players array' do
      tournament.add_player(:player_one)
      tournament.add_player(:player_two)
      tournament.add_player(:player_three)
      tournament.add_player(:player_four)
      tournament.create_matches
      expect(tournament.matches).to eq [[:player_one, :player_two], [:player_three, :player_four]]
    end

  end

end