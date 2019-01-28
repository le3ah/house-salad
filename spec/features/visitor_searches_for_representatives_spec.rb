require 'rails_helper'

feature 'visitor searches for representative' do
  scenario 'with valid state' do
    visit "/"

    select "Colorado", from: "state"

    click_on "Locate Members of the House"

    expect(current_path).to eq("/search")
    expect(current_url).to include("state=CO")

    expect(page).to have_content("7 Results")
    expect(page).to have_css(".representative", count: 7)

    within(first(".representative")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".role")
      expect(page).to have_css(".party")
      expect(page).to have_css(".district")
    end
  end
end
