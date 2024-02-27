class PlanetsController < ApplicationController
  def index
    @solar_systems = SolarSystem.all

  end

  def show
    @planet = Planet.find(params[:id])
  end
end
