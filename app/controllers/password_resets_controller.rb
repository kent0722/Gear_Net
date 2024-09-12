class PasswordResetsController < ApplicationController
  skip_before_action :require_login

  def new; end

def create
  @user = User.find_by(email: params[:email])
  if @user
    Rails.logger.info "User found: #{@user.email}"
    begin
      result = @user.deliver_reset_password_instructions!
      Rails.logger.info "Password reset email sent: #{result}"
    rescue => e
      Rails.logger.error "Error sending password reset email: #{e.message}"
      Rails.logger.error e.backtrace.join("\n")
    end
    redirect_to root_path, notice: 'パスワードリセットの手順をメールで送信しました'
  else
    Rails.logger.info "User not found for email: #{params[:email]}"
    flash.now[:alert] = 'メールアドレスが見つかりません'
    render :new
  end
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
      redirect_to login_path, flash: { success: 'パスワードがリセットされました' }
    else
      flash.now[:danger] = 'パスワードのリセットに失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end
end
