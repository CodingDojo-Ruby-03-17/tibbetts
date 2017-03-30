class ProductsController < ApplicationController
  def index
    return render json: Product.all
  end

  def show
    return render json: Product.find(params[:id])
  end

  def create 
    Product.create( protect_params )
    redirect_to '/products'
  end

  def new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    Product.find(params[:id]).update( protect_params )
    return redirect_to '/products'
  end

  def total
  end

  private
    def protect_params
      params.require(:product).permit(:name, :description, :price)
    end
end
