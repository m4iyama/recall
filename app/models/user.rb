class User < ApplicationRecord
  has_one_attached :avatar

  has_many :posts, dependent: :destroy

  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followee_id', dependent: :destroy

  has_many :followees, through: :active_relationships
  has_many :followers, through: :passive_relationships

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  validates :username, presence: true, uniqueness: { case_sensitive: false }

  def follow(other)
    active_relationships.create(followee_id: other.id)
  end

  def unfollow(other)
    active_relationships.find_by(followee_id: other.id).destroy
  end
end
