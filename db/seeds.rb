require 'open-uri'
require 'json'

Quote.destroy_all
puts 'Cleaning the database.'

url = "https://zenquotes.io/api/quotes"
parsed = JSON.parse(URI.open(url).read)
parsed.each do |quote|
  Quote.create!(
    title: quote['q'],
    author: quote['a']
    )
end

puts "Seeded the database"
