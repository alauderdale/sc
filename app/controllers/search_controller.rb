class SearchController < ApplicationController
	def index
		@liquors = Liquor.search(params[:search]).order("created_at DESC")
		@distills = Distill.search(params[:search]).order("created_at DESC")

		@search = params[:search]
	end
end
