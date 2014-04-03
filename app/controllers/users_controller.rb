class UsersController < ApplicationController 
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = 'Your account has been created successfully'
			redirect_to '/'
		else
			flash[:alert] = 'There was a problem creating your account'
			redirect_to :back
		end
	end
	private
	def user_params
		params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation)
	end
end