class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
    else
      @post.likes.create(user_id: current_user.id)
    end
    redirect_back(fallback_location: @post_path)
  end

  def destroy
    if already_liked?
      @like.destroy
    end
    redirect_back(fallback_location: @post_path)
  end

  def find_like
    if already_liked?
      @like = @post.likes.find(params[:id])
    end
  end

  private 

  def find_post
    @post = Post.find(params[:post_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id:
    params[:post_id]).exists?
  end
end
