require 'deck'

RSpec.describe Deck do
  describe '#initialize' do
    it 'creates a deck of 52 cards' do
      expect(Deck.new.cards.count).to eq(52)
    end
  end
end
