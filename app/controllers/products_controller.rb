class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  respond_to :json, :html
  load_and_authorize_resource

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    respond_with @products
  end

  def search_results
    if params[:q]
      search_term = params[:q]
      if Rails.env.production?
        @products = Product.where("title ilike :search or author ilike :search or description ilike :search", {search: "%#{search_term}%"})
      else
        @products = Product.where("title like :search or author like :search or description like :search", {search: "%#{search_term}%"})
      end
    end
  end

  # GET /products/1
  # GET /products/1.json
  # @previous and @next for links to previous and next products in show page
  def show
    @product = Product.find(params[:id])
    @previous = Product.where("id < ?", params[:id]).order(:id).first   
    @next = Product.where("id > ?", params[:id]).order(:id).first
    @comments = @product.comments.order("created_at DESC").paginate(:page => params[:page], :per_page => 2)
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :author, :description, :image_url, :price)
    end
end
