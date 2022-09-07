# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

PropertyUser.destroy_all
User.destroy_all
Property.destroy_all

User.create!(email: 'test45@test.fr',password: '123456',password_confirmation: '123456')

3.times do |i|
  Property.create!(
    title: "Propriété Numéro #{i}",
    price: i + 100_000,
    description: "Description NuméroDescription NuméroDescription Numéro #{i}",
    surface: i + 100,
  )
end

Properties = Property.all
Properties.each do |property| 
PropertyUser.create(
  user: User.all.sample,
  property: property
)
end