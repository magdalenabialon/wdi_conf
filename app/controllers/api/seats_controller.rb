module Api
  class SeatsController < ApplicationController

    def index
      @seats = Seat.order(:id).where(event_id: 1)
      render json: @seats.to_json(include: [:ticket, :seat_type])
    end

  end

end
