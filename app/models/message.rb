class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :message, presence: true

  has_one :notification, as: :subject, dependent: :destroy
  after_create_commit :create_notifications

  def create_notifications
    # ルームのエントリーで、メッセージ送信者以外のユーザーに通知を作成する
    room.entries.where.not(user_id: self.user_id).each do |entry|
      Notification.create(
        subject: self,                # 通知の対象（メッセージ）
        user: entry.user,             # 通知を受け取るユーザー
        action: :message_me     # ここで適切なアクションタイプを指定
      )
    end
  end
end
