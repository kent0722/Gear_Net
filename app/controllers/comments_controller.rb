class CommentsController < ApplicationController
  before_action :set_post_id, only: %i[create]
  
  def create
    @comment = current_user.comments.build(comment_params)
    @comment.save
    respond_to do |format|
      format.turbo_stream 
    end
  end


   def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.turbo_stream 
    end
  end

  private 
  
  def comment_params
		params.require(:comment).permit(:body).merge(post_id: params[:post_id])
	end

  def set_post_id
    @post = Post.find(params[:post_id])
  end
end
