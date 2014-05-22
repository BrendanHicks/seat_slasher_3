class TaggingsController < ApplicationController
  def index
    @taggings = Tagging.all
  end

  def show
    @tagging = Tagging.find(params[:id])
  end

  def new
    @tagging = Tagging.new
  end

  def create
    @tagging = Tagging.new
    @tagging.genre_id = params[:genre_id]
    @tagging.event_id = params[:event_id]

    if @tagging.save
      redirect_to "/events/#{params[:event_id]}", :notice => "Event has been tagged as #{Genre.find(params[:genre_id]).genre_name}."
    else
      redirect_to "/events/#{params[:event_id]}", :alert => "Event has already been tagged as #{Genre.find(params[:genre_id]).genre_name}."
    end
  end

  def edit
    @tagging = Tagging.find(params[:id])
  end

  def update
    @tagging = Tagging.find(params[:id])

    @tagging.genre_id = params[:genre_id]
    @tagging.event_id = params[:event_id]

    if @tagging.save
      redirect_to "/taggings", :notice => "Tagging updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @tagging = Tagging.find(params[:id])

    @tagging.destroy

    redirect_to "/events/#{params[:event_id]}", :notice => "Tagging deleted."
  end
end
