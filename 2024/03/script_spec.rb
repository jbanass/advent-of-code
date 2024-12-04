require_relative 'script.rb'      

describe DayThree do

  subject { described_class.new }

  before(:each) do
    allow(subject).to receive(:input).and_return(input)
  end

  describe '#calculate' do
    let(:input) {
      Parser.read_file('/Users/josephbanass/projects/advent-of-code/2024/03/input_fixture_part_1.txt')
    }

    it 'properly calculates' do
      expect(subject.calculate).to eq(161)
    end
  end

  describe '#calculate2' do
    let(:input) {
      Parser.read_file('/Users/josephbanass/projects/advent-of-code/2024/03/input_fixture_part_2.txt')
    }

    it 'properly calculates' do
      expect(subject.calculate2).to eq(48)
    end
  end
end
