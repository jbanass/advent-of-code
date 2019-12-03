require_relative 'opcode.rb'

describe OpCode do
  describe "#calculate" do
    it "calculates value at final position" do
      expect(OpCode::calculate([1,0,0,0,99])).to eq([2,0,0,0,99])
      expect(OpCode::calculate([2,3,0,3,99])).to eq([2,3,0,6,99])
      expect(OpCode::calculate([2,4,4,5,99,0])).to eq([2,4,4,5,99,9801])
      expect(OpCode::calculate([1,1,1,4,99,5,6,0,99])).to eq([30,1,1,4,2,5,6,0,99])
    end

    it "produces result 19690720 in position 0" do
      expect(OpCode::calculate([1,66,35,3,1,1,2,3,1,3,4,3,1,5,0,3,2,6,1,19,1,19,10,23,2,13,23,27,1,5,27,31,2,6,31,35,1,6,35,39,2,39,9,43,1,5,43,47,1,13,47,51,1,10,51,55,2,55,10,59,2,10,59,63,1,9,63,67,2,67,13,71,1,71,6,75,2,6,75,79,1,5,79,83,2,83,9,87,1,6,87,91,2,91,6,95,1,95,6,99,2,99,13,103,1,6,103,107,1,2,107,111,1,111,9,0,99,2,14,0,0])[0]).to eq(19690720)
    end
  end

  describe "#find_noun_and_verb_to_match" do
    it "finds noun and verb to match 19690720" do
      expect(OpCode::find_noun_and_verb_to_match(19690720)).to eq([66, 35])
    end
  end
end