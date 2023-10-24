def flip_coin
  rand(2) == 0 ? 'H' : 'T'
end

def longest_streak(coin_flips)
  max_streak = 0
  current_streak = 0

  (1...coin_flips.length).each do |i|
    if coin_flips[i] == coin_flips[i - 1]
      current_streak += 1
    else
      max_streak = [max_streak, current_streak].max
      current_streak = 0
    end
  end

  [max_streak, current_streak].max
end

# simulate coin flips
coin_flips = Array.new(1000000) { flip_coin }

# count the longest streak
max_streak = longest_streak(coin_flips)

# print the result
puts "Coin flips: #{coin_flips.join}"
puts "Longest streak of either H or T: #{max_streak}"

