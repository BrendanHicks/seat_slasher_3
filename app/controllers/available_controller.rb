class AvailableController < ApplicationController

  def index

    @interested_events = current_user.interested_events
    @my_region = current_user.region_id
    @events = @interested_events.where(region_id: @my_region)

  end

  def show

    @event = Event.find(params[:id])

  end

end
