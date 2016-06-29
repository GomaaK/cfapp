if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_ZsPGtC6WkuMERTdt4E0keVl0',
    :secret_key => 'sk_test_TRr3Y6B4ppIMPOFhBzx6fb3K'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]