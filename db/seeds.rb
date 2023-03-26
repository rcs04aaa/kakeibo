# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: "admin@mail.com",
  password: "admin1"
)

categories = ["食費", "日用品費", "光熱費", "衣服", "美容費", "通信費", "交通費", "医療費", "交際費", "娯楽費", "教育費", "その他"]
categories.each do |category|
  Category.create!(category_name: category)
end

contents = %w(醤油 パン お弁当)
(1..5).each do |n|
  user = User.create!(email: "syuhu#{n}@test.com", user_name: "kenyakuka#{n}", password: 'password')
  rand(1..3).times do
    user.posts.create!(payment_at: '2023-03-26', content: contents.sample, category_id: rand(1..categories.size), price: rand(20..50) * 10, quantity: rand(1..3))
  end
end

#if Rails.env.development?
#end