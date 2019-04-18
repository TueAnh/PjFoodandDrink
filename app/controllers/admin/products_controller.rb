class Admin::ProductsController < ApplicationController
  before_action :find_product, only: [:destroy,:edit,:update] 

  def index
  	@products = Product.all.order(category_id: :desc)
  end

  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new(product_params)
  	if @product.save
  		redirect_to admin_products_path
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	if @product.update_attributes(product_params)
  		redirect_to admin_products_path
  	else
  		render 'edit'
  	end
  end

  def destroy
  	if @product.present?
  		@product.destroy
  		flash[:success] = "Delete complete"
  	else
  	end
  	redirect_to admin_products_path
  end

  private 
  	def find_product
  		@product = Product.find(params[:id])
  	end

  	def product_params
  		params.require(:product).permit(:category_id,:name,:image,:price,:quantity,:description)
  	end

end
