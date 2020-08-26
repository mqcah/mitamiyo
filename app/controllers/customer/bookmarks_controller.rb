class Customer::BookmarksController < ApplicationController
	before_action :set_movie, only: %i[create destroy]

  def create
    bookmark = current_customer.bookmarks.build(movie_id: params[:movie_id])
    bookmark.save!
   # redirect_to movies_path, success: t('.flash.not_bookmark')
  end

  def destroy
    current_customer.bookmarks.find_by(movie_id: params[:movie_id]).destroy!
    # redirect_to movies_path, success: t('.flash.not_bookmark')
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

end
