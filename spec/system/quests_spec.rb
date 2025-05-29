require 'rails_helper'

describe "Quests", type: :system do
  context "when visiting the academy quests page" do
    before do
      visit root_path
    end

    it "show the title of this academy quest website" do
      expect(page).to have_content("My Academy Quest")
    end
  end
end
