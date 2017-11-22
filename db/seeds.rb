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

User.create!(
  email: "rabea_bader@gmail.com",
  password: "secret123",
  first_name: "Rabea",
  last_name: "Badea"
)

User.create!(
  email: "sarah_lafer@yahoo.com",
  password: "secret123",
  first_name: "Sarah",
  last_name: "Lafer"
)

User.create!(
  email: "stephan_is_great@gmail.com",
  password: "secret123",
  first_name: "Stephan",
  last_name: "Schmidbauer"
)

User.create!(
  email: "richard_ogrady@gmail.com",
  password: "secret123",
  first_name: "Richard",
  last_name: "O'Grady"
)

User.create!(
  email: "david_beckham@hotmail.com",
  password: "secret123",
  first_name: "David",
  last_name: "Beckham"
)

Bike.create!(
  address: "Schützenstraße 51, 10117 Berlin",
  city: "berlin",
  name: "Fantastic 19th century bike",
  price_by_day: 23,
  category: "Vintage Bike",
  start_date: '21-11-2017',
  end_date: '30-11-2017',
  user_id: 1,
  # latitude: 52.509073,
  # longitude: 13.395794,
  photo: "https://www.lekkerbikes.com/wp-content/uploads/2017/01/Lekker-Sportief-Womens-Bike-Pastel-Blue.jpg"
  )

Bike.create!(
  address: "Axel-Springer-Straße 41, 10969 Berlin",
  city: "berlin",
  name: "Dodgy looking modern bike",
  price_by_day: 3,
  category: "Mountain Bike",
  start_date: '21-11-2017',
  end_date: '30-11-2017',
  user_id: 2,
  # latitude: 52.507535,
  # longitude: 13.399219,
  photo: "http://rcmedulin.eu/wp-content/uploads/kids-bike-24-2-900-2-400x284.jpg"
  )

Bike.create!(
  address: "26 Rudi-Dustchke-Strasse, 10969 Berlin",
  city: "berlin",
  name: "Funky fresh bike",
  price_by_day: 14,
  category: "Child's Bike",
  start_date: '21-11-2017',
  end_date: '30-11-2017',
  user_id: 3,
  # latitude: 52.506897,
  # longitude: 13.391423,
  photo: "https://static3.nordic.pictures/1172944-thickbox_default/girls-bicycle-disney-frozen-16-inch-volare.jpg"
  )

Bike.create!(
  address: "Charlottenstraße 85-96, 10969 Berlin",
  city: "berlin",
  name: "The best bike in Berlin",
  price_by_day: 100,
  category: "Road Bike",
  start_date: '21-11-2017',
  end_date: '30-11-2017',
  user_id: 4,
  # latitude: 52.505938,
  # longitude: 13.392723,
  photo: "https://cdn.mangobikes.com/wp-content/uploads/custom-ss.jpg"
  )

Bike.create!(
  address: "Schützenstraße 8, 10117 Berlin",
  city: "berlin",
  name: "A just above average bike",
  price_by_day: 15,
  category: "Road Bike",
  start_date: '21-11-2017',
  end_date: '30-11-2017',
  user_id: 5,
  # latitude: 52.508646,
  # longitude: 13.392961,
  photo: "http://www.studds.com.au/bikes/images/2016-studds-100-FB-road-bike-black-lar.jpg"
  )


puts "Populating DB"
