# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning up database..."
Booking.destroy_all
puts "Cleaning up Bookings..."
Sneaker.destroy_all
puts "Cleaning up Sneakers..."
User.destroy_all
puts "Cleaning up Users..."
puts "Database cleaned"

puts "Creating users..."
elsa = User.create(first_name: "Elsa", last_name:"Test", email: "elsa@gmail.com", password:"123456", password_confirmation:"123456")
benjamin = User.create(first_name: "Benjamin", last_name:"Test", email: "benjamin@gmail.com", password:"123456", password_confirmation:"123456")
chloe = User.create(first_name: "Chloé", last_name:"Test", email: "chloé@gmail.com", password:"123456", password_confirmation:"123456")
eric = User.create(first_name: "Eric", last_name:"Test", email: "eric@gmail.com", password:"123456", password_confirmation:"123456")
aurelie = User.create(first_name: "Aurelie", last_name:"Test", email: "aurelie@gmail.com", password:"123456", password_confirmation:"123456")
puts "Users created!"

lorem = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the.
 industry's standard dummy text ever since the 1500s, when an unknown printer took a galley"

puts "Creating sneakers..."
Sneaker.create(address: "16 villa gaudelet, Paris", brand: "Crocs", name: "Crocs Bob l'éponge", size: 38, price: 42, description: lorem, user: benjamin)
Sneaker.create(address: "16 villa gaudelet, Paris", brand: "Nike", name: "Nike Waffle One SE ", size: 42, price: 135, description: lorem, user: chloe)
Sneaker.create(address: "16 villa gaudelet, Paris", brand: "New balance", name: "New Balance - 327", size: 36, price: 160, description: lorem, user: eric)
Sneaker.create(address: "16 villa gaudelet, Paris", brand: "Nike", name: "AIR FORCE 1 SHADOW ", size: 36, price: 120, description: lorem, user: aurelie)
Sneaker.create(address: "16 villa gaudelet, Paris", brand: "Veja", name: "Veja Venturi ", size: 41, price: 120, description: lorem, user: benjamin)
Sneaker.create(address: "16 villa gaudelet, Paris", brand: "Converse", name: "Chuck Taylor All Star Classic", size: 37, price: 90, description: lorem, user: elsa)
Sneaker.create(address: "16 villa gaudelet, Paris", brand: "Adidas", name: "Baskets Ozweego", size: 41, price: 100, description: lorem, user: aurelie)
Sneaker.create(address: "16 villa gaudelet, Paris", brand: "Adidas", name: "STAN SMITH - Baskets basses", size: 37, price: 100, description: lorem, user: eric)
Sneaker.create(address: "16 villa gaudelet, Paris", brand: "Nike", name: "Venture runner", size: 38, price: 105, description: lorem, user: chloe)
Sneaker.create(address: "16 villa gaudelet, Paris", brand: "Vans", name: "OLD SKOOL PLATFORM - Baskets basses", size: 35, price: 90, description: lorem, user: elsa)
puts "Sneakers created!"



require "open-uri"
require "yaml"

file = ""
sample = YAML.load(open(file).read)

puts 'Pick a sneak...'
sneakers = {}  # slug => sneaker
sample["sneakers"].each do |sneaker|
  sneakers[sneaker["slug"]] = sneaker.create! sneaker.slice("name", "brand", "size")
end
