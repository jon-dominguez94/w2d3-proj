require_relative 'card'

class Deck

  def initialize
    @cards = []
    populate
  end

  def populate
    SUITS.each do |suit|
      VALUES.each do |value|
        @cards << Card.new(suit, value)
      end
    end
    p @cards
  end
end

d = Deck.new
