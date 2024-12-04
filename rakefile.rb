require "fileutils"

days = {
  "01"=> "One",
  "02"=> "Two",
  "03"=> "Three",
  "04"=> "Four",
  "05"=> "Five",
  "06"=> "Six",
  "07"=> "Seven",
  "08"=> "Eight",
  "09"=> "Nine",
  "10"=> "Ten",
  "11"=> "Eleven",
  "12"=> "Twelve",
  "13"=> "Thirteen",
  "14"=> "Fourteen",
  "15"=> "Fifteen",
  "16"=> "Sixteen",
  "17"=> "Seventeen",
  "18"=> "Eighteen",
  "19"=> "Nineteen",
  "20"=> "Twenty",
  "21"=> "TwentyOne",
  "22"=> "TwentyTwo",
  "23"=> "TwentyThree",
  "24"=> "TwentyFour",
  "25"=> "TwentyFive",
}

task :new, [:year,:day] do |task, args|
  day_path = File.join(File.expand_path(File.dirname(__FILE__)), "#{args[:year]}/#{args[:day]}")
  puts day_path
  if File.exist?(day_path)
    puts "Directory already exists, exiting"
    exit
  end

  `git checkout main && git pull && git checkout -b aoc#{args[:year]}-day#{args[:day]}`

  script_path = File.join(day_path, "script.rb")
  spec_path = File.join(day_path, "script_spec.rb")
  input_path = File.join(day_path, "input.txt")
  input_fixture_path = File.join(day_path, "input_fixture.txt")

  FileUtils.mkdir_p(day_path)
  File.open(script_path, 'wb') do |file|
    file.write(<<~SCRIPT
      require 'pry'
      require_relative '../../tools/parser/parser.rb'

      class Day#{days[args[:day]]}

        def calculate
          nil
        end

        private

        def input
          Parser.split_on_newline('/Users/josephbanass/projects/advent-of-code/#{args[:year]}/#{args[:day]}/input.txt')
        end
      end

      if __FILE__ == $0
        puts Day#{days[args[:day]]}.new.calculate
      end
    SCRIPT
    )
  end

  File.open(spec_path, 'wb') do |file|
    file.write(<<~SCRIPT
      require_relative 'script.rb'      

      describe Day#{days[args[:day]]} do

        subject { described_class.new }

        let(:input) {
          Parser.split_on_newline('/Users/josephbanass/projects/advent-of-code/#{args[:year]}/#{args[:day]}/input_fixture.txt')
        }

        before(:each) do
          allow(subject).to receive(:input).and_return(input)
        end
      end
    SCRIPT
    )
  end

  FileUtils.touch(input_path)
  FileUtils.touch(input_fixture_path)

  puts "Ready to go!"
end
