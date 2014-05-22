class RegionsController < ApplicationController
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
