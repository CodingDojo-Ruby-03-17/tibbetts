class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create 
    
    user = User.find_by_email( user_params[:email] )    
    
    if user.try(:authenticate, user_params[:password]) 
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}/show" 
    else
      if user 
        flash[:errors] = user.errors.full_messages
      else
        flash[:erorrs] = ["User not found"]
      end
      redirect_to action: "new"      
    end
  end

  def destroy
    reset_session
    redirect_to action: "new"
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
   end
end
