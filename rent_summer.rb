#!/usr/bin/env ruby

fname = ARGV[0]

# Open the file and read each line
total = 0
File.foreach(fname) do |line|
  # Convert the line to a float and add to total if it's a valid number
  number = line.strip
  total += number.to_f if number.match?(/\A[+-]?\d+(\.\d+)?\z/)
end

# Print the result
puts "Total: #{total}"
