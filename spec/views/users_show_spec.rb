require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  describe 'show page' do
    before(:each) do
      @first_user = User.create!(name: 'Daf',
                                 photo: 'https://marcorockmusic1.files.wordpress.com/2011/10/loveless.jpg',
                                 bio: 'Programmer from Argentina')
      @first_post = @first_user.posts.create!(title: 'Test post', text: 'Test text')
      @id = @first_user.id
      @post_id = @first_post.id
      visit("/users/#{@id}")
    end
    it 'shows the users pfp' do
      expect(page).to have_xpath("//img[contains(@src,'#{@first_user.photo}')]")
    end
    it 'shows the username' do
      expect(page).to have_content(@first_user.name)
    end
    it 'shows the number of posts' do
      expect(page).to have_content(@first_user.posts.length)
    end
    it 'shows the users bio' do
      expect(page).to have_content(@first_user.bio)
    end
    it 'shows the users first 3 posts' do
      expect(page).to have_content(@first_user.posts.length)
    end
    it 'shows a button to see all posts' do
      expect(page).to have_link('See all posts')
      click_on 'See all posts'
      expect(current_path).to eql "/users/#{@id}/posts"
    end
    it 'goes to a users post' do
      click_on "Post ##{@post_id}"
      expect(current_path).to eql "/users/#{@id}/posts/#{@post_id}"
    end
  end
end
