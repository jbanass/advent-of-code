require_relative '../../tools/parser/parser.rb'
require 'pry'

class DayOne

  def self.calculate_two
    numbers.each do |i|
      numbers.each do |j|
        return i*j if i + j == 2020
      end
    end
  end

  def self.calculate_three
    numbers.each do |i|
      numbers.each do |j|
        numbers.each do |k|
          return i*j*k if i + j + k == 2020
        end
      end
    end
  end

  def self.numbers
    Parser.split_on_newline(input_path).map { |number| number.to_i }
  end

  def self.input_path
    "/Users/josephbanass/projects/advent-of-code/2020/01/input.txt"
  end
end

if __FILE__ == $0
  puts DayOne.calculate_two
  puts DayOne.calculate_three
end
