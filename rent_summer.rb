# function to read numbers from the file and calculate the sum

def calculate_sum(file_path)
  total_sum = 0.0

  File.open(file_path, "r") do |file|
    file.each_line do |line|
      number = line.to_f
      total_sum += number
    end
  end

  total_sum.round(2)
end

file_path = "file.txt"
total_sum = calculate_sum(file_path)

puts "Total sum: #{total_sum}"

