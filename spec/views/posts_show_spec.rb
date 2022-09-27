require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  describe 'index page' do
    before(:each) do
      @first_user = User.create!(name: 'Daf',
                                 photo: 'https://marcorockmusic1.files.wordpress.com/2011/10/loveless.jpg',
                                 bio: 'Programmer from Argentina')
      @id = @first_user.id
      @first_post = @first_user.posts.create!(title: 'Test post', text: 'Test text')
      @post_id = @first_post.id
      @first_comment = Comment.create!(author: @first_user, author_id: @id, post_id: @post_id)
      visit("/users/#{@first_user.id}/posts/#{@first_post.id}")
    end

    it 'shows a posts title' do
      expect(page).to have_content(@first_post.title)
    end

    it 'shows who wrote the post' do
      expect(page).to have_content(@first_post.author.name)
    end

    it 'shows the post body' do
      expect(page).to have_content(@first_post.text)
    end

    it 'shows how many comments a post has' do
      expect(page).to have_content(@first_post.comments.length)
    end

    it 'shows how many likes a post has' do
      expect(page).to have_content(@first_post.likes.length)
    end

    it 'shows who wrote the comments' do
      expect(page).to have_content(@first_comment.author.name)
    end

    it 'shows the comment' do
      expect(page).to have_content(@first_comment.text)
    end
  end
end
