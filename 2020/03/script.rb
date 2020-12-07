require 'pry'
require_relative '../../tools/parser/parser.rb'

class DayThree
  OPEN_SQUARE = '.'.freeze
  TREE = '#'.freeze
  STARTING_POSITION_X = 0
  STARTING_POSITION_Y = 0


  def self.calculate(right, down)
    cur_position_x = STARTING_POSITION_X
    cur_position_y = STARTING_POSITION_Y
    y_length = input.length - 1

    tree_count = input[cur_position_y][cur_position_x] == TREE ? 1 : 0

    (y_length).times do
      prev_count = tree_count
      right.times do |i|
        #puts "Currently at #{cur_position_x},#{cur_position_y}"
        cur_position_x += 1
        #puts "Moved to #{cur_position_x},#{cur_position_y}"
        print_map(cur_position_x, cur_position_y)
      end

      down.times do |i|
        #puts "Currently at #{cur_position_x},#{cur_position_y}"
        cur_position_y += 1
        #puts "Moved to #{cur_position_x},#{cur_position_y}"
        print_map(cur_position_x, cur_position_y)
      end

      begin
        if input[cur_position_y][cur_position_x] == TREE
          #puts "Hit tree at new location!"
          tree_count += 1 
        end
      rescue Exception => e
        # noop
      end

      #puts "Encountered #{ tree_count - prev_count } new trees en route to #{cur_position_x},#{cur_position_y}. Total: #{ tree_count }"
    end

    tree_count
  end

  def self.print_map(x, y)
    return
    rows = input.length
    columns = input[0].length

    rows.times do |row|
      columns.times do |column|
        if y == row && x == column
          print "(#{input[row][column]})"
        else
          begin
            print input[row][column]
          rescue Exception => e
            binding.pry
          end
        end
      end
      puts
    end
  end

  def self.input
    map = Parser.split_on_newline('/Users/josephbanass/projects/advent-of-code/2020/03/input.txt')
    y_length = map.length - 1

    map.map { |row| row * y_length }
  end
end

if __FILE__ == $0
  puts "Part 1: #{DayThree.calculate(3, 1)}"

  #part 2
  slopes = [
    [3,1],
    [5,1],
    [7,1],
    [1,2]
  ]

  part_2_total = DayThree.calculate(1, 1)
  slopes.each do |slope|
    part_2_total *= DayThree.calculate(slope[0], slope[1])
  end

  puts "Part 2: #{part_2_total}"
end
