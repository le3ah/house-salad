require 'rails_helper'

describe PropublicaService do
  it "exists" do
    propublica_service = PropublicaService.new("CO")

    expect(propublica_service).to be_a(PropublicaService)
  end

  it "gets members by state" do
    json_response = File.open("./spec/fixtures/members_of_the_house.json")
    stub_request(:get, "https://api.propublica.org/congress/v1/members/house/CO/current.json").

      to_return(status: 200, body: json_response)

    propublica_service = PropublicaService.new("CO")

    member = propublica_service.members_by_state[:results].first
    expect(propublica_service.members_by_state[:results].count).to eq(7)
    expect(member).to have_key(:name)
    expect(member).to have_key(:district)
    expect(member).to have_key(:role)
    expect(member).to have_key(:party)
  end
end
