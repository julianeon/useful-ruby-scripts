arrone=Array.new
arrtwo=Array.new

flines=File.readlines("csv1.csv")
flines.each do |x|
  split=x.split(",")
  addyto= split[5]
  arrone.push addyto
end

glines=File.readlines("csv2.csv")
glines.each do |y|
  split=y.split(",")
  addytoo= split[5]
  arrtwo.push addytoo
end

arrone.uniq!
arrtwo.uniq!

arrtwo.each do |x|
  if arrone.include? x
    puts x
  end
end
