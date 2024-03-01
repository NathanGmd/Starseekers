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

SolarSystem.destroy_all
Category.destroy_all
User.destroy_all

Category.create(name: "Coup de Coeur")
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

BACKPLANETS = ["arid.jpg", "artic.jpg", "humid.png", "murky.jpg", "rocky.jpg", "temperate.jpg", "tropical.jpg"]

x = 1
6.times do
  url = "https://swapi.dev/api/planets/?page=#{x}"
  list_serialized = URI.open(url).read
  list = JSON.parse(list_serialized)
  planets = list["results"]
  planets.each do |content|
    planet = Planet.new(
      name: content["name"],
      rotation_period: content["rotation_period"],
      orbital_period: content["orbital_period"],
      diameter: content["diameter"],
      gravity: content["gravity"],
      terrain: content["terrain"],
      surface_water: content["surface_water"],
      population: content["population"],
      climate: content["climate"],
      image: BACKPLANETS.sample,
      category: Category.all.sample,
      solar_system: SolarSystem.all.sample,
      user: User.first,
      content: Faker::Lorem.paragraph(sentence_count: 30),
      price_per_day: rand(800..1200)
    )
    planet.save!
  end
  x += 1
end
puts 'ok'
