class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_one :notification, as: :subject, dependent: :destroy
  after_create_commit :create_notification

  validates :body, presence: true, length: { maximum: 150 }

  def create_notification
    return if self.user_id == self.post.user_id
    Notification.create(subject: self, user: self.post.user, action: :commented_to_own_post)
  end
end
