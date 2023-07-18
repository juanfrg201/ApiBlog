require 'rails_helper'

RSpec.describe Api::V1::User::Blogs::UserBlogsController, type: :controller do
  before do
    @user = create(:user)
    @blog1 = create(:blog, user: @user)
    @blog2 = create(:blog, user: @user)
  end

  describe 'GET #index' do
    it 'returns a JSON response with user blogs' do
      get :index, params: { user_id: @user.id }

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json')

      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(2)
      expect(json_response[0]['id']).to eq(@blog1.id)
      expect(json_response[1]['id']).to eq(@blog2.id)
    end
  end
end