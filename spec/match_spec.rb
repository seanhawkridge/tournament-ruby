require 'match'

describe Match do

  subject(:match) {described_class.new}

  describe "#initialize" do

    it 'initializes with two optional players' do
      expect(match.player_one).to eq :player_one
      expect(match.player_two).to eq :player_two
    end

    it 'initializes with players passed as arguments' do
      match = Match.new("Bob")
      expect(match.player_one).to eq "Bob"
      expect(match.player_two).to eq :player_two
    end

    it 'initializes with players passed as arguments' do
      match = Match.new("Bob", "Barbara")
      expect(match.player_one).to eq "Bob"
      expect(match.player_two).to eq "Barbara"
    end

  end

end
