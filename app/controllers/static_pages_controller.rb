class StaticPagesController < ApplicationController
	def home
		@products = Product.order_created_at_desc
		@categories = Category.all
  end
end
