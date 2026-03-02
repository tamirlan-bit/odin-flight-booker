class FlightsController < ApplicationController
  def index
    @searched = params[:date].present? &&
                params[:departure_airport_id].present? &&
                params[:arrival_airport_id].present?
    @airports = Airport.order(:code)
    if @searched && params[:departure_airport_id] != params[:arrival_airport_id]
        date = Date.parse(params[:date])
        @flights = Flight.includes(:departure_airport, :arrival_airport).where(
          start_datetime: date.all_day,
          departure_airport_id: params[:departure_airport_id],
          arrival_airport_id: params[:arrival_airport_id]
          ).order(:start_datetime)
    else
      @flights = []
    end
  end
end
