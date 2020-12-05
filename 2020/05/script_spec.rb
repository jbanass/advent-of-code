require_relative 'script.rb'

describe DayFive do
  let(:input) {
    'FBFBBFFRLR'
  }

  describe "calculate_seat_id" do
    it "successfully calculates" do
      expect(described_class.calculate_seat_id(input)).to eq(357)
    end
  end

  describe "solve_row" do
    it "successfully calculates" do
      expect(described_class.solve_row(input)).to eq(44)
    end

    it "successfully calculates" do
      expect(described_class.solve_row('BFFFBBFRRR')).to eq(70)
    end

    it "successfully calculates" do
      expect(described_class.solve_row('FFFBBBFRRR')).to eq(14)
    end

    it "successfully calculates" do
      expect(described_class.solve_row('BBFFBBFRLL')).to eq(102)
    end
  end

  describe "solve_column" do
    it "successfuly calculates" do
      expect(described_class.solve_column(input)).to eq(5)
    end

    it "successfuly calculates" do
      expect(described_class.solve_column('BFFFBBFRRR')).to eq(7)
    end

    it "successfuly calculates" do
      expect(described_class.solve_column('FFFBBBFRRR')).to eq(7)
    end

    it "successfuly calculates" do
      expect(described_class.solve_column('BBFFBBFRLL')).to eq(4)
    end
  end
end
