class OrdersController < ApplicationController
  #protect_from_forgery with: :null_session
  protect_from_forgery
  load_and_authorize_resource
  skip_before_action :verify_authenticity_token, if: :json_request?
  respond_to :json, :html
	
  def index
    @orders = Order.all
    @user = current_user
    if user_signed_in? && @user.admin?
      @orders = Order.all.to_json(:include => [{:product => {:only => :title}}, {:user => {:only => :email}}])
      respond_with @orders
    elsif user_signed_in?
      @orders = @user.orders.to_json(:include => [{:product => {:only => :title}}, {:user => {:only => :email}}])
      respond_with @orders
    else
      redirect_to main_app.root_url, alert: "You are not logged in"
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
  end

  def create
    @order = Order.create(order_params)
    respond_with @order
  end

  # def update
  #   respond_with Order.update(params[:id], params[:order])
  # end

  def destroy
    respond_with Order.destroy(params[:id])
  end

  protected

  def json_request?
    request.format.json?
  end

  private

  def order_params
    params.require(:order).permit(:product_id, :user_id, :total)
  end
end