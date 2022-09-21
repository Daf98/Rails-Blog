require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  context 'Correct response status' do
    describe 'GET /index' do
      it 'returns http success' do
        get '/users/:user_id/posts'
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET /show' do
      it 'returns http success' do
        get '/users/:user_id/posts/:id'
        expect(response).to have_http_status(:success)
      end
    end
  end
  context 'Correct template' do
    describe 'GET posts' do
      it 'renders the index template' do
        get '/users/:user_id/posts'
        expect(response).to render_template(:index)
        expect(response.body).to include('Here is a list of all posts for a given user')
      end
      it 'renders the show template' do
        get '/users/:user_id/posts/:id'
        expect(response).to render_template(:show)
        expect(response.body).to include('Here is a post by a user given an id')
      end
    end
  end
end
