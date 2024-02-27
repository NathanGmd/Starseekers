class PlanetsController < ApplicationController
  def index
    @solar_systems = SolarSystem.all
  end

  def show
  end
end
