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

  def royal
    idxs = user_hand.map {|card| VALUES.index(card.value) }.sort
    straight_flush && (idxs == [8,9,10,11,12])
  end

  def straight_flush
    is_straight? && is_flush?
  end

  def is_four?
    of_kind?(4)
  end

  def is_fullhouse?
    get_hash.values.sort == [2,3]
  end

  def is_flush?
    suits = user_hand.map {|card| card.suit }
    suits.uniq.length == 1
  end

  def is_straight?
    straight = user_hand.map {|card| VALUES.index(card.value) }.sort
    if straight.max == 12
      straight.max - straight.min == 4 || straight[-2] == 3
    else
      straight.max - straight.min == 4
    end
  end

  def is_three?
    of_kind?(3)
  end

  def two_pair?
    get_hash.values.sort == [1,2,2]
  end

  def a_pair?
    of_kind?(2)
  end

  private

  def of_kind?(num)
    get_hash.values.max == num

  end

  def get_hash
    hash = Hash.new(0)
    user_hand.each do |card|
      hash[card.value] += 1
    end
    hash
  end

end
