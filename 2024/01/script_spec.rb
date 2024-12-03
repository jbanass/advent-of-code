require_relative 'script.rb'

describe DayOne do
  subject { described_class.new }

  let(:input) {
    Parser.split_on_newline('/Users/josephbanass/projects/advent-of-code/2024/01/input_fixture.txt')
  }

  before(:each) do
    allow(subject).to receive(:input).and_return(input)
  end

  describe '#calculate' do
    it 'calculates' do
      expect(subject.calculate).to eq(11)
    end
  end

  describe '#calculate2' do
    it 'calculates' do
      expect(subject.calculate2).to eq(31)
    end
  end
end
