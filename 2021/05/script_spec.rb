require_relative 'script.rb'

describe DayFive do
  subject { described_class.new }

  let(:input) {
    [
      '0,9 -> 5,9',
      '9,4 -> 3,4',
      '2,2 -> 2,1',
      '7,0 -> 7,4',
      '6,4 -> 2,0',
      '0,9 -> 2,9',
      '3,4 -> 1,4',
      '0,0 -> 8,8',
      '5,5 -> 8,2',
      '8,0 -> 0,8'
    ]
  }

  before(:each) do
    allow(subject).to receive(:input).and_return(input)
  end

  describe "#hydrothermal_vent_locations" do
    it "returns a hash of hydrothermal vent locations" do
      expect(subject.hydrothermal_vent_locations).to eq(
        {
          7 => {
            0 => 1,
            1 => 1,
            2 => 1,
            3 => 1,
            4 => 2
          },
          2 => {
            1 => 1,
            2 => 1,
            4 => 1,
            9 => 2
          },
          1 => {
            4 => 1,
            9 => 2
          },
          3 => {
            4 => 2,
            9 => 1,
          },
          4 => {
            4 => 1,
            9 => 1
          },
          5 => {
            4 => 1,
            9 => 1
          },
          6 => {
            4 => 1
          },
          8 => {
            4 => 1
          },
          9 => {
            4 => 1
          },
          0 => {
            9 => 2
          }
        }
      )

        #  0123456789
        #0 .......1..
        #1 ..1....1..
        #2 ..1....1..
        #3 .......1..
        #4 .112111211
        #5 ..........
        #6 ..........
        #7 ..........
        #8 ..........
        #9 222111....

    end
  end

  describe "#hydrothermal_vent_locations_2" do
    it "returns a hash of hydrothermal vent locations" do
      expect(subject.hydrothermal_vent_locations_2).to eq(
        {
          0 => {
            0 => 1,
            8 => 1,
            9 => 2
          },
          1 => {
            1 => 1,
            4 => 1,
            7 => 1,
            9 => 2
          },
          2 => {
            0 => 1,
            1 => 1,
            2 => 2,
            4 => 1,
            6 => 1,
            9 => 2
          },
          3 => {
            1 => 1,
            3 => 1,
            4 => 2,
            5 => 1,
            9 => 1
          },
          4 => {
            2 => 1,
            4 => 3,
            9 => 1
          },
          5 => {
            3 => 2,
            4 => 1,
            5 => 2,
            9 => 1
          },
          6 => {
            2 => 1,
            4 => 3,
            6 => 1
          },
          7 => {
            0 => 1,
            1 => 2,
            2 => 1,
            3 => 2,
            4 => 2,
            7 => 1
          },
          8 => {
            0 => 1,
            2 => 1,
            4 => 1,
            8 => 1
          },
          9 => {
            4 => 1
          }
        }
      )

        #  0123456789
        #0 1.1....11. 
        #1 .111...2.. 
        #2 ..2.1.111. 
        #3 ...1.2.2.. 
        #4 .112313211 
        #5 ...1.2....
        #6 ..1...1...
        #7 .1.....1..
        #8 1.......1.
        #9 222111....

    end
  end

  describe "#calculate" do
    it "returns coordinates that have two or more overlaps" do
      expect(subject.calculate).to eq(5)
    end
  end

  describe "#calculate_2" do
    it "returns coordinates that have two or more overlaps" do
      expect(subject.calculate_2).to eq(12)
    end
  end

end
