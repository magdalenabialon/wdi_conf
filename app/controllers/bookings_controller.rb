class BookingsController < ApplicationController

  def new
    @amount = '100';
  end

  def choose_seat
    render :seat_selection
  end


  def create
    # Set your secret key: remember to change this to your live secret key in production
    # See your keys here: https://dashboard.stripe.com/account/apikeys

    Stripe.api_key = "sk_test_s9sDunalUrIG1UuwI8XlAHSh"

    # Get the credit card details submitted by the form
    token = params[:token]

    # Create a charge: this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => 89900, # Amount in cents
        :currency => "aud",
        :source => token,
        :description => "Example charge"
      )
    rescue => e
    success = false
    render :json => { success:  false, :errorText => e.json_body } and return
    end

    booking = Booking.new
    # booking.user_id = User.first.id
    booking.save

    success = true
    render :json => { success: true, :errorText => '' } and return
  end



end
