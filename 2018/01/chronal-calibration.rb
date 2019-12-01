require 'CSV'

def find_frequency(filename)
  frequency = 0

  CSV.open(filename).each do |row|
    frequency += row.first.to_i
  end
  
  frequency
end

def find_first_repeated_frequency(filename)
  inputs = CSV.open(filename).read
  frequency_history = [0]
  frequency = 0
  loop_ctr = 0

  while true
    inputs.each do |value|
      frequency += value.first.to_i
      return frequency if frequency_history.include?(frequency)
      frequency_history << frequency
    end
    loop_ctr += 1
    system "clear"
    puts "Processing " + cool_spinny(loop_ctr)
  end
end

def cool_spinny(ctr)
  case ctr%4
  when 0
    "-"
  when 1
    "\\"
  when 2
    "|"
  when 3
    "/"
  when 4
    ""
  end
end

puts find_first_repeated_frequency("./data.csv")