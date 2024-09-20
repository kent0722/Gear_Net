class NotificationsController < ApplicationController
  before_action :set_user_id

  def index
    @notifications = current_user.notifications.order(created_at: :desc)
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end

  def delete_selected
    if params[:notification_ids].present?
      params[:notification_ids].each do |notification_id|
        current_user.notifications.destroy(notification_id)
      end
      flash[:notice] = '削除しました'
      redirect_to user_notifications_path(current_user), status: :see_other
    else
      flash[:danger] = '選択されていません'
      redirect_to user_notifications_path(current_user), status: :see_other
    end
  end
end