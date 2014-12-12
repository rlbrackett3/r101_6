class BoardsController < ApplicationController
	def index
		@boards = Board.all
		
	end

	def show 
		@board = Board.find(params[:id])
		@new_topics = Topic.all # lists all topics 
		@board_topics = @board.topics #lists topics that belong to board

	end

	def edit
		@board = Board.find(params[:id])

	end

	def update
		# Updated this to just be for using the board edit form
		@board = Board.find(params[:id])

		if @board.update(board_params)
			flash[:notice] = "Board updated successfully."
			redirect_to @board
		else
			flash[:alert] = "Problem!"
			redirect_to edit_board_path(@board)
		end

	end
	
	
	#Here are two new methods for add and remove topic associations
	def add_topic
		@board = Board.find(params[:id])
		@topic = Topic.find(params[:board][:topic_id])

		@board.topics << @topic

		if @board.update(board_params)
			flash[:notice] = "Topic Added!"
			redirect_to board_path(@board)
		else
			flash[:alert] = "Problem!"
			redirect_to board_path(@board)
		end
	end

	def remove_topic
		@board = Board.find(params[:id])
		@topic = @board.topics.find(params[:board][:topic_id])

		@board.topics.delete(@topic)

		if @board.update(board_params)
			flash[:notice] = "Topic Removed!"
			redirect_to board_path(@board)
		else
			flash[:alert] = "Problem!"
			redirect_to board_path(@board)
		end
	end

	private

	def board_params
		params.require(:board).permit(:name,:description )
	end





end
