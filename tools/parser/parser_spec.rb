require_relative 'parser.rb'

describe Parser do
  describe "split_on_newline" do
    let(:file_path) { 'fixtures/split_on_newlines.txt' }

    it "returns an array consisting of a line per index" do
      expect(described_class.split_on_newline(file_path)).to eq(
        %w(
          a
          b
          c
          d
          e
          f
          g
        )
      )
    end
  end

  describe "split_on_consecutive_newlines" do
    let(:file_path) { 'fixtures/split_on_consecutive_newlines.txt' }

    it "returns an array of arrays, each index containing multiple lines" do
      expect(described_class.split_on_consecutive_newlines(file_path)).to eq(
        [
          ['a','b','c','d'],
          ['e','f','g']
        ]
      )
    end
  end
end
