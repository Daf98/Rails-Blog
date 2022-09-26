require 'rails_helper'

RSpec.describe 'Users', js: true do
  describe 'index page' do
    before(:each) do
      visit '/users'
    end  
    it 'shows the right content' do
      expect(page).to have_content('Users')
    end
  end
end