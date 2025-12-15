#!/usr/bin/env ruby

require 'date'
require 'find'

exit 1 if ARGV.empty? || !ARGV[0].match?(/^\d{6}$/)

date_arg = ARGV[0]
month = date_arg[0, 2].to_i
day = date_arg[2, 2].to_i
year = 2000 + date_arg[4, 2].to_i

target_date = Date.new(year, month, day)

image_exts = %w[.jpg .jpeg .png .gif .bmp .tiff .tif .webp .svg .raw .cr2 .nef .arw .dng]

Find.find('.') do |file|
  next unless File.file?(file) && image_exts.include?(File.extname(file).downcase)
  
  file_date = Date.new(*File.mtime(file).to_a[3..5].reverse)
  puts file if file_date == target_date
end