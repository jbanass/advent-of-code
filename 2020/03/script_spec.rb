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

    let(:expected_answer) { 7 }

    it "correctly calculates" do
      expect(described_class.calculate(input)).to eq(expected_answer)
    end
  end
end
