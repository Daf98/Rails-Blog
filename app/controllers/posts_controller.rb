class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author: @user).order(id: :asc)
    # @comments = Post.find_comments
  end

  def show
    # @comments = Post.find_comments
    @post = Post.find(params[:id])
  end
end
