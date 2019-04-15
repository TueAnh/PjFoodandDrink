class Admin::OrderItemsController < ApplicationController
	before_action :load_order , only: :index

	def index
		@order_items = OrderItem.where(order_id: params[:order_id])
	end

	private
    	def load_order
      		@order = Order.find_by id: params[:order_id]
      	end
end