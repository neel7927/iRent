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
require 'open-uri'
require 'json'

# User.create(email: "lewagon@gmail.com",encrypted_password: "123456")
# Booking.destroy_all
# Item.destroy_all
# file = URI.open('https://images.unsplash.com/photo-1496181133206-80ce9b88a853?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80')


#   item = Item.new(
#     name:Faker::Device.model_name,
#     description:Faker::Lorem.paragraph(sentence_count: 2),
#     price:Faker::Number.decimal(l_digits: 4, r_digits: 2),
#     category: ["Computer","Camera","Gaming","Appliances","Drone"].sample,
#     available: true,
#     item_condition: ["A","B","C"].sample,
#     average_rating: Faker::Number.within(range: 0.0..5.0),
#     user_id: rand(5..10)
#   )
#   item.photo.attach(io: file, filename: 'laptop.png', content_type: 'image/png')
#   puts "create item"
#   item.save


  # 15.times do
  #   Booking.create(
  #     user_id: rand(5..10),
  #     item_id: rand(39..55),
  #     start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default),
  #     end_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default),
  #     total: Faker::Number.positive,
  #     state: "Pending"
  #   )
  #   puts "create booking"
  # end
item_list = "db/items.json"
items_file = File.read(item_list)
items = JSON.parse(items_file)

user_list = "db/users.json"
users_file = File.read(user_list)
users = JSON.parse(users_file)

# Booking.destroy_all
# Item.destroy_all
# User.destroy_all

# user_count = users["entries"].count
# x = 0
# user_count.times do
#   user1 = User.create(email: "#{users["entries"][x]["email"]}", password: "#{users["entries"][x]["password"]}")
#   x += 1
# end

# user1 = User.create(email: "ibrahim@gmail.com",encrypted_password: "123456")

puts "creating items"
item_count = items["entries"].count
i = 0
item_count.times do
  item1 = Item.create!(name: "#{items["entries"][i]["name"]}",
                       description: "#{items["entries"][i]["description"]}",
                       price: "#{items["entries"][i]["price"]}",
                       category: "#{items["entries"][i]["category"]}",
                       item_condition: "#{items["entries"][i]["item_condition"]}",
                       user_id: "#{items["entries"][i]["user_id"]}"
                       )
j = 0
photo_count = items["entries"][i]["photo"].count
photo_count.times do
  photo = items["entries"][i]["photo"][j]
  file = URI.open("#{photo}")
  item1.photo.attach(io: file, filename: "item.jpg",content_type: 'image/jpg')
  j += 1
end
i += 1
end

puts "Items created"
