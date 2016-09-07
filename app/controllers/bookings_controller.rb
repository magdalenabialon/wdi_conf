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
    token = params[:stripeToken]

    # Create a charge: this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => 89900, # Amount in cents
        :currency => "aud",
        :source => token,
        :description => "Example charge"
      )
    rescue Stripe::CardError => e
    # Since it's a decline, Stripe::CardError will be caught
    body = e.json_body
    err  = body[:error]

    puts "Status is: #{e.http_status}"
    puts "Type is: #{err[:type]}"
    puts "Code is: #{err[:code]}"
    # param is '' in this case
    puts "Param is: #{err[:param]}"
    puts "Message is: #{err[:message]}"
    rescue Stripe::RateLimitError => e
    # Too many requests made to the API too quickly
    rescue Stripe::InvalidRequestError => e
    # Invalid parameters were supplied to Stripe's API
    rescue Stripe::AuthenticationError => e
    # Authentication with Stripe's API failed
    # (maybe you changed API keys recently)
    rescue Stripe::APIConnectionError => e
    # Network communication with Stripe failed
    rescue Stripe::StripeError => e
    # Display a very generic error to the user, and maybe send
    # yourself an email
    rescue => e
# # Something else happened, completely unrelated to Stripe
#     rescue Stripe::CardError => e
      render :error and return
    end
    render :confirm
  end




end
