class RelationshipsController < ApplicationController
  before_action :require_login
  before_action :guest_authenticated, only: %i[create destroy]
  before_action :set_user_id

  def create
    current_user.follow(params[:user_id])
  end
  
  def destroy
    current_user.unfollow(params[:user_id])
  end
end
