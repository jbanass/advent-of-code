require 'pry'
require_relative '../../tools/parser/parser.rb'

class DayOne

  def calculate
    (0..normalized_input.length - 1).map { |idx| (left[idx] - right[idx]).abs }.sum
  end

  def calculate2
    (0..normalized_input.length - 1).map { |idx| left[idx] * right.count(left[idx]) }.sum
  end

  private

  def input
    Parser.split_on_newline('/Users/josephbanass/projects/advent-of-code/2024/01/input.txt')
  end

  def normalized_input
    @normalized_input ||= input.map { |pair| pair.split(' ') }
  end

  def left
    @left ||= normalized_input.map { |pair| pair[0].to_i }.sort
  end

  def right
    @right ||= normalized_input.map { |pair| pair[1].to_i }.sort
  end
end

if __FILE__ == $0
  puts DayOne.new.calculate
  puts DayOne.new.calculate2
end
