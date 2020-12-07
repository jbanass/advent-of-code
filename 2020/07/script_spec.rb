require_relative 'script.rb'

describe DaySeven do

  before do
    allow(Parser).to receive(:split_on_newline).and_return(input)  
  end
  
  subject { described_class.new }

  let(:input) {
    [
      'light red bags contain 1 bright white bag, 2 muted yellow bags.',
      'dark orange bags contain 3 bright white bags, 4 muted yellow bags.',
      'bright white bags contain 1 shiny gold bag.',
      'muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.',
      'shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.',
      'dark olive bags contain 3 faded blue bags, 4 dotted black bags.',
      'vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.',
      'faded blue bags contain no other bags.',
      'dotted black bags contain no other bags.',
    ]
  }
  
  describe "rulebook" do
    let(:expected) {
      {
        "light red bags" => [
          [1, "bright white bags"],
          [2, "muted yellow bags"]
        ],
        "dark orange bags" => [
          [3, "bright white bags"],
          [4, "muted yellow bags"]
        ],
        "bright white bags" => [
          [1, "shiny gold bags"]
        ],
        "muted yellow bags" => [
          [2, "shiny gold bags"],
          [9, "faded blue bags"]
        ],
        "shiny gold bags" => [
          [1, "dark olive bags"],
          [2, "vibrant plum bags"]
        ],
        "dark olive bags" => [
          [3, "faded blue bags"],
          [4, "dotted black bags"]
        ],
        "vibrant plum bags" => [
          [5, "faded blue bags"],
          [6, "dotted black bags"]
        ],
        "faded blue bags" => nil,
        "dotted black bags" => nil
      }
    }

    it "returns the rulebook" do
      #allow(Parser).to receive(:split_on_newline).and_return(input)
      expect(subject.rulebook).to eq(expected)
    end
  end

  describe "drilldown" do
    it "correctly determines if bag can hold a gold bag" do
      #allow(Parser).to receive(:split_on_newline).and_return(input)
      expect(subject.drilldown("bright white bags")).to eq(true)
    end

    it "correctly determines if bag can hold a gold bag" do
      #allow(Parser).to receive(:split_on_newline).and_return(input)
      expect(subject.drilldown("muted yellow bags")).to eq(true)
    end

    it "correctly determines if bag can hold a gold bag (recursion)" do
      #allow(Parser).to receive(:split_on_newline).and_return(input)
      expect(subject.drilldown("dark orange bags")).to eq(true)
    end

    it "correctly determines if bag can hold a gold bag (recursion)" do
      #allow(Parser).to receive(:split_on_newline).and_return(input)
      expect(subject.drilldown("light red bags")).to eq(true)
    end

    it "correctly determines if bag can hold a gold bag (recursion)" do
      #allow(Parser).to receive(:split_on_newline).and_return(input)
      expect(subject.drilldown("vibrant plum bags")).to eq(false)
    end

    it "correctly determines if bag can hold a gold bag" do
      #allow(Parser).to receive(:split_on_newline).and_return(input)
      expect(subject.drilldown("faded blue bags")).to eq(false)
    end
  end

  describe "parse_rule" do
    context "when rule has contents" do
      let(:rule) { 'light red bags contain 1 bright white bag, 2 muted yellow bags.' }
      let(:expected) {
        [
          'light red bags',
          [
            [1, 'bright white bags'],
            [2, 'muted yellow bags']
          ]
        ]
      }
      it "parses a rule into a key, value pair" do
        expect(subject.parse_rule(rule)).to eq(expected)
      end
    end

    context "when rule has no contents" do
      let(:rule) { 'faded blue bags contain no other bags.' }
      let(:expected) {
        [
          'faded blue bags',
          nil
        ]
      }
      it "parses a rule into a key, value pair" do
        expect(subject.parse_rule(rule)).to eq(expected)
      end
    end
  end

  describe "parse_contents" do
    let(:contents) { '1 bright white bag, 2 muted yellow bags' }
    let(:expected) {
      [
        [1, 'bright white bags'],
        [2, 'muted yellow bags']
      ]
    }

    it "correctly parses contents" do
      expect(subject.parse_contents(contents)).to eq(expected)
    end
  end

end
