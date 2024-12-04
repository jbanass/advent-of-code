require_relative 'script.rb'      

describe DayThree do

  subject { described_class.new }

  let(:input) {
    Parser.read_file('/Users/josephbanass/projects/advent-of-code/2024/03/input_fixture.txt')
  }

  before(:each) do
    allow(subject).to receive(:input).and_return(input)
  end

  describe '#calculate' do
    it 'properly calculates' do
      expect(subject.calculate).to eq(161)
    end
  end

  describe '#find_instructions' do
    it 'returns the instruction, and the arguments involved' do
      expect(subject.find_instructions).to match_array([
        [:*, 2, 4],
        [:*, 5, 5],
        [:*, 11, 8],
        [:*, 8, 5]
      ])
    end
  end

  describe '#execute_instruction' do
    it 'executes the instruction' do
      expect(subject.execute_instruction([:*, 2, 4])).to eq(8)
    end
  end
end
