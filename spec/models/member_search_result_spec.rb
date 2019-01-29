require 'rails_helper'

describe MemberSearchResult do
  it "exists" do
    member_search_result = MemberSearchResult.new("CO")

    expect(member_search_result).to be_a(MemberSearchResult)
  end

  context "instance methods" do
    context "#members" do

      it "returns members with a valid state" do
        json_response = File.open("./spec/fixtures/members_of_the_house.json")
        stub_request(:get, "https://api.propublica.org/congress/v1/members/house/CO/current.json").

          to_return(status: 200, body: json_response)

        member_search_result = MemberSearchResult.new("CO")
        expect(member_search_result.members.count).to eq(7)
        expect(member_search_result.members.first).to be_a(Member)
      end
    end
  end
end
