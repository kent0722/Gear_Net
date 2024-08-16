class CommentsController < ApplicationController
  before_action :set_post_id, only: %i[create]
  before_action :guest_authenticated, only: %i[create destroy] 
  
  def create
    @comment = current_user.comments.build(comment_params)
    @comment.save
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!
  end

  private 
  
  def comment_params
		params.require(:comment).permit(:body).merge(post_id: params[:post_id])
	end

  def set_post_id
    @post = Post.find(params[:post_id])
  end
end
