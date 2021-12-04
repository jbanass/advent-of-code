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

  def oxygen_generator_rating_binary
    subset = input
    current_bit_position = 0

    while (
      current_bit_position < binary_length && \
      subset.length > 1
    ) do
      binary_digit_to_filter_by = get_subset_common_positions(subset)[current_bit_position].yield_self do |occurrences|
        if occurrences.values.uniq != occurrences.values
          "1"
        else
          occurrences.max_by do |binary_value, number_of_occurrences|
            number_of_occurrences
          end[0]
        end
      end

      subset = subset.filter { |binary| binary[current_bit_position] == binary_digit_to_filter_by }

      current_bit_position += 1
    end

    subset[0]
  end

  def oxygen_generator_rating_decimal
    oxygen_generator_rating_binary.to_i(2)
  end

  def co2_scrubber_rating_binary
    subset = input
    current_bit_position = 0

    while (
      current_bit_position < binary_length && \
      subset.length > 1
    ) do
      binary_digit_to_filter_by = get_subset_common_positions(subset)[current_bit_position].yield_self do |occurrences|
        if occurrences.values.uniq != occurrences.values
          "0"
        else
          occurrences.min_by do |binary_value, number_of_occurrences|
            number_of_occurrences
          end[0]
        end
      end

      subset = subset.filter { |binary| binary[current_bit_position] == binary_digit_to_filter_by }

      current_bit_position += 1
    end

    subset[0]
  end

  def co2_scrubber_rating_decimal
    co2_scrubber_rating_binary.to_i(2)
  end

  def calculate_2
    oxygen_generator_rating_decimal * co2_scrubber_rating_decimal
  end

  def binary_length
    input[0].length
  end

  def get_subset_common_positions(subset)
    get_common_positions(subset)
  end

  def get_common_positions(set=self.input)
    result = (0..set[0].length - 1).map { Hash.new(0) }

    set.each do |binary|
      binary.split('').each_with_index do |value, index|
        result[index][value] += 1
      end
    end

    result
  end

  private

  def input
    @input ||= Parser.split_on_newline('/Users/josephbanass/projects/advent-of-code/2021/03/input.txt')
  end
end

if __FILE__ == $0
  puts DayThree.new.calculate
  puts DayThree.new.calculate_2
end
