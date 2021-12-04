require 'pry'
require_relative '../../tools/parser/parser.rb'

class DayTwo

  def calculate
    horizontal = 0
    depth = 0

    transformed_input.each do |orders|
      case orders[:direction]
      when :forward
        horizontal += orders[:units]
      when :down
        depth += orders[:units]
      when :up
        depth -= orders[:units]
      end
    end

    horizontal * depth
  end

  def transformed_input
    @transformed_input ||= input.map do |movement|
      direction, units = movement.split(' ')

      { direction: direction.to_sym, units: units.to_i }
    end
  end

  private

  def input
    @input ||= Parser.split_on_newline('/Users/josephbanass/projects/advent-of-code/2021/02/input.txt')
  end
end

if __FILE__ == $0
  puts DayTwo.new.calculate
end
