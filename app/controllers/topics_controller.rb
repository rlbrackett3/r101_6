class TopicsController < ApplicationController

	###Create
	def new
		@topic = Topic.new
	end
	
	def create
		@topic = Topic.new(topic_params)
		if @topic.save(topic_params)
			flash[:notice] = "topic has been created"
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
	###Delete

	###Strong_Params
	def topic_params
		params.require('topic')	.permit(
											:title,
											:body,
											:user_id
										)
	end

end
