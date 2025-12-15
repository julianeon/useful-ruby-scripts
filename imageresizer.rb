#!/usr/bin/env ruby

# Define the amount at the top of the script
amount = 1600

# Check if an argument was provided
if ARGV.empty?
  puts "Error: Please provide an image filename as an argument."
  puts "Usage: ruby #{File.basename(__FILE__)} input_image.png"
  exit 1
end

# Get the input filename from command line argument
input_file = ARGV[0]

# Set output filename to output.png in the same directory as input file
output_file = File.join(File.dirname(input_file), "output.png")

# Build and execute the sips command
command = "sips -Z #{amount} #{input_file} --out #{output_file}"

puts "Resizing image: #{input_file} → #{output_file} (#{amount}px)"
system(command)

# Check if the command was successful
if $?.success?
  # Get the file sizes
  original_size = File.size(input_file)
  new_size = File.size(output_file)
  size_reduction = original_size - new_size
  percentage = ((size_reduction.to_f / original_size) * 100).round(2)
  
  # Get image dimensions if possible
  original_dims = `sips -g pixelHeight -g pixelWidth #{input_file} 2>/dev/null`.strip
  new_dims = `sips -g pixelHeight -g pixelWidth #{output_file} 2>/dev/null`.strip
  
  # Human-readable output
  puts "\nRESIZE COMPLETE"
  puts "================="
  puts "Original: #{input_file}"
  puts "Original size: #{(original_size.to_f / 1024).round(2)} KB"
  puts "New size:      #{(new_size.to_f / 1024).round(2)} KB"
  puts "Reduction:     #{percentage}% (#{(size_reduction.to_f / 1024).round(2)} KB)"
  
else
  puts "Error: Failed to resize the image."
  exit 1
end
