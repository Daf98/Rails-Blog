require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  describe 'show page' do
    first_user = User.find_by(name: 'Daf')
    first_post = Post.find_by(id: 145)
    before(:each) do
      visit("/users/#{first_user.id}")
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
    it 'shows the users bio' do
      expect(page).to have_content(first_user.bio)
    end
    it 'shows the users first 3 posts' do
      expect(page).to have_content(first_user.posts.length)
      # something else
    end
    it 'shows a button to see all posts' do
      expect(page).to have_link('See all posts')
      click_on 'See all posts'
      expect(current_path).to eql "/users/#{first_user.id}/posts"
    end
    it 'goes to a users post' do
      click_on "Post ##{first_post.id}"
      expect(current_path).to eql "/users/#{first_user.id}/posts/#{first_post.id}"
    end
  end
end
