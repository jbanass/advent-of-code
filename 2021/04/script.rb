require 'pry'
require_relative '../../tools/parser/parser.rb'

class DayFour

  def calculate
    numbers = numbers_to_call

    while (!numbers.nil?) do
      current_number = numbers.shift

      boards_affected = check_boards(current_number)

      if (winning_board_index = find_bingo(boards_affected))
        break
      end
    end

    current_number * sum_unchecked(winning_board_index)
  end

  def sum_unchecked(winning_board_index)
    sum = 0
    bingo_boards[winning_board_index].each do |row|
      sum += row.filter { |cell| !cell[:checked] }.sum { |cell| cell[:number] }
    end

    sum
  end

  def find_bingo(board_indices)
    board_indices.each do |board_index|
      bingo_boards[board_index].each_with_index do |row, row_index|
        if row.select { |cell| cell[:checked] }.length == 5
          return board_index
        end

        begin
          column = (0..4).map { |column_index| bingo_boards[board_index][column_index][row_index] }
          
          if column.select { |cell| cell[:checked] }.length == 5
            return board_index
          end
        rescue
          binding.pry
        end
      end
    end

    nil
  end

  def check_boards(number_called)
    boards_affected = []
    bingo_boards.each_with_index do |board, board_index|
      catch :number_found do
        board.each_with_index do |row, row_index|
          row.each_with_index do |cell, cell_index|
            if cell[:number] == number_called
              set_checked(board_index, row_index, cell_index)
              boards_affected << board_index
              throw :number_found
            end
          end
        end
      end
    end

    boards_affected
  end

  def set_checked(board_index, row_index, cell_index)
    bingo_boards[board_index][row_index][cell_index][:checked] = true
  end

  def numbers_to_call
    input[0][0].split(',').map(&:to_i)
  end

  def fresh_bingo_boards
    input[1..].map do |board|
      board.map { |row| row.split(' ').map { |number| { number: number.to_i, checked: false } } }
    end
  end

  def bingo_boards
    @bingo_boards ||= fresh_bingo_boards
  end

  private

  def input
    @input ||= Parser.split_on_consecutive_newlines('/Users/josephbanass/projects/advent-of-code/2021/04/input.txt')
  end
end

if __FILE__ == $0
  puts DayFour.new.calculate
end
