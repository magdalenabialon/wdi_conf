module Api
  class SeatsController < ApplicationController

    def index
      @seats = Seat.all

      @seatString = ""

      @seats.each do |seat|
        @seatString = @seatString + "-" + seat.seatNumber
      end
      # binding.pry
      # binding.pry
      # User.find_by(image_url: session[:userinfo]["info"]["image_url"] )

      # session[:userinfo]["id"]
      render json: @seatString.to_json

      # render json: @seats.to_json
    end
  end
end
