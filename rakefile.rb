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

  `git checkout master && git pull && git checkout -b aoc#{args[:year]}-day#{args[:day]}`

  script_path = File.join(day_path, "script.rb")
  spec_path = File.join(day_path, "script_spec.rb")

  FileUtils.mkdir_p(day_path)
  File.open(script_path, 'wb') do |file|
    file.write(<<~SCRIPT
      require 'pry'
      require_relative '../../tools/parser/parser.rb'

      class Day#{days[args[:day]]}

        def calculate(file_path)
          input = Parser.split_on_newline(file_path)
        end
      end
    SCRIPT
    )
  end

  File.open(spec_path, 'wb') do |file|
    file.write(<<~SCRIPT
      require_relative 'script.rb'

      describe Day#{days[args[:day]]} do

      end
    SCRIPT
    )
  end

  puts "Ready to go!"
end
