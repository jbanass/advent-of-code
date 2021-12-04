require_relative 'script.rb'

describe DayTwo do
  subject { described_class.new }

  let(:input) {
    [
      'forward 5',
      'down 5',
      'forward 8',
      'up 3',
      'down 8',
      'forward 2'
    ]
  }

  before(:each) do
    allow(subject).to receive(:input).and_return(input)
  end

  describe "#calculate" do
    it "correctly reports back the result" do
      expect(subject.calculate).to eq(150)
    end
  end

  describe "#calculate_2" do
    it "correctly reports back the result" do
      expect(subject.calculate_2).to eq(900)
    end
  end

  describe "#transformed_input" do
    let(:expected) {
      [
        {
          direction: :forward,
          units: 5
        },
        {
          direction: :down,
          units: 5
        },
        {
          direction: :forward,
          units: 8
        },
        {
          direction: :up,
          units: 3
        },
        {
          direction: :down,
          units: 8
        },
        {
          direction: :forward,
          units: 2
        }
      ]
    }

    it "returns the transformed input as expected" do
      expect(subject.transformed_input).to eq(expected)
    end
  end
end
