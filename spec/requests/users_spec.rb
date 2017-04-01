# spec/requests/api/v1/users_spec.rb
require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  # initialize test data
  let!(:users) { create_list(:user, 10) }
  let(:user) { users.first.id }
  let!(:questions) { create_list(:question, 10) }
  let(:question) { questions.first.id }
  let(:other_user) { build(:user, name: "Joe", email: "joe@gmail.com", password: "abcd1234") }

  # Test suite for GET /api/v1/users/:id
  describe 'GET /api/v1/users/:id with auth' do
    before { get "/api/v1/users/#{user}", params: {}, headers: jwt_header }

    context 'when the record exists' do
      it 'returns the user' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(user)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:user) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end
  end

  describe 'GET /api/v1/users/:id with auth but not the owner' do
    before { get "/api/v1/users/#{user}", params: {}, headers: jwt_header(other_user.email, other_user.password)}

    it 'returns status code 401' do
      expect(response).to have_http_status(401)
    end
  end

  describe 'GET /api/v1/users/:id without auth' do
    before { get "/api/v1/users/#{user}" }

    it 'returns status code 401' do
      expect(response).to have_http_status(401)
    end
  end

  # Test suite for POST /api/v1/users
  describe 'POST /api/v1/users' do
    # valid payload
    let(:valid_attributes) { { name: "Jonathan", email: "jhudak@blah.com", password: "blah1234", password_confirmation: "blah1234" } }

    context 'when the request is valid' do
      before { post '/api/v1/users', params: valid_attributes }

      it 'creates an user' do
        valid_attributes.extract!(:name, :email).each do |k, v|
          expect(body_as_json[k]).to eq(v)
        end
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end


  # Test suite for PUT /api/v1/users/:id
  describe 'PUT /api/v1/users/:id with auth' do
    let(:valid_attributes) {{ name: "Jonathan!!!" }}

    context 'when the record exists' do
      before { put "/api/v1/users/#{user}", params: valid_attributes, headers: jwt_header }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'PUT /api/v1/users/:id without auth' do
    let(:valid_attributes) {{ name: "Jonathan!!!" }}

    context 'when the record exists' do
      before { put "/api/v1/users/#{user}", params: valid_attributes }

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end
    end
  end

  # Test suite for DELETE /api/v1/users/:id
  describe 'DELETE /api/v1/users/:id with auth' do
    before { delete "/api/v1/users/#{user}", params: {}, headers: jwt_header }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

  describe 'DELETE /api/v1/users/:id without auth' do
    before { delete "/api/v1/users/#{user}"}

    it 'returns status code 401' do
      expect(response).to have_http_status(401)
    end
  end
end
