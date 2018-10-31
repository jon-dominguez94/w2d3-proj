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
  end

end
