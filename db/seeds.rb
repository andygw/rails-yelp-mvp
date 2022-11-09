# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."
15.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: Restaurant::CATEGORIES.sample
  )
  puts "Restaurant #{restaurant.name} created"
  puts "Writing reviews for #{restaurant.name}..."
  rand(2..4).times do
    review = Review.create(
      rating: rand(0..5),
      content: Faker::Restaurant.review,
      restaurant_id: restaurant.id
    )
    puts "Review created for #{restaurant.name}"
  end
  puts "All reviews written"
end

puts "Finished!"
