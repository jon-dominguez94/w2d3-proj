require 'hand'

RSpec.describe Hand do
  let(:card) { Card.new('diamond', 2)}
  describe '#initialize' do
    let(:hand) { Hand.new([card,card,card,card,card]) }
    it 'raises an ArgumentError for length != 5' do
      expect{ Hand.new([3,4,5,6,7,3]) }.to raise_error("length does not equal 5")
    end
    it 'raises an error for not having cards' do
      expect{ Hand.new([3,4,5,6,3]) }.to raise_error("contains non-card values")
    end
    it 'sets the user_hand instance variable' do
      expect(hand.user_hand).to eq([card,card,card,card,card])
    end
  end

  let(:a_h) { Card.new('heart', 'a') }
  let(:k_h) { Card.new('heart', 'k') }
  let(:q_h) { Card.new('heart', 'q') }
  let(:j_h) { Card.new('heart', 'j') }
  let(:ten_h) { Card.new('heart', 10) }
  let(:royal) { Hand.new([ten_h, j_h, q_h, k_h, a_h])}
  let(:random) { Hand.new([ten_h, j_h, q_h, k_h, card])}

  describe '#is_royal?' do
    it 'returns true if hand is a royal flush' do
      expect(royal.is_royal?).to be(true)
    end
    it 'returns false if hand is not a royal flush' do
      expect(random.is_royal?).to be(false)
    end
  end

  describe '#is_straight_flush?' do
    it 'returns true if hand is a straight flush' do
      expect(royal.is_straight_flush?).to be(true)
    end
    it 'returns false if hand is not a straight flush' do
      expect(random.is_straight_flush?).to be(false)
    end
  end

  describe '#is_flush?' do
    it 'returns true if hand is a flush' do
      expect(royal.is_flush?).to be(true)
    end
    it 'returns false if hand is not a flush' do
      expect(random.is_flush?).to be(false)
    end
  end

  describe '#is_straight?' do
    it 'returns true if hand is a straight' do
      expect(royal.is_straight?).to be(true)
    end
    it 'returns false if hand is not a straight' do
      expect(random.is_straight?).to be(false)
    end
  end

  let(:four) { Hand.new([card,card,card,card,a_h]) }

  describe '#is_four?' do
    it 'returns true if hand is a 4 of a kind' do
      expect(four.is_four?).to be(true)
    end
    it 'returns false if hand is not a 4 of a kind' do
      expect(random.is_four?).to be(false)
    end
  end

  let(:three) { Hand.new([card,card,card,k_h,a_h]) }

  describe '#is_three?' do
    it 'returns true if hand is a 3 of a kind' do
      expect(three.is_three?).to be(true)
    end
    it 'returns false if hand is not a 3 of a kind' do
      expect(random.is_three?).to be(false)
    end
  end

  let(:two_p) { Hand.new([card,card,k_h,k_h,a_h]) }

  describe '#a_pair?' do
    it 'returns true if hand is a pair' do
      expect(two_p.a_pair?).to be(true)
    end
    it 'returns false if hand is not a pair' do
      expect(random.a_pair?).to be(false)
    end
  end

  describe '#two_pair?' do
    it 'returns true if hand is a two pair' do
      expect(two_p.two_pair?).to be(true)
    end
    it 'returns false if hand is not a two pair' do
      expect(random.two_pair?).to be(false)
    end
  end

  let(:full) { Hand.new([card,card,k_h,k_h,k_h]) }

  describe '#is_fullhouse?' do
    it 'returns true if hand is a fullhouse' do
      expect(full.is_fullhouse?).to be(true)
    end
    it 'returns false if hand is not a fullhouse' do
      expect(random.is_fullhouse?).to be(false)
    end
  end

  describe '#get_score' do
    it 'returns a score for the type of hand' do
      expect(royal.get_score).to eq(21)
      expect(random.get_score).to eq(11)
    end
  end
end
