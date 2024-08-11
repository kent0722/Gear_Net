class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to post_path(comment.post), flash: { notice: 'コメントを投稿しました' }
    else
      flash.now[:danger] = 'コメントの投稿ができませんでした'
      redirect_to post_path(comment.post)
    end
   end


  def destroy; end

  private 
  
  def comment_params
		params.require(:comment).permit(:body).merge(post_id: params[:post_id])
	end
end
