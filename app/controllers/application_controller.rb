class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  	private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:customer_name, :user_id, :customer_status, :image, :profile, :password, :email])
    end
    before_action :set_search

	def set_search
	  #@search = Article.search(params[:q])
	  @search = Customer.ransack(params[:q]) #ransackメソッド推奨
	  @search_customers = @search.result.page(params[:page])
	end
end