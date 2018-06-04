class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :photo

  validates :latitude, presence: true
  validates :longitude, presence: true
end
