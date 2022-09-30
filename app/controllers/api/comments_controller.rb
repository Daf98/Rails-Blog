class Api::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  def index
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comments = Comment.where(post_id: @post.id)
    render json: { status: 'SUCCESS', message: 'Loaded users', data: @comments }, status: :ok
  end

  def new
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(strong_params)
    @comment.author = @current_user
    @comment.post = @post
    if @comment.save
      render json: @comment, status: :created
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to user_post_path
  end

  private

  # Using a private method to encapsulate the permissible parameters
  # is just a good pattern since you'll be able to reuse the same
  # permit list between create and update. Also, you can specialize
  # this method with per-user checking of permissible attributes.
  def strong_params
    params.require(:comment).permit(:title, :text)
  end
end
