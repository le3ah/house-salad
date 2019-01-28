class PropublicaService
  def initialize(state)
    @state = state
  end

  def members_by_state
    response = conn.get("/congress/v1/members/house/#{@state}/current.json")
    JSON.parse(response.body, symbolize_names: true)
  end
  def conn
    Faraday.new(:url => "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = ENV["propublica_key"]
      faraday.adapter Faraday.default_adapter
    end
  end
end
