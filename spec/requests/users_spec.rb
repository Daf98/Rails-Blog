require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'Correct response status' do
    describe 'GET /index' do
      it 'returns http success' do
        get '/users'
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET /show' do
      it 'returns http success' do
        get '/users/:user_id'
        expect(response).to have_http_status(:success)
      end
    end
  end
  context 'Correct template' do
    describe 'GET users' do
      it 'renders the index template' do
        get '/users'
        expect(response).to render_template(:index)
        expect(response.body).to include('Here is a list of all users')
      end
      it 'renders the show template' do
        get '/users/:user_id'
        expect(response).to render_template(:show)
        expect(response.body).to include('Here is a user given an id')
      end
    end
  end
end
