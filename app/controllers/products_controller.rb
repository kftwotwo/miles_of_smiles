class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @user = current_user
    @photo = @user.products.new(product_params)
    if @photo.save
      redirect_to products_path
    else
      render :new
    end
  end

private
  def product_params
    params.require(:product).permit(:name, :description, :price, :user_id)
  end
end
