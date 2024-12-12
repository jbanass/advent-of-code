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
      expect(subject.calculate).to eq(9)
    end
  end

  describe '#get_xmas_coords_from' do
      # forwards on left means
      # M
      #  A
      #   S

      # forwards on right means
      #    S
      #   A
      #  M
    let(:x) { nil }
    let(:y) { nil }

    context 'where left mas is forwards and right mas is forwards' do
      let(:x) { 2 }
      let(:y) { 1 }
      
      it 'returns the left mas coords then the right mas coords' do
        expect(subject.get_xmas_coords_from(y, x)).to match_array([
          [
            [
              [0, 1],
              [1, 2],
              [2, 3]
            ],
            [
              [2, 1],
              [1, 2],
              [0, 3]
            ]            
          ]
        ])
      end
    end

    # left
    # S
    #  A
    #   M

    # right
    #   S
    #  A
    # M
    context 'were left mas is backwards and right mas is forwards' do
      let(:x) { 7 }
      let(:y) { 2 }
      
      it 'returns the left mas coords then the right mas coords' do
        expect(subject.get_xmas_coords_from(y, x)).to match_array([
          [
            [
              [3, 8],              
              [2, 7],
              [1, 6],
            ],
            [
              [3, 6],
              [2, 7],
              [1, 8]
            ]            
          ]
        ])
      end
    end

    # left
    # S
    #  A
    #   M

    # right
    #   M
    #  A
    # S
    context 'where left mas is backwards and right mas is backwards' do
      let(:x) { 4 }
      let(:y) { 3 }

      it 'returns the left mas coords then the right mas coords' do
        expect(subject.get_xmas_coords_from(y, x)).to match_array([
          [
            [
              [4, 5],
              [3, 4],
              [2, 3]
            ],
            [
              [2, 5],
              [3, 4],
              [4, 3]
            ]            
          ]
        ])
      end
    end

    # forwards on left means
      # M
      #  A
      #   S

    # right
    #   M
    #  A
    # S
    context 'where left mas is forwards and right mas is backward' do
      let(:x) { 6 }
      let(:y) { 2 }

      it 'returns the left mas coords then the right mas coords' do
        expect(subject.get_xmas_coords_from(y, x)).to match_array([
          [
            [
              [1, 5],
              [2, 6],
              [3, 7]
            ],
            [
              [1, 7],
              [2, 6],
              [3, 5]
            ]            
          ]
        ])
      end
    end
  end
end
