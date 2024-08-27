class PostsController < ApplicationController
  before_action :require_login
  before_action :guest_authenticated, only: %i[new create edit destroy] 
  before_action :set_user, only: %i[show edit update destroy]
  
  def index
    @posts = Post.all.includes(:user).order(created_at: :desc)
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(created_at: :desc)
    @likes = @post.likes.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, flash: { notice: '投稿しました' }
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), flash: { notice: '編集しました' }
    else
      flash.now[:danger] = '編集に失敗しました'
      redirect_to posts_path(@post)
   end
  end

  def destroy
    @post.destroy
    flash[:notice] = '削除しました'
    redirect_to posts_path, status: :see_other
  end

  private
  def post_params
    params.require(:post).permit(:brand, :category, :production_year, :instrument_model, :body, :video, images: [])
  end

  def set_user
    @post = Post.find(params[:id])
  end
end
