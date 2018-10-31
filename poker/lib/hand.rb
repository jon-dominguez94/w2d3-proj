require_relative 'card'

class Hand
  attr_reader :user_hand
  
  def initialize(user_hand)
    raise "length does not equal 5" if user_hand.length != 5
    user_hand.each do |card|
      raise "contains non-card values" unless card.is_a?(Card)
    end
    @user_hand = user_hand
  end

  def is_flush?

  end

end
