class PostsController < ApplicationController
  before_action :require_login
  before_action :guest_authenticated, only: %i[new create edit destroy]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :set_tags, only: %i[index show new]
  before_action :set_search, only: %i[index show new edit]

  
  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = @q.result.includes(:user).order(created_at: :desc)
    end
  end

  def show 
    @user = @post.user
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(created_at: :desc)
    @likes = @post.likes.includes(:user)
    @tags_list = @post.tag_list
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.tag_list = params[:post][:tag_list].split.map { |tag| "##{tag}"}.join(",")
    if @post.save
      redirect_to posts_path, flash: { notice: '投稿しました' }
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if params[:post][:images].present?
      @post.images.attach(params[:post][:images])
    end

    if params[:post][:image_ids].present?
      params[:post][:image_ids].each do |image_id|
        @post.images.destroy(image_id)
      end
    end

    if params[:post][:tag_list].present?
      params[:post][:tag_list] = params[:post][:tag_list].split.map { |tag| tag.start_with?('#') ? tag : "##{tag}" }.join(", ")
    end
       
    if @post.update(post_params.except(:images))
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

  def auto_search
    @posts = Post.where("brand like ?", "%#{params[:q]}%")
    respond_to do |format|
      format.js
    end
  end

  private
  
  def post_params
    params.require(:post).permit(:brand, :category, :production_year, :instrument_model, :body, :tag_list, :video, images: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
