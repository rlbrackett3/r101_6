class TopicsController < ApplicationController

	###Create
	def new
		@topic = Topic.new
	end
	
	def create
		@topic = Topic.new(topic_params)
		if @topic.save(topic_params)
			flash[:notice] = "topic has been created"
			User.find(user_params) << @topic
			redirect_to root_path
		else
			flash[:alert] = "Problem!"
			redirect_to new_topic_path
		end
	end

	###Read
	def index
		@topics = Topic.all
	end

	###Update

	def edit
		@topic = Topic.find(params[:id])
	end

	def update
		@topic = Topic.find(params[:id])
		if @topic.update(topic_params)
			flash[:notice] = "topic has been updated"
			redirect_to root_path
		else
			flash[:alert] = "problem!"
			redirect_to edit_topic_path
		end
	end
	###Delete
	def destroy
		@topic = Topic.find(params[:id])
		if @topic.delete
			flash[:notice] = "Topic has been deleted"
			redirect_to root_path
		else
			flash[:alert] = "Problem"
			redirect_to root_path
		end
	end
	
	###Strong_Params
	def topic_params
		params.require(:topic).permit(:title,:body,:user_id)
	end

end
