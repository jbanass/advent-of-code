require_relative 'script.rb'

describe DayOne do
  subject { described_class.new }

  let(:input) {
    [
      199,
      200,
      208,
      210,
      200,
      207,
      240,
      269,
      260,
      263
    ]
  }

  before(:each) do
    allow(subject).to receive(:input).and_return(input)
  end

  describe "#calculate" do
    it "gets the right answer" do
      expect(subject.calculate).to eq(7)
    end
  end

  describe "#calculate_2" do
    it "gets the right answer" do
      expect(subject.calculate_2).to eq(5)
    end
  end
end
