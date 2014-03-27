class HomeController < ApplicationController
  def index
    @users = User.all
    @check_ins = CheckIn.all(:order => 'updated_at DESC', :limit => 10)
  end
end
