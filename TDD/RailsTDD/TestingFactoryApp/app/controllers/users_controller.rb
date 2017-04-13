class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new( protect_params )
    if user.valid?
      flash[:success] = "User successfully created"
    else  
      flash[:error] = []
      user.errors.messages.each do |field, error| 
        flash[:error] << "#{field.to_s.titleize} #{error[0]}"
      end
    end
    
    redirect_to action: "new"
  end

  private 
    def protect_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end
end
