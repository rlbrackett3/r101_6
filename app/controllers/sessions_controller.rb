class SessionsController < ApplicationController
	def index
		if session[:user_id]
			redirect_to users_path#redirects tp /users if user is logged in
		end
	end

	def new
	end

	def create
		@user = User.where(email: params[:email]).first
		if @user && @user.password 
			flash[:notice] = "Login successful"
			session[:user_id] = @user.id
			redirect_to users_path
		else
			flash[:alert] = "Problem"
			redirect_to home_path
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:alert] = "Logout successful!"
		redirect_to home_path
	end
end

