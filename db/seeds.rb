require 'open-uri'
require 'json'

Quote.destroy_all
User.destroy_all
puts 'Cleaning the database.'

puts 'Admin user'
admin = User.create!(email: 'admin@quotes.com', firstname: 'admin', lastname: 'user', password: 123456)

url = "https://zenquotes.io/api/quotes"
parsed = JSON.parse(URI.open(url).read)
parsed.each do |quote|
  Quote.create!(
    title: quote['q'],
    author: quote['a'],
    user_id: admin.id
    )
end

puts "Seeded the database"
