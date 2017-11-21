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

def create_bike(user)
  puts user.inspect
  bikes_attributes = [
    {
      address: Faker::Address.street_address,
      city: Faker::Address.city,
      name: Faker::StarWars.character,
      price_by_day: (0..100).to_a.sample,
      category: Faker::Pokemon.move ,
      user_id: user[0][:id]
    },
  ]
end

def create_user
  users_attributes = [
    {
      email: "#{Faker::Pokemon.name}@gmail.com" ,
      password: "greatStephan1"
    },
  ]
end



puts "Creating users and bikes"
10.times do
  user = User.create!(create_user)
  Bike.create!(create_bike(user))
end

puts "#{User.all.length} Users created"
puts "#{Bike.all.length} Bikes created"

puts "Finished"
