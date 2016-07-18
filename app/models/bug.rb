class Bug < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :expected_outcome, presence: true, length: { maximum: 255 }
  validates :actual_outcome, presence: true, length: { maximum: 255 }
  validates :status, presence: true
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
end
