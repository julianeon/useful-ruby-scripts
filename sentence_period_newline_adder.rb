# Original text
flines=File.readlines("index.md")

flines.each do |line|
  newline = line.gsub(/\.(\s|$)/, ".\n\n")
  puts newline
end

