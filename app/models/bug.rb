class Bug < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :expected_outcome, presence: true, length: { maximum: 255 }
  validates :actual_outcome, presence: true, length: { maximum: 255 }
  validates :solution_attempt, presence: true, length: { maximum: 255 }
  validates :other_info, length: { maximum: 255 }
  validates :status, presence: true
  VALID_URL_REGEX = /(https?:\/\/|localhost:)[\S]+\.[\S]+/i
  validates :url, presence: true, format: { with: VALID_URL_REGEX }
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validate :picture_size

  has_attached_file :file, default_url: '/files/:style/missing.doc'
  validates_attachment :file, content_type: { content_type: ['text/csv'] }

  def self.search(search)
    where('status LIKE ?', "%#{search}%")
  end

  private

  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, 'should be less than 5MB')
    end
  end
end
