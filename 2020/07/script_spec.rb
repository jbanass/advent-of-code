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
      expect(subject.rulebook).to eq(expected)
    end
  end

  describe "drilldown" do
    it "correctly determines if bag can hold a gold bag" do
      expect(subject.drilldown("bright white bags")).to eq(true)
    end

    it "correctly determines if bag can hold a gold bag" do
      expect(subject.drilldown("muted yellow bags")).to eq(true)
    end

    it "correctly determines if bag can hold a gold bag (recursion)" do
      expect(subject.drilldown("dark orange bags")).to eq(true)
    end

    it "correctly determines if bag can hold a gold bag (recursion)" do
      expect(subject.drilldown("light red bags")).to eq(true)
    end

    it "correctly determines if bag can hold a gold bag (recursion)" do
      expect(subject.drilldown("vibrant plum bags")).to eq(false)
    end

    it "correctly determines if bag can hold a gold bag" do
      expect(subject.drilldown("faded blue bags")).to eq(false)
    end
  end

  describe "drilldown_bag_count" do
    it "gets number of bags in a bag" do
      expect(subject.drilldown_bag_count('shiny gold bags')).to eq(32)
    end

    context "deeper example" do
      let(:input) {
        [
          'shiny gold bags contain 2 dark red bags.',
          'dark red bags contain 2 dark orange bags.',
          'dark orange bags contain 2 dark yellow bags.',
          'dark yellow bags contain 2 dark green bags.',
          'dark green bags contain 2 dark blue bags.',
          'dark blue bags contain 2 dark violet bags.',
          'dark violet bags contain no other bags.',
        ]
      }
      it "handles it fine" do
        expect(subject.drilldown_bag_count('shiny gold bags')).to eq(126)
      end
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
