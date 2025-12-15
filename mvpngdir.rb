#!/usr/bin/env ruby


def copy_listed_pngs(target_dir)
  fname = 'saved.txt'
  # Check if target directory exists
  unless Dir.exist?(target_dir)
    puts "Error: Directory '#{target_dir}' not found"
    exit 1
  end
  
  # Read filenames from saved.txt
  begin
    filenames = File.readlines(fname).map(&:chomp)
  rescue Errno::ENOENT
    puts "Error: saved.txt not found"
    exit 1
  end
  
  # Copy each file
  filenames.each do |filename|
    if File.exist?(filename)
      require 'fileutils'
      FileUtils.mv(filename, "#{target_dir}/#{filename}")
      puts "Moved: #{filename}"
    else
      puts "Skipped: #{filename} (not found)"
    end
  end
end

# Get target directory from command line argument
if ARGV.empty?
  puts "Usage: ./mvpngdir <target_directory>"
  exit 1
end

copy_listed_pngs(ARGV[0])
