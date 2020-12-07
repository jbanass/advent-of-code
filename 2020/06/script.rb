require 'pry'
require 'set'
require_relative '../../tools/parser/parser.rb'

class DaySix

  def self.calculate
    sum_groups(input)
  end

  def self.sum_groups(groups)
    groups.map { |group| answers_for_group(group) }.sum
  end

  def self.answers_for_group(group)
    people_in_group = group.length

    group.
      join('').
      split('').
      group_by(&:chr).
      map { |k,v| [k, v.size] }.
      filter { |letter, count| count == people_in_group }.
      length
  end

  def self.input
    Parser.split_on_consecutive_newlines('/Users/josephbanass/projects/advent-of-code/2020/06/input.txt')
  end
end

if __FILE__ == $0
  puts DaySix.calculate
end
