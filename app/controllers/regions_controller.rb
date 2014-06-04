class RegionsController < ApplicationController
  before_action(:signed_in_user_must_be_admin, :only => [:show, :edit, :destroy, :update, :index, :new, :create])


  def signed_in_user_must_be_admin
    if current_user.id != 6
      redirect_to root_url, :alert => "You Have Insufficient Privileges."
    end
  end

  def index
    @regions = Region.all
  end

  def show
    @region = Region.find(params[:id])
  end

  def new
    @region = Region.new
  end

  def create
    @region = Region.new
    @region.region_name = params[:region_name]

    if @region.save
      redirect_to "/regions", :notice => "Region created successfully."
    else
      render 'new'
    end
  end

  def edit
    @region = Region.find(params[:id])
  end

  def update
    @region = Region.find(params[:id])

    @region.region_name = params[:region_name]

    if @region.save
      redirect_to "/regions", :notice => "Region updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @region = Region.find(params[:id])

    @region.destroy

    redirect_to "/regions", :notice => "Region deleted."
  end
end
