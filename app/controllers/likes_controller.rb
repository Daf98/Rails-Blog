class LikesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    like = Like.new(params.permit(:post, :author))
    like.author = @user
    like.post = @post

    respond_to do |format|
      format.html do
        if like.save
          flash[:success] = 'Post liked.'
          redirect_to user_post_url(@user, @post)
        else
          flash.now[:error] = 'Error: Post could not be liked.'
        end
      end
    end
  end
end
