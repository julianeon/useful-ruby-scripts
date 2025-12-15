#!/usr/bin/env ruby

value = 1500
# Check if both input and output arguments are provided
if ARGV.length != 2
  puts "Usage: #{$PROGRAM_NAME} input_image output_image"
  exit 1
end

# Store the input and output paths
input_file = ARGV[0]
output_file = ARGV[1]

# Check if input file exists
unless File.exist?(input_file)
  puts "Error: Input file '#{input_file}' does not exist"
  exit 1
end

# Resize the image to 1024 pixels (preserving aspect ratio) using sips
command = "sips -Z #{value} \"#{input_file}\" --out \"#{output_file}\""
result = system(command)

# Check if operation was successful
if result
  puts "Image successfully resized to 1024 pixels and saved to '#{output_file}'"
else
  puts "Error: Failed to resize the image"
  exit 1
end
