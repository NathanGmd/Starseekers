class PlanetsController < ApplicationController
  def index
    @solar_systems = SolarSystem.all
    if params[:category]
      @planets = Planet.where(category: Category.find_by(name: params[:category]))
    else
      @planets = Planet.where(category: Category.find_by(name: "Coup de coeur"))
    end
    @categories = Category.all
  end

  def show
    @planet = Planet.find(params[:id])
    # raise
  end

  private

  def set_planet

  end
end
