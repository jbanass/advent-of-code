require 'pry'
require_relative '../../tools/parser/parser.rb'

class DayFour

  X_BOUNDS = 139.freeze
  Y_BOUNDS = 139.freeze
  PHRASE = 'XMAS'.freeze

  # ..X...
  # .SAMX.
  # .A..A.
  # XMAS.S
  # .X....
  def calculate
    mapping = []
    (0..Y_BOUNDS).each do |y|
      (0..X_BOUNDS).each do |x|
        get_xmas_coords_from(y, x).each { |coord| mapping << coord }
      end
    end

    mapping.length
  end

  def get_xmas_coords_from(y, x)
    return [] unless normalized_input.dig(y, x) == PHRASE[0]

    result = [
      'backwards',
      'forwards',
      'up_left',
      'up',
      'down',
      'up_right',
      'down_right',
      'down_left'
    ].each_with_object([]) do |direction, accumulator|
      result = self.send("get_xmas_#{direction}", y, x)

      if result
        accumulator << result
      end

      accumulator
    end
  end

  private

  def check_word_from_coords(coords)
    coords = coords.filter { |x, y| x >= 0 && y >= 0 }
    word = coords.map { |y, x| normalized_input.dig(y, x) }.join('')

    return coords if word == PHRASE
  end

  def get_xmas_backwards(y, x)
    coords = [
      [y, x],
      [y, x - 1],
      [y, x - 2],
      [y, x - 3]
    ]
    
    check_word_from_coords(coords)
  end

  def get_xmas_forwards(y, x)
    coords = [
      [y, x],
      [y, x + 1],
      [y, x + 2],
      [y, x + 3]
    ]

    check_word_from_coords(coords)
  end

  def get_xmas_up_left(y, x)
    coords = [
      [y, x],
      [y - 1, x - 1],
      [y - 2, x - 2],
      [y - 3, x - 3]
    ]

    check_word_from_coords(coords)
  end

  def get_xmas_up(y, x)
    coords = [
      [y, x],
      [y - 1, x],
      [y - 2, x],
      [y - 3, x]
    ]

    check_word_from_coords(coords)
  end

  def get_xmas_down(y, x)
    coords = [
      [y, x],
      [y + 1, x],
      [y + 2, x],
      [y + 3, x]
    ]

    check_word_from_coords(coords)
  end

  def get_xmas_up_right(y, x)
    coords = [
      [y, x],
      [y - 1, x + 1],
      [y - 2, x + 2],
      [y - 3, x + 3]
    ]

    check_word_from_coords(coords)
  end

  def get_xmas_down_right(y, x)
    coords = [
      [y, x],
      [y + 1, x + 1],
      [y + 2, x + 2],
      [y + 3, x + 3]
    ]

    check_word_from_coords(coords)
  end

  def get_xmas_down_left(y, x)
    coords = [
      [y, x],
      [y + 1, x - 1],
      [y + 2, x - 2],
      [y + 3, x - 3]
    ]

    check_word_from_coords(coords)
  end

  def normalized_input
    @normalized_input ||= input.map { |line| line.split('') }
  end

  def input
    Parser.split_on_newline('/Users/josephbanass/projects/advent-of-code/2024/04/input.txt')
  end
end

if __FILE__ == $0
  puts DayFour.new.calculate
end
