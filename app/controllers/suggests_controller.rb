class SuggestsController < ApplicationController
  
  def new
  	@suggest = Suggest.new
  end

  def create
  	@suggest = Suggest.new(suggest_params)
  	@suggest.user_id = current_user.id
  	@suggest.status = 0
  	if @suggest.save || product_have
  		redirect_to root_path
  		flash[:success] = "Suggest success"
  	else
  		flash[:danger] = "This product haved"
  	end
  end

  private

  	def suggest_params
  		params.require(:suggest).permit(:name,:price,:quantity,:description)
  	end

  	def product_have
  		@product_name = Product.find_by name: @suggest.name
  	end

end