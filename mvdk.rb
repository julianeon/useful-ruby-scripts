#!/usr/bin/env ruby

# Script: mvdk - Move Desktop Screenshots
# Description: Finds the latest screenshot on macOS Desktop and moves it to the specified location

require 'fileutils'

def find_latest_screenshot
  # Get the Desktop path
  desktop_path = File.expand_path("~/Desktop")
  
  # Find all files that start with "Screenshot"
  screenshots = Dir.glob("#{desktop_path}/Screenshot*").select { |f| File.file?(f) }
  
  # If no screenshots found, exit with an error
  if screenshots.empty?
    puts "Error: No screenshot files found on Desktop"
    exit 1
  end
  
  # Sort by modification time (most recent last) and get the last one
  latest_screenshot = screenshots.sort_by { |f| File.mtime(f) }.last
  
  return latest_screenshot
end

def move_screenshot(source, destination)
  begin
    # Create destination directory if it doesn't exist
    dest_dir = File.dirname(destination)
    FileUtils.mkdir_p(dest_dir) unless File.directory?(dest_dir)
    
    # Move the file
    FileUtils.mv(source, destination)
    puts "Moved #{File.basename(source)} to #{destination}"
  rescue => e
    puts "Error: Failed to move file - #{e.message}"
    exit 1
  end
end

# Check if destination argument is provided
if ARGV.empty?
  puts "Usage: mvdk DESTINATION_PATH"
  puts "Example: mvdk ~/Pictures/fun.png"
  exit 1
end

destination = File.expand_path(ARGV[0])
latest_screenshot = find_latest_screenshot
move_screenshot(latest_screenshot, destination)