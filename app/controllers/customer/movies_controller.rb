class Customer::MoviesController < ApplicationController
  before_action :authenticate_customer!, only: [:new, :create, :bookmark,]


  def index
    @movies = Movie.page(params[:page]).per(10)
    @movie = Movie.all.includes(:customer).recent
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
    @movie.customer_id = current_customer.id
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

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "配送先を削除しました。"
    redirect_to customer_path(current_customer.id)
  end

  private
  def movie_params
  	params.require(:movie).permit(:customer_name, :title, :impression, :movie_image, :rate, :netflix, :amazon, :hulu, genre_ids: [])
  end
end