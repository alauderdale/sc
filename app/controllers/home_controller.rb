class HomeController < ApplicationController
  def index
    @users = User.all
    @check_ins = CheckIn.order('created_at desc')
    @recent_liquors = Liquor.all(:limit => 10, :order => 'created_at DESC')
  end
end
