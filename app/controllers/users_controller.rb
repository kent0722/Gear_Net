class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  before_action :guest_authenticated
  before_action :set_user, only: %i[edit update destroy follows followers]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to posts_path, flash: { notice: '新規作成完了しました' }
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to request.referer, flash: { notice: '編集しました' }
    else
      flash.now[:danger] = '編集に失敗しました'
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = '削除しました'
    redirect_to root_path, status: :see_other
  end

  # フォロー一覧
  def follows
    @follow = @user.followee_users
  end

  # フォロワー一覧
  def followers
    @follower = @user.follower_users
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
 