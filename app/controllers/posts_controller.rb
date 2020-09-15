class PostsController < ApplicationController
  before_action :require_correct_user, only: [:edit, :update, :destroy]
  
  
  def index
    @posts = Post.all.order("created_at DESC")
    @post = Post.new
    @users = User.all
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

  def post_params
    params.require(:post).permit(:body)
  end
end
