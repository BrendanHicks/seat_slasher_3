class AvailableController < ApplicationController

  def index

    @my_region = Region.last.id

    @events = User.
    @events2 = Event.where(region_id: @my_region)

  end

  def show

    @event = Event.find(params[:id])

  end

end
