class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # A method that updates the comments counter for a post.
  after_save :update_comments_counter

  def update_comments_counter
    post.increment!(:comments_counter)
  end

  private :update_comments_counter
end
