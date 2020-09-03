class User < ApplicationRecord
  validates :username, presence: true, length: {minimum: 2}, format: { with: /\A[a-zA-Z]+\z/,
  message: "should contain only letters" }

  has_many :posts, dependent: :destroy
end
