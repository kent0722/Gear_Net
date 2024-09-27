class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create guest_login]
  
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to posts_path, flash: { notice: 'ログインしました' }
    else
      flash.now[:danger] = 'ログインできませんでした'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, status: :see_other, flash: { notice: 'ログアウトしました' }
  end

  def guest_login
    @guest_user = User.create(
      name: 'guest',
      email: SecureRandom.alphanumeric(10) + "@email.com",
      password: 'password',
      password_confirmation: 'password'
      )
  
    auto_login(@guest_user)
    redirect_to posts_path, notice: 'ゲストとしてログインしました'
  end
end
