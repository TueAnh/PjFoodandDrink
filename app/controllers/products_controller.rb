class ProductsController < ApplicationController
	def index
    if params[:category_id].blank?
      @products = Product.order_created_at_desc.category_by(1)
    else
      @products = Product.where(:category_id => params[:category_id]).order_created_at_desc
    end
	end

  def show
  	@product = Product.find_by id: params[:id]
    return if @product
    redirect_to root_url
   #  return if @product
   #  redirect_to root_url
  end
end
