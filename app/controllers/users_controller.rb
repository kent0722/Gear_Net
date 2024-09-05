class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  
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
  
  # フォロー一覧
  def follows
    @user = User.find(params[:id])
    @users = user.followee_users
  end

  # フォロワー一覧
  def followers
    @user = User.find(params[:id])
    @user = user.follower_users
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
 