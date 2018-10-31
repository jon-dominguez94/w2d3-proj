require_relative 'card'

class Deck

  attr_reader :cards

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
    nil
  end
end
