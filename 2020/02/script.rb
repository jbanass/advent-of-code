require 'pry'

class DayTwo
  def self.calculate(inputs)
    offset = 1
    results = Hash.new { |h,k| h[k] = false }

    inputs.map { |input| self.parse(input) }.each_with_index do |input, index|
      ranges = input[0]
      letter = input[1]
      phrase = input[2]

      position_1_has_letter = phrase[ranges[0] - offset] == letter
      position_2_has_letter = phrase[ranges[1] - offset] == letter
      
      results[inputs[index]] = if position_1_has_letter && position_2_has_letter
        false
      elsif (position_1_has_letter && !position_2_has_letter) || (!position_1_has_letter && position_2_has_letter)
        true
      else
        false
      end
    end

    results
  end

  def self.parse(input)
    split = input.split(' ')
    range = split[0].split('-')
    letter_to_search = split[1][0..-2]
    phrase = split[2]

    [
      [range[0].to_i, range[1].to_i],
      letter_to_search,
      phrase
    ]
  end
end

inputs = File.open('/Users/josephbanass/Desktop/input.txt').readlines.map { |line| line.chomp }

results = DayTwo.calculate(inputs)

puts results.select { |key, value| value == true }.length