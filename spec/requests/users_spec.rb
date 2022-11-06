# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do
  describe 'GET /users' do
    it 'returns a success response' do
      get api_v1_users_url
      expect(response).to be_successful
    end
  end

  describe 'GET /users/find_user/:email' do
    it 'returns a success response' do
      get '/api/v1/users/find_user/ac'
      expect(response).to be_successful
    end
  end
end
