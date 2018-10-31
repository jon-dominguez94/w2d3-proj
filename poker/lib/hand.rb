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
    suits = user_hand.map {|card| card.suit }
    suits.uniq.length == 1
  end

  def of_kind?(num)
    hash = Hash.new(0)
    user_hand.each do |card|
      hash[card.value] += 1
    end

    hash.values.max == num
    # case hash[-1][1]
    # when 4
    #   p "four of a kind "
    # when 3
    #   p "three of a kind"
    # when 2
    #   p "two of a kind"
    # end
  end

  def is_four?
    of_kind?(4)
  end
  def is_fullhouse?
    sorted = user_hand.sort_by {|card| card.value}
  end

end
