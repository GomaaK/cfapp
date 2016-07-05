class OrdersController < ApplicationController
	#skip_before_filter  :verify_authenticity_token MAKES it vulnurable for attacks
  protect_from_forgery with: :null_session
	
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
  end

  def create
    @order = Order.create(order_params)
  end

  # def update
  #   respond_with Order.update(params[:id], params[:order])
  # end

  def destroy
    respond_with Order.destroy(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:product_id, :user_id, :total)
  end
end