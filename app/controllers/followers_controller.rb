class FollowersController < ApplicationController
  before_action :find_user
  before_action :find_follow, only: [:destroy]

  def create
    if already_follow?
    else
      @user.followers.create(follower_id: current_user.id)
    end
    redirect_back(fallback_location: @post_path)
  end

  def destroy
    if already_follow?
      @follower.destroy
    end
    redirect_back(fallback_location: @post_path)
  end

  def find_follow
    if already_follow?
      @follower = @user.followers.find(params[:id])
    end
  end

  private 

  def find_user
    @user = User.find(params[:profile_id])
  end

  def already_follow?
    Follower.where(follower_id: current_user.id, user_id:
    params[:profile_id]).exists?
  end
end
