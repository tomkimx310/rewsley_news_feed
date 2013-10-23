class StoriesController < ApplicationController

	def index
		@stories = Story.search(params[:search])
		@stories = Story.all
	end

	def show
		@story = Story.find(params[:id])
	end

	def new
		@story = Story.new
	end

	def create
		@story = Story.create(story_params)
		if @story.save 
			redirect_to "/stories"
		else
			render "new"
		end
	end

	def search

	end

	private 

	def story_params
		params.require(:story).permit(:title, :link, 
																	:upvotes, :category)
	end



end
