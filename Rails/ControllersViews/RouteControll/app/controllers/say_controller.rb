class SayController < ApplicationController

  def index
  end

  def hello
    return 'hello.html.erb'
  end

  def show
    @name = params[:name]
  end
end
