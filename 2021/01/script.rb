require 'pry'
require_relative '../../tools/parser/parser.rb'

class DayOne

  def calculate
    ctr = 0
    last = nil

    input.each do |number|
      if last.nil?
        last = number
        next
      end

      if last < number
        ctr += 1
      end

      last = number
    end

    ctr
  end

  def calculate_2
    ctr = 0
    index = 2
    last = nil

    while index <= input.length - 1 do
      if last.nil?
        last = input[index] + input[index-1] + input[index-2]
        next
      end

      current = input[index] + input[index-1] + input[index-2]

      if current > last
        ctr += 1
      end

      last = current
      index += 1
    end

    ctr
  end

  private

  def input
    @input ||= Parser.split_on_newline('/Users/josephbanass/projects/advent-of-code/2021/01/input.txt').map(&:to_i)
  end
end

if __FILE__ == $0
  puts DayOne.new.calculate
  puts DayOne.new.calculate_2
end
