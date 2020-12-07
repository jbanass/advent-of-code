require 'pry'
require 'set'
require_relative "../../tools/parser/parser.rb"

class DayFour
  REQ_FIELDS = %w(
    byr
    iyr
    eyr
    hgt
    hcl
    ecl
    pid
  ).to_set

  OPT_FIELDS = %w(
    cid
  )

  def self.calculate
    passports = self.group_input

    passports.map do |passport|
      valid_values = true

      passport.each do |key, value|
        if !self.validate(key, value)
          puts "#{key} #{value} is invalid"
          valid_values = false
        end
      end

      valid_values && REQ_FIELDS.subset?(passport.keys.to_set)
    end.count(true)
  end

  def self.group_input
    passport_hash_array = []
    inputs.map { |input| input.join(' ').gsub("\n", " ").split }.each_with_index do |passport, index|
      passport_hash = {}

      passport.each do |credential|
        key, value = credential.split(':')
        passport_hash[key] = value
      end

      passport_hash_array << passport_hash
    end

    passport_hash_array
  end

  def self.validate(category, value)
    case category
    when 'byr'
      value.to_s.length == 4 && (1920..2002).include?(value.to_i)
    when 'iyr'
      value.to_s.length == 4 && (2010..2020).include?(value.to_i)
    when 'eyr'
      value.to_s.length == 4 && (2020..2030).include?(value.to_i)
    when 'hgt'
      false if !value.match?(/[cm|in]+/)
      measurement = value[-2..-1]
      size = value[0..-3].to_i
      case value[-2..-1]
      when 'in'
        (59..76).include?(size)
      when 'cm'
        (150..193).include?(size)
      end
    when 'hcl'
      value.match?(/^#[0-9a-f]{6}$/)
    when 'ecl'
      %w(amb blu brn gry grn hzl oth).include?(value)
    when 'pid'
      value.match?(/^[0-9]{9}$/)
    else
      true
    end
  end

  def self.inputs
    Parser.split_on_consecutive_newlines('/Users/josephbanass/projects/advent-of-code/2020/04/input.txt')
  end
end

if __FILE__ == $0
  puts DayFour.calculate
end
