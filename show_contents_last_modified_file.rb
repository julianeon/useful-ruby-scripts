#!/usr/bin/env ruby

# Find the most recently modified file in the current directory
ansfile = Dir.glob("*").max_by { |f| File.mtime(f) }

# Open and read the file line by line
if File.exist?(ansfile)
  File.foreach(ansfile) do |line|
    puts line
  end
else
  puts "File not found: #{ansfile}"
end
