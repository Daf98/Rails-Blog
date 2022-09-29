class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:comments, :likes).where(author: @user).order(id: :asc)
    @comments = Comment.where(id: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:author)
    @likes = @post.likes
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @post = Post.new(strong_params)
    @post.author = current_user
    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post saved successfully'
          redirect_to users_url
        else
          flash.now[:error] = 'Error: Post could not be saved'
          render :new, locals: { post: @post }
        end
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = 'The post was successfully destroyed.'
    redirect_to user_posts_path
  end

  private

  # Using a private method to encapsulate the permissible parameters
  # is just a good pattern since you'll be able to reuse the same
  # permit list between create and update. Also, you can specialize
  # this method with per-user checking of permissible attributes.
  def strong_params
    params.require(:post).permit(:title, :text, :author)
  end
end
