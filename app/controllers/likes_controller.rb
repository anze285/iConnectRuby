class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    @post.likes.create(user_id: current_user.id)
    #respond_to do |format|
    #  format.html { redirect_to @posts }
    #  format.js
    #end
    redirect_back(fallback_location: @post_path)
  end

  def destroy
    @like.destroy
    redirect_back(fallback_location: @post_path)
  end

  def find_like
   @like = @post.likes.find(params[:id])
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
