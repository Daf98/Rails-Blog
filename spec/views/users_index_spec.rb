require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  describe 'index page' do
    before(:each) do
      @first_user = User.create!(name: 'Daf',
                                 photo: 'https://marcorockmusic1.files.wordpress.com/2011/10/loveless.jpg',
                                 bio: 'Programmer from Argentina')
      @second_user = User.create!(name: 'Gabi',
                                  photo: 'https://i.scdn.co/image/ab67616d0000b273934a734586b2a0a7fbddb81e',
                                  bio: 'Translator from Spain')
      @first_id = @first_user.id
      @second_id = @second_user.id

      visit('/')
    end
    it 'shows the right username' do
      expect(page).to have_content(@first_user.name)
      expect(page).to have_content(@second_user.name)
    end
    it 'shows the profile picture' do
      expect(page).to have_xpath("//img[contains(@src,'#{@first_user.photo}')]")
      expect(page).to have_xpath("//img[contains(@src,'#{@second_user.photo}')]")
    end
    it 'shows the number of posts' do
      expect(page).to have_content(@first_user.posts.length)
      expect(page).to have_content(@second_user.posts.length)
    end
    it 'goes to userpage when username is clicked' do
      click_on @first_user.name
      expect(current_path).to eql "/users/#{@first_user.id}"
      click_on 'Back'
      click_on @second_user.name
      expect(current_path).to eql "/users/#{@second_user.id}"
    end
  end
end
