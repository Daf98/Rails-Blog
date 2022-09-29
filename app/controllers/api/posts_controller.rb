class Api::PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:comments, :likes).where(author: @user).order(id: :asc)
    render json: { status: 'SUCCESS', message: 'Loaded users', data: @posts }, status: :ok
  end
end
