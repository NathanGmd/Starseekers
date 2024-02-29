class PlanetsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @solar_systems = SolarSystem.all
    @planets = Planet.all
    @planets = @planets.where(category: Category.find_by(name: params[:category])) if params[:category]
    @planets = @planets.global_search(params[:query]) if params[:query]
    @categories = Category.all
  end

  def show
    @planet = Planet.find(params[:id])
  end

  def new
    @planet = Planet.new
  end

  def create
    @planet = Planet.new(planet_params)
    @planet.image ||= 'arid.jpg'
    @planet.user = current_user
    if @planet.save
      redirect_to planet_path(@planet), notice: 'Your planet has been successfully registered.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def myplanets
    @myplanetsmine = Planet.where(user: current_user)
  end

  def events
    @planets = Planet.all
  end

  def chien
  end

  private

  def planet_params
    params.require(:planet).permit(:name, :content, :price_per_day, :category_id, :solar_system_id)
  end

end
