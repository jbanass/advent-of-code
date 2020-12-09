require_relative 'script.rb'

describe DayEight do

  subject { described_class.new }

  let(:input) { 
    [
      'nop +0',
      'acc +1',
      'jmp +4',
      'acc +3',
      'jmp -3',
      'acc -99',
      'acc +1',
      'jmp -4',
      'acc +6',
    ]
  }

  describe "#calculate" do
    it "properly calculates" do
      allow(subject).to receive(:default_input).and_return(input)
      expect{ 
        subject.calculate
      }.to raise_error(DayEight::InfiniteLoopException, '5')
    end
  end

  describe "parse_operation" do
    let(:nooperation) { "nop +0" }
    let(:accoperation) { "acc +8" }
    let(:jmpoperation) { "jmp -3" }

    it "correctly parses noop" do
      expect(subject.parse_operation(nooperation)).to eq([:nop, :+, 0])
    end

    it "correctly parses acc" do
      expect(subject.parse_operation(accoperation)).to eq([:acc, :+, 8])
    end

    it "correctly parses jmp" do
      expect(subject.parse_operation(jmpoperation)).to eq([:jmp, :-, 3])
    end
  end

  describe "perform_operation" do
    
    let(:nooperation) { [:nop, :+, 0] }
    let(:accoperation) { [:acc, :+, 8] }
    let(:jmpoperation) { [:jmp, :-, 3] }

    before do
      subject.set_stack_pointer_position(10)
      subject.set_accumulator_value(0)
    end

    it "correctly handles noop" do
      subject.perform_operation(nooperation)
      expect(subject.get_stack_pointer).to eq(11)
      expect(subject.get_accumulator).to eq(0)
    end

    it "correctly handles acc" do
      subject.perform_operation(accoperation)
      expect(subject.get_stack_pointer).to eq(11)
      expect(subject.get_accumulator).to eq(8)
    end

    it "correctly handles jmp" do
      subject.perform_operation(jmpoperation)
      expect(subject.get_stack_pointer).to eq(7)
      expect(subject.get_accumulator).to eq(0)
    end
  end
end
