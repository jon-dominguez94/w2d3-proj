require 'tdd'

RSpec.describe '#my_uniq' do
  context 'when given a valid argument' do
    let(:array) {[1,2,1,3,3]}
    it 'returns an array with uniq values' do
      expect(my_uniq(array)).to eq(array.uniq)
    end
    it 'Does not call the uniq method' do
      expect(array).to_not receive(:uniq)
      my_uniq(array)
    end
  end
  context 'when given an invalid argument' do
    it 'raises an error' do
      expect{my_uniq("a")}.to raise_error(ArgumentError)
    end
  end
end

describe '#two_sum' do
  context 'when given a valid argument' do
    let(:array) {[-1,0,2,-2,1]}
    it "returns array of arrays of correct position" do
      expect(two_sum(array)).to eq([[0, 4], [2, 3]])
    end
  end
  context 'when given an invalid argument' do
    it 'raises an error' do
      expect{my_uniq("a")}.to raise_error(ArgumentError)
    end
  end
end

describe '#my_transpose' do
  context 'when given a valid argument' do
    let(:array) {[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]}
    it 'returns an array with transpose values' do
      expect(my_transpose(array)).to eq(array.transpose)
    end
    it 'Does not call the transpose method' do
      expect(array).to_not receive(:transpose)
      my_transpose(array)
    end
  end
  context 'when given an invalid argument' do
    it 'raises an error' do
      expect{my_transpose("a")}.to raise_error(ArgumentError)
    end
  end
end

describe '#stock' do
  context 'when given a valid argument' do
    let(:array) {[30,350,50,500,200]}
    it 'returns a pair of days' do
      expect(stock(array)).to eq([0,3])
    end
  end
  context 'when given an invalid argument' do
    it 'raises an error' do
      expect{stock("a")}.to raise_error(ArgumentError)
    end
  end
end
