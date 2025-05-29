require 'rails_helper'

RSpec.describe "Quests", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_quest_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    let(:quest_params) { { name: "New Quest", completed: false } }
    it "creates a new quest and redirects to the quest list page" do
      expect {
        post quests_path, params: { quest: quest_params }
      }.to change(Quest, :count).by(1)
      expect(Quest.last.name).to eq("New Quest")
      expect(response).to redirect_to(root_path)
    end
  end

  describe "DELETE /destroy" do
    let!(:quest) { create(:quest, name: "Quest to be deleted") }

    it "deletes the quest" do
      expect {
        delete quest_path(quest)
      }.to change(Quest, :count).by(-1)

      expect(Quest.exists?(quest.id)).to be_falsey
    end
  end

  describe "PATCH /update" do
    let!(:quest) { create(:quest, name: "Quest to be updated", completed: false) }
    let(:updated_params) { { completed: true } }

    it "updates the status of a quest" do
      patch quest_path(quest), params: { quest: updated_params }
      quest.reload
      expect(quest.completed).to be_truthy
    end
  end
end
