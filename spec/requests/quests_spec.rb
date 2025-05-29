require 'rails_helper'

RSpec.describe "Quests", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/quests/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/quests/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/quests/create"
      expect(response).to have_http_status(:success)
    end
  end

end
