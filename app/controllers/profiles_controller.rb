class ProfilesController < ApplicationController
  before_action :set_user_id
  before_action :set_profile
  before_action :set_tags, only: %i[show edit]
  before_action :set_search, only: %i[show edit]

  def show
    @users = @user.posts
    @current_entry = Entry.where(user_id: current_user.id)
    @another_entry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @current_entry.each do |current|
        @another_entry.each do |another|
          if current.room_id == another.room_id
            @is_room = true
            @room_id = current.room_id
          end
        end
      end
      unless @is_room
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def edit; end

  def update
    if @profile.update(profile_params)
      flash[:notice] = "プロフィールが更新されました"
      redirect_to user_profile_path(@user), flash: { notice: '編集しました' }
    else
      flash.now[:danger] = "プロフィールの更新に失敗しました"
      redirect_to user_profile_path(@user)
    end
  end

  def destroy
  end

  private

  def profile_params
    params.require(:profile).permit(:instrument, :favorite_music, :favorite_artist, :introduction, :image)
  end

  def set_user_id
    @user = User.find(params[:user_id])
  end

  def set_profile
    @profile = @user.profile
  end
end
