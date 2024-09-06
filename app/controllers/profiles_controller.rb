class ProfilesController < ApplicationController
  before_action :set_tags
  before_action :set_search
  before_action :set_user_id

  def show
    @profile = @user.profile
    @users = @user.posts
  end

  def edit
  end

  def update
    @profile = @user.profile
    if @profile.update(profile_params)
      redirect_to user_profile_path(@user), flash: { notice: '編集しました' }
    else
      flash.now[:danger] = '編集に失敗しました'
      redirect_to user_profile_path(@user)
    end
  end

  def destroy
  end

  private

  def profile_params
    params.require(:profile).permit(:instrument, :favorite_music, :favorite_artist, :introduction, :images)
  end

  def set_user_id
    @user = User.find(params[:user_id])
  end

  def set_tags
    @tags = Post.tag_counts_on(:tags)
  end

  def set_search
    @q = Post.ransack(params[:q])
  end
end
