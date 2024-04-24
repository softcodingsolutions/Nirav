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
  end
end
