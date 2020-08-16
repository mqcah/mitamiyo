class Customer::MovieController < ApplicationController
  def index
  end

  def show
  end

  def new
  	@movie = Movie.new
  end

  def create
  	@movie = Movie.new(movie.params)
  	if @movie.save
  		redirect_to _path(@movie.id)
  	else
  		render :new
  	end
  end

  def edit
  end

  def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to admin_product_path(@product.id)
        else
           render :new
        end
  end

end
