require_relative 'script.rb'

describe DayNine do

  subject { described_class.new(5) }

  describe "calculate" do
    it "properly calculates" do
      allow(subject).to receive(:input).and_return([
        35,
        20,
        15,
        25,
        47,
        40,
        62,
        55,
        65,
        95,
        102,
        117,
        150,
        182,
        127,
        219,
        299,
        277,
        309,
        576,
      ])
      expect(subject.calculate).to eq(127)
    end
  end

end
