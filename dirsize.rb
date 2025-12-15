#!/usr/bin/env ruby

# Get directory from command line argument, or use current directory
dir = ARGV[0] || "."

# Calculate total size by summing the size of all files
total_size = 0
Dir.glob("#{dir}/**/*", File::FNM_DOTMATCH).each do |f|
  # Skip . and .. directories
  next if File.basename(f) == "." || File.basename(f) == ".."
  # Add file size if it's a file
  total_size += File.size(f) if File.file?(f)
end

# Convert to human readable format
def human_readable(size)
  units = ['B', 'KB', 'MB', 'GB', 'TB']
  unit_index = 0
  
  while size >= 1024 && unit_index < units.length - 1
    size /= 1024.0
    unit_index += 1
  end
  
  # Format with 2 decimal places if it's not bytes
  if unit_index == 0
    "#{size.to_i} #{units[unit_index]}"
  else
    "#{size.round(2)} #{units[unit_index]}"
  end
end

# Output in human readable format
puts human_readable(total_size)