class LikesController < ApplicationController
  before_action :require_login
  before_action :guest_authenticated, only: %i[create destroy] 

  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.create(post_id: params[:post_id])
  end

  def destroy 
    @post = Post.find(params[:post_id])
    @like = current_user.likes.find_by(post_id: @post.id)
    @like.destroy!
  end
end
