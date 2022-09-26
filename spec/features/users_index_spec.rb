require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  describe 'index page' do
    before(:each) do
      visit('/')
    end  
    it 'shows the right content' do
      expect(page).to have_content('Users')
    end
  end
end