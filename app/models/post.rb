class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  after_save :update_posts_counter

  # A method that updates the posts counter for a user.
  def update_posts_counter
    author.increment!(:posts_counter)
  end

  private :update_posts_counter

  #   A method which returns the 5 most recent comments for a given post.

  def find_comments
    Comment.where(post: self).order(created_at: :desc).limit(5)
  end
end
