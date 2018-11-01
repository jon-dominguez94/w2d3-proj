require_relative 'hand'

class Player

  attr_reader :ans

  def initialize(name, money)
    @name = name
    @money = money
  end

  def discard
    puts "Which card do you want to discard?"
    @discard = gets.chomp

  end

  def choices
    puts "Fold(f), See(s), or Raise(r)"
    @ans = gets.chomp
  end

  def get_money
  end

  def get_raise
  end

end
