require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'Correct response status' do
    before(:each) do
      @first_user = User.create!(name: 'Daf',
                                 photo: 'https://marcorockmusic1.files.wordpress.com/2011/10/loveless.jpg',
                                 bio: 'Programmer from Argentina')
      @id = @first_user.id
      @first_post = @first_user.posts.create!(title: 'Test post', text: 'Test text')
      @post_id = @first_post.id
      @first_comment = Comment.create!(author: @first_user, author_id: @id, post_id: @post_id)
    end
    describe 'GET /index' do
      it 'returns http success' do
        get '/'
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET /show' do
      it 'returns http success' do
        get "/users/#{@id}"
        expect(response).to have_http_status(:success)
      end
    end
  end
  context 'Correct template' do
    before(:each) do
      @first_user = User.create!(name: 'Daf',
                                 photo: 'https://marcorockmusic1.files.wordpress.com/2011/10/loveless.jpg',
                                 bio: 'Programmer from Argentina')
      @id = @first_user.id
      @first_post = @first_user.posts.create!(title: 'Test post', text: 'Test text')
      @post_id = @first_post.id
      @first_comment = Comment.create!(author: @first_user, author_id: @id, post_id: @post_id)
    end
    describe 'GET users' do
      it 'renders the index template' do
        get '/'
        expect(response).to render_template(:index)
        expect(response.body).to include('Users')
      end
      it 'renders the show template' do
        get "/users/#{@id}"
        expect(response).to render_template(:show)
        expect(response.body).to include('Bio')
      end
    end
  end
end
