class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  # A method that returns the 3 most recent posts for a given user.

  def find_posts
    Post.where(user: self).order(updated_at: :desc).first(3)
  end
end
