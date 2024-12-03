require_relative 'script.rb'

describe DayTwo do
  subject { described_class.new }

  let(:input) {
    Parser.split_on_newline('/Users/josephbanass/projects/advent-of-code/2024/02/input_fixture.txt')
  }

  before(:each) do
    allow(subject).to receive(:input).and_return(input)
  end

  describe 'part 1' do
    describe '#calculate' do
      it 'calculates' do
        expect(subject.calculate).to eq(2)
      end
    end

    describe 'is_safe?' do
      it 'reports if safe' do
        [
          '7 6 4 2 1',
          '1 3 6 7 9'
        ].each do |test|
          expect(subject.is_safe?(test)).to eq(true)
        end
      end

      it 'reports if unsafe' do
        [
          '1 2 7 8 9',
          '9 7 6 2 1',
          '1 3 2 4 5',
          '8 6 4 4 1'
        ].each do |test|
          expect(subject.is_safe?(test)).to eq(false)
        end
      end
    end
  end

  describe 'part 2' do
    describe '#calculate2' do
      it 'calculates' do
        expect(subject.calculate2).to eq(4)
      end
    end
  end
end