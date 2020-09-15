class User < ApplicationRecord
  validates :username, presence: true, length: {minimum: 2}, format: { with: /\A[a-zA-Z]+\z/,
  message: "should contain only letters" }

  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name: "Followship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Followship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def follow(user)
    active_relationships.create(followed_id: user.id)
  end

  def unfollow(user)
    active_relationships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    following.include?(user)
  end
end
