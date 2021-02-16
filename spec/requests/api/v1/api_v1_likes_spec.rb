require 'rails_helper'
 
RSpec.describe "Api::V1::Likes", type: :request do
    let(:user) { create(:user) }
    let(:tweet) { create(:tweet) }

    describe 'POST /api/v1/tweets/:id/like' do

        before { post "/api/v1/tweets/#{tweet.id}/like", headers: header_with_authentication(user) }

        it ' check if user is liked' do
            expect(tweet.get_likes.count).to be 1
        end

        it 'success to liked' do            
            expect(response).to have_http_status(:created)
        end

    end

    describe 'DELETE /api/v1/tweets/:id/like' do

        before do
            user.likes(tweet)
            delete "/api/v1/tweets/#{tweet.id}/like", headers: header_with_authentication(user)
        end

        it 'success to unlike' do
            expect(response).to have_http_status(:no_content)
        end

        it ' check if user is not like' do
            expect(tweet.get_likes.count).to be 0
        end
    end
end