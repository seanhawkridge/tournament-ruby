require 'player'

describe Player do

  subject(:player) {described_class.new("Joe Smith")}

  describe '#initialize' do

    it 'initializes with a name' do
      expect(player.name).to eq :"Joe Smith"
    end

  end

end
