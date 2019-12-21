# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# カスタマーのサンプルデータ
10.times do |n|
Customer.create!(
				  nickname: Faker::Name.name,
				  image_id: "",
				  email: Faker::Internet.unique.free_email,
				  password: Faker::Number.between(from: 100000, to: 999999),
				  )
end

# 店主のサンプルデータ
10.times do |n|
Owner.create!(
				  nickname: Faker::Name.name,
				  name_kana: Faker::Name.name,
				  name: Faker::Name.name,
				  email: Faker::Internet.unique.free_email,
				  password: Faker::Number.between(from: 100000, to: 999999),
				  )
end
# conversationのサンプルデータ
10.times do |n|
Conversation.create!(
				  owner_id: Faker::Number.between(from: 1, to: 5),
				  customer_id: Faker::Number.between(from: 1, to: 4),
				  )
end
# メッセージのサンプルデータ
10.times do |n|
Message.create!(
				  conversation_id: Faker::Number.between(from: 1, to: 5),
				  message: Faker::Lorem.sentence,
				  )
end
# 店主のサンプルデータ
10.times do |n|
Store.create!(
				  owner_id: Faker::Number.between(from: 1, to: 10),
				  store_name: Faker::Name.name,
				  store_postal_cade: Faker::Number.between(from: 100, to: 999),
				  store_prefecture_code: Faker::Number.between(from: 1, to: 47),
				  store_city: Faker::Address.city,
				  store_building: Faker::Address.street_address,
				  store_phone_number: Faker::Number.between(from: 100, to: 500),
				  store_category: Faker::Name.name,
				  good: Faker::Lorem.sentence,
				  image_id: "",
				  introduction: Faker::Lorem.sentence,
				  )
end