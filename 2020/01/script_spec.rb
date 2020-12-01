require_relative 'script.rb'

describe DayOne do
  it "should calculate correctly" do
    expect(described_class.calculate([1721,
      979,
      366,
      299,
      675,
      1456])).to eq(514579)
  end
end