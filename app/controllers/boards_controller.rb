class BoardsController < ApplicationController
	def index
		@boards = Board.all
		
	end

	def show 
		@board = Board.find(params[:id])
		@new_topics = Topic.all
		@board_topics = @board.topics
	end

	def update
		@board = Board.find(params[:board_id])
		@topic = Topic.find(params[:id])		

		if @board.update(board_params)
			flash[:notice] = "Added!"
			@board.topics << @topic
			redirect_to boards_path
		else
			flash[:alert] = "Problem!"
			redirect_to boards_path
		end

	end

	private

	def board_params
		params.require(:board).permit(:name,:description)
	end





end
