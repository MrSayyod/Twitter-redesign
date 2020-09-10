class PostsController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC")
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @user = User.find(params[:id])
    @post.update(post_params)
    redirect_to @user, notice: "Post successfully updated!"
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    @user = User.find(params[:id])
    redirect_to @user
  end

  def new
    
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
