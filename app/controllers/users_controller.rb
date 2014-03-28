class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @check_ins = @user.check_ins.order('created_at desc')
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users
    render 'show_following'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_followers'
  end

end
