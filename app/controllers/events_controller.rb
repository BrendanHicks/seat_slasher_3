class EventsController < ApplicationController

  before_action(:set_event, :only => [:show, :edit, :destroy, :update])
  before_action(:signed_in_user_must_be_owner, :only => [:edit, :destroy, :update])
  before_action(:signed_in_user_must_be_admin, :only => [:index])



  def set_event
    @event = Event.find(params[:id])
  end

  def signed_in_user_must_be_owner
    if @event.user_id != current_user.id
      redirect_to root_url, :alert => "You Have Insufficient Privileges."
    end
  end

  def signed_in_user_must_be_admin
    if current_user.id != 6
      redirect_to root_url, :alert => "You Have Insufficient Privileges."
    end
  end


  def index
    @events = Event.all

  end

  def my_events
    @events_1 = Event.where(user_id: current_user.id).order("event_date_time asc")
    @events = @events_1.order("event_date_time desc")

  end

  def show
    @genres = Genre.all.order(:genre_name)
    @taggings = Event.find(params[:id]).taggings
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @regions = Region.all
    @genres = Genre.all
  end

  def create
    @event = Event.new
    @tagging = Tagging.new
    @event.event_description = params[:event_description]
    @event.event_date_time = Date.strptime(params[:event_date_time], "%m/%d/%Y")
    @event.user_id = current_user.id
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
      redirect_to "/my_events", :notice => "Event created successfully."
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
    @event.event_date_time = Date.strptime(params[:event_date_time], "%m/%d/%Y")
    @event.user_id = current_user.id
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
      redirect_to "/my_events", :notice => "Event updated successfully."
    else
      render 'edit'
    end
  end

  def destroy

    @event.destroy

    redirect_to "/my_events", :notice => "Event deleted."
  end

  def email


    @event = Event.find(params[:id])
    @interested_users = @event.interested_users.where(region_id: @event.region_id)
    @users = @interested_users.where.not(id: current_user.id)
    @subject = "Discount Tickets Available - #{@event.event_description}"

    interested_emails_array = []
    @users.each do |user|

      email = user.email
        interested_emails_array.push email
    end

    @interested_users = interested_emails_array.join(",")

    if @users.blank?
      redirect_to "/my_events", :alert => "No Interested Users At This Time."
    else
      UserMailer.available_ticket_alert(@event, @interested_users, @subject).deliver

      redirect_to "/my_events", :notice => "Notification Sent"
    end
  end
end
