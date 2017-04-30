# spec/requests/api/v1/answers_spec.rb
require 'rails_helper'

RSpec.describe 'Graphql Endpoint', type: :request do

  # Test suite for GET /api/v1/answers
  describe 'GET user id' do
    # make HTTP get request before each example
    before { post '/api/v1/graphql?q=', params: { query: "{ users(id: \"1\") { email } }" }, headers: jwt_header }

    it 'returns json' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET users' do
    # make HTTP get request before each example
    before { post '/api/v1/graphql?q=', params: { query: "{ users() { email } }" }, headers: jwt_header }

    it 'returns json' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
  describe 'GET question id' do
    # make HTTP get request before each example
    before { post '/api/v1/graphql?q=', params: { query: "{ questions(id: \"1\") { question } }" }, headers: jwt_header }

    it 'returns json' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET questions' do
    # make HTTP get request before each example
    before { post '/api/v1/graphql?q=', params: { query: "{ questions() { question } }" }, headers: jwt_header }

    it 'returns json' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
