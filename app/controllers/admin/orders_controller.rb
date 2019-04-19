class Admin::OrdersController < ApplicationController
	before_action :find_suggest , only: [:destroy,:edit]

	def index
		@orders = Order.all.order(status: :ASC)
	end

	def destroy
	  	@status = 2
	  	update_status
	end

	def edit
		@status = 1
	  	update_status
	end

	private
	  	def find_suggest
	  		@order = Order.find(params[:id])
	  	end

	  	def update_status
	  		if @order.update_attribute(:status,@status)
		        flash[:success] = "success"
		    else
		        flash[:danger] = "failed"
		    end
		    redirect_to admin_orders_path
	  	end

end