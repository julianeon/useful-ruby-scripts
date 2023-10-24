require 'csv'

def find_matching_addresses(csv_file)
  matching_addresses = []

  CSV.foreach(csv_file) do |row|
    from_address = row[4]
    to_address = row[5]

    matching_addresses << from_address if from_address && !matching_addresses.include?(from_address)
    matching_addresses << to_address if to_address && !matching_addresses.include?(to_address)
  end

  matching_addresses.uniq
end

csv_file = 'test.csv'
matching_addresses = find_matching_addresses(csv_file)

if matching_addresses.empty?
  puts "No matching addresses found."
else
  puts "Matching addresses:"
  matching_addresses.each { |address| puts address }
end

