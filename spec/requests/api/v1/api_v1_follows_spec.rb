require 'rails_helper'
 
RSpec.describe "Api::V1::Follows", type: :request do
    let(:user) { create(:user) }
    let(:second_user) { create(:user) }
    describe 'POST /api/v1/users/:id/follow' do

        before { post "/api/v1/users/#{second_user.id}/follow", headers: header_with_authentication(user) }

        it ' check if user is followd' do
            expect(second_user.followers_by_type('User')).to include(user)
        end

        it 'success to follow' do            
            expect(response).to have_http_status(:created)
        end

    end
    describe 'DELETE /api/v1/users/:id/follow' do

        before do
            user.follow(second_user)
            delete "/api/v1/users/#{second_user.id}/follow", headers: header_with_authentication(user)
        end

        it 'success to unfollow' do
            expect(response).to have_http_status(:ok)
        end

        it ' check if user is unfollowd' do
            expect(second_user.followers_by_type('User')).to_not include(user)
        end
    end
end