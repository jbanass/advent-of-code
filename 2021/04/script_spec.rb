require_relative 'script.rb'

describe DayFour do
  subject { described_class.new }

  before(:each) do
    allow(subject).to receive(:input).and_return(input)
  end

  let(:input) {
    [
      [
        '7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1'
      ],
      [
        "22 13 17 11  0",
         "8  2 23  4 24",
        "21  9 14 16  7",
         "6 10  3 18  5",
         "1 12 20 15 19"
      ],
      [
        " 3 15  0  2 22",
        " 9 18 13 17  5",
        "19  8  7 25 23",
        "20 11 10 24  4",
        "14 21 16 12  6",
      ],
      [
        "14 21 17 24  4",
        "10 16 15  9 19",
        "18  8 23 26 20",
        "22 11 13  6  5",
        " 2  0 12  3  7"
      ]
    ]
  }

  describe "#numbers_to_call" do
    it "returns the bingo numbers to call" do
      expect(subject.numbers_to_call).to eq([
        7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1
      ])
    end
  end

  describe "#fresh_bingo_boards" do
    let(:expected) {
      [
        [
          [
            { number: 22, checked: false }, { number: 13, checked: false }, { number: 17, checked: false }, { number: 11, checked: false }, { number: 0, checked: false }
          ],
          [
            { number: 8, checked: false }, { number: 2, checked: false }, { number: 23, checked: false }, { number: 4, checked: false }, { number: 24, checked: false }
          ],
          [
            { number: 21, checked: false }, { number: 9, checked: false }, { number: 14, checked: false }, { number: 16, checked: false }, { number: 7, checked: false }
          ],
          [
            { number: 6, checked: false }, { number: 10, checked: false }, { number: 3, checked: false }, { number: 18, checked: false }, { number: 5, checked: false }
          ],
          [
            { number: 1, checked: false }, { number: 12, checked: false }, { number: 20, checked: false }, { number: 15, checked: false }, { number: 19, checked: false }
          ]          
        ],
        [
          [
            { number: 3, checked: false }, { number: 15, checked: false }, { number: 0, checked: false }, { number: 2, checked: false }, { number: 22, checked: false }
          ],
          [
            { number: 9, checked: false }, { number: 18, checked: false }, { number: 13, checked: false }, { number: 17, checked: false }, { number: 5, checked: false }
          ],
          [
            { number: 19, checked: false }, { number: 8, checked: false }, { number: 7, checked: false }, { number: 25, checked: false }, { number: 23, checked: false }
          ],
          [
            { number: 20, checked: false }, { number: 11, checked: false }, { number: 10, checked: false }, { number: 24, checked: false }, { number: 4, checked: false }
          ],
          [
            { number: 14, checked: false }, { number: 21, checked: false }, { number: 16, checked: false }, { number: 12, checked: false }, { number: 6, checked: false }
          ]
        ],
        [
          [
            { number: 14, checked: false }, { number: 21, checked: false }, { number: 17, checked: false }, { number: 24, checked: false }, { number: 4, checked: false }
          ],
          [
            { number: 10, checked: false }, { number: 16, checked: false }, { number: 15, checked: false }, { number: 9, checked: false }, { number: 19, checked: false }
          ],
          [
            { number: 18, checked: false }, { number: 8, checked: false }, { number: 23, checked: false }, { number: 26, checked: false }, { number: 20, checked: false }
          ],
          [
            { number: 22, checked: false }, { number: 11, checked: false }, { number: 13, checked: false }, { number: 6, checked: false }, { number: 5, checked: false }
          ],
          [
            { number: 2, checked: false }, { number: 0, checked: false }, { number: 12, checked: false }, { number: 3, checked: false }, { number: 7, checked: false }
          ]
        ]
      ]
    }

    it "returns a fresh set of bingo boards" do
      expect(subject.fresh_bingo_boards).to eq(expected)
    end
  end

  describe "#check_boards" do
    let(:input) {
      [
        [
          '7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1'
        ],
        [
          "22 13 17 11  0",
          " 8  2 23  4 24",
          "21  9 14 16  7",
          " 6 10  3 18  5",
          " 1 12 20 15 19"
          
        ],
        [
          " 3 15  0  2 22",
          " 9 18 13 17  37",
          "19  8  7 25 23",
          "20 11 10 24  4",
          "14 21 16 12  6"
        ],
        [
          "14 21 17 24  4",
          "10 16 15  9 19",
          "18  8 23 26 20",
          "22 11 13  6  5",
          " 2  0 12  3  37"
        ]
      ]
    }

    let(:expected) {
      [
        [
          [
            { number: 22, checked: false }, { number: 13, checked: false }, { number: 17, checked: false }, { number: 11, checked: false }, { number: 0, checked: false }
          ],
          [
            { number: 8, checked: false }, { number: 2, checked: false }, { number: 23, checked: false }, { number: 4, checked: false }, { number: 24, checked: false }
          ],
          [
            { number: 21, checked: false }, { number: 9, checked: false }, { number: 14, checked: false }, { number: 16, checked: false }, { number: 7, checked: false }
          ],
          [
            { number: 6, checked: false }, { number: 10, checked: false }, { number: 3, checked: false }, { number: 18, checked: false }, { number: 5, checked: false }
          ],
          [
            { number: 1, checked: false }, { number: 12, checked: false }, { number: 20, checked: false }, { number: 15, checked: false }, { number: 19, checked: false }
          ]          
        ],
        [
          [
            { number: 3, checked: false }, { number: 15, checked: false }, { number: 0, checked: false }, { number: 2, checked: false }, { number: 22, checked: false }
          ],
          [
            { number: 9, checked: false }, { number: 18, checked: false }, { number: 13, checked: false }, { number: 17, checked: false }, { number: 37, checked: true }
          ],
          [
            { number: 19, checked: false }, { number: 8, checked: false }, { number: 7, checked: false }, { number: 25, checked: false }, { number: 23, checked: false }
          ],
          [
            { number: 20, checked: false }, { number: 11, checked: false }, { number: 10, checked: false }, { number: 24, checked: false }, { number: 4, checked: false }
          ],
          [
            { number: 14, checked: false }, { number: 21, checked: false }, { number: 16, checked: false }, { number: 12, checked: false }, { number: 6, checked: false }
          ]
        ],
        [
          [
            { number: 14, checked: false }, { number: 21, checked: false }, { number: 17, checked: false }, { number: 24, checked: false }, { number: 4, checked: false }
          ],
          [
            { number: 10, checked: false }, { number: 16, checked: false }, { number: 15, checked: false }, { number: 9, checked: false }, { number: 19, checked: false }
          ],
          [
            { number: 18, checked: false }, { number: 8, checked: false }, { number: 23, checked: false }, { number: 26, checked: false }, { number: 20, checked: false }
          ],
          [
            { number: 22, checked: false }, { number: 11, checked: false }, { number: 13, checked: false }, { number: 6, checked: false }, { number: 5, checked: false }
          ],
          [
            { number: 2, checked: false }, { number: 0, checked: false }, { number: 12, checked: false }, { number: 3, checked: false }, { number: 37, checked: true }
          ]
        ]
      ]
    }

    it "checks the proper number on each board" do
      subject.check_boards(37)
      expect(subject.bingo_boards).to eq(expected)
    end

    it "returns affected boards" do
      expect(subject.check_boards(37)).to eq([1,2])
    end
  end

  describe "#find_bingo" do
    context "when victory is horizontal" do
      let(:bingo_boards_horizontal_win) {
        [
          [
            [
              { number: 22, checked: false }, { number: 13, checked: false }, { number: 17, checked: false }, { number: 11, checked: false }, { number: 0, checked: false }
            ],
            [
              { number: 8, checked: false }, { number: 2, checked: false }, { number: 23, checked: false }, { number: 4, checked: false }, { number: 24, checked: false }
            ],
            [
              { number: 21, checked: false }, { number: 9, checked: false }, { number: 14, checked: false }, { number: 16, checked: false }, { number: 7, checked: false }
            ],
            [
              { number: 6, checked: false }, { number: 10, checked: false }, { number: 3, checked: false }, { number: 18, checked: false }, { number: 5, checked: false }
            ],
            [
              { number: 1, checked: false }, { number: 12, checked: false }, { number: 20, checked: false }, { number: 15, checked: false }, { number: 19, checked: false }
            ]          
          ],
          [
            [
              { number: 3, checked: false }, { number: 15, checked: false }, { number: 0, checked: false }, { number: 2, checked: false }, { number: 22, checked: false }
            ],
            [
              { number: 9, checked: false }, { number: 18, checked: false }, { number: 13, checked: false }, { number: 17, checked: false }, { number: 37, checked: true }
            ],
            [
              { number: 19, checked: false }, { number: 8, checked: false }, { number: 7, checked: false }, { number: 25, checked: false }, { number: 23, checked: false }
            ],
            [
              { number: 20, checked: true }, { number: 11, checked: true }, { number: 10, checked: true }, { number: 24, checked: true }, { number: 4, checked: true }
            ],
            [
              { number: 14, checked: false }, { number: 21, checked: false }, { number: 16, checked: false }, { number: 12, checked: false }, { number: 6, checked: false }
            ]
          ],
          [
            [
              { number: 14, checked: false }, { number: 21, checked: false }, { number: 17, checked: false }, { number: 24, checked: false }, { number: 4, checked: false }
            ],
            [
              { number: 10, checked: false }, { number: 16, checked: false }, { number: 15, checked: false }, { number: 9, checked: false }, { number: 19, checked: false }
            ],
            [
              { number: 18, checked: false }, { number: 8, checked: false }, { number: 23, checked: false }, { number: 26, checked: false }, { number: 20, checked: false }
            ],
            [
              { number: 22, checked: false }, { number: 11, checked: false }, { number: 13, checked: false }, { number: 6, checked: false }, { number: 5, checked: false }
            ],
            [
              { number: 2, checked: false }, { number: 0, checked: false }, { number: 12, checked: false }, { number: 3, checked: false }, { number: 37, checked: true }
            ]
          ]
        ]
      }

      it "finds winning bingo board index" do
        allow(subject).to receive(:bingo_boards).and_return(bingo_boards_horizontal_win)
        expect(subject.find_bingo([1,2])).to eq([1])
      end
    end

    context "when victory is vertical" do
      let(:bingo_boards_vertical_win) {
        [
          [
            [
              { number: 22, checked: false }, { number: 13, checked: false }, { number: 17, checked: false }, { number: 11, checked: false }, { number: 0, checked: false }
            ],
            [
              { number: 8, checked: false }, { number: 2, checked: false }, { number: 23, checked: false }, { number: 4, checked: false }, { number: 24, checked: false }
            ],
            [
              { number: 21, checked: false }, { number: 9, checked: false }, { number: 14, checked: false }, { number: 16, checked: false }, { number: 7, checked: false }
            ],
            [
              { number: 6, checked: false }, { number: 10, checked: false }, { number: 3, checked: false }, { number: 18, checked: false }, { number: 5, checked: false }
            ],
            [
              { number: 1, checked: false }, { number: 12, checked: false }, { number: 20, checked: false }, { number: 15, checked: false }, { number: 19, checked: false }
            ]          
          ],
          [
            [
              { number: 3, checked: false }, { number: 15, checked: false }, { number: 0, checked: false }, { number: 2, checked: true }, { number: 22, checked: false }
            ],
            [
              { number: 9, checked: false }, { number: 18, checked: false }, { number: 13, checked: false }, { number: 17, checked: true }, { number: 37, checked: true }
            ],
            [
              { number: 19, checked: false }, { number: 8, checked: false }, { number: 7, checked: false }, { number: 25, checked: true }, { number: 23, checked: false }
            ],
            [
              { number: 20, checked: false }, { number: 11, checked: false }, { number: 10, checked: false }, { number: 24, checked: true }, { number: 4, checked: false }
            ],
            [
              { number: 14, checked: false }, { number: 21, checked: false }, { number: 16, checked: false }, { number: 12, checked: true }, { number: 6, checked: false }
            ]
          ],
          [
            [
              { number: 14, checked: false }, { number: 21, checked: false }, { number: 17, checked: false }, { number: 24, checked: false }, { number: 4, checked: false }
            ],
            [
              { number: 10, checked: false }, { number: 16, checked: false }, { number: 15, checked: false }, { number: 9, checked: false }, { number: 19, checked: false }
            ],
            [
              { number: 18, checked: false }, { number: 8, checked: false }, { number: 23, checked: false }, { number: 26, checked: false }, { number: 20, checked: false }
            ],
            [
              { number: 22, checked: false }, { number: 11, checked: false }, { number: 13, checked: false }, { number: 6, checked: false }, { number: 5, checked: false }
            ],
            [
              { number: 2, checked: false }, { number: 0, checked: false }, { number: 12, checked: false }, { number: 3, checked: false }, { number: 37, checked: true }
            ]
          ]
        ]
      }

      it "finds winning bingo board index" do
        allow(subject).to receive(:bingo_boards).and_return(bingo_boards_vertical_win)
        expect(subject.find_bingo([1,2])).to eq([1])
      end
    end
  end

  describe "#sum_unchecked" do
    let(:winning_board_scenario) {
      [
        [
          [
            { number: 22, checked: false }, { number: 13, checked: false }, { number: 17, checked: false }, { number: 11, checked: false }, { number: 0, checked: false }
          ],
          [
            { number: 8, checked: false }, { number: 2, checked: false }, { number: 23, checked: false }, { number: 4, checked: false }, { number: 24, checked: false }
          ],
          [
            { number: 21, checked: false }, { number: 9, checked: false }, { number: 14, checked: false }, { number: 16, checked: false }, { number: 7, checked: false }
          ],
          [
            { number: 6, checked: false }, { number: 10, checked: false }, { number: 3, checked: false }, { number: 18, checked: false }, { number: 5, checked: false }
          ],
          [
            { number: 1, checked: false }, { number: 12, checked: false }, { number: 20, checked: false }, { number: 15, checked: false }, { number: 19, checked: false }
          ]          
        ],
        [
          [
            { number: 3, checked: false }, { number: 15, checked: false }, { number: 0, checked: false }, { number: 2, checked: false }, { number: 22, checked: false }
          ],
          [
            { number: 9, checked: false }, { number: 18, checked: false }, { number: 13, checked: false }, { number: 17, checked: false }, { number: 5, checked: false }
          ],
          [
            { number: 19, checked: false }, { number: 8, checked: false }, { number: 7, checked: false }, { number: 25, checked: false }, { number: 23, checked: false }
          ],
          [
            { number: 20, checked: false }, { number: 11, checked: false }, { number: 10, checked: false }, { number: 24, checked: false }, { number: 4, checked: false }
          ],
          [
            { number: 14, checked: false }, { number: 21, checked: false }, { number: 16, checked: false }, { number: 12, checked: false }, { number: 6, checked: false }
          ]
        ],
        [
          [
            { number: 14, checked: true }, { number: 21, checked: true }, { number: 17, checked: true }, { number: 24, checked: true }, { number: 4, checked: true }
          ],
          [
            { number: 10, checked: false }, { number: 16, checked: false }, { number: 15, checked: false }, { number: 9, checked: true }, { number: 19, checked: false }
          ],
          [
            { number: 18, checked: false }, { number: 8, checked: false }, { number: 23, checked: true }, { number: 26, checked: false }, { number: 20, checked: false }
          ],
          [
            { number: 22, checked: false }, { number: 11, checked: true }, { number: 13, checked: false }, { number: 6, checked: false }, { number: 5, checked: true }
          ],
          [
            { number: 2, checked: true }, { number: 0, checked: true }, { number: 12, checked: false }, { number: 3, checked: false }, { number: 7, checked: true }
          ]
        ]
      ]
    }
    it "sums the unchecked items on board" do
      allow(subject).to receive(:bingo_boards).and_return(winning_board_scenario)
      expect(subject.sum_unchecked(2)).to eq(188)
    end
  end

  describe "#calculate" do
    it 'correctly returns the value' do
      expect(subject.calculate).to eq(4512)
    end
  end

  describe "#calculate_2" do
    it 'correctly returns the value' do
      expect(subject.calculate_2).to eq(1924)
    end
  end

end
