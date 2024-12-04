require 'pry'
require_relative '../../tools/parser/parser.rb'

class DayThree

  def initialize
    @can_process = true
  end

  def calculate
    find_instructions.map { |instruction| instruction.call }.sum
  end

  def calculate2
    find_instructions.map { |instruction| instruction.call }.sum
  end

  def find_instructions
    reg = /(mul)(\(\d+,\d+\))|(do\b|\bdon't\b)(\(\))/

    input.scan(reg).map do |instruction|
      instruction, args = instruction.compact

      case instruction
      when 'mul'
        a, b = args.scan(/\d+/).map(&:to_i)
        Proc.new { multiply(a, b) }
      when 'do'
        Proc.new { enable }
      when "don't"
        Proc.new { disable }
      end
    end
  end

  def multiply(a, b)
    @can_process ? a * b : 0
  end

  def disable
    @can_process = false
    0
  end

  def enable
    @can_process = true
    0
  end

  private

  def input
    Parser.read_file('/Users/josephbanass/projects/advent-of-code/2024/03/input.txt')
  end
end

if __FILE__ == $0
  puts DayThree.new.calculate
  puts DayThree.new.calculate2
end
