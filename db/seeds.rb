# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Clearing database"
User.destroy_all
Bike.destroy_all

puts "Populating DB"

bikes_attributes = [
  {
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    name: Faker::StarWars.character,
    price_by_day: (0..100).to_a.sample,
    category: Faker::Pokemon.move ,
    user_id: 1
  },
        ]

users_attributes = [
  {
    email: "#{Faker::Pokemon.name}@gmail.com" ,
    password: Faker::Team.creature
  },
        ]

1.times do
User.create!(users_attributes)
end

10.times do
Bike.create!(bikes_attributes)
end

puts "Finished"
