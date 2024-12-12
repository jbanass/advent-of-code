require_relative 'script.rb'      

describe DayFour do

  subject { described_class.new }

  let(:input) {
    Parser.split_on_newline('/Users/josephbanass/projects/advent-of-code/2024/04/input_fixture.txt')
  }

  before(:each) do
    allow(subject).to receive(:input).and_return(input)
  end

  describe '#calculate' do
    it 'calculates' do
      expect(subject.calculate).to eq(18)
    end
  end

  describe '#get_xmas_coords_from' do
    let(:x) { nil }
    let(:y) { nil }
    context 'when xmas is backwards' do
      let(:x) { 4 }
      let(:y) { 1 }

      it 'finds xmas and returns the coords' do
        expect(subject.get_xmas_coords_from(y, x)).to include([
          [1, 4],
          [1, 3],
          [1, 2],
          [1, 1]
        ])
      end
    end

    context 'when xmas is forwards' do
      let(:x) { 5 }
      let(:y) { 0 }

      it 'finds xmas and returns the coords' do
        expect(subject.get_xmas_coords_from(y, x)).to include([
          [0, 5],
          [0, 6],
          [0, 7],
          [0, 8]
        ])
      end
    end

    context 'when xmas is up left' do
      let(:x) { 6 }
      let(:y) { 5 }

      it 'finds xmas and returns the coords' do
        expect(subject.get_xmas_coords_from(y, x)).to include([
          [5, 6],
          [4, 5],
          [3, 4],
          [2, 3]
        ])
      end
    end

    context 'when xmas is up' do
      let(:x) { 6 }
      let(:y) { 4 }

      it 'finds xmas and returns the coords' do
        expect(subject.get_xmas_coords_from(y, x)).to include([
          [4, 6],
          [3, 6],
          [2, 6],
          [1, 6]
        ])
      end
    end

    context 'when xmas is down' do
      let(:x) { 9 }
      let(:y) { 3 }

      it 'finds xmas and returns the coords' do
        expect(subject.get_xmas_coords_from(y, x)).to include([
          [3, 9],
          [4, 9],
          [5, 9],
          [6, 9]
        ])
      end
    end

    context 'when xmas is up right' do
      let(:x) { 0 }
      let(:y) { 5 }

      it 'finds xmas and returns the coords' do
        expect(subject.get_xmas_coords_from(y, x)).to include([
          [5, 0],
          [4, 1],
          [3, 2],
          [2, 3]
        ])
      end
    end

    context 'when xmas is down right' do
      let(:x) { 4 }
      let(:y) { 0 }

      it 'finds xmas and returns the coords' do
        expect(subject.get_xmas_coords_from(y, x)).to include([
          [0, 4],
          [1, 5],
          [2, 6],
          [3, 7]
        ])
      end
    end

    context 'when xmas is down left' do
      let(:x) { 9 }
      let(:y) { 3 }

      it 'finds xmas and returns the coords' do
        expect(subject.get_xmas_coords_from(y, x)).to include([
          [3, 9],
          [4, 8],
          [5, 7],
          [6, 6]
        ])
      end
    end
  end
end
