class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params.require(:comment).permit(:title, :text))
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
end
