class ProductsController < ApplicationController
	def index

      @products = Product.where(:category_id => params[:category_id]).order_created_at_desc
	end

  def show
  	@product = Product.find_by id: params[:id]
    @reviews = Review.all.for_product(@product.id)
    @rating = 0
    @reviews.each do |review|
      if review.rating 
        @rating += review.rating
      end
    end
    if @reviews.length > 0
      @rating = @rating/@reviews.length
    end
    return if @product
    redirect_to root_url
   #  return if @product
   #  redirect_to root_url
  end
  private

    def find_product
      @product = Product.find(params[:id])
    end
end
