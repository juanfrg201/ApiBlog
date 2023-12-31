require 'rails_helper'

RSpec.describe "Api::V1::Comments", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/api/v1/comments/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/api/v1/comments/show"
      expect(response).to have_http_status(:success)
    end
  end

end
