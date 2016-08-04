class UsersController < ApplicationController
	layout false

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "Sign Up Successful"
			flash[:color] = "valid"
			redirect_to(:action => 'home')
		else
			flash[:color] = "invalid"
			render ('new')
		end
	end

	private 
	def user_params
    	params.require(:user).permit(:username, :faculty, :major, :email, :password, :password_confirmation)
  	end
end
