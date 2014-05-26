class SearchController < ApplicationController
	def index
		# require 'will_paginate/array'
		@users = User.search(params)
		# @search = params[:search]
		# liquors = Liquor.search(params[:search])+Liquor.tagged_with(params[:search])
		# @liquors = liquors.paginate page: params[:page], per_page: 12
	end
end
