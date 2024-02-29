class BookingsController < ApplicationController
  before_action :set_planet, only: %i[new create]

  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.planet = @planet
    @booking.user = current_user
    @booking.total_price = (@booking.end_date - @booking.start_date).to_i * @planet.price_per_day
    if @booking.save
      redirect_to booking_path(@booking), notice: 'Your reservation has been successfully registered.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_url, notice: 'The reservation has been canceled.'
  end

  private

  def set_planet
    @planet = Planet.find(params[:planet_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
