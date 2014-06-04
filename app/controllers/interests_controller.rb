class InterestsController < ApplicationController
  def index
    @interests = Interest.all
    @genres = Genre.all
  end

  def show
    @interest = Interest.find(params[:id])
  end

  def new
    @interest = Interest.new
  end

  def create
    @interest = Interest.new
    @interest.user_id = current_user.id
    @interest.genre_id = params[:genre_id]

    if @interest.save
      redirect_to "/interests", :notice => "Interest created successfully."
    else
      render 'new'
    end
  end

  def edit
    @interest = Interest.find(params[:id])
  end

  def update
    @interest = Interest.find(params[:id])

    @interest.user_id = params[:user_id]
    @interest.genre_id = params[:genre_id]

    if @interest.save
      redirect_to "/interests", :notice => "Interest updated successfully."
    else
      render 'edit'
    end
  end

  def destroy_with_form

    @interest = Interest.find(params[:interest_id])

    @interest.destroy

    redirect_to "/interests", :alert => "Interest deleted."
  end

  def destroy
    @interest = Interest.find(params[:id])

    @interest.destroy

    redirect_to "/interests", :alert => "Interest deleted."
  end

end
