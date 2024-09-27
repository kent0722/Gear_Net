class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :instrument, length: { maximum: 15 }
  validates :favorite_music, length: { maximum: 20 }
  validates :favorite_artist, length: { maximum: 50 }
  validates :introduction, length: { maximum: 100 }
end
