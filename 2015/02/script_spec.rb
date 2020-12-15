require_relative 'script.rb'

describe DayTwo do

  subject { described_class.new }

  describe "parse_line" do
    it "splits properly" do
      expect(subject.parse_line('2x3x4')).to eq([2,3,4])
    end
  end

  describe "surface_area" do
    it "returns surface area" do
      expect(subject.surface_area(2,3,4)).to eq(58)
    end
  end

end
