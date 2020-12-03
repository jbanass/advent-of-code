require_relative "script.rb"
require 'pry'

describe DayThree do
  describe "#calculate" do
    let(:input) {
      %w(
        ..##.......
        #...#...#..
        .#....#..#.
        ..#.#...#.#
        .#...##..#.
        ..#.##.....
        .#.#.#....#
        .#........#
        #.##...#...
        #...##....#
        .#..#...#.#
      )
    }

    context "when slope is right 3 down 1" do
      let(:expected_answer) { 7 }

      it "correctly calculates" do
        expect(described_class.calculate(input, 3, 1)).to eq(expected_answer)
      end
    end
    

    context "when slope is right 1 down 1" do
      let(:expected_answer) { 2 }
      it "correctly calculates" do
        expect(described_class.calculate(input, 1, 1)).to eq(expected_answer)
      end
    end

    context "when slope is right 5 down 1" do
      let(:expected_answer) { 3 }
      it "correctly calculates" do
        expect(described_class.calculate(input, 5, 1)).to eq(expected_answer)
      end
    end

    context "when slope is right 7 down 1" do
      let(:expected_answer) { 4 }
      it "correctly calculates" do
        expect(described_class.calculate(input, 7, 1)).to eq(expected_answer)
      end
    end

    context "when slope is right 1 down 2" do
      let(:expected_answer) { 2 }
      it "correctly calculates" do
        expect(described_class.calculate(input, 1, 2)).to eq(expected_answer)
      end
    end
  end
end
