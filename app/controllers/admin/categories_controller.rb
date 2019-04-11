class Admin::CategoriesController < ApplicationController
  before_action :find_category , only: [:edit,:update,:destroy] 

  def index
  	@categories = Category.all
  end
  
  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new(category_params)
  	if @category.save
  		redirect_to admin_categories_path
  	else
  	end
  end

  def edit
  end

  def update
  	if @category.update_attributes(category_params)
  		redirect_to admin_categories_path
  	else
  		render 'edit'
  	end
  end

  def destroy
  	if @category.present?
  		@category.destroy
  	else
  	end
  	redirect_to admin_categories_path
  end

  private
  	def find_category
  		@category = Category.find(params[:id])
  	end

  	def category_params
  		params.require(:category).permit(:name,:description)
  	end
end
