require 'pry'

class SearchController < ApplicationController
  def index
    @search = MemberSearchResult.new(params[:state])
  end
end
