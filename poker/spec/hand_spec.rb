require 'hand'

RSpec.describe Hand do
  describe '#initialize' do
    let(:card) { Card.new('heart', 2)}
    subject(:hand) { Hand.new([card,card,card,card,card]) }
    it 'raises an ArgumentError for length != 5' do
      expect{ Hand.new([3,4,5,6,7,3]) }.to raise_error("length does not equal 5")
    end
    it 'raises an error for not having cards' do
      expect{ Hand.new([3,4,5,6,3]) }.to raise_error("contains non-card values")
    end
    it 'sets the user_hand instance variable' do
      expect(hand.user_hand).to eq([card,card,card,card,card])
    end
  end
end
