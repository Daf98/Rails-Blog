require 'swagger_helper'

RSpec.describe 'api/my', type: :request do
  describe 'Blog API' do
    path '/users/:user_id/posts/:post_id/comments/new' do
      post 'Create a comment' do
        tags 'Comment'
        consumes 'application/json'
        parameter name: :comment, in: :body, schema: {
          type: :object,
          properties: {
            text: { type: :string }
          },
          required: ['title']
        }

        response '201', 'comment created' do
          let(:comment) { { text: 'foo' } }
          run_test!
        end

        response '422', 'invalid request' do
          let(:comment) { { text: 'foo' } }
          run_test!
        end
      end
    end

    path '/users/:user_id/posts/' do
      get 'Retrieves all posts' do
        tags 'Posts'
        produces 'application/json', 'application/xml'
        parameter name: :id, in: :path, type: :string

        response '200', 'blog found' do
          schema type: :object,
                 properties: {
                   id: { type: :integer },
                   title: { type: :string },
                   text: { type: :string }
                 },
                 required: %w[id title content]

          let(:id) { Post.create(title: 'foo', text: 'bar').id }
          run_test!
        end

        response '404', 'blog not found' do
          let(:id) { 'invalid' }
          run_test!
        end

        response '406', 'unsupported accept header' do
          let(:Accept) { 'application/foo' }
          run_test!
        end
      end
    end
  end
end
