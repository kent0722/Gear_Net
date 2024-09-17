class Relationship < ApplicationRecord
  belongs_to :followee, class_name: "User"
  belongs_to :follower, class_name: "User"
  has_one :notification, as: :subject, dependent: :destroy
  after_create_commit :create_notification

  def create_notification
    Notification.create(subject: self, user: self.followee, action: :followed_me)
  end
end
