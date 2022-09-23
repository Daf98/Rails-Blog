class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
    end
  end

  def create
    @comment = Comment.new(strong_params)
    @post = Post.find(params[:post_id])
    @user = current_user
    @comment.author = current_user
    @comment.post_id = @post.id
    respond_to do |format|
      format.html do
        if @comment.save
          flash[:success] = 'Comment saved successfully'
          redirect_to user_post_url(@user, @post)
        else
          flash.now[:error] = 'Error: Comment could not be saved'
        end
      end
    end
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
