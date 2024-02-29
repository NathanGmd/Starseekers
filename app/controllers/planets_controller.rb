class PlanetsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @solar_systems = SolarSystem.all
    if params[:category]
      @planets = Planet.where(category: Category.find_by(name: params[:category]))
    elsif params[:query]
      @planets = Planet.global_search(params[:query])
    else
      @planets = Planet.where(category: Category.find_by(name: "Coup de coeur"))
    end
    @categories = Category.all
  end

  def show
    @planet = Planet.find(params[:id])
  end

  private

  def set_planet

  end
end
