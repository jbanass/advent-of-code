require_relative 'script.rb'

describe DayOne do
  describe "#calculate_two" do
    it "should calculate correctly" do
      expect(described_class.calculate_two([1721,
        979,
        366,
        299,
        675,
        1456])).to eq(514579)
    end
  end
  
  describe "#calculate_three" do
    it "should calculate correctly" do
      expect(described_class.calculate_three([1721,
        979,
        366,
        299,
        675,
        1456])).to eq(241861950)
    end
  end


end
