require 'rails_helper'
 
RSpec.describe "Api::V1::Tweets", type: :request do
  
  let(:query) { FFaker::Lorem.characters(1) }

  before(:all) do
    Tweet.reindex
    User.reindex
    create_list(:user, 10)
    create_list(:tweet, 10)
  end

  describe 'GET /api/v1/search' do
    
    before { get "/api/v1/search?query=#{query}" }

    it 'has success status' do
      expect(response).to have_http_status(:success)
    end

  end

  describe 'GET /api/v1/autocomplete' do

    before { get "/api/v1/autocomplete?query=#{query}" }

    it 'has success status' do
      expect(response).to have_http_status(:success)
    end

  end
end