require 'rails_helper'

feature 'visitor searches for member' do
  scenario 'with valid state' do
    filename = "members_of_the_house.json"
    url = "https://api.propublica.org/congress/v1/members/house/CO/current.json"
    stub_get_json(url, filename)
    
    visit "/"

    select "Colorado", from: "state"

    click_on "Locate Members of the House"

    expect(current_path).to eq("/search")
    expect(current_url).to include("state=CO")

    expect(page).to have_content("7 Results")
    expect(page).to have_css(".member", count: 7)

    within(first(".member")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".role")
      expect(page).to have_css(".party")
      expect(page).to have_css(".district")
    end
  end
end
