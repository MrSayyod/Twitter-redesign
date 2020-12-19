class User < ApplicationRecord
  validates :username, presence: true, length: { in: 2..30 }, format: { with: /\A[a-zA-Z]+\z/,
                                                                        message: 'only letters allowed' }
  validates :username, uniqueness: true

  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name: 'Followship', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'Followship', foreign_key: 'followed_id', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  mount_uploader :avatar, AvatarUploader

  def follow!(user)
    active_relationships.create!(followed_id: user.id)
  end

  def unfollow!(user)
    active_relationships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    following.include?(user)
  end
end
