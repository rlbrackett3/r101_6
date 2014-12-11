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
		@board = Board.find(params[:id])
		@topic = Topic.find(params[:topic]) #param is passes from controllers#


		if @board.update(board_params)
			flash[:notice] = "Added!"
			@board.topics << @topic
			redirect_to home_path
		else
			flash[:alert] = "Problem!"
			redirect_to boards_path
		end

	end

	private

	def board_params
		params.require(:board).permit(:name,:description )
	end





end
