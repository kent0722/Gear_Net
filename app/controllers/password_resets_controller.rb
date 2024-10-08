class PasswordResetsController < ApplicationController
  skip_before_action :require_login

  def new; end

  def create
    @user = User.find_by(email: params[:email])
    @user&.deliver_reset_password_instructions! if @user
    redirect_to root_path, flash: { notice: 'パスワードリセットのメールを送信しました' }
  end


  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])
    not_authenticated if @user.blank?
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])
    return not_authenticated if @user.blank?
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.change_password(params[:user][:password])
      redirect_to login_path, flash: { notice: 'パスワードがリセットされました' }
    else
      flash.now[:danger] = 'パスワードのリセットに失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end
end
