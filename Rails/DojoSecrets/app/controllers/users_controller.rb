class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new( user_params )
    if user.save
      flash[:success] = ["User created"]
      return redirect_to controller: "sessions", action: "new" 
    else
      flash[:errors] = user.errors.full_messages
      return redirect_to action: "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if !user.update( update_params )
      flash[:errors] = user.errors.full_messages
      return redirect_to action: "edit", id: params[:id] 
    end 
    return redirect_to action: "show", id: params[:id] 
  end

  def destroy
    reset_session
    User.find(params[:id]).destroy
    return redirect_to action: "new"
  end

  private 
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    def update_params
      params.require(:user).permit(:name, :email)
    end
end
