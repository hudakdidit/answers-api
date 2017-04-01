# spec/requests/api/v1/answers_spec.rb
require 'rails_helper'

RSpec.describe 'Answer API', type: :request do

  # Test suite for GET /api/v1/answers
  describe 'GET /graphql' do
    # make HTTP get request before each example
    before { post '/api/v1/graphql', params: {}, headers: jwt_header }

    it 'returns answer' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end