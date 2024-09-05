class RelationshipsController < ApplicationController
  before_action :require_login
  before_action :guest_authenticated, only: %i[create destroy] 
  
  def create
    @user = User.find(params[:user_id])
    current_user.follow(params[:user_id])
  end
  
  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(params[:user_id])
  end
end
