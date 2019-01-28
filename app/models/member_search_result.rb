require 'pry'

class MemberSearchResult
  def initialize(state)
    @state = state
  end

  def members
    conn = Faraday.new(:url => "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = ENV["propublica_key"]
      faraday.adapter Faraday.default_adapter
    end
    response = conn.get("/congress/v1/members/house/#{@state}/current.json")
    data = JSON.parse(response.body, symbolize_names: true)
    data[:results]
  end
end
