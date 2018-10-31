require 'tdd'

Rspec.describe '#my_uniq' do
  context 'when given a valid argument' do
    it 'returns an array with uniq values' do
      expect(my_uniq([1,2,1,3,3])).to eq([1,2,1,3,3].uniq)
    end
  end
  context 'when given an invalid argument' do
    it 'raises an error' do
      expect{my_uniq("a")}.to raise_error(ArgumentError)
    end
  end
end
