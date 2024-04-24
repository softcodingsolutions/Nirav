require_relative '../calculator'
describe Calculator do
  describe '.add' do
    context 'when argument is valid' do
      it 'should accept only single string argument' do
        expect { described_class.add('1') }.not_to raise_error(ArgumentError, 'Please use only single string')
      end
    end

    context "when argument is not valid" do
      it 'should raise an error if argument type is different' do
        expect { described_class.add(123) }.to raise_error(ArgumentError, 'Please use only single string')
      end
    end

    context 'when argument is an empty string' do
      it 'should return 0' do
        expect(described_class.add('')).to eq 0
      end
    end

    context 'when argument contains the valid numbers' do
      it 'should returns sum of numbers' do
        expect(described_class.add('1')).to eq 1
      end

      it 'should perform addition on numbers' do
        expect(described_class.add('1,2,3')).to eq 6
      end
    end

    context 'when string has negative numbers' do
      it 'raises exception with message' do
        expect { described_class.add('-1,2,-3') }.to raise_error(RuntimeError, 'Negative numbers not allowed: -1,-3')
      end

      it 'does raise an exception with negative number and different delimiter' do
        expect { described_class.add("//;\n1;2;-3") }.to raise_error(RuntimeError, 'Negative numbers not allowed: -3')
      end
    end
  end
end
