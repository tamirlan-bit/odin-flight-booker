class BookingsController < ApplicationController
  def new
    if params[:flight_id].present?
      @flight = Flight.find(params[:flight_id])
      @booking = Booking.new(flight: @flight)

      count = params[:passengers_count].to_i
      count = 1 if count < 1

      count.times do
        @booking.passengers.build
      end

      @passengers_count = count
    else
      redirect_to root_path, notice: "Please select a flight first."
    end
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking
    else
      @flight = @booking.flight
      @passengers_count = @booking.passengers.size
      @showing_failed_form = true
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name])
  end
  
end
