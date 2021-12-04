require_relative 'script.rb'

describe DayThree do
  subject { described_class.new }

  let(:input) { 
    [
      '00100',
      '11110',
      '10110',
      '10111',
      '10101',
      '01111',
      '00111',
      '11100',
      '10000',
      '11001',
      '00010',
      '01010'
    ]
  }

  before(:each) do
    allow(subject).to receive(:input).and_return(input)
  end

  describe "#gamma_rate_binary" do
    it "correctly returns the binary result" do
      expect(subject.gamma_rate_binary).to eq('10110')
    end
  end

  describe "#gamma_rate_decimal" do
    it "correctly returns the decimal result" do
      expect(subject.gamma_rate_decimal).to eq(22)
    end
  end

  describe "#epsilon_rate_binary" do
    it "correctly returns the binary result" do
      expect(subject.epsilon_rate_binary).to eq('01001')
    end
  end

  describe "#epsilon_rate_decimal" do
    it "correctly returns the decimal result" do
      expect(subject.epsilon_rate_decimal).to eq(9)
    end
  end

  describe "#calculate" do
    it "correctly returns the result" do
      expect(subject.calculate).to eq(198)
    end
  end

  describe "#oxygen_generator_rating_binary" do
    it "correctly returns the binary" do
      expect(subject.oxygen_generator_rating_binary).to eq('10111')
    end
  end

  describe "#oxygen_generator_rating_decimal" do
    it "correctly returns the decimal" do
      expect(subject.oxygen_generator_rating_decimal).to eq(23)
    end
  end

  describe "#co2_scrubber_rating_binary" do
    it "correctly returns the binary" do
      expect(subject.co2_scrubber_rating_binary).to eq('01010')
    end
  end

  describe "#co2_scrubber_rating_decimal" do
    it "correctly returns the decimal" do
      expect(subject.co2_scrubber_rating_decimal).to eq(10)
    end
  end

  describe "#calculate_2" do
    it "correctly returns the result" do
      expect(subject.calculate_2).to eq(230)
    end
  end

  describe "#get_common_positions" do
    let(:expected) {
      [
        {"0"=>5, "1"=>7},
        {"0"=>7, "1"=>5},
        {"1"=>8, "0"=>4},
        {"0"=>5, "1"=>7},
        {"0"=>7, "1"=>5}
      ]
    }

    it "returns a data structure describing which positions had which most and least digit" do
      expect(subject.get_common_positions).to eq(expected)
    end
  end

end
