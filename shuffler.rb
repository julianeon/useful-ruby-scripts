#!/usr/bin/env ruby

filename = ARGV[0]

if filename.nil? || !File.exist?(filename)
  puts "Please provide a valid filename"
  exit 1
end

# Read all lines from the file
lines = File.readlines(filename)

# Shuffle the lines randomly
shuffled_lines = lines.shuffle

# Write the shuffled lines back to the file
File.open(filename, 'w') do |file|
  shuffled_lines.each do |line|
    file.write(line)
  end
end

puts "Successfully reshuffled #{lines.length} lines in #{filename}"
