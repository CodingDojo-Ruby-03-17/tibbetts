class SayController < ApplicationController

  def index
  end

  def hello
  end

  def show
    @name = params[:name]
  end
end
