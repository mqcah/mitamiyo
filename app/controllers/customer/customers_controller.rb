class Customer::CustomersController < ApplicationController
  def index
  end

  def show
  	@customer = Customer.find(current_customer.id)
  end

  def edit
  	@customer = Customer.find(current_customer.id)
  end

  def update
  	@customer = Customer.find(current_customer.id)
  	if @customer.update(customer_params)
  		redirect_to customer_path
  	else
  		render :edit
  	end
  end

  def leave
    @customer = Customer.find(current_customer.id)
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
   	params.require(:customer).permit(:customer_name, :user_id, :customer_status, :image, :profile, :password, :email)
   end
end
