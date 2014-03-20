class Admin::DashboardController < ApplicationController
	before_filter :authenticate_user!

  def index
  	if current_user.admin == false
  		redirect_to root_url, alert: "You're No Admin!!!"
  	end
  end
end
