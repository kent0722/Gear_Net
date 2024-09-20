class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post
  has_many :entries, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_one :profile, dependent: :destroy
  after_create :create_profile

  # 自分がフォローしているユーザーとの関係
  has_many :followees, class_name: "Relationship", foreign_key: "followee_id", dependent: :destroy
  # 自分がフォローされているユーザーとの関係
  has_many :followers, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy

  # 一覧画面で使う
  has_many :followee_users, through: :followers, source: :followee
  has_many :follower_users, through: :followees, source: :follower

  validates :name, presence: true, length: { maximum: 9 }
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 4 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :reset_password_token, uniqueness: true, allow_nil: true

  def create_profile
    build_profile
    profile.save
  end

  def own?(object)
    id == object&.user_id
  end

  def liked?(post)
     self.likes.exists?(post_id: post.id)
  end

  # フォローしたとき
  def follow(user_id)
    followers.create(followee_id: user_id)
  end

  # フォローを外すとき
  def unfollow(user_id)
    followers.find_by(followee_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def followee?(user)
    followee_users.include?(user)
  end	

  def self.ransackable_attributes(auth_object = nil)
    %w[name]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[]
  end
end
