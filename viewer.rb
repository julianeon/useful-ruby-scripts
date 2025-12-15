#!/usr/bin/env ruby
# Save as view-images-ordered.rb

# Check if an argument was provided
if ARGV.empty?
  puts "Usage: #{$0} <input_file>"
  exit 1
end

input_file = ARGV[0]
image_files = []

# Check if the input file exists
unless File.exist?(input_file)
  puts "Error: File '#{input_file}' not found."
  exit 1
end

# Read the file and collect valid image files
File.foreach(input_file) do |line|
  filename = line.strip
  
  # Check if file exists and has valid image extension
  if File.exist?(filename) && filename.match?(/\.(png|jpe?g)$/i)
    image_files << filename
  end
end

# Open all image files if any were found
if image_files.any?
  system("qlmanage", "-p", "-x", *image_files)
else
  puts "No valid image files (PNG, JPG, JPEG) found in '#{input_file}'."
end