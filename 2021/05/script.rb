require 'pry'
require_relative '../../tools/parser/parser.rb'

class DayFive

  def calculate
    occurrences = 0
    hydrothermal_vent_locations.each { |k, v| occurrences += v.values.filter { |overlaps| overlaps >= 2 }.length }

    occurrences
  end

  def calculate_2
    occurrences = 0
    hydrothermal_vent_locations_2.each { |k, v| occurrences += v.values.filter { |overlaps| overlaps >= 2 }.length }

    occurrences
  end

  def hydrothermal_vent_locations
    return @hydrothermal_vent_locations if @hydrothermal_vent_locations

    @hydrothermal_vent_locations = Hash.new { |h, k| h[k] = Hash.new(0) }

    input.each do |coordinates|
      x1,y1,x2,y2 = coordinates.gsub(' -> ', ',').split(',').map(&:to_i)
      next unless x1 == x2 || y1 == y2

      if x1 != x2
        ([x1,x2].min..[x1,x2].max).each do |x|
          @hydrothermal_vent_locations[x][y1] += 1
        end
      else
        ([y1,y2].min..[y1,y2].max).each do |y|
          @hydrothermal_vent_locations[x1][y] += 1
        end
      end
    end

    @hydrothermal_vent_locations
  end

  def hydrothermal_vent_locations_2
    return @hydrothermal_vent_locations if @hydrothermal_vent_locations

    @hydrothermal_vent_locations = Hash.new { |h, k| h[k] = Hash.new(0) }

    input.each do |coordinates|
      x1,y1,x2,y2 = coordinates.gsub(' -> ', ',').split(',').map(&:to_i)

      if x1 == x2 || y1 == y2
        if x1 != x2
          ([x1,x2].min..[x1,x2].max).each do |x|
            @hydrothermal_vent_locations[x][y1] += 1
          end
        else
          ([y1,y2].min..[y1,y2].max).each do |y|
            @hydrothermal_vent_locations[x1][y] += 1
          end
        end
      else
        x_operation = x1 > x2 ? :- : :+
        y_operation = y1 > y2 ? :- : :+

        scenario = true if x2 == 0 && y2 == 8

        while (x1 != x2 && y1 != y2)
          @hydrothermal_vent_locations[x1][y1] += 1          
          
          x1 = x1.send(x_operation, 1) if x1 != x2
          y1 = y1.send(y_operation, 1) if y1 != y2
        end

        @hydrothermal_vent_locations[x1][y1] += 1
      end
    end

    @hydrothermal_vent_locations
  end

  private

  def input
    @input ||= Parser.split_on_newline('/Users/josephbanass/projects/advent-of-code/2021/05/input.txt')
  end
end

if __FILE__ == $0
  puts DayFive.new.calculate
  puts DayFive.new.calculate_2
end
