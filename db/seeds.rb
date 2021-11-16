# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

elsa = User.create(first_name: "Elsa", last_name:"Test", email: "elsa@gmail.com", password:"123456", password_confirmation:"123456")
benjamin = User.create(first_name: "Benjamin", last_name:"Test", email: "benjamin@gmail.com", password:"123456", password_confirmation:"123456")
chloé = User.create(first_name: "Chloé", last_name:"Test", email: "chloé@gmail.com", password:"123456", password_confirmation:"123456")
eric = User.create(first_name: "Eric", last_name:"Test", email: "eric@gmail.com", password:"123456", password_confirmation:"123456")
aurelie = User.create(first_name: "Aurelie", last_name:"Test", email: "aurelie@gmail.com", password:"123456", password_confirmation:"123456")

lorem = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the.
 industry's standard dummy text ever since the 1500s, when an unknown printer took a galley"

puts "Creating sneakers..."
Sneaker.create(brand: "Crocs", name: "Crocs Bob l'éponge", size: "38", price: "42", description: lorem, user_id: benjamin)
Sneaker.create(brand: "Nike", name: "Nike Waffle One SE ", size: "42", price: "135 €", description: lorem, user_id: chloé)
Sneaker.create(brand: "New balance", name: "New Balance - 327", size: "36", price: "160 €", description: lorem, user_id: eric)
Sneaker.create(brand: "Nike", name: "AIR FORCE 1 SHADOW ", size: "36", price: "120 €", description: lorem, user_id: aurelie)
Sneaker.create(brand: "Veja", name: "Veja Venturi ", size: "41", price: "120 €", description: lorem, user_id: benjamin)
Sneaker.create(brand: "Converse", name: "Chuck Taylor All Star Classic", size: "37", price: "90 €", description: lorem, user_id: elsa)
Sneaker.create(brand: "Adidas", name: "Baskets Ozweego", size: "41", price: "100 €", description: lorem, user_id: aurelie)
Sneaker.create(brand: "Adidas", name: "STAN SMITH - Baskets basses", size: "37", price: "100 €", description: lorem, user_id: eric)
Sneaker.create(brand: "Nike", name: "Venture runner", size: "38", price: "105 €", description: lorem, user_id: chloé)
Sneaker.create(brand: "Vans", name: "OLD SKOOL PLATFORM - Baskets basses", size: "35", price: "90 €", description: lorem, user_id: elsa)
