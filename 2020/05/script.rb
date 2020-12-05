require 'pry'

class DayFive

  def self.calculate(inputs)
    inputs.map { |input| calculate_seat_id(input.strip) }.max
  end

  def self.calculate_seat_id(input)
    (solve_row(input) * 8) + solve_column(input)
  end

  def self.solve_row(input)
    low = 0
    high = 127

    input[0,6].split('').each do |letter|
      case letter
      when 'F'
        high = (high - ((high - low) / 2)) - 1
      when 'B'
        low = (low + ((high - low) / 2)) + 1
      end
    end

    input[7] == 'F' ? high : low
  end

  def self.solve_column(input)
    low = 0
    high = 7

    input[7, input.length - 1].split('').each do |letter|
      case letter
      when 'R'
        low = (low + ((high - low) / 2)) + 1
      when 'L'
        high = (high - ((high - low) / 2)) - 1
      end
    end

    input[input.length] == 'R' ? low : high
  end
end

inputs = File.open('./input.txt').readlines

puts DayFive.calculate(inputs)
