class CommentsController < ApplicationController

	def new
		@comment = Comment.new
		@topic = Topic.find(params[:topic_id])
	end

	def create
		@topic = Topic.find(params[:topic_id])
		@comment = Comment.new(comment_params)
		#@user = User.find(session[:user_id]) trying current_user helper in controller 
		if @comment.save
			flash[:message] = "Comment has been posted!"
			User.find(session[:user_id]).comments << @comment
			@topic.comments << @comment
			redirect_to topic_path(@topic)
		else
			flash[:alert] = "Something went south!"
			redirect_to topic_path(@topic)
		end

	end

	private
	def comment_params
		params.require(:comment).permit(:body,:user_id,:topic_id)
	end
end
