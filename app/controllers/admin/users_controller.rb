class Admin::UsersController < ApplicationController
	before_action :find_user , only: [:edit,:update,:destroy]

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
    	@user = User.new(user_params)
    	if @user.save
     		redirect_to root_url
    	else
     		render 'new'
    	end
  	end


	def edit
	end

	def update
		if @user.update_attributes(user_params)
			redirect_to admin_users_path
		else
			flash[:danger] = "Cannot Edit"
			render 'edit'
		end
	end
	
	def destroy
		if @user.present?
      		@user.destroy
    	else
		end
    	redirect_to admin_users_path
	end

	private
		def user_params
    		params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    	end


		def find_user
			@user = User.find(params[:id])
		end
end
