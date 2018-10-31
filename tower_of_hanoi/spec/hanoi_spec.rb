require 'hanoi'

RSpec.describe Hanoi do
  subject(:game) { Hanoi.new }
  describe "#initialize" do
    it 'correctly sets up the discs' do
      expect(game.disc).to eq([[3,2,1],[],[]])
    end
  end

  describe "#move" do
    context 'when given an empty tower' do
      it 'raises an error' do
        expect { game.move(1,2) }.to raise_error("cannot move from empty stack")
      end
    end
    context 'when making an invalid move' do
      it 'raises an error' do
        game.move(0,2)
        expect { game.move(0,2) }.to raise_error("cannot move onto smaller disk")
      end
    end
    it 'makes a valid move' do
      expect(game.move(0,2)).to eq([1])
    end
  end

  describe "#won?" do
    before(:each) {
      game.move(0,2)
      game.move(0,1)
      game.move(2,1)
      game.move(0,2)
      game.move(1,0)
      game.move(1,2)
    }
    it 'returns false if the game is not won' do
      expect(game.won?).to be(false)
    end
    it 'returns true if the game is won' do
      game.move(0,2)
      expect(game.won?).to be(true)
    end
  end
end
