require 'pry'
require_relative '../../tools/parser/parser.rb'

class DayFour

  X_BOUNDS = 139.freeze
  Y_BOUNDS = 139.freeze
  PHRASE = 'MAS'.freeze

  # ..X...
  # .SAMX.
  # .A..A.
  # XMAS.S
  # .X....
  def calculate
    mapping = []
    (0..Y_BOUNDS).each do |y|
      (0..X_BOUNDS).each do |x|
        get_xmas_coords_from(y, x).each { |coord| mapping << coord }.compact
      end
    end

    mapping.length
  end

  def get_xmas_coords_from(y, x)
    return [] unless normalized_input.dig(y, x) == PHRASE[1]

    result = [
      'forward_backward',
      'forward_forward',
      'backward_forward',
      'backward_backward'
    ].each_with_object([]) do |direction, accumulator|
      result = self.send("get_xmas_#{direction}", y, x)

      if result
        break [result]
      end
    end || []
  end

  private

  def check_word_from_coords(coords)
    coords = coords.filter { |x, y| x >= 0 && y >= 0 }
    word = coords.map { |y, x| normalized_input.dig(y, x) }.join('')

    return coords if word == PHRASE
  end

  def get_xmas_forward_forward(y, x)
    left_coords = [
      [y - 1, x - 1],
      [y, x],
      [y + 1, x + 1]
    ]

    right_coords = [
      [y + 1, x - 1],
      [y, x],
      [y - 1, x + 1]
    ]

    if check_word_from_coords(left_coords) && check_word_from_coords(right_coords)
      return [
        left_coords,
        right_coords
      ]
    end
  end

  def get_xmas_forward_backward(y, x)
    left_coords = [
      [y - 1, x - 1],
      [y, x],
      [y + 1, x + 1]
    ]

    right_coords = [
      [y - 1, x + 1],
      [y, x],
      [y + 1, x - 1]
    ]

    if check_word_from_coords(left_coords) && check_word_from_coords(right_coords)
      return [
        left_coords,
        right_coords
      ]
    end
  end

  def get_xmas_backward_forward(y, x)
    left_coords = [
      [y + 1, x + 1],
      [y, x],
      [y - 1, x - 1],
    ]

    right_coords = [
      [y + 1, x - 1],
      [y, x],
      [y - 1, x + 1]
    ]

    if check_word_from_coords(left_coords) && check_word_from_coords(right_coords)
      return [
        left_coords,
        right_coords
      ]
    end
  end

  def get_xmas_backward_backward(y, x)
    left_coords = [
      [y + 1, x + 1],
      [y, x],
      [y - 1, x - 1]
    ]

    right_coords = [
      [y - 1, x + 1],
      [y, x],
      [y + 1, x - 1]
    ]

    if check_word_from_coords(left_coords) && check_word_from_coords(right_coords)
      return [
        left_coords,
        right_coords
      ]
    end
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
