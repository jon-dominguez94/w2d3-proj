SUITS = ['heart', 'spade', 'club', 'diamond']
VALUES = ('1'..'10').to_a + ['j', 'q', 'k', 'a']

class Card

  attr_reader :suit, :value

  def initialize(suit, value)
    raise ArgumentError unless SUITS.include?(suit) && VALUES.include?(value.to_s)
    @suit = suit
    @value = value.to_s
  end

  def inspect
    "#{value} of #{suit}s"
  end

end
