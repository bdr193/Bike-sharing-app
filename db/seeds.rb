# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Clearing database"
puts "Clearing users"
User.destroy_all
puts "Clearing bikes"
Bike.destroy_all
puts "Clearing bookings"
Booking.destroy_all

puts "Creating users"
user_one = User.create!(
  email: "rabea_bader@gmail.com",
  password: "secret123",
  first_name: "Rabea",
  last_name: "Badea",
  facebook_picture_url: "https://scontent-frt3-1.xx.fbcdn.net/v/t1.0-9/11267855_494475644050145_7650517800177078839_n.jpg?oh=88f598f1fc8228a3a81f204d69ab47bb&oe=5A916072"
)

user_two = User.create!(
  email: "sarah_lafer@yahoo.com",
  password: "secret123",
  first_name: "Sarah",
  last_name: "Lafer",
  facebook_picture_url: "https://scontent-frt3-1.xx.fbcdn.net/v/t31.0-8/15123387_1524489700911298_8540080221667972968_o.jpg?oh=81c74c24d54e1d3f4989184e7a9ee45a&oe=5AA0CACD"
)

user_three = User.create!(
  email: "stephan_is_great@gmail.com",
  password: "secret123",
  first_name: "Stephan",
  last_name: "Schmidbauer",
  facebook_picture_url: "https://scontent-frt3-1.xx.fbcdn.net/v/t1.0-9/12472516_1150297835028069_8300065499297260894_n.jpg?oh=61fd7f780e66b7d600be2918c009e714&oe=5AA8DD43"
)

user_four = User.create!(
  email: "richard_ogrady@gmail.com",
  password: "secret123",
  first_name: "Richard",
  last_name: "O'Grady",
  facebook_picture_url: "https://scontent-frt3-1.xx.fbcdn.net/v/t31.0-8/15972751_237246466721822_1634594414421206870_o.jpg?oh=51c4df723a1a2e64c7972c3e34468b0b&oe=5A8F41B5"
)

user_five = User.create!(
  email: "david_beckham@hotmail.com",
  password: "secret123",
  first_name: "David",
  last_name: "Beckham",
  facebook_picture_url: "https://www.famousbirthdays.com/headshots/david-beckham-4.jpg"
)

users = [user_one, user_two, user_three, user_four, user_five]

puts "Users completed"
puts "Creating bikes"
Bike.create!(
  address: "Schützenstraße 51, 10117 Berlin",
  city: "berlin",
  name: "Fantastic 19th century bike",
  price_by_day: 23,
  category: "Vintage Bike",
  start_date: '21-11-2017',
  end_date: '30-11-2017',
  user_id: users[0][:id],
  photo_url: "https://www.lekkerbikes.com/wp-content/uploads/2017/01/Lekker-Sportief-Womens-Bike-Pastel-Blue.jpg"
  # latitude: 52.509073,
  # longitude: 13.395794,
)

puts "First bike completed"

Bike.create!(
  address: "Axel-Springer-Straße 41, 10969 Berlin",
  city: "berlin",
  name: "Dodgy looking modern bike",
  price_by_day: 3,
  category: "Mountain Bike",
  start_date: '21-11-2017',
  end_date: '30-11-2017',
  user_id: users[1][:id],
  photo_url: "http://rcmedulin.eu/wp-content/uploads/kids-bike-24-2-900-2-400x284.jpg"
  # latitude: 52.507535,
  # longitude: 13.399219,
)

puts "Second bike completed"

Bike.create!(
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  city: "berlin",
  name: "Funky fresh bike",
  price_by_day: 14,
  category: "Child's Bike",
  start_date: '21-11-2017',
  end_date: '30-11-2017',
  user_id: users[2][:id],
  photo_url: "https://www.raleigh.co.uk/media/catalog/product/r/a/raleigh_molli_moll16pk-9_1_1_1_1_1.jpg"
  # latitude: 52.506897,
  # longitude: 13.391423,
)

puts "Third bike completed"

Bike.create!(
  address: "Charlottenstraße 85-96, 10969 Berlin",
  city: "berlin",
  name: "The best bike in Berlin",
  price_by_day: 100,
  category: "Road Bike",
  start_date: '21-11-2017',
  end_date: '30-11-2017',
  user_id: users[3][:id],
  photo_url: "https://cdn.mangobikes.com/wp-content/uploads/custom-ss.jpg"
  # latitude: 52.505938,
  # longitude: 13.392723,
)
puts "Fourth bike completed"

Bike.create!(
  address: "Schützenstraße 8, 10117 Berlin",
  city: "berlin",
  name: "Stemfmister bike",
  price_by_day: 15,
  category: "Road Bike",
  start_date: '21-11-2017',
  end_date: '30-11-2018',
  user_id: users[4][:id],
  photo_url: "http://www.studds.com.au/bikes/images/2016-studds-100-FB-road-bike-black-lar.jpg"
  # latitude: 52.508646,
  # longitude: 13.392961,
)

Bike.create!(
  address: "Linienstraße 113, 10115 Berlin",
  city: "berlin",
  name: "Coco bike",
  price_by_day: 18,
  category: "Road Bike",
  start_date: '21-11-2017',
  end_date: '30-11-2018',
  user_id: users[4][:id],
  photo_url: "http://www.studds.com.au/bikes/images/2016-studds-100-FB-road-bike-white-lar.jpg"
  # latitude: 52.508646,
  # longitude: 13.392961,
)

Bike.create!(
  address: "Karl-Liebknecht-Str. 3, 10178 Berlin",
  city: "berlin",
  name: "Boring bike",
  price_by_day: 12,
  category: "Road Bike",
  start_date: '21-11-2017',
  end_date: '30-11-2018',
  user_id: users[0][:id],
  photo_url: "http://www.studds.com.au/bikes/images/dutch-purple.png"
  # latitude: 52.508646,
  # longitude: 13.392961,
)

Bike.create!(
  address: "Zimmerstraße 12, 10969 Berlin",
  city: "berlin",
  name: "Way above average bike",
  price_by_day: 8,
  category: "Road Bike",
  start_date: '21-11-2017',
  end_date: '30-11-2018',
  user_id: users[3][:id],
  photo_url: "http://rosen-meents.co.il/_uploads/extraimg/reacto400.jpg"
  # latitude: 52.508646,
  # longitude: 13.392961,
)

Bike.create!(
  address: "Köthener Str. 28, 10963 Berlin",
  city: "berlin",
  name: "Fastest Bike",
  price_by_day: 35,
  category: "Road Bike",
  start_date: '21-11-2017',
  end_date: '30-11-2018',
  user_id: users[1][:id],
  photo_url: "http://rosen-meents.co.il/_uploads/extraimg/7000e.jpg"
  # latitude: 52.508646,
  # longitude: 13.392961,
)

Bike.create!(
  address: "Am Kupfergraben 4/4A, 10117 Berlin",
  city: "berlin",
  name: "Crazy bike",
  price_by_day: 45,
  category: "Road Bike",
  start_date: '21-11-2017',
  end_date: '30-11-2018',
  user_id: users[2][:id],
  photo_url: "http://rosen-meents.co.il/_uploads/extraimg/44444444444444444444444444444444.jpg"
  # latitude: 52.508646,
  # longitude: 13.392961,
)

puts "All bikes completed"
puts "Created #{User.all.length} Users and #{Bike.all.length} bikes"
