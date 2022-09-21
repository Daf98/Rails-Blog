class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author: @user).order(id: :asc)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end
end
