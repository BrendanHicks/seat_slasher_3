class AvailableController < ApplicationController

  def index

    @my_region = current_user.region_id
    @events = Event.where(region_id: @my_region)

  end

  def show

    @event = Event.find(params[:id])

  end

end
