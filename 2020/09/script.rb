require 'pry'
require_relative '../../tools/parser/parser.rb'

class DayNine

  def initialize(preamble = 25)
    @preamble = preamble - 1 #array 0-indexed
    @pointer = preamble
  end

  def calculate
    while true
      cur_num = input[@pointer]
      if valid_number_range.keys.map { |k, v| valid_number_range[cur_num - k] == true }.count(true) == 0
        return cur_num
      end

      @pointer += 1
    end
  end

  def calculate_part_two(target_number)
    start = 0
    finish = 0
    
    while true
      sum = input[start..finish].sum
      if sum < target_number
        finish += 1
      elsif sum == target_number
        min = input[start..finish].min
        max = input[start..finish].max
        return min + max
      else
        start += 1
        finish = start
      end
    end
  end

  def valid_number_range
    range = Hash.new { |h, k| h[k] = false }
    input[@pointer - @preamble - 1..@pointer - 1].each { |number| range[number] = true }
    range
  end

  def input
    @input ||= Parser.split_on_newline('/Users/josephbanass/projects/advent-of-code/2020/09/input.txt').map { |line| line.to_i }
  end
end

if __FILE__ == $0
  puts DayNine.new.calculate
  puts DayNine.new.calculate_part_two(400480901)
end
