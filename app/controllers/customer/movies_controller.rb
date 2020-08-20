class Customer::MoviesController < ApplicationController
  def index
    @movies = Movie.page(params[:page]).per(10)
    @movies = Movie.all.includes(:customer).recent
    @genres = Genre.all
  end

  def bookmarks
    @movies = current_customer.bookmark_movies.includes(:customer).recent
  end

  def show
  	@movie = Movie.find(params[:id])
  end

  def new
  	@movie = Movie.new
  end

  def create
  	@movie = Movie.new(movie_params)
  	if @movie.save
  		redirect_to movie_path(@movie.id)
  	else
  		render :new
  	end
  end

  def edit
  	@movie = Movie.find(params[:id])
  end

  def update
  	@movie = Movie.find(params[:id])
  	if Movie.update(movie_params)
  	   redirect_to movie_path(@movie.id)
  	else
  	   render :edit
  	end
  end

  private
  def movie_params
  	params.require(:movie).permit(:title, :impression, :movie_image, :rate, :netflix, :amazon, :hulu, :customer_id, genre_ids: [])
  end
end