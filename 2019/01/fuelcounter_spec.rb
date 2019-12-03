require_relative 'fuelcounter.rb'

describe FuelCounter do
  describe "#calculate" do
    it "calculates the amount of fuel (including fuel for fuel) for a given mass" do
      expect(FuelCounter::calculate(12)).to eq(2)
      expect(FuelCounter::calculate(14)).to eq(2)
      expect(FuelCounter::calculate(1969)).to eq(966)
      expect(FuelCounter::calculate(100756)).to eq(50346)
    end
  end

  describe "#calculate_fuel_for_input" do
    it "calculates total fuel for our input" do
      expect(FuelCounter::calculate_fuel_for_input).to eq(4940279)
    end
  end
end