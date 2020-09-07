class PostsController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def edit
    @post = Post.find(params[:id])
  end
end
