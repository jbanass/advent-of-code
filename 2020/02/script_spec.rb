require_relative 'script.rb'

describe DayTwo do
  describe "parse" do
    it "returns a parsed array consisting of range, which letter, and the string to check" do
      input = "2-9 c: ccccccccc"

      expect(described_class.parse(input)).to eq([[2,9], 'c', 'ccccccccc'])

    end
  end

  describe "calculate" do
    it "successfully calculates" do
      input = [
        "1-3 a: abcde",
        "1-3 b: cdefg",
        "2-9 c: ccccccccc"
      ]

      expected = {
        "1-3 a: abcde" => true,
        "1-3 b: cdefg" => false,
        "2-9 c: ccccccccc" => false
      }

      result = described_class.calculate(input)

      expect(result).to eq(expected)
      expect(result.length).to eq(expected.length)
    end
  end
end
