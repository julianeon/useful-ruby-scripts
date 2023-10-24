total=0
100.times do |rep|
  outcome=""
  5.times do |x|
    num=rand 99
  #print num
    if num>65
      outcome=outcome+"0"
    else
      outcome=outcome+"1"
    end
  end
  puts outcome
  if outcome.count("1")==5
    total=total+1
  end
end
puts total

