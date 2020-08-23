class Customer::BookmarksController < ApplicationController
  def create
    bookmark = current_customer.bookmarks.build(movie_id: params[:movie_id])
    bookmark.save!
    redirect_to movies_path, succes: t('.flash.bookmark')
  end

  def destroy
    current_customer.bookmarks.find_by(movie_id: params[:movie_id]).destroy!
    redirect_to movies_path, success: t('.flash.not_bookmark')
  end

end
