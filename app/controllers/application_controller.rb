class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_movie

  	private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:customer_name, :user_id, :customer_status, :image, :profile, :password, :email])
    end
    before_action :set_search

	def set_search
	  @search = Movie.ransack(params[:q])
	  @search_movies = @search.result.page(params[:page])
	end

	def set_movie
		@movie = Movie.new
	end

end