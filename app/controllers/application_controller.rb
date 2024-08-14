class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def not_authenticated
    redirect_to login_url, alert: 'ログインしてください'
  end

  def gest_authenticated
    if current_user&.name == 'guest'
      redirect_to posts_path, alert: 'ゲストユーザーはこの操作を行うことができません。'
    end
  end

  def redirect_if_logged_in
    if logged_in?
      redirect_to posts_path
    end
  end

end
