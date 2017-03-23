class ProductsController < ApplicationController
  def index
    return render json: Product.all
  end

  def show
    puts params.class.ancestors
    return render json: Product.find(params[:id])
  end

  def create 
    Product.create(name: params[:name], description: params[:description], price: params[:price])
    redirect_to '/products'
  end

  def new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    Product.find(params[:id]).update(name: params[:name], description: params[:description], price: params[:price])
    return redirect_to '/products'
  end

  def total
  end

end
