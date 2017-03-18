# spec/requests/answers_spec.rb
require 'rails_helper'

RSpec.describe 'Answer API', type: :request do
  # initialize test data
  let!(:answers) { create_list(:answer, 10) }
  let(:answer) { answers.first.id }
  let!(:questions) { create_list(:question, 10) }
  let(:question) { questions.first.id }

  # Test suite for GET /answers
  describe 'GET /answers' do
    # make HTTP get request before each example
    before { get '/answers' }

    it 'returns answer' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /answers/:id
  describe 'GET /answers/:id' do
    before { get "/answers/#{answer}" }

    context 'when the record exists' do
      it 'returns the todo' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(answer)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:answer) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Answer/)
      end
    end
  end

  # Test suite for POST /answers
  describe 'POST /answers' do
    # valid payload
    let(:valid_attributes) { { answer: "Hey hej", question_id: question } }

    context 'when the request is valid' do
      before { post '/answers', params: valid_attributes }

      it 'creates an answer' do
        valid_attributes.each do |k, v|
          expect(body_as_json[k]).to eq(v)
        end
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end


  # Test suite for PUT /answers/:id
  describe 'PUT /answers/:id' do
    let(:valid_attributes) {{ answer: "Hey hej" }}

    context 'when the record exists' do
      before { put "/answers/#{answer}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /answers/:id
  describe 'DELETE /answers/:id' do
    before { delete "/answers/#{answer}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
