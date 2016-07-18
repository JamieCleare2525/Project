class Bug < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  validates :status, presence: true
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
end
