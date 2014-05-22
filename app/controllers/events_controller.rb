class EventsController < ApplicationController
  def index
    @events = Event.all


  end

  def show
    @event = Event.find(params[:id])
    @genres = Genre.all
    @taggings = Event.find(params[:id]).taggings
  end

  def new
    @event = Event.new
    @regions = Region.all
  end

  def create
    @event = Event.new
    @event.event_description = params[:event_description]
    @event.event_date_time = params[:event_date_time]
    @event.user_id = params[:user_id]
    @event.venue_name = params[:venue_name]
    @event.region_id = params[:region_id]
    @event.venue_city = params[:venue_city]
    @event.venue_state = params[:venue_state]
    @event.section = params[:section]
    @event.row = params[:row]
    @event.seat_numbers = params[:seat_numbers]
    @event.quantity = params[:quantity]
    @event.asking_price = params[:asking_price]
    @event.face_value = params[:face_value]
    @event.ticket_type = params[:ticket_type]
    @event.delivery_notes = params[:delivery_notes]
    @event.notes = params[:notes]

    if @event.save
      redirect_to "/events", :notice => "Event created successfully."
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
    @regions = Region.all
  end

  def update
    @event = Event.find(params[:id])

    @event.event_description = params[:event_description]
    @event.event_date_time = params[:event_date_time]
    @event.user_id = params[:user_id]
    @event.venue_name = params[:venue_name]
    @event.region_id = params[:region_id]
    @event.venue_city = params[:venue_city]
    @event.venue_state = params[:venue_state]
    @event.section = params[:section]
    @event.row = params[:row]
    @event.seat_numbers = params[:seat_numbers]
    @event.quantity = params[:quantity]
    @event.asking_price = params[:asking_price]
    @event.face_value = params[:face_value]
    @event.ticket_type = params[:ticket_type]
    @event.delivery_notes = params[:delivery_notes]
    @event.notes = params[:notes]

    if @event.save
      redirect_to "/events", :notice => "Event updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])

    @event.destroy

    redirect_to "/events", :notice => "Event deleted."
  end
end
