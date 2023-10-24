fname="cnt.txt"
cnt=0
flines=File.readlines(fname)
flines.each do |line|
  cnt+=1
  newline="#{cnt}:#{line}"
  puts newline
end

