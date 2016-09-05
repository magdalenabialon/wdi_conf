class BookingsController < ApplicationController

  def new
    @amount = '100';
  end

  def choose_seat
    render :seat_selection
  end

end
  
