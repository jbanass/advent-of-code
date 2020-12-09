require 'pry'
require_relative '../../tools/parser/parser.rb'

class DayEight

  def initialize
    @stack_pointer = 0
    @accumulator = 0
    @encountered_operations = Hash.new { |h, k| h[k] = false }
  end

  def calculate(input=default_input())
    while @stack_pointer < input.length
      if @encountered_operations[@stack_pointer]
        raise InfiniteLoopException.new @accumulator
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
      set_stack_pointer_position(@stack_pointer.send(operator, value))
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

  def default_input
    Parser.split_on_newline('/Users/josephbanass/projects/advent-of-code/2020/08/input.txt')
  end

  def fix_bad_instruction
    default_input.each_with_index do |operation, index|
      new_input = default_input
      set_accumulator_value(0)
      set_stack_pointer_position(0)
      @encountered_operations = Hash.new { |h, k| h[k] = false }
      begin
        case operation[0..2]
        when 'jmp'
          new_input[index] = 'nop '.concat(operation[4..-1])
          puts calculate(new_input)
        when 'nop'
          new_input[index] = 'jmp '.concat(operation[4..-1])
          puts calculate(new_input)
        else
          next
        end
      rescue InfiniteLoopException => e
        next
      end
    end
  end

  class InfiniteLoopException < Exception; end;
end

if __FILE__ == $0
  #puts DayEight.new.calculate
  part_2 = DayEight.new
  part_2.fix_bad_instruction
end
