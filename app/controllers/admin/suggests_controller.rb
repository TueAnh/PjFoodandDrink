class Admin::SuggestsController < ApplicationController
  before_action :find_suggest, only: [:destroy,:edit,:update]  


  def index
  	@suggests = Suggest.all.order(status: :ASC)
  end

  def destroy
  	@status = 2
  	if @suggest.present?
  		update_status
  	else
  	end
  	redirect_to admin_suggests_path
  end

  def edit
  	@product = Product.new
  	@product.name = @suggest.name
  	@product.price = @suggest.price
  	@product.description = @suggest.description
  end

  def update
  	@status = 1
  	@product = Product.new(product_params)
  	if @product.save
  		update_status
  		redirect_to admin_suggests_path
  	else
  		render 'edit'
  	end
  end

  private
  	def find_suggest
  		@suggest = Suggest.find(params[:id])
  	end

  	def product_params
  		params.require(:product).permit(:category_id,:name,:image,:price,:quantity,:description)
  	end

  	def update_status
      if @suggest.update_attribute(:status,@status)
        flash[:success] = "success"
      else
        flash[:danger] = "failed"
      end
  	end

end
