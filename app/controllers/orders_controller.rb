class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
  end

  def destroy
  end

  private
  def order_params
      params.require(:order).permit(:user_id, :product_id, :total)
  end
end