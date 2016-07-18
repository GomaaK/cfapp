class OrdersController < ApplicationController
  # protect_from_forgery with: :null_session
  protect_from_forgery
  skip_before_action :verify_authenticity_token, if: :json_request?
  respond_to :json, :html
  load_and_authorize_resource
	
  def index
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
    @order = Order.find(params[:id]).to_json(:include => [{:product => {:only => :title}}, {:user => {:only => :email}}])
    respond_with @order
  end

  # def new
  # end

  def create
    @order = Order.create(order_params)
    @order.product = Product.find(params[:product_id])
    @order.user = User.find(params[:user_id])
    # @order = Order.create(order_params).to_json(:include => [{:product => {:only => :title}}, {:user => {:only => :email}}])
    respond_with @order
  end

  def update
    # I've tried all of these...
    # @order = Order.find(params[:id]).to_json(:include => [{:order => {:only => :shipped}}])
    # @order = Order.update(params[:id]).to_json(:only => :shipped)
    # respond_with Order.update(params[:id])
    # respond_with Order.update(order_params).to_json
    # @order = Order.find(params[:id])
    # respond_with @order
  end

  def destroy
    respond_with Order.destroy(params[:id])
  end

  protected

  def json_request?
    request.format.json?
  end

  private

  def order_params
    params.require(:order).permit(:product_id, :user_id, :total, :shipped)
  end
end