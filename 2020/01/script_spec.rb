require_relative 'script.rb'

describe DayOne do
  let(:input) {
    [
      1721,
      979,
      366,
      299,
      675,
      1456
    ]
  }

  describe "#calculate_two" do
    it "should calculate correctly" do
      allow(described_class).to receive(:numbers).and_return(input)

      expect(described_class.calculate_two).to eq(514579)
    end
  end
  
  describe "#calculate_three" do
    it "should calculate correctly" do
      allow(described_class).to receive(:numbers).and_return(input)

      expect(described_class.calculate_three).to eq(241861950)
    end
  end
end
