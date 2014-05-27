class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new
    @genre.genre_name = params[:genre_name]
    @genre.example = params[:example]

    if @genre.save
      redirect_to "/genres", :notice => "Genre created successfully."
    else
      redirect_to "/genres"
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])

    @genre.genre_name = params[:genre_name]
    @genre.example = params[:example]

    if @genre.save
      redirect_to "/genres", :notice => "Genre updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @genre = Genre.find(params[:id])

    @genre.destroy

    redirect_to "/genres", :notice => "Genre deleted."
  end

end

