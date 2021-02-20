class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def show
    @users = User.all
    @user = User.find(params[:id])
    @following = Follower.where(follower_id: params[:id])
  end
end
