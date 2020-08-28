class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by(username: params[:username])
    if user
      session[:user_id] = user.id
      redirect_to user, notice: "Welcome back #{user.username}"
    else
      flash.now[:alert] = "Invalid username"
      render :new
    end
  end
end
