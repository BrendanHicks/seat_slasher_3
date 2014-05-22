class AvailableController < ApplicationController

  def index

    @my_region = Region.last.id
    @events = Event.where(region_id: @my_region)

  end

end
