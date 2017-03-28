class DojoController < ApplicationController
  def index
    @dojos = Dojo.all
  end

  def new
    @dojo = Dojo.new
  end

  def create
    @dojo = Dojo.new(protect_params)
    if @dojo.save
      redirect_to '/dojos'
    else
      return redirect_to 'new'
    end
  end

  def show
    @dojo = Dojo.find(params[:id])
  end

  def edit
    @dojo = Dojo.find(params[:id])
  end

  def update
    @dojo = Dojo.find(params[:id])
    if @dojo.update(protect_params)
      return redirect_to '/dojos'
    end
    puts @dojo.errors
    return redirect_to "/dojos/edit/#{params[:id]}"
  end

  def destroy
    Dojo.find(params[:id]).destroy
    return redirect_to '/dojos'
  end

  private
    def protect_params
      params.require(:dojo).permit(:branch, :street, :city, :state)
    end

end
