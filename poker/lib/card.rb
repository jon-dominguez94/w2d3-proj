class Card

  SUITS = ['heart', 'spade', 'club', 'diamond']
  VALUES = ('1'..'10').to_a + ['a', 'j', 'q', 'k']

  attr_reader :suit, :value

  def initialize(suit, value)
    raise ArgumentError unless SUITS.include?(suit) && VALUES.include?(value.to_s)
    @suit = suit
    @value = value.to_s
  end

end
