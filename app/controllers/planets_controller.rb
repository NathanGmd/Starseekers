class PlanetsController < ApplicationController
  def index
    @solar_systems = SolarSystem.all
    @categories = Category.all
    @planets = Planet.all
  end

  def show
  end
end
