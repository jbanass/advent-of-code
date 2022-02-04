require 'pry'
require_relative '../../tools/parser/parser.rb'

class DaySix

  def calculate(days)

    days.times do
      update_population
    end

    population.values.compact.sum
  end

  def update_population
    population.transform_keys! { |fish_age| fish_age - 1 }

    # population[-1] is the number of fish that is about to reproduce
    # so add these values to the age groupings of new (8) and recently-reproduced
    # (6) populations
    # This does create quite a few nil negative keys as a result :(
    population[8] = population[-1]
    population[6] += population[-1]
    population[-1] = nil
  end

  def population
    return @population if @population

    @population = starters.tally.yield_self { |hash| hash.default = 0; hash }
  end

  private

  def starters
    input[0].split(',').map(&:to_i)
  end

  def input
    @input ||= Parser.split_on_newline('/Users/josephbanass/projects/advent-of-code/2021/06/input.txt')
  end
end

if __FILE__ == $0
  puts DaySix.new.calculate(80)
  puts DaySix.new.calculate(256)
end
