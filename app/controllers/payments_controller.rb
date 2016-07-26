class PaymentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => (@product.price*100).to_i, # amount in cents
        :currency => "usd",
        :source => token,
        :description => params[:stripeEmail]
      )

      if charge.paid
        # Create new order with product ID, User ID, product price
        Order.create!(product_id: @product.id, user_id: @user.id, total: @product.price)

        # Send e-mail confirmation to customer
        @name = current_user.first_name
        @email = current_user.email
        UserMailer.order_placed(@name, @email).deliver_now
      end

      flash[:success] = "Payment has been processed successfully"

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
    # redirect_to product_path(@product)
    redirect_to payments_payment_thank_you_path
  end

  def payment_thank_you
  end
end
