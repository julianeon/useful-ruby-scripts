#!/usr/bin/env ruby

if ARGV.length != 1
  puts "Usage: ruby timestamp_converter.rb <timestamp>"
  exit 1
end

timestamp = ARGV[0].to_i

# Handle milliseconds (if timestamp > 10 digits, it's likely milliseconds)
timestamp = timestamp / 1000 if timestamp > 10**10

puts Time.at(timestamp).strftime("%Y-%m-%d %H:%M:%S")
