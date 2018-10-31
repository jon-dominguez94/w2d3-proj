require 'card'

RSpec.describe Card do
  describe '#initialize' do
    it 'sets the suit and the value' do
      card = Card.new('heart','k')
      expect(card.suit).to eq('heart')
      expect(card.value).to eq('k')
    end
    it 'raises ArgumentError if wrong input' do
      expect { Card.new('adcasca','aas') }.to raise_error(ArgumentError)
    end
  end
end
