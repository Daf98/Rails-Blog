require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  describe 'index page' do
    first_user = User.find_by(name: 'Daf')
    first_post = Post.find_by(id: 145)
    first_comment = Comment.first
    before(:each) do
      visit("/users/#{first_user.id}/posts")
    end
    it 'shows the users pfp' do
      expect(page).to have_xpath("//img[contains(@src,'#{first_user.photo}')]")
    end
    it 'shows the username' do
      expect(page).to have_content(first_user.name)
    end
    it 'shows the number of posts' do
      expect(page).to have_content(first_user.posts.length)
    end
    it 'shows a posts title' do
      expect(page).to have_content(first_post.title)
    end
    it 'shows some post content' do
      expect(page).to have_content(first_post.text)
    end
    it 'shows the first comment' do
      expect(page).to have_content(first_comment.text)
    end
    it 'shows how many comments a post has' do
      expect(page).to have_content(first_post.comments.length)
    end
    it 'shows how many likes a post has' do
      expect(page).to have_content(first_post.likes.length)
    end
    it 'redirects to a posts page' do
      click_on "Post ##{first_post.id}"
      expect(current_path).to eql "/users/#{first_user.id}/posts/#{first_post.id}"
    end
  end
end
