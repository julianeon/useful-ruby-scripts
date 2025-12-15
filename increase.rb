#!/usr/bin/env ruby
require 'date'

# Days of the week
DAYS = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']

# Get yesterday's date
yesterday = Date.today.prev_day
date_format = yesterday.strftime('%m%d%y')

# Define the file mappings
file_mappings = {
  'today.md' => "today_#{date_format}.md",
  'diary.md' => "log_#{date_format}.md"
}

def next_day(day_name)
  current_index = DAYS.index(day_name)
  DAYS[(current_index + 1) % 7]
end

def next_date(date_str)
  # Parse MMDDYY format
  month = date_str[0..1].to_i
  day = date_str[2..3].to_i
  year = date_str[4..5].to_i
  
  # Assume 20YY for years
  full_year = year < 50 ? 2000 + year : 1900 + year
  date = Date.new(full_year, month, day)
  next_date = date + 1
  
  # Format back to MMDDYY
  next_date.strftime('%m%d%y')
end

def update_entry(line)
  # Match pattern like [Sat 110825](log_110825.md)
  if line =~ /\[(#{DAYS.join('|')})\s+(\d{6})\]\((log_\d{6}\.md)\)/
    day_name = $1
    date_str = $2
    log_file = $3
    
    new_day = next_day(day_name)
    new_date = next_date(date_str)
    new_log_file = "log_#{new_date}.md"
    
    "[#{new_day} #{new_date}](#{new_log_file})"
  else
    line
  end
end

def update_images(line)
  # Increment image{number}.jpg to image{number+1}.jpg
  line.gsub(/image(\d+)\.jpg/) { |match| "image#{$1.to_i + 1}.jpg" }
end

def update_today_dates(line)
  # Increment today_MMDDYY to today_MMDDYY with incremented date (with or without .md)
  line.gsub(/today_(\d{6})(?=\.md|[)\]])/) { |match| "today_#{next_date($1)}" }
end

# Copy each file
file_mappings.each do |source, destination|
  if File.exist?(source)
    begin
      File.open(source, 'r') do |source_file|
        File.open(destination, 'w') do |dest_file|
          dest_file.write(source_file.read)
        end
      end
      puts "Successfully copied: #{source} -> #{destination}"
    rescue StandardError => e
      puts "Error copying #{source} to #{destination}: #{e.message}"
    end
  else
    puts "Warning: Source file '#{source}' does not exist!"
  end
end

# Update diary.md
content = File.read('diary.md')
lines = content.split("\n")
updated_lines = lines.map do |line|
  # Only process diary entries (log date links), not other links
  if line =~ /^\s*-\s*\[/ && line =~ /\[(#{DAYS.join('|')})\s+\d{6}\]/
    "- #{update_entry(line)}"
  else
    # Still update image numbers on all lines
    update_images(line)
  end
end
File.write('diary.md', updated_lines.join("\n"))
puts "✓ Updated diary.md"

# Update today.md
content = File.read('today.md')
lines = content.split("\n")
updated_lines = lines.map do |line|
  update_today_dates(line)
end
File.write('today.md', updated_lines.join("\n"))
puts "✓ Updated today.md"