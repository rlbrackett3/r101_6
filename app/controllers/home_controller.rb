class HomeController < ApplicationController
	def index
	end

	def results 
		query = params[:query]
		@users = User.where("fname like ?", "%#{query}") || User.where("lname like ?", "%#{query}")
		@topics = Topic.where("title like ?", "%#{query}")
		@boards = Board.where("name like ?", "%#{query}")
	end
end
