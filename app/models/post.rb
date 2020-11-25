class Post < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, length: { in: 1..280 }
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  
end
