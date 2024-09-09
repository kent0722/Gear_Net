class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :set_header_image
  before_action :set_tags
  before_action :set_search
  
  private

  def not_authenticated
    redirect_to login_url, alert: 'ログインしてください'
  end

  def guest_authenticated
    if current_user&.name == 'guest'
      redirect_to posts_path, alert: 'ゲストユーザーはこの操作を行うことができません。'
    end
  end

  def redirect_if_logged_in
    if logged_in?
      redirect_to posts_path
    end
  end
  
  def set_header_image
    @header_image =
      if current_user&.profile&.image.present?
        current_user.profile.image
      else
        'defaultUser.jpg' # デフォルト画像のパス
      end
  end

  def set_tags
    @tags = Post.tag_counts_on(:tags)
  end

  def set_search
    @q = Post.ransack(params[:q])
  end
end
