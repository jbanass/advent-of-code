require 'pry'
require_relative '../../tools/parser/parser.rb'

class DayEight

  def initialize
    @stack_pointer = 0
    @accumulator = 0
    @encountered_operations = Hash.new { |h, k| h[k] = false }
  end

  def calculate
    while true
      if @encountered_operations[@stack_pointer]
        break
      else
        @encountered_operations[@stack_pointer] = true
      end

      perform_operation(parse_operation(input[@stack_pointer]))
    end

    @accumulator
  end

  def parse_operation(operation)
    regex = /^(nop|jmp|acc) (\+|\-)(\d+)$/
    opcode, operator, value = operation.scan(regex).first
    [opcode.to_sym, operator.to_sym, value.to_i]
  end

  def perform_operation(operation)
    opcode, operator, value = operation

    case opcode
    when :acc
      @accumulator = @accumulator.send(operator, value)
      set_stack_pointer_position(@stack_pointer + 1)
    when :jmp
      @stack_pointer = @stack_pointer.send(operator, value)
    when :nop
      # noop
      set_stack_pointer_position(@stack_pointer + 1)
    end
  end

  def set_stack_pointer_position(position)
    @stack_pointer = position
  end

  def set_accumulator_value(value)
    @accumulator = value
  end

  def get_stack_pointer
    @stack_pointer
  end

  def get_accumulator
    @accumulator
  end

  def input
    Parser.split_on_newline('/Users/josephbanass/projects/advent-of-code/2020/08/input.txt')
  end
end

if __FILE__ == $0
  puts DayEight.new.calculate
end
