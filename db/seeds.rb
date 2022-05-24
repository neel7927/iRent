# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'json'
# require 'open-uri'

# url = ''
# item_ids = URI.open.(url).read
# items = JSON.parse(item_ids)

# 10.times do |index|
#   item_id = items[index]
#   url_item = "url"
#   item_info = URI.open(url_item).read
#   Item.create (
#     name: item[''],
#     description: item[''],
#     category: item[''],
#     # available: item[''],
#     item_condition: item[''],
#     average_rating: item[''],
#   )
# end
require 'faker'

# User.create(email: "lewagon@gmail.com",encrypted_password: "123456")
Booking.destroy_all
Item.destroy_all


10.times do
  Item.create(
    name:Faker::Device.model_name,
    description:Faker::Lorem.paragraph(sentence_count: 2),
    price:Faker::Number.decimal(l_digits: 4, r_digits: 2),
    category: ["Computer","Camera","Gaming","Appliances","Drone"].sample,
    available: true,
    item_condition: ["A","B","C"].sample,
    average_rating: Faker::Number.within(range: 0.0..5.0),
    user_id: 1
  )
  puts "create item"
end

5.times do
  Booking.create(
    user_id: 1,
    item_id: rand(92..101),
    start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default),
    end_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default),
    total: Faker::Number.positive,
    is_accepted: true
  )
  puts "create booking"
end
