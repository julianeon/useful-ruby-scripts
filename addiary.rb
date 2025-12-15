#!/usr/bin/env ruby

# Script to add a line to diary.md after the ![imagetop] line

diary_path = File.expand_path("~/JavaScript/cooking/Diary/diary.md")

unless ARGV.length > 0
  puts "Usage: ./addiary \"Your diary entry here\""
  exit 1
end

entry = ARGV.join(" ")

unless File.exist?(diary_path)
  puts "Error: Diary file not found at #{diary_path}"
  exit 1
end

# Read the file
content = File.read(diary_path)
lines = content.split("\n")

# Find the ![imagetop] line
imagetop_index = lines.find_index { |line| line.match?(/^\!\[imagetop\]/) }

unless imagetop_index
  puts "Error: Could not find ![imagetop] line in diary"
  exit 1
end

# Insert the new entry after the ![imagetop] line
lines.insert(imagetop_index + 1, "\n#{entry}.")

# Write back to file
File.write(diary_path, lines.join("\n"))

puts "✓ Added: #{entry}"
