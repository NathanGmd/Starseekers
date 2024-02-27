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

Categorie.create(name: "Coup de Coeur")
Categorie.create(name: "Rocky")
Categorie.create(name: "Temperate")
Categorie.create(name: "Arid")
Categorie.create(name: "Artic")
Categorie.create(name: "Tropical")
Categorie.create(name: "Humid")
Categorie.create(name: "Murker")

x = 1
6.times do
  url = "https://swapi.dev/api/planets/?page=#{x}"
  list_serialized = URI.open(url).read
  list = JSON.parse(list_serialized)
  planets = list["results"]
  planets.each do |content|
    planet = Planet.new(
      name: content["name"]
      )
  end
  x += 1
end

12.times do
  name = Faker::Space.star
  SolarSystem.find_or_create_by(name: name)
end

puts 'ok'
