class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :photo

  validates :latitude, presence: true
  validates :longitude, presence: true
  validate :photo_validation

  def photo_validation
    if photo.attached?
      if !photo.content_type.in?(%w(image/jpeg image/png))
        errors.add(:photo, 'must be jpeg or png')
      end
    else
      errors.add(:photo, 'must be attached')
    end
  end
end
