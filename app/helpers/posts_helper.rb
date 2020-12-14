module PostsHelper
  def list_of_followers
    if list_followers.any?
      render 'posts/followers_list'
    else
      render 'posts/connect'
    end
  end
end
