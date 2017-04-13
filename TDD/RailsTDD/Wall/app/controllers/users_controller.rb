class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
  end

  def create
    user = User.new( user_params )
    if user.save
      flash[:success] = [ "Welcome #{user.first_name}", "User successfully created"]
      session[:user_id] = user.id
      redirect_to :controller => 'messages', :action => 'index' 
    else
      flash[:errors] = user.errors.full_messages
      redirect_to users_new_path
    end 
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
    end

end
