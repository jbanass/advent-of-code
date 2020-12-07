require_relative 'script.rb'

describe DaySix do

  describe "sum_groups" do
    let(:groups) {
      [
        ['abc'],
        ['a','b','c'],
        ['ab','ac'],
        ['a','a','a','a'],
        ['b']
      ]
    }

    it "correctly sums the answer" do
      expect(described_class.sum_groups(groups)).to eq(6)
    end
  end

  describe "answers_for_group" do
    let(:groups) {
      [
        [['abc'], 3],
        [['a','b','c'], 0],
        [['ab','ac'], 1],
        [['a','a','a','a'], 1],
        [['b'], 1]
      ]
    }

    it "correctly sums answers for a group" do
      groups.each do |group|
        expect(described_class.answers_for_group(group[0])).to eq(group[1])
      end
    end
  end
end
