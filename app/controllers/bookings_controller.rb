class BookingsController < ApplicationController

  def choose_seat
    render :seat_selection
  end

end
