class ApplicationController < ActionController::Base
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def require_sign_in
    unless current_user
      session[:intended_url] = request.url
      redirect_to new_session_path, alert: "Please, sign in first!"
    end
  end

  def require_correct_user
    @user = User.find(params[:id])
    unless current_user?(@user)
      redirect_to root_path
    end
  end

  def current_user?(user)
    current_user == user
  end

  helper_method :current_user?

  def who_to_follow
    @following_list = []
    current_user.following.each do | followings |
      followings.following.each do | refollowing |
        @following_list.push(refollowing)
        @following_list.uniq!
        if current_user.following.include?(refollowing)
          @following_list.delete(refollowing)
        end
      end
    end
    exclude_current_user(@following_list)
    @following_list.uniq!
  end
  
  helper_method :who_to_follow
  
  def who_to_connect
    user_list = []
    User.all.each do |user|
      user_list.push(user)
    end
    exclude_current_user(user_list)
    exclude_current_following(user_list)
    user_list
  end
  
  helper_method :who_to_connect


  def list_followers
    @following_list.each do |following|
      following.username
    end
  end

  helper_method :list_followers

  def exclude_current_user(list)
    if list.include?(current_user)
      list.delete(current_user)
    end
  end

  helper_method :exclude_current_user
  
  def exclude_current_following(list)
    current_user.following.each do | followings |
      list.delete(followings)
    end
  end

end

