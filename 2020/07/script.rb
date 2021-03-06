require 'pry'
require_relative '../../tools/parser/parser.rb'

class DaySeven
  attr_reader :rulebook

  def initialize
    @encountered = {}
    @rulebook = set_rulebook
  end

  def calculate
    rulebook.map { |container, contents| drilldown(container) }.count(true) - 1
  end

  def calculate_part_two
    drilldown_bag_count('shiny gold bags')
  end

  def drilldown(container)
    return false if @rulebook[container].nil?
    return true if container == "shiny gold bags"
    if !@encountered[container].nil?
      return @encountered[container]
    end
    
    @encountered[container] = @rulebook[container].map { |content| self.drilldown(content[1]) }.include?(true)
  end

  def drilldown_bag_count(container)
    return 0 if @rulebook[container].nil?

    count = @rulebook[container].map { |content| content[0] }.sum

    return count + @rulebook[container].map { |content| content[0] * self.drilldown_bag_count(content[1]) }.sum
  end

  def set_rulebook
    rulebook = {}

    input.each do |rule|
      container, contents = parse_rule(rule)
      rulebook[container] = contents
    end

    rulebook
  end

  def parse_rule(rule)
    container, contents = rule.split('contain').map { |subphrase| subphrase.strip.gsub('.', '') }

    [
      container,
      parse_contents(contents)
    ]
  end

  def parse_contents(contents)
    contents.split(',').map { |content| content.strip }.map do |content|
      exploded_contents = content.split(' ')
      quantity = exploded_contents[0].to_i
      return nil if quantity == 0
      container = exploded_contents[1..exploded_contents.length].join(' ')
      container += 's' if quantity == 1
      [
        quantity,
        container
      ]
    end
  end

  def input
    Parser.split_on_newline('/Users/josephbanass/projects/advent-of-code/2020/07/input.txt')
  end
end

if __FILE__ == $0
  puts DaySeven.new.calculate
  puts DaySeven.new.calculate_part_two
end
