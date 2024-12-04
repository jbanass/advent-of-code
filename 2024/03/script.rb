require 'pry'
require_relative '../../tools/parser/parser.rb'

class DayThree

  def calculate
    find_instructions.map { |instruction| execute_instruction(instruction) }.sum
  end

  def execute_instruction(instruction)
    instruction[1].send(instruction[0], instruction[2])
  end

  def find_instructions
    reg = /mul\(\d+,\d+\)/
    instruction_reg = /(mul)/
    argument_reg = /\d+/

    mapping = {
      'mul' => :*
    }

    input.scan(reg).map do |token|
      [
        mapping[token[instruction_reg]],
        *token.scan(argument_reg).map(&:to_i)
      ]
    end
  end

  private

  def input
    Parser.read_file('/Users/josephbanass/projects/advent-of-code/2024/03/input.txt')
  end
end

if __FILE__ == $0
  puts DayThree.new.calculate
end
