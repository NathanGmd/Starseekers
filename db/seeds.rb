# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'json'
require 'open-uri'
require 'faker'

Category.destroy_all
SolarSystem.destroy_all
Planet.destroy_all
User.destroy_all

# Category.create(name: "Coup de Coeur")
Category.create(name: "Arid")
Category.create(name: "Artic")
Category.create(name: "Tropical")
Category.create(name: "Temperate")
Category.create(name: "Rocky")
Category.create(name: "Humid")
Category.create(name: "Murky")

12.times do
  name = Faker::Space.star
  SolarSystem.find_or_create_by(name: name)
end

newuser = User.new(
  email: "newmail@gmail.com",
  password: "password"
)
newuser.save

x = 1
6.times do
  url = "https://swapi.dev/api/planets/?page=#{x}"
  list_serialized = URI.open(url).read
  list = JSON.parse(list_serialized)
  planets = list["results"]
  planets.each do |content|
    planet = Planet.new(
      name: content["name"],
      category: Category.all.sample,
      solar_system: SolarSystem.all.sample,
      user: User.first
    )
    planet.save!
  end
  x += 1
end
puts 'ok'
