require_relative 'script.rb'

describe DayFour do
  let(:input) {
    <<~STRING
      eyr:1972 cid:100
      hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926
      
      iyr:2019
      hcl:#602927 eyr:1967 hgt:170cm
      ecl:grn pid:012533040 byr:1946
      
      hcl:dab227 iyr:2012
      ecl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277
      
      hgt:59cm ecl:zzz
      eyr:2038 hcl:74454a iyr:2023
      pid:3556412378 byr:2007

      pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980
      hcl:#623a2f

      eyr:2029 ecl:blu cid:129 byr:1989
      iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm

      hcl:#888785
      hgt:164cm byr:2001 iyr:2015 cid:88
      pid:545766238 ecl:hzl
      eyr:2022

      iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719
  STRING
  }

  describe "#calculate" do
    let(:expected_result) { 4 }

    it "calculates correctly" do
      expect(described_class.calculate(input)).to eq(expected_result)
    end
  end

  describe "validate" do
    it "properly validates byr" do
      invalid = 2003
      valid = 2002

      expect(described_class.validate('byr', invalid)).to be_falsey
      expect(described_class.validate('byr', valid)).to be_truthy
    end

    it "properly validates iyr" do
      invalid = 2009
      valid = 2019

      expect(described_class.validate('iyr', invalid)).to be_falsey
      expect(described_class.validate('iyr', valid)).to be_truthy
    end

    it "properly validates eyr" do
      invalid = 2010
      valid = 2029

      expect(described_class.validate('eyr', invalid)).to be_falsey
      expect(described_class.validate('eyr', valid)).to be_truthy
    end

    it "properly validates hgt" do
      invalid_cm = '149cm'
      valid_cm = '190cm'

      invalid_in = '190in'
      valid_in = '60in'

      invalid_unit = '180'

      expect(described_class.validate('hgt', invalid_cm)).to be_falsey
      expect(described_class.validate('hgt', valid_cm)).to be_truthy

      expect(described_class.validate('hgt', invalid_in)).to be_falsey
      expect(described_class.validate('hgt', valid_in)).to be_truthy

      expect(described_class.validate('hgt', invalid_unit)).to be_falsey
    end

    it "properly validates hcl" do
      valid = '#123abc'
      invalid = '#123abz'
      invalid_missing_pound = '123abc'

      expect(described_class.validate('hcl', invalid)).to be_falsey
      expect(described_class.validate('hcl', invalid_missing_pound)).to be_falsey
      expect(described_class.validate('hcl', valid)).to be_truthy
    end

    it "properly validates ecl" do
      valid = 'brn'
      invalid = 'wat'

      expect(described_class.validate('ecl', invalid)).to be_falsey
      expect(described_class.validate('ecl', valid)).to be_truthy
    end

    it "properly validates pid" do
      valid = '000000001'
      invalid = '0123456789'

      expect(described_class.validate('pid', invalid)).to be_falsey
      expect(described_class.validate('pid', valid)).to be_truthy
    end
  end
end
