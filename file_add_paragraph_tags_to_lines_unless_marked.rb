flines=File.readlines("text.txt")
tagme=true
flines.each do |x|
  if (x.strip=="XXX")
    tagme=!tagme
  else
    unless (x.strip=="")
      if tagme
        puts "<p>#{x.strip}</p>"
      else
        puts "#{x.strip}"
      end
    end
  end
end
