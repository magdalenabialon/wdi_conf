class BookingsController < ApplicationController

  def new
  end
  
  def choose_seat
    render :seat_selection
  end

end
