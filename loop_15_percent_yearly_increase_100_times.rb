value=50000

100.times do |x|
  percent_value=value*0.15
  value=value+percent_value
  puts value.round(1)
end
