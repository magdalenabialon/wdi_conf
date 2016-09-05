Rails.configuration.stripe = {
  :publishable_key => "pk_test_yojSr1TOZyi7eMOOwCox9qhA",
  :secret_key      => "sk_test_s9sDunalUrIG1UuwI8XlAHSh"

# ENV['PUBLISHABLE_KEY']
  # ENV['SECRET_KEY']


}
Stripe.api_key = Rails.configuration.stripe[:secret_key]


# Rails.configuration.stripe = {
#     :publishable_key => Rails.application.secrets.stripe_publishable_key,
#     :secret_key      => Rails.application.secrets.stripe_secret_key
# }
#
# Stripe.api_key = Rails.application.secrets.stripe_secret_key
#
