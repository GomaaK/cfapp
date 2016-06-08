class OrdersController < ApplicationController
	before_filter :authenticate_user!
	
  def index
    @orders = Order.all
  end

  def show
  	@orders = Order.all
  end
end