class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def show
    @users = User.all
    @user = User.find(params[:id])
    @following = Follower.where(follower_id: params[:id])
  end

  def index
    if params[:search]
      @users = User.where("username LIKE ? OR fullname LIKE ?","%#{params[:search]}%", "%#{params[:search]}%").limit(20)
    else
      @users = User.all.limit(20)
    end
  end
end
