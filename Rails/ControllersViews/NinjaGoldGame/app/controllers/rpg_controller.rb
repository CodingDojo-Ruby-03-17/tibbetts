class RpgController < ApplicationController

 def initialize
    super
    # supported actions 
    @actions = {
      "farm" => lambda { rand(10..20) },
      "cave" => lambda { rand(5..10) },
      "house" => lambda { rand(2..5) },
      "casino" => lambda { rand(-50..50) }
    }
  end

  def index
    # initialize session if needed
    session[:gold] ||= 0
    session[:history] ||= []

    # process submitted action 
    if request.post?

      # check if submitted action exists
      unless @actions.key?(params[:activity])
        flash[:error] = "Action is not supported"
        return render 'index.html.erb'
      end

      # get gold for action
      gold = @actions[params[:activity]].call if @actions.key?(params[:activity])
      session[:gold] += gold
      # assume action is gain
      now = Time.zone.now
      event = ["gain", "Earned #{gold} from the farm! (#{now})"]

      # handle casino lost
      if gold < 0
        event = ["loss", "Entered a casino and lost #{gold*-1}... Ouch... (#{now})"]
      end

      # add most recent event to front
      session[:history].unshift(event)
    end
  end


end
