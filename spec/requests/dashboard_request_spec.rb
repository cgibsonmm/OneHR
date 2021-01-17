require 'rails_helper'

RSpec.describe 'Dashboards', type: :request do
  describe 'GET /index' do
    context 'signed in' do
      before do
        @user = create(:user)
        sign_in @user
      end
      it 'returns http success' do
        get '/dashboard/index'
        expect(response).to have_http_status(:success)
      end
    end

    context 'Not signed in' do
      it 'returns http success' do
        get '/dashboard/index'
        expect(response).not_to have_http_status(:success)
      end
    end
  end
end
