class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :room
  scope :visible, -> { where(visible: true) }
end
