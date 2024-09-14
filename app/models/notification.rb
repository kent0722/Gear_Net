class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :subject, polymorphic: true

  enum action: { commented_to_own_post: 0, liked_to_own_post: 1, message_me: 2, followed_me: 3}
end
