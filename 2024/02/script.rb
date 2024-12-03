require 'pry'
require_relative '../../tools/parser/parser.rb'

class DayTwo

  def calculate
    input.filter { |report| is_safe?(report) }.length
  end

  def calculate2
    x = input.filter do |report|
      result = is_safe2?(report)

      if result == true
        true
      else
        valid = false
        (0..report.split(' ').length).each do |index|
          if is_safe2?(remove_at_index(report, index)) == true
            valid = true
          end
        end

        valid
      end
    end

    x.length
  end

  def is_safe2?(report)
    state = nil
    return_value = false
    normalized = report.split(' ').map(&:to_i)

    normalized.each_with_index do |value, index|
      next_value = normalized[index + 1]

      if next_value
        if state.nil?
          state = check_state(value, next_value)
        end

        if state_changed?(value, next_value, state) || !within_range?(value, next_value)
          return_value = index
          break
        end
      else
        return_value = true
        break
      end
    end

    return_value
  end

  def is_safe?(report)
    state = nil
    valid = false
    normalized = report.split(' ').map(&:to_i)

    normalized.each_with_index do |value, index|
      next_value = normalized[index + 1]

      if next_value
        if state.nil?
          state = check_state(value, next_value)
        end

        break if state_changed?(value, next_value, state)
        break if !within_range?(value, next_value)
      else
        valid = true
        break
      end
    end

    valid
  end

  private

  def remove_at_index(report, index)
    x = report.split(' ')
    x.delete_at(index)
    x.join(' ')
  end

  def check_state(value, next_value)
    value - next_value < 0 ? :increasing : :decreasing
  end

  def state_changed?(value, next_value, current_state)
    current_state != check_state(value, next_value)
  end

  def within_range?(value, next_value)
    (1..3).include?((value - next_value).abs)
  end

  def input
    Parser.split_on_newline('/Users/josephbanass/projects/advent-of-code/2024/02/input.txt')
  end
end

if __FILE__ == $0
  puts DayTwo.new.calculate
  puts DayTwo.new.calculate2
end
