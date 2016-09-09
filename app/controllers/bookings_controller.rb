class BookingsController < ApplicationController

  def choose_seat
    render :seat_selection
  end


  def create
    # Set your secret key: remember to change this to your live secret key in production
    # See your keys here: https://dashboard.stripe.com/account/apikeys

    Stripe.api_key = "sk_test_s9sDunalUrIG1UuwI8XlAHSh"

    # Get the credit card details submitted by the form
    token = params[:token]
    user_id = params[:user_id]
    amount = params[:amount]
    seats = params[:seats]
    seats.slice!(0)

    # If we reseed we need to log out and change the user id
     u = User.find_by(id: user_id)
     if u == nil
       user_id = User.first.id
     end
    # Create a charge: this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => amount, # Amount in cents
        :currency => "aud",
        :source => token,
        :description => "WDI Conference"
      )
    rescue => e
    success = false
    render :json => { success:  false, :errorText => e.json_body } and return
    end

    booking = Booking.new
    booking.user_id = user_id
    booking.save
    seatArray = seats.split("-")

    seatArray.each do |seat|
        newSeat = Seat.new
        newSeat.user_id = user_id
        newSeat.seatNumber = seat
        newSeat.save
    end

    success = true
    render :json => { success: true, :errorText => '', charge: charge } and return
  end

end
