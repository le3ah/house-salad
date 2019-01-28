require 'pry'

class MemberSearchResult
  def initialize(state)
    @state = state
  end

  def members
    data = service.members_by_state
    data[:results].map do |raw_member|
      Member.new(raw_member)
    end
  end

  def service
    PropublicaService.new(@state)
  end
end
