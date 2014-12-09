class UsersController < ApplicationController

	###Create
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "User created"
			redirect_to root_path
		else
			flash[:alert] = "Something went south"
			redirect_to edit_user_path
		end

	end

	###Read
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	###Update
	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "User has been updated!"
			redirect_to root_path
		else
			flash[:alert] = "Problem!"
			redirect_to edit_user_path
		end
	end	

	###Delete
	def destroy
		@user = User.find(params[:id])
		if @user.delete
			flash[:notice] = "User has been deleted"
			redirect_to users_path
		else
			flash[:notice] = "Something went south"
		end
	end

	###strong params
	def user_params
		params.require(:user).permit(:fname, :lname,:email,:password,:username,:bio)
	end



end
