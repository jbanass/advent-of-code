require 'pry'
require_relative '../../tools/parser/parser.rb'

class DayTwo

  def calculate
    total = 0

    input.each do |measurement|
      total += surface_area(measurement[0], measurement[1], measurement[2])
    end

    total
  end

  def parse_line(line)
    line.split('x').map { |number| number.to_i }
  end

  def surface_area(len, width, height)
    side_a = len * width
    side_b = width * height
    side_c = height * len
    smallest = [side_a, side_b, side_c].min
    (2 * side_a) + (2 * side_b) + (2 * side_c) + smallest
  end

  def input
    Parser.split_on_newline('/Users/josephbanass/projects/advent-of-code/2015/02/input.txt').map { |line| parse_line(line) }
  end
end

if __FILE__ == $0
  puts DayTwo.new.calculate
end
