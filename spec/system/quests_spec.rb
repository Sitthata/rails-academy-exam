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

  context "when creating a new quest" do
    before do
      visit root_path
    end

    it "allows the user to create a new quest" do
      click_on_new_quest_button
      should_see_new_quest_page
      create_new_quest("Added Test Quest")
      should_see_the_added_quest("Added Test Quest")
    end
  end

  context "when deleting a quest" do
    let!(:quest) { create(:quest, name: "Quest to be deleted") }
    before do
      visit root_path
    end

    it "allows the user to delete a quest" do
      expect(page).to have_content("Quest to be deleted")
      click_on_delete_quest_button(quest)
      should_not_see_the_deleted_quest(quest)
    end
  end
end

def click_on_new_quest_button
  click_link id: "new-quest-button"
end

def should_see_new_quest_page
  expect(page).to have_content("New Quest")
  expect(page).to have_current_path(new_quest_path)
end

def create_new_quest(name)
  fill_in id: "quest-name-field", with: "Added Test Quest"
  click_button id: "add-quest-button"
  sleep 0.5
end

def should_see_the_added_quest(name)
  expect(page).to have_content(name)
end

def click_on_delete_quest_button(quest)
  find("#delete-#{quest.id}-button").click
end

def should_not_see_the_deleted_quest(quest)
  expect(page).not_to have_content(quest.name)
end
