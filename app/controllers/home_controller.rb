class HomeController < ApplicationController
  def index

    if current_user
    	@check_ins = current_user.check_ins.order('created_at desc')
    	@recent_liquors = current_user.check_ins.joins(:liquor).select("liquors.*,  check_ins.*").order("liquors desc").limit(5)
    	@user_liquors = current_user.checked_in_liquors.order("name asc").limit(5)
  	end
    # @recent_liquors = Liquor.all(:limit => 10, :order => 'created_at DESC')
  end
end
