require 'rails_helper'

describe PropublicaService do
  it "exists" do
    propublica_service = PropublicaService.new("CO")

    expect(propublica_service).to be_a(PropublicaService)
  end

  it "gets members by state" do
    propublica_service = PropublicaService.new("CO")

    member = propublica_service.members_by_state[:results].first
    expect(propublica_service.members_by_state[:results].count).to eq(7)
    expect(member).to have_key(:name)
    expect(member).to have_key(:district)
    expect(member).to have_key(:role)
    expect(member).to have_key(:party)
  end
end
