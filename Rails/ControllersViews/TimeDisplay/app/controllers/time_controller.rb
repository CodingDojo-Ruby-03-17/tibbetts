class TimeController < ApplicationController
  def index
    @date = Time.now.strftime("%b %d, %Y")
    @time = Time.now.strftime(" %I:%M %p")
  end
end
