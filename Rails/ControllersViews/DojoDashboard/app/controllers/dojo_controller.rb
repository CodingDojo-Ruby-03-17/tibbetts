class DojoController < ApplicationController
  def index
    @dojos = Dojo.all
  end

  def new
    @dojo = Dojo.new
  end

  def create
    action = 'index'
    @dojo = Dojo.new(protect_params)
    if @dojo.save
      flash[:success] = "A new dojo was successfully create"
    else
      @dojo.errors.messages.each { |k, v| flash[k] = "#{k} #{v[0]}" }
      action = 'new'
    end
    return redirect_to action: action
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
      return redirect_to action: 'index'
    end
    return redirect_to action: 'edit', id: params[:id]
  end

  def destroy
    Dojo.find(params[:id]).destroy
    return redirect_to action: 'index'
  end

  private
    def protect_params
      params.require(:dojo).permit(:branch, :street, :city, :state)
    end

end
