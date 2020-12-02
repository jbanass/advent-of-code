require 'pry'

class DayTwo
  def self.calculate(inputs)
    results = Hash.new { |h,k| h[k] = false }

    inputs.map { |input| self.parse(input) }.each_with_index do |input, index|
      range = input[0]
      letter = input[1]
      phrase = input[2]

      results[inputs[index]] = range.include?(phrase.count(letter))
    end

    results
  end

  def self.parse(input)
    split = input.split(' ')
    range = split[0].split('-')
    letter_to_search = split[1][0..-2]
    phrase = split[2]

    [
      (range[0].to_i..range[1].to_i),
      letter_to_search,
      phrase
    ]
  end
end

inputs = File.open('/Users/josephbanass/Desktop/input.txt').readlines.map { |line| line.chomp }

results = DayTwo.calculate(inputs)

puts results.select { |key, value| value == true }.length