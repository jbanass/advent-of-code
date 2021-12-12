require_relative 'script.rb'

describe DaySix do
  subject { described_class.new }

  let(:input) {
    [
      '3,4,3,1,2'
    ]
  }

  before(:each) do
    allow(subject).to receive(:input).and_return(input)
  end

  describe '#calculate' do
    it 'works' do
      expect(subject.calculate(80)).to eq(5934)
    end
  end
end
