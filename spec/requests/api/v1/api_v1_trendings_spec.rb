require 'rails_helper'
 
RSpec.describe "Api::V1::Trendings", type: :request do
    describe 'GET /api/v1/trendings' do
        context 'has trendings' do
        
            let(:trending) { create_list(:trending, 10) }

            before { get "/api/v1/trending" }

            it 'has success status' do
                expect(response).to have_http_status(:success)
            end

            it 'get the last most posted' do
                expect(response.body).to eql(Trending.last.to_json)
            end

        end

        context 'has no trendings' do
            before { get "/api/v1/trending" }

            it 'has success status' do
                expect(response).to have_http_status(:success)
            end
        end
    end
end