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

      it 'raises error when multiple integers passed as argument' do
        expect { described_class.add(1, 2) }.to raise_error(ArgumentError, /wrong number of arguments/)
      end

      it 'raises error when multiple string arguments passed' do
        expect { described_class.add('1', '2') }.to raise_error(ArgumentError, /wrong number of arguments/)
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

    context 'when string contains valid new line character' do
      it 'returns sum of numbers' do
        expect(described_class.add("1\n2,3")).to eq 6
      end
    end

    context 'when string contains invalid new line char' do
      it "return error when invalid \n passed at end" do
        expect{ described_class.add("1,\n") }.to raise_error(RuntimeError, 'Invalid input')
      end

      it "return error when invalid \n passed at beginning" do
        expect { described_class.add("1,\n, 2") }.to raise_error(RuntimeError, 'Invalid input')
      end
    end

    context 'when argument has different delimiter' do
      it 'should return the sum of numbers' do
        expect(described_class.add("//;\n1;2")).to eq 3
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
