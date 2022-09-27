require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  describe 'index page' do
    first_post = Post.find_by(id: 145)
    first_user = User.find_by(id: first_post.author_id)
    first_comment = Comment.where(post_id: first_post.id).first

    before(:each) do
      visit("/users/#{first_user.id}/posts/#{first_post.id}")
    end

    it 'shows a posts title' do
      expect(page).to have_content(first_post.title)
    end

    it 'shows who wrote the post' do
      expect(page).to have_content(first_post.author.name)
    end

    it 'shows the post body' do
      expect(page).to have_content(first_post.text)
    end

    it 'shows how many comments a post has' do
      expect(page).to have_content(first_post.comments.length)
    end

    it 'shows how many likes a post has' do
      expect(page).to have_content(first_post.likes.length)
    end

    it 'shows who wrote the comments' do
      expect(page).to have_content(first_comment.author.name)
    end

    it 'shows the comment' do
      expect(page).to have_content(first_comment.text)
    end
  end
end
