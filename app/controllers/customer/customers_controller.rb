class Customer::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
  	@customer = Customer.find(params[:id])
    @bookmark_movie = Bookmark.where(customer_id:@customer.id)
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
  	@customer = Customer.find(params[:id])
  	if @customer.update(customer_params)
  		redirect_to customer_path
  	else
  		render :edit
  	end
  end

  def leave
  end

  def hide
    @customer = Customer.find(current_customer.id)
    @customer.update(customer_status: false)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
      redirect_to root_path
   end

   private
   def customer_params
   	params.require(:customer).permit(:customer_name, :user_id, :customer_status, :image, :profile, :password, :email, :movie_id,)
   end
end
