# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
#=> apps
# 5.times do
#   App.create!(name:Faker::App.name.downcase!,ceo:User.first)
# end

#=> users
5.times do
  User.create!(email: Faker::Internet.email, password:'foobar')
end