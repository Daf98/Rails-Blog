require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  before(:each) do
    @first_user = User.create!(name: 'Daf',
                               photo: 'https://marcorockmusic1.files.wordpress.com/2011/10/loveless.jpg',
                               bio: 'Programmer from Argentina')
    @id = @first_user.id
    @first_post = @first_user.posts.create!(title: 'Test post', text: 'Test text')
    @post_id = @first_post.id
    @first_comment = Comment.create!(author: @first_user, author_id: @id, post_id: @post_id)
    visit("/users/#{@first_user.id}/posts/#{@first_post.id}")
    visit("/users/#{@id}/posts")
  end
  describe 'index page' do
    it 'shows the users pfp' do
      expect(page).to have_xpath("//img[contains(@src,'#{@first_user.photo}')]")
    end
    it 'shows the username' do
      expect(page).to have_content(@first_user.name)
    end
    it 'shows the number of posts' do
      expect(page).to have_content(@first_user.posts.length)
    end
    it 'shows a posts title' do
      expect(page).to have_content(@first_post.title)
    end
    it 'shows some post content' do
      expect(page).to have_content(@first_post.text)
    end
    it 'shows the first comment' do
      expect(page).to have_content(@first_comment.text)
    end
    it 'shows how many comments a post has' do
      expect(page).to have_content(@first_post.comments.length)
    end
    it 'shows how many likes a post has' do
      expect(page).to have_content(@first_post.likes.length)
    end
    it 'redirects to a posts page' do
      click_on "Post ##{@post_id}"
      expect(current_path).to eql "/users/#{@id}/posts/#{@post_id}"
    end
  end
end
