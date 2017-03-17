# spec/requests/day_logs_spec.rb
require 'rails_helper'

RSpec.describe 'DayLog API', type: :request do
  # initialize test data
  let!(:day_logs) { create_list(:day_log, 10) }
  let(:day_log) { day_logs.first.id }

  # Test suite for GET /day_logs
  describe 'GET /day_log' do
    # make HTTP get request before each example
    before { get '/day_logs' }

    it 'returns day_log' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /day_logs/:id
  describe 'GET /day_logs/:id' do
    before { get "/day_logs/#{day_log}" }

    context 'when the record exists' do
      it 'returns the todo' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(day_log)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:day_log) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find DayLog/)
      end
    end
  end

  # Test suite for POST /day_logs
  describe 'POST /day_logs' do
    # valid payload
    let(:valid_attributes) {}

    context 'when the request is valid' do
      before { post '/day_logs', params: valid_attributes }

      # it 'creates a day_log' do
      #   expect(json).to eq('Learn Elm')
      # end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

  # We don't currently need put
  # Test suite for PUT /day_logs/:id
  # describe 'PUT /day_logs/:id' do
  #   let(:valid_attributes) {}
  #
  #   context 'when the record exists' do
  #     before { put "/day_logs/#{day_log}", params: valid_attributes }
  #
  #     it 'updates the record' do
  #       puts response.body
  #       expect(response.body).to be_empty
  #     end
  #
  #     it 'returns status code 204' do
  #       expect(response).to have_http_status(204)
  #     end
  #   end
  # end

  # Test suite for DELETE /day_logs/:id
  describe 'DELETE /day_logs/:id' do
    before { delete "/day_logs/#{day_log}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
