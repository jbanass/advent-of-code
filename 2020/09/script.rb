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
end
