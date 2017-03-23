class TimeController < ApplicationController

  def index
    session[:times] = 0 unless session.key?(:times)
    session[:times] += 1
  end

  def restart
    session.delete(:times)
    redirect_to '/times'
  end
end
