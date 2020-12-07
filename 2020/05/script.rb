require 'pry'
require_relative '../../tools/parser/parser.rb'

class DayFive

  def self.calculate
    inputs.map { |input| calculate_seat_id(input.strip) }.max
  end

  def self.calculate_seat_id(input)
    (solve_row(input) * 8) + solve_column(input)
  end

  def self.find_my_id
    sorted_array = inputs.map { |input| calculate_seat_id(input.strip) }.sort

    ((0..1024).to_a - sorted_array).filter do |seat|
      sorted_array.include?(seat+1) && sorted_array.include?(seat-1)
    end
  end

  def self.solve_row(input)
    low = 0
    high = 127

    input[0,6].split('').each do |letter|
      #binding.pry
      case letter
      when 'F'
        high = (high + low) / 2
      when 'B'
        low = ((high + low) / 2) + 1
      end
    end

    input[7] == 'F' ? high : low
  end

  def self.solve_column(input)
    low = 0
    high = 7

    input[7, input.length - 1].split('').each do |letter|
      case letter
      when 'R'
        low = ((high + low) / 2) + 1
      when 'L'
        high = (high + low) / 2
      end
    end

    input.split('').last == 'R' ? low : high
  end

  def self.inputs
    Parser.split_on_newline('/Users/josephbanass/projects/advent-of-code/2020/05/input.txt')
  end
end

if __FILE__ == $0
  puts DayFive.calculate
  puts DayFive.find_my_id
end
