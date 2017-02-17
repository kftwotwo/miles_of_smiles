class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end


    def new
      if current_user.admin == true
        @product = Product.new
      else
        flash[:notice]="Have to be Admin"
        redirect_to products_path
      end
    end

    def create
        @user = current_user
        @product = @user.products.new(product_params)
        if @product.save
          redirect_to products_path
        else
          render :new
        end
    end

    def edit
      if current_user.admin == true
        @product = Product.find(params[:id])
      else
        flash[:notice]="Have to be Admin"
        redirect_to products_path
      end

    end

    def update
      @product = Product.find(params[:id])
      if @product.update(product_params)
        redirect_to products_path
      else
        render :edit
      end
    end

    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to products_path
    end

private
  def product_params
    params.require(:product).permit(:name, :description, :price, :user_id)
  end
end
