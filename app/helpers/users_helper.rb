module UsersHelper
  def avatar_for(user, options = { size: 80 })
    size = options[:size]
    if user.avatar?
      image_tag user.avatar.url(:thumb), width: size
    else
      image_tag 'default-avatar.png', width: size
    end
  end

  def create_post_if_current_user(user)
    render 'posts/create_post' if current_user?(user)
  end

  def edit_post(post, user)
    render 'posts/edit_post', post: post if current_user?(user)
  end

  def edit_account(user)
    render 'users/edit_account' if current_user?(user)
  end

  def no_followers(user)
    if current_user?(user)
      render 'users/no_followers'
    else
      render 'users/no_user_followers'
    end
  end

  def see_followers(user)
    if user.followers.any?
      render 'users/followers'
    else
      no_followers(user)
    end
  end
end
