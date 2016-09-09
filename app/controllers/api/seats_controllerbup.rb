module Api
  class SeatsController < ApplicationController

    def index
      @seats = Seat.all
      @seatString = ""

      @seats.each do |seat|
        @seatString = @seatString + "-" + seat.seatNumber
      end
      render json: @seatString.to_json
    end
  end
end
