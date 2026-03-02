class BookingsController < ApplicationController
  def new
    if params[:flight_id].present?
      @flight = Flight.find(params[:flight_id])
      @booking = Booking.new(flight: @flight)
    else
      redirect_to root_path, notice: "Please select a flight first."
    end
  end
end
