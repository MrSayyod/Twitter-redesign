class Post < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, length: { in: 1..280 }
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }

  def self.user_posts(user)
    self.all.where(user: user)
  end

  # def followers_posts
  #   self.all.where(user: current_user.following)
  # end

  # def timeline_posts
  #   user_posts + followers_posts
  # end

    # def timeline_posts
  #   @user_posts = self.all.where(user: current_user)
  #   @followers_posts = self.all.where(user: current_user.following)
  #   @post_list = @user_posts + @followers_posts
  #   @post_list
  # end
end
