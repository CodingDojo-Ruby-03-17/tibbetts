class MessagesController < ApplicationController

  def index

  end

  def new 
    @message = Message.new
  end

  def create
    puts "we are in the create method of the message controller"
    puts params[:message]

    message = Message.new( message_params )
    if message.save
      flash[:success] = ["Successfully created message"]
    else
      flash[:errors] = ["Unsuccessfully	created message"]
    end
    puts message.user_id
    puts message.errors.full_messages
    redirect_to action: "new" 
  end

  private
    def message_params
      params.require(:message).permit(:user_id, :message)
    end
end
