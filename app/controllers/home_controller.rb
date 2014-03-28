class HomeController < ApplicationController
  def index
    @users = User.all
    @check_ins = CheckIn.all(:order => 'updated_at DESC', :limit => 10)
    @recent_liquors = Liquor.all(:limit => 10, :order => 'created_at DESC')
  end
end
