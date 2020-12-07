require 'pry'
require_relative '../../tools/parser/parser.rb'

class DayTwo
  def self.calculate
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

  def self.inputs
    Parser.split_on_newline('/Users/josephbanass/projects/advent-of-code/2020/02/input.txt')
  end
end

if __FILE__ == $0
  results = DayTwo.calculate

  puts results.select { |key, value| value == true }.length
end
