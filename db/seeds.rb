# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

#=> users
User.create!(email:'ispirett@gmail.com', password:'foobar')
5.times do
  User.create!(email: Faker::Internet.email, password:'foobar')
end

#=> apps
5.times do
  App.create!(name:Faker::App.name.downcase ,ceo:User.first)
end



  # User.all.each do |user|
  #   App.all.each do |app|
  #     user.update_attribute(:app_id,app.id )
  #   end
  #
  # end

