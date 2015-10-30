class PlansController < ApplicationController
  
  
  def index
    @plans = Plan.all.to_json
    # render :json => @plans
  end
end
