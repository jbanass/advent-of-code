require 'pry'
require_relative '../../tools/parser/parser.rb'

class DayThree

  def calculate
    gamma_rate_decimal * epsilon_rate_decimal
  end

  def gamma_rate_binary
    get_common_positions.map do |position|
      position.max_by do |binary_value, number_of_occurrences|
        number_of_occurrences
      end[0]
    end.join
  end

  def gamma_rate_decimal
    gamma_rate_binary.to_i(2)
  end

  def epsilon_rate_binary
    get_common_positions.map do |position|
      position.min_by do |binary_value, number_of_occurrences|
        number_of_occurrences
      end[0]
    end.join
  end

  def epsilon_rate_decimal
    epsilon_rate_binary.to_i(2)
  end

  def get_common_positions
    return @result if @result

    @result = (0..input[0].length - 1).map { Hash.new(0) }

    input.each do |binary|
      binary.split('').each_with_index do |value, index|
        @result[index][value] += 1
      end
    end

    @result
  end

  private

  def input
    @input ||= Parser.split_on_newline('/Users/josephbanass/projects/advent-of-code/2021/03/input.txt')
  end
end

if __FILE__ == $0
  puts DayThree.new.calculate
end
