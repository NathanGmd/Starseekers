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
    @planet.user = current_user
    @planet.image = "arid.jpg"
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
    @planettatooine
  end


  private

  def planet_params
    params.require(:planet).permit(
      :name, :content, :rotation_period, :orbital_period, :diameter, :gravity, :terrain,
      :surface_water, :population, :climate, :image, :price_per_day, :user_id, :category_id,
      :solar_system_id, :content
    )
  end

end
