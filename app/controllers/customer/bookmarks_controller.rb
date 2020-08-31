class Customer::BookmarksController < ApplicationController
	before_action :set_movie, only: %i[create destroy]

  def create
    bookmark = current_customer.bookmarks.build(movie_id: params[:movie_id])
    bookmark.save!
  end

  def destroy
    current_customer.bookmarks.find_by(movie_id: params[:movie_id]).destroy!
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

end
