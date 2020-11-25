class PostsController < ApplicationController
  before_action :require_sign_in

  def index
    # @posts = Post.all.order("created_at DESC")
    @posts = timeline_posts
    @post = Post.new
    @users = User.all
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @user = @post.user
    @post.update(post_params)
    redirect_to @user, notice: "Post successfully updated!"
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post successfully deleted!"
    redirect_to root_path
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path, notice: "A new post successfully created!"
    else
      flash[:alert] = "Ooops, Something get wrong!"
      render :new    
    end  
  end

  private

  def timeline_posts
    @user_posts = Post.all.where(user: current_user)
    @followers_posts = Post.all.where(user: current_user.following)
    @post_list = @user_posts + @followers_posts
    @post_list
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
