require 'match'

describe Match do

  subject(:match) {described_class.new}

  describe "#initialize" do

    it 'initializes with two optional players' do
      expect(match.players[0]).to eq :player_one
      expect(match.players[1]).to eq :player_two
    end

    it 'initializes with players passed as arguments' do
      match = Match.new("Bob")
      expect(match.players[0]).to eq "Bob"
      expect(match.players[1]).to eq :player_two
    end

    it 'initializes with players passed as arguments' do
      match = Match.new("Bob", "Barbara")
      expect(match.players[0]).to eq "Bob"
      expect(match.players[1]).to eq "Barbara"
    end

  end

end
