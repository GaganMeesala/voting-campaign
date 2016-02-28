require 'csv'

puts "Started creating campaigns"
# Creating Array as Campaign Names
campaign_array = ["ssss_uk_01B", "Emmerdale", "ssss_uk_02A", "ssss_uk_02B"]
campaign_array.each do |campaign|
  # Creating campaign object
  Campaign.create(name: campaign)
end
puts "Finished Campaigns.........!"

# Reading data from file
file_data = File.read('/home/gagan/Desktop/votes.txt')

# Creating CSV object
# To remove invalid byte sequences from stings
# http://stackoverflow.com/questions/8710444/is-there-a-way-in-ruby-1-9-to-remove-invalid-byte-sequences-from-strings
csv_file = CSV.new(file_data.chars.select(&:valid_encoding?).join, {:col_sep => " "})

puts "Started creating votes associated with campaigns"
# Converting CSV to Array and creating voting objects
csv_file.to_a.map do |data|
  key = campaign_array.index(data[2].split(':')[1])
  # Verifying whether key is nil or not.
  if !key.nil?
    Vote.create(validity: data[3].split(':')[1], choice: data[4].split(':')[1], campaign_id: key + 1)
  end
end
puts "Finished Votes..........!"