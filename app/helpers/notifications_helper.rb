module NotificationsHelper
  def transition_path(notification)
    case notification.action.to_sym
    when :commented_to_own_post
      post_path(notification.subject.post, anchor: "comment-#{notification.subject.id}")
    when :liked_to_own_post
      user_profile_path(notification.subject.post)
    when :followed_me
      user_profile_path(notification.subject.follower)
    end
  end
end